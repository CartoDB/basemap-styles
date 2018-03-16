
/****************
 CONSTANTS
*****************/

var ACTIVE_RENDERING_ENGINE_CLASS = "rendering_engine_active";

var RENDERING_ENGINE_BASE = "rendering_engine_"
var RENDERING_ENGINE_OL = RENDERING_ENGINE_BASE + "ol"
var RENDERING_ENGINE_GL = RENDERING_ENGINE_BASE + "gl"
var RENDERING_ENGINE_TANGRAM = RENDERING_ENGINE_BASE + "tangram"
var RENDERING_ENGINE_LEAFLET = RENDERING_ENGINE_BASE + "leaflet"

RENDERER_TYPES = { 
    openlayers: "openlayers", 
    mapboxgl: "mapbox-gl", 
    tangram: "tangram", 
    leaflet: "leaflet"
}

/****************
 BASEMAP LIST
*****************/

var url = "basemap_styles.json"
$.get(url, onStylesLoadComplete)

var styles = undefined

function onStylesLoadComplete(data) {
    styles = data
    initializeMaps()
}

function initializeMaps() {

    var data = getDataFromHash()
    
    if (data == undefined) {
        
        var initial = getDefaultStyles()

        for (var i = 1; i < 5; i++) {
            var map = initializeMap(i, initial[i - 1])
            maps.push(map)

            addMoveEndListener(map)
        }

    } else {
        
        var existing = []
        
        var zoom = parseFloat(data.zoom)
        var lat = parseFloat(data.lat)
        var lon = parseFloat(data.lon)

        var style = findStyleFromName(data.s1)
        existing.push(style)

        style = findStyleFromName(data.s2)
        existing.push(style)

        style = findStyleFromName(data.s3)
        existing.push(style)

        style = findStyleFromName(data.s4)
        existing.push(style)

        for (var i = 1; i < 5; i++) {
            var style = existing[i - 1]
            var map = initializeMap(i, style)
            maps.push(map)

            addMoveEndListener(map)
        }

        // Set timeout for ZoomAndCenter function, OpenLayers map cannot be zoomed before it's rendered
        setTimeout(function() {
            for (var i = 0; i < maps.length; i++) {
                var map = maps[i]
                setZoomAndCenterOf(map, zoom, lat, lon)
            }
        }, 1000)
        
    }
}

function getDefaultStyles() {

    var result = []

    // Add first instance of openlayers map
    for (var i = 0; i < styles.length; i++) {
        var style = styles[i]
        if (style.renderer == RENDERER_TYPES.openlayers) {
            result.push(style)
            break
        }
    }
    
    // Add first instance of mapbox-gl map
    for (var i = 0; i < styles.length; i++) {
        var style = styles[i]
        if (style.renderer == RENDERER_TYPES.mapboxgl) {
            result.push(style)
            break
        }
    }

    // Add two first instances of leaflet map
    var counter = 0
    for (var i = 0; i < styles.length; i++) {
        var style = styles[i]
        if (style.renderer == RENDERER_TYPES.leaflet) {
            result.push(style)
            if (counter == 1) {
                break    
            }
            counter++
        }
    }

    return result
}

function findStyleFromRenderer(renderer) {
    for (var i = 0; i < styles.length; i++) {
        if (renderer == styles[i].renderer) {
            return styles[i]
        }
    }
}

function findStyleFromName(name) {
    for (var i = 0; i < styles.length; i++) {
        if (name == styles[i].name) {
            return styles[i]
        }
    }

    // Hacky solution:
    // If a style cannot be found in the list, it will be an embedded url instead
    var url = name
    return url
}

function findStylesFromRenderer(renderer) {
    renderer = convertRendererToShort(renderer)

    var result = []

    for (var i = 0; i < styles.length; i++) {
        if (renderer == styles[i].renderer) {
            result.push(styles[i])
        }
    }

    return result   
}

/***************
 MAP INITIALIZATION
****************/

var STYLE_NAME = "style_name"

