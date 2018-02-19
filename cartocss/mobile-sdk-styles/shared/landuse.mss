// =====================================================================
// LANDUSE/LANDCOVER
// - #landuse: urban areas
// - #landcover: park, wood
// - #park: nature_reserve, national_park
// - #poi: park labels
// - #buildings
// - #aeroways: runway, taxiway
// =====================================================================

// BEGIN STYLING //

//urban areas
#landuse[class='residential'][zoom>=6]{
  polygon-fill: linear([view::zoom], (5, @urban_fade_1), (8, @urban_fade_2), (9, @urban_fade_3), (11, @urban_fade_4), (13, @urban_fade_5), (15, @urban_fade_6), (16, @urban_fade_7));
}

//green areas and parks
#landcover[class='wood'][zoom>=5],
#park[class='nature_reserve'][zoom>=5],
#park[class='national_park'][zoom>=9],
#landcover[class='grass'][zoom>=9],
#landcover[subclass='recreation_ground'][zoom>=12],
#landuse[class='cemetery'],
#landuse[class='stadium']{
  polygon-fill: linear([view::zoom], (8, @greenarea_fade_1), (9, @greenarea_fade_2), (11, @greenarea_fade_3), (13, @greenarea_fade_4), (15, @green_area_highzoom));

  #landcover[class='grass']{
    polygon-opacity: linear([view::zoom], (9.0, 0.0), (11, 1.0));
  }
}

//buildings
#building [zoom>=13]['mapnik::geometry_type'=3]['nuti::buildings'>0]{
  ::3d['nuti::buildings'>1][zoom>=15]{
    building-height: [render_height] ? [render_height] : 10;
    building-min-height: [render_min_height];
    building-fill: lighten(@buildings,10%);
    building-fill-opacity: linear([view::zoom], (15, 0.0), (18, 0.25));
  } 

  ::shadow['nuti::buildings'=1][zoom>=15]{
    polygon-fill: @building_shadow;
    polygon-opacity: linear([view::zoom], (14.5, 0.0), (15, 1.0));
    [zoom>=15] { polygon-geometry-transform: translate(0,1); }
    [zoom>=16] { polygon-geometry-transform: translate(0,2); }
    [zoom>=17] { polygon-geometry-transform: translate(0,3); }
    [zoom>=18] { polygon-geometry-transform: translate(0,5); } 
  }

  ::fill{
    polygon-fill: @buildings;
    polygon-opacity: linear([view::zoom], (13, 0.0), (14.5, 0.8), (15, 1.0));
  }
}

//aeroway
#aeroway{
  line-cap: butt;
  line-join: miter;
  line-color: @aeroways;
  line-width: 0.5;

  [class='runway']{
    line-width: linear([view::zoom], (10, 0.0), (11, 0.5), (12, 1.0), (13, 2.0), (14, 4.0), (15, 6.0), (16, 8.0));
  }

  [class='taxiway']{
    line-width: linear([view::zoom], (12, 0.0), (13, 0.5), (14, 1.0), (15, 2.0), (16, 4.0));
  }
}
