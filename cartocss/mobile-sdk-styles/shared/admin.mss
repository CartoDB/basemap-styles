// =====================================================================
// ADMIN Boundaries, Places, and Place Labels
// - #boundary: countries
// - #boundary: states and provinces
// =====================================================================



// BEGIN STYLING //

//country boundaries
#boundary[admin_level=2][maritime=0]{
  ::outline{
    line-cap: butt;
    line-width: linear([view::zoom], (5, 0.0), (6, 8.0));
    line-color: @admin0_6;
    line-opacity: 0.5;
  }

  line-cap: butt;
  line-color: linear([view::zoom], (3, @admin0_3), (4, @admin0_4), (5, @admin0_5), (6, @admin0_7), (7, @admin0_7));
  line-width: linear([view::zoom], (0, 0.25), (2, 1.0), (6, 1.5));

  [disputed=1]{
    line-dasharray: 3,3;
    [zoom>=7] { line-dasharray: 4,4; }
  }
}

//state and province boundaries
#boundary[admin_level>2][admin_level<=6][zoom>=3][maritime=0]{
  eraser/line-cap: butt;
  eraser/line-color: @landmass_fill;
  eraser/line-width: linear([view::zoom], (4, 0.0), (7, 1.0), (9, 1.2));
  line-cap: butt;
  line-color: linear([view::zoom], (4, @admin1_low), (6, @admin1_high));
  line-width: linear([view::zoom], (4, 0.0), (7, 1.0), (9, 1.2));
  [zoom>=7]{
    line-dasharray: 2,2;
  }
}