function findRenderer(container) {

    var renderer = container.find("." + ACTIVE_RENDERING_ENGINE_CLASS)

    if (renderer.hasClass(RENDERING_ENGINE_OL)) {
        return RENDERING_ENGINE_OL
    } else if (renderer.hasClass(RENDERING_ENGINE_GL)) {
        return RENDERING_ENGINE_GL
    } else if (renderer.hasClass(RENDERING_ENGINE_TANGRAM)) {
        return RENDERING_ENGINE_TANGRAM
    } else if (renderer.hasClass(RENDERING_ENGINE_LEAFLET)) {
        return RENDERING_ENGINE_LEAFLET
    }
}

function initializeMap(id, style) {

    var mapDivId = "map" + id
    var mapDiv = $("#" + mapDivId)

    // Clear the mapDiv of possible previous mapView objects
    mapDiv.html("")
    var rendererDiv = mapDiv.parent().find(".rendering_engine_container")

    // If the url field is active, the url (string) is passed as style parameter instead of style object
    var isUrl = typeof style === 'string' || style instanceof String

    if (!isUrl) {
        // Remove current active class from choice, whatever it may be
        rendererDiv.find(".rendering_engine").removeClass(ACTIVE_RENDERING_ENGINE_CLASS)
    }

    if (isUrl) {
        showUrlField(mapDiv.parent())
    } else {
        hideUrlField(mapDiv)
    }

    if (isUrl) {
        var converted = findRenderer(rendererDiv)
    } else {
        // Add active renderer class to choice, based on style's renderer
        var converted = convertRendererToLong(style.renderer)
    }
    
    var engine = rendererDiv.find("." + converted)
    engine.addClass(ACTIVE_RENDERING_ENGINE_CLASS)

    var url = style.url

    if (isUrl) {
        url = style
    }

    if (engine.hasClass(RENDERING_ENGINE_OL)) {
        
        var map = olms.apply(mapDivId, url);
    } else if (engine.hasClass(RENDERING_ENGINE_GL)) {
        mapboxgl.accessToken = 'pk.eyJ1IjoiY2FydG8tYml6LW9wcyIsImEiOiJjamNjbGk5cW0xN2J2MndwNWdrcWdvZXA0In0.v-cmdvJ7OADDPTi2nrSkKg';
        var map = new mapboxgl.Map({ container: mapDivId, style: url });
     
     
    } else if (engine.hasClass(RENDERING_ENGINE_TANGRAM)) {
        
        var map = L.map(mapDivId);
        var layer = Tangram.leafletLayer({ scene: url });
        layer.addTo(map);
        map.setView([0, 0], 0);
    } else if (engine.hasClass(RENDERING_ENGINE_LEAFLET)) {
        
        var map = L.map(mapDivId).setView([0, 0], 0);
        L.tileLayer(url, { }).addTo(map);
    }

    if (isUrl) {
        mapDiv.parent().find(".url_field").val(style)
    } else {
        var dropdown = mapDiv.parent().find(".dropdown_container").find(".dropdown_text")
        
        if (engine.hasClass(RENDERING_ENGINE_OL) && style.renderer == RENDERER_TYPES.openlayers) {
            dropdown.html(style.name)
        } else if (engine.hasClass(RENDERING_ENGINE_GL) && style.renderer == RENDERER_TYPES.mapboxgl) {
            dropdown.html(style.name)
        } else if (engine.hasClass(RENDERING_ENGINE_TANGRAM) && style.renderer == RENDERER_TYPES.tangram) {
            dropdown.html(style.name)
        } else if (engine.hasClass(RENDERING_ENGINE_LEAFLET) && style.renderer == RENDERER_TYPES.leaflet) {
            dropdown.html(style.name)
        }
    }

    if (isUrl) {
        mapDiv.attr(STYLE_NAME, url)
    } else {
        mapDiv.attr(STYLE_NAME, style.name)
    }

    return map
}

// This application uses two different sets of string values to classify renderers,
// both are defined at the start of this document.
// The ones used as html classes are longer in name, e.g. renderer_engine_leaflet,
// the ones defined in the json files are shorter, e.g. leaflet
// These two helper functions quickly convert them from one to the other
// Note that they are not entirely identical, cannot simply concat strings
function convertRendererToLong(renderer) {

    var converted = undefined

    if (renderer == RENDERER_TYPES.openlayers) {
        converted = RENDERING_ENGINE_OL
    } else if (renderer == RENDERER_TYPES.mapboxgl) {
        converted = RENDERING_ENGINE_GL
    } else if (renderer == RENDERER_TYPES.tangram) {
        converted = RENDERING_ENGINE_TANGRAM
    } else if (renderer == RENDERER_TYPES.leaflet) {
        converted = RENDERING_ENGINE_LEAFLET
    }
    
    return converted
}

