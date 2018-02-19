// =====================================================================
// HYDRO
// - #water: Water Polygons
// - #waterway: rivers
// =====================================================================

// BEGIN STYLE //

#water[class='ocean']{
  ::shadow {
    polygon-fill: @water_shadow;
    polygon-geometry-transform: translate(0,1);
    [zoom>=14] {
      polygon-geometry-transform: translate(0,2);
    }
  }
  ::fill {
    polygon-fill: @water;
  }
}
  
#water[class='lake'],
#water[class='river'][zoom>=10]{
  ::shadow {
    polygon-fill: @water_shadow;
    polygon-geometry-transform: translate(0,1);
    [zoom>=14]{
      polygon-geometry-transform: translate(0,2);
    }
  }
  ::fill{
    polygon-fill: @water;
  }
}

//river styling
#waterway{
  [class='river'],
  [class='canal'][zoom>=12],
  [class='stream'][zoom>=14]{
    line-cap: [zoom]<=12 ? butt : round;
    line-color: @rivers_stroke;
    line-width: linear([view::zoom], (8, 0.5), (15, 2.0), (16, 3.0));
  }
}
