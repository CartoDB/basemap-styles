// =====================================================================
// LANDUSE/LANDCOVER
// - #landuse: urban areas
// - #landcover: park, wood
// - #park: nature_reserve, national_park
// - #poi: park labels
// - #buildings
// - #aeroways: runway, taxiway
// =====================================================================

//urban areas
#landuse[class='residential'][zoom>=6]{
  [zoom>=5]{polygon-fill:  @urban_fade_1;}
  [zoom>=8]{polygon-fill:  @urban_fade_2;}
  [zoom>=9]{polygon-fill:  @urban_fade_3;}
  [zoom>=11]{polygon-fill: @urban_fade_4;}
  [zoom>=13]{polygon-fill: @urban_fade_5;}
  [zoom>=15]{polygon-fill: @urban_fade_6;}
  [zoom>=16]{polygon-fill: @urban_fade_7;}
}

//green areas and parks

#landcover[class='wood'][zoom>=5],
#park[class='nature_reserve'][zoom>=5],
#park[class='national_park'][zoom>=9],
#landcover[class='grass'][zoom>=11],
#landcover[subclass='recreation_ground'][zoom>=12],
#landuse[class='cemetery'],
#landuse[class='stadium']{

  [zoom<=8]{polygon-fill:  @greenarea_fade_1;}
  [zoom>=9]{polygon-fill:  @greenarea_fade_2;}
  [zoom>=11]{polygon-fill: @greenarea_fade_3;}
  [zoom>=13]{polygon-fill: @greenarea_fade_4;}
  [zoom>=15]{polygon-fill: @green_area_highzoom;}
  
  polygon-pattern-file: url(images/park-halftone-1.png);
  polygon-pattern-opacity: @pattern_opacity;
  polygon-pattern-alignment: global;
}

//buildings
#building [zoom>=13]{
      ::fill {
       polygon-fill: @buildings;
       line-width: 0;
       [zoom<=14]{polygon-opacity: 0.8;}
       [zoom>=15]{polygon-opacity: 1;}
    }
  
    ::shadow[zoom>=15] {
      polygon-fill: @building_shadow;
      polygon-geometry-transform:translate(0,2);
  
      [zoom>=15]{line-color:@building_outline;}
      [zoom<=17]{line-width:0.5;}
      [zoom=15]{ polygon-geometry-transform:translate(0,1);}
      [zoom=17]{ polygon-geometry-transform:translate(0,3);}
      [zoom=18]{ polygon-geometry-transform:translate(0,5);} 
      a/polygon-fill: @building_a;  
    }
}

//aeroway
#aeroway {
  line-cap: square;
  line-join:miter;
  line-color: @aeroways;
  line-width:0.5;

  [class='runway']{
    [zoom=12] {line-width: 1;}
    [zoom=13] {line-width: 2;}
    [zoom=14] {line-width: 4;}
    [zoom=15] {line-width: 6;}
    [zoom>=16] {line-width: 8;}
  }

  [class='taxiway'][zoom>=13]{
    [zoom=13] {line-width: 0.5;}
    [zoom=14] {line-width: 1;}
    [zoom=15] {line-width: 2;}
    [zoom>=16] {line-width: 4;}
  }
}