function convertRendererToShort(renderer) {

    var converted = undefined

    if (renderer == RENDERING_ENGINE_OL) {
        converted = RENDERER_TYPES.openlayers
    } else if (renderer == RENDERING_ENGINE_GL) {
        converted = RENDERER_TYPES.mapboxgl
    } else if (renderer == RENDERING_ENGINE_TANGRAM) {
        converted = RENDERER_TYPES.tangram
    } else if (renderer == RENDERING_ENGINE_LEAFLET) {
        converted = RENDERER_TYPES.leaflet
    }
    
    return converted
}

var maps = []

/*****************
 HTML EVENTS
******************/

var ENTER = 13
var TAB = 9

$(document).keypress(onKeyPress);
$(document).on("keydown", ".url_field", onKeyDown)

var currentFocus = undefined
$(document).mousemove(onMouseMoved);

function onKeyPress(e) {
    if(e.which == ENTER) {
        var focus = $(':focus');
        if (focus.hasClass("url_field")) {
            initializeMapFromUrlField(focus)
        }
    }
}

function onKeyDown(e) {
    
    if (e.which == TAB) {
        var focus = $(e.target)
        initializeMapFromUrlField(focus)
    }
}

function onMouseMoved(event) {
    var x = event.pageX;
    var y = event.pageY;
    var halfHeight = $(document).height() / 2;
    var halfWidth = $(document).width() / 2;
    
    if (x < halfWidth && y < halfHeight) {
        currentFocus = "map1"
    } else if (x > halfWidth && y < halfHeight) {
        currentFocus = "map2"
    } else if (x < halfWidth && y > halfHeight) {
        currentFocus = "map3"
    } else if (x > halfWidth && y > halfHeight) {
        currentFocus = "map4"
    }
}

/*****************
 MAP EVENTS
******************/

function addMoveEndListener(map) {
    
    var engine = getEngineFromMap(map)
    
    if (engine.hasClass(RENDERING_ENGINE_TANGRAM) || engine.hasClass(RENDERING_ENGINE_LEAFLET)) {
        map.on('zoomend', onMoveEnd)
        map.on('dragend', onMoveEnd)
    } else {
        map.on('moveend', onMoveEnd);
    }

    map.on("click", onMapClick)
}

function onMapClick(e) {
    collapseDropdown()
}

$(".rendering_engine_choice").click(onRendererChoice)

function onRendererChoice(e) {

    var target = $(e.target)

    // Direct parent: rendering_engine_container
    // Parent of direct parent: map_container
    var container = target.parent().parent()

    // Find map dom:
    var mapDiv = container.find(".map")
    var mapId = mapDiv.attr("id")

    clearMap(mapDiv, mapId)

    var style = getStyleFromRenderer(target)

    // Find the index by replacing "map" in the id, e.g. "map1" -> "1".
    // Map dom indexing starts from 1, arrays start at 0
    var index = parseInt(mapId.replace("map", ""))

    var map = initializeMap(index, style)
    
    // Replace the map in our existing list
    maps[index - 1] = map

    addMoveEndListener(map)

    var data = getDataFromHash()

    if (data != undefined) {
        var zoom = parseFloat(data.zoom)
        var lat = parseFloat(data.lat)
        var lon = parseFloat(data.lon)
        
        setZoomAndCenterOf(map, zoom, lat, lon)
    }
}

function getStyleFromRenderer(target) {
    
    var stringValue = undefined

    if (target.hasClass(RENDERING_ENGINE_OL)) {
        stringValue = RENDERING_ENGINE_OL
    } else if (target.hasClass(RENDERING_ENGINE_GL)) {
        stringValue = RENDERING_ENGINE_GL
    } else if (target.hasClass(RENDERING_ENGINE_TANGRAM)) {
        stringValue = RENDERING_ENGINE_TANGRAM
    } else if (target.hasClass(RENDERING_ENGINE_LEAFLET)) {
        stringValue = RENDERING_ENGINE_LEAFLET
    }
    
    return findStyleFromRenderer(convertRendererToShort(stringValue))
}

var E3857 = '+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext  +no_defs';
var E4326 = "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs";

function onMoveEnd(e) {

    var current = e.target;

    var engine = getEngineFromMap(current)

    // Find the div id of our event's target
    var id = undefined

    if (engine.hasClass(RENDERING_ENGINE_GL)) {
        id = current._container.id
    } else if (engine.hasClass(RENDERING_ENGINE_OL)) {
        id = current.P.target
    } else if (engine.hasClass(RENDERING_ENGINE_TANGRAM)) {
        id = current._container.id
    } else if (engine.hasClass(RENDERING_ENGINE_LEAFLET)) {
        id = current._container.id
    }

    // Return if current hovered div isn't the target of the event,
    // as move event gets called regardless of 
    // whether the user moved the map or if it was moved via function
    if (id != currentFocus) {        
        return
    }   

    var zoom = round(getMapView(current, engine).getZoom())
    var center = getMapView(current, engine).getCenter()

    $(".zoom_label").text("Zoom: " + zoom)

    /*
     * Conversion: EPSG:3857 TO EPSG:4326 using 
     * http://spatialreference.org/ref/sr-org/7483/proj4/ -- wkt of EPSG:3857
     * http://spatialreference.org/ref/epsg/4326/proj4/   -- proj4 of EPSG:4326 
     */

    var epsg3857 = []
    var epsg4326 = []

    if (engine.hasClass(RENDERING_ENGINE_OL)) {
        epsg3857 = [center[0], center[1]]
        epsg4326 = proj4(E3857, E4326, epsg3857)

        epsg4326 = [round(epsg4326[0]), round(epsg4326[1])]
        var text = "Longitude: " + epsg4326[0] + ", Latitude: " + epsg4326[1]
    } else {
        // MapBox-Gl Renderer's center is an object, not an array, translate it into an array
        epsg4326 = [ round(center.lng), round(center.lat) ]
        // Coordinates are given at lat/lon, translate it to EPSG:3857
        epsg3857 = proj4(E4326, E3857, epsg4326)

        var text = "Longitude: " + epsg4326[0] + ", Latitude: " + epsg4326[1]
    }

    updateHash(zoom, epsg4326)

    $(".center_label").text(text)

    // Mapzen GL's map is ahead by one zoom level. 
    // We always need to add one level when zooming from another map,
    // and always substract one when zooming in on Mapzen GL's map
    for (var i = 0; i < maps.length; i++) {

        var other = maps[i]

        var engine2 = getEngineFromMap(other)
        
        var view = getMapView(other, engine2)

        if (current != other) {
            
            if (engine2.hasClass(RENDERING_ENGINE_OL)) {
                if (engine.hasClass(RENDERING_ENGINE_GL)) {
                    view.setZoom(zoom + 1)
                } else {
                    view.setZoom(zoom)
                }
                
                view.setCenter(epsg3857)
            } else if (engine2.hasClass(RENDERING_ENGINE_GL)) {
                view.setZoom(zoom - 1)
                view.setCenter(epsg4326)
            } else if (engine2.hasClass(RENDERING_ENGINE_TANGRAM)) {
                view.setView(new L.LatLng(epsg4326[1], epsg4326[0]), zoom);
            } else if (engine2.hasClass(RENDERING_ENGINE_LEAFLET)) {
                
                if (engine.hasClass(RENDERING_ENGINE_GL)) {
                    view.setView(new L.LatLng(epsg4326[1], epsg4326[0]), zoom + 1);
                } else {
                    view.setView(new L.LatLng(epsg4326[1], epsg4326[0]), zoom);    
                }

                
            }
        }
    }
}

function setZoomAndCenterOf(map, zoom, lat, lon) {

    var engine = getEngineFromMap(map)
    var view = getMapView(map, engine)

    if (engine.hasClass(RENDERING_ENGINE_OL)) {
        view.setZoom(zoom)
        var mercator = proj4(E4326, E3857, [lon, lat])
        view.setCenter(mercator)
    } else if (engine.hasClass(RENDERING_ENGINE_GL)) {
        view.setZoom(zoom - 1)
        view.setCenter([lon, lat])
    } else {
        view.setView(new L.LatLng(lat, lon), zoom);
    } 
}

/****************
 URL FIELD
*****************/

var URL_FIELD_PLACEHOLDER = "- Enter a custom url -"

$(".cancel_url_field_button").click(onCancelClick)

function onCancelClick(e) {

    var field = $(e.target)
    var container = field.parent()
    
    hideUrlField(container)
    
    addStylesToDropdown(container)

    var engine = container.parent().find(".rendering_engine_container").find("." + ACTIVE_RENDERING_ENGINE_CLASS)

    var mapDiv = container.parent().find(".map")
    var mapId = mapDiv.attr("id")

    var index = parseInt(mapId.replace("map", ""))
    var styles = findStylesFromRenderer(getRendererId(engine))
    
    var map = initializeMap(index, styles[0])
    maps[index - 1] = map

    addMoveEndListener(map)
}

function initializeMapFromUrlField(field) {

    var url = field.val()

    var mapDiv = field.parent().parent().find(".map")
    var mapId = mapDiv.attr("id")

    var id = mapDiv.attr("id")
    var index = parseInt(id.replace("map", ""))

    clearMap(mapDiv, mapId)

    var map = initializeMap(index, url)

    // Replace the map in our existing list
    maps[index - 1] = map

    addMoveEndListener(map)
}

function showUrlField(container) {
    var field = container.find(".url_field")
    field.show()
    field.focus()
    container.find(".cancel_url_field_button").show()

    container.find(".dropdown_text_overlay").hide()
    container.find(".dropdown_text_container").hide()
    container.find(".dropdown_triangle").hide()
}

function hideUrlField(container) {

    container.find(".url_field").hide()
    container.find(".cancel_url_field_button").hide()

    container.find(".dropdown_text_overlay").show()
    container.find(".dropdown_text_container").show()
    container.find(".dropdown_triangle").show()
}

/****************
 HASH
*****************/

function updateHash(zoom, center) {
    
    // Adding zoom and center position to hash
    var hash = "zoom=" + zoom + ";lat=" + center[1] + ";lon=" + center[0]
    
    // Adding renderer choice to hash
    for (var i = 0; i < maps.length; i++) {

        var engine = getEngineFromMap(maps[i])
        var renderer = "none"
        
        if (engine.hasClass(RENDERING_ENGINE_OL)) {
            renderer = RENDERING_ENGINE_OL.replace(RENDERING_ENGINE_BASE, "")
        } else if (engine.hasClass(RENDERING_ENGINE_GL)) {
            renderer = RENDERING_ENGINE_GL.replace(RENDERING_ENGINE_BASE, "")
        } else if (engine.hasClass(RENDERING_ENGINE_TANGRAM)) {
            renderer = RENDERING_ENGINE_TANGRAM.replace(RENDERING_ENGINE_BASE, "")
        } else if (engine.hasClass(RENDERING_ENGINE_LEAFLET)) {
            renderer = RENDERING_ENGINE_LEAFLET.replace(RENDERING_ENGINE_BASE, "")
        }

        hash += ";r" + (i + 1) + "=" + renderer
    }
    
    // Adding styles to hash
    for (var i = 0; i < maps.length; i++) {
        var engine = getEngineFromMap(maps[i])

        var urlField = engine.parent().parent().find(".url_field")
        var isVisible = urlField.css("display") != "none"
        
        if (isVisible) {
            var style = urlField.val()
        } else {
            var style = engine.parent().parent().find(".map").attr(STYLE_NAME)    
        }
        
        hash += ";s" + (i + 1) + "=" + style
    }

    location.hash = encodeURIComponent(hash)
}

function getDataFromHash() {

    if (location.hash == "") {
        return undefined
    }

    var data = decodeURIComponent(location.hash).split(";")
    var result = {}

    for (var i = 0; i < data.length; i++) {
        var item = data[i].replace("#", "")
        var split = item.split("=")

        var key = split[0]
        var value = split[1]

        if (key == "r1" || key == "r2" || key == "r3" || key == "r4") {
            value = RENDERING_ENGINE_BASE + value
        }

        result[key] = value
    }

    return result
}

/****************
 DROPDOWN
*****************/

var EXPANDED_CLASS = "dropdown_expanded"
var DROPDOWN_DURATION = 150
var EXPANDED_HEIGHT = 200
var COLLAPSED_HEIGHT = 35
var PADDING = 5

$(".dropdown_text_overlay").click(onDropdownClicked)

function onDropdownClicked(e) {

    var box = $(e.target).parent()

    // Find current active (expanded) element.
    // If it's a different dropdown than the one clicked, 
    // close it automatically, else continue to animated collapse
    var active = $("." + EXPANDED_CLASS)
    if (active.length == 1 && !($(active[0]).is(box))) {
        collapseDropdown(0)
    }

    var x = box.offset().left
    var y = box.offset().top + box.height() 

    if (box.hasClass(EXPANDED_CLASS)) {
        collapseDropdown()
    } else {
        box.addClass(EXPANDED_CLASS)
        expandDropdown()
    }
}

function onDropdownTextClicked(e) {

    var target = $(e.target)

    target.parent().find(".dropdown_text_active").removeClass("dropdown_text_active")
    target.addClass("dropdown_text_active")

    // Direct parent: dropdown_text_container
    // Grandparent: dropdown_container
    // Grat grantparent: map_container
    var container = target.parent().parent().parent()

    var name = target.html()

    if (name == URL_FIELD_PLACEHOLDER) {
        // Url field was clicked, no need to find any styles or render the map
        collapseDropdown()
        showUrlField(container)
        return
    }

    var style = findStyleFromName(name)

    // Find map dom:
    var mapDiv = container.find(".map")
    var mapId = mapDiv.attr("id")

    clearMap(mapDiv, mapId)

    // Find the index by replacing "map" in the id, e.g. "map1" -> "1".
    // Map dom indexing starts from 1, arrays start at 0
    var index = parseInt(mapId.replace("map", ""))

    var map = initializeMap(index, style)
    
    // Replace the map in our existing list
    maps[index - 1] = map

    addMoveEndListener(map)

    collapseDropdown()

    var data = getDataFromHash()

    if (data != undefined) {
        var zoom = parseFloat(data.zoom)
        var lat = parseFloat(data.lat)
        var lon = parseFloat(data.lon)
        
        setZoomAndCenterOf(map, zoom, lat, lon)
    }

    target.parent().parent().scrollTop(0);
}

function expandDropdown() {
    
    var container = getExpandedContainer()

    addStylesToDropdown(container)
    
    var options = { height: EXPANDED_HEIGHT }

    if (!isBottomDropdown()) {
        options.bottom = -EXPANDED_HEIGHT + PADDING + COLLAPSED_HEIGHT
        rotateTriangle(container, 0)
    } else {
        rotateTriangle(container, 180)
    }

    container.animate(options, DROPDOWN_DURATION)

    container.find(".dropdown_text_overlay").hide()
}

function collapseDropdown(duration = DROPDOWN_DURATION) {

    var container = getExpandedContainer()
    var options = { height: COLLAPSED_HEIGHT, bottom: PADDING }
    
    if (duration > 0) {
        container.animate(options, duration);
    } else {
        container.css(options)
    }
    
    rotateTriangle(container, 270)

    $(".dropdown_container").removeClass(EXPANDED_CLASS)

    container.find(".dropdown_text_overlay").show()
}

function addStylesToDropdown(container) {

    var styles = getStyles(container)

    var texts = container.find(".dropdown_text_container")
    texts.html("")
    texts.html(getStylesHtml(styles))


    $(".dropdown_text").click(onDropdownTextClicked)
}

function getStyles(container) {
    
    var engineContainer = container.parent().find(".rendering_engine_container")
    var engine = engineContainer.find("." + ACTIVE_RENDERING_ENGINE_CLASS)

    var styles = []

    if (engine.hasClass(RENDERING_ENGINE_OL)) {
        styles = findStylesFromRenderer(RENDERING_ENGINE_OL)
    } else if (engine.hasClass(RENDERING_ENGINE_GL)) {
        styles = findStylesFromRenderer(RENDERING_ENGINE_GL)
    } else if (engine.hasClass(RENDERING_ENGINE_TANGRAM)) {
        styles = findStylesFromRenderer(RENDERING_ENGINE_TANGRAM)
    } else if (engine.hasClass(RENDERING_ENGINE_LEAFLET)) {
        styles = findStylesFromRenderer(RENDERING_ENGINE_LEAFLET)
    }
    
    return styles
}

function getStylesHtml(styles) {

    var result = ""
    
    for (var i = 0; i < styles.length; i++) {
        result += "<div class='dropdown_text'>" + styles[i].name + "</div>"
    }

    result += "<div class='dropdown_text dropdown_text_url'>" + URL_FIELD_PLACEHOLDER + "</div>"

    return result
}

function rotateTriangle(container, degrees) {
    
    var triangle = container.find(".dropdown_triangle")
    var rotation = "rotate(" + degrees + "deg)"
    
    triangle.css("-ms-transform", rotation);
    triangle.css("-webkit-transform", rotation);
    triangle.css("transform", rotation);
}

// Distinction is important, top dropdowns expand down, bottom dropdowns expand up. 
function isBottomDropdown() {
    
    var container = getExpandedContainer()
    
    if (container == undefined) {
        return undefined
    }

    return container.hasClass("dropdown_container_3") || container.hasClass("dropdown_container_4")
}

function getExpandedContainer() {
    var containers = $(".dropdown_container")

    for (var i = 0; i < containers.length; i++) {
        var container = $(containers[i])
        
        if (container.hasClass(EXPANDED_CLASS)) {
            return container
        }
    }

    return undefined
}

/******************
 UTILS (UI, Math etc.)
*******************/

function getRendererId(activeEngine) {
    if (activeEngine.hasClass(RENDERING_ENGINE_OL)) {
        return RENDERING_ENGINE_OL
    } else if (activeEngine.hasClass(RENDERING_ENGINE_GL)) {
        return RENDERING_ENGINE_GL
    } else if (activeEngine.hasClass(RENDERING_ENGINE_TANGRAM)) {
        return RENDERING_ENGINE_TANGRAM
    } else if (activeEngine.hasClass(RENDERING_ENGINE_LEAFLET)) {
        return RENDERING_ENGINE_LEAFLET
    }
}

// Finds the current rendering engine choice from  any of your map_container's child div
function getEngineFromChildDiv(childDiv) {
    var container = getContainer(childDiv)
    var engine = container.find("." + ACTIVE_RENDERING_ENGINE_CLASS)
    return engine
}

// Finds the current rendering engine choice from your current map object
function getEngineFromMap(map) {

    var index = undefined

    for (var i = 0; i < maps.length; i++) {
        if (maps[i] == map) {
            index = i
        }
    }
    
    if (index != undefined) {
        var mapDiv = $("#map" + (index + 1))
        var engine = getEngineFromChildDiv(mapDiv);
        
        return engine
    }
    
    return undefined
}

function getContainer(childDiv) {
    return childDiv.parent().find(".rendering_engine_container")
}

function getMapView(map, engine) {

    if (engine.hasClass(RENDERING_ENGINE_OL)) {
        return map.getView()
    } else if (engine.hasClass(RENDERING_ENGINE_GL)) {
        return map
    } else if (engine.hasClass(RENDERING_ENGINE_TANGRAM)) {
        return map
    } else if (engine.hasClass(RENDERING_ENGINE_LEAFLET)) {
        return map
    }

    return undefined      
}

function clearMap(mapDiv, map_name) {
    // Map dom indexing starts from 1, arrays start at 0
    var index = parseInt(map_name.replace("map", "")) - 1

    // Leaflet cannot be refreshed simply by clearing the div,
    // we need to explicitly remove the map
    if (mapDiv.hasClass("leaflet-container")) {
        maps[index].remove()
    }

    mapDiv.html("")

    mapDiv.attr(STYLE_NAME, "")
    
    // Remove tags (classes) associated with leaflet
    mapDiv.removeClass("leaflet-container leaflet-touch leaflet-fade-anim")
}

function round(number) {
    return Math.round(number * 100) / 100
}









