// =====================================================================
// ROADS
// - #transportation: ::case and ::fill for roads, rail, bridges, tunnels
// =====================================================================

// BEGIN STYLING //

#transportation{
  ::polygon{
    [class='path']['mapnik::geometry_type'=3][zoom>=14]{
      polygon-fill: @path_poly;
      polygon-opacity: linear([view::zoom], (14.0, 0.0), (14.5, 0.7));
    }
  }
  ::case{ }
  ::fill{ }
}

#transportation{
  [class='motorway']['mapnik::geometry_type'=2][zoom>=4]{
    ::case{
      line-cap: [zoom]<=9 ? butt : round;
      line-join: round;
      line-opacity: linear([view::zoom], (4.5, 0.0), (5, 0.5), (7, 1.0));
      line-color: linear([view::zoom], (9, @motorway_case_lowzoom), (10, @motorway_case));
      line-width: linear([view::zoom], (4.5, 0.0), (5, @05_hwy_f), (7, @07_hwy_f), (8, @08_hwy_f), (9, @09_hwy_f), (10, @10_hwy_f), (11, @11_hwy_f + 2.0), (12, @12_hwy_f + 2.5), (13, @13_hwy_f + 2.5), (14, @14_hwy_f + 3.0), (15, @15_hwy_f + 3.0), (16, @16_hwy_f + 4.0), (17, @17_hwy_f + 4.0), (18, @18_hwy_f + 5.0));
      [brunnel='tunnel'] { line-color: @tunnel_case; }
    }
    ::fill{
        line-color: @motorway;
        line-cap: [zoom]<=9 ? butt : round;
        line-join: round;
        line-opacity: 1;
        line-width: linear([view::zoom], (9.5, 0.0), (10, 1.0), (11, @11_hwy_f), (12, @12_hwy_f), (13, @13_hwy_f), (14, @14_hwy_f), (15, @15_hwy_f), (16, @16_hwy_f), (17, @17_hwy_f), (18, @18_hwy_f));
        [brunnel='tunnel'] { line-color: @tunnel; }
    }
  }
 
  [class='trunk']['mapnik::geometry_type'=2][zoom>=4],
  [class='primary']['mapnik::geometry_type'=2][zoom>=4]{
    ::case{ 
      line-cap: [zoom]<=10 ? butt : round;
      line-join: round;
      line-opacity: linear([view::zoom], (4.5, 0.0), (5, 0.5), (7, 1.0));
      line-color: linear([view::zoom], (11, @main_case_lowzoom), (12, @main_case));
      line-width: linear([view::zoom], (4.5, 0.0), (5, @5_trunk), (7, @7_maj_f), (8, @8_maj_f), (10, @10_maj_f), (11, @11_maj_f + 1.5), (12, @12_maj_f + 2.0), (13, @13_maj_f + 2.0), (14, @14_maj_f + 2.5), (15, @15_maj_f + 2.5), (16, @16_maj_f + 2.5), (17, @17_maj_f + 3.0), (18, @18_maj_f + 3.0));
      [brunnel='tunnel'] { line-color: @tunnel_case; }
      [class='trunk'] { line-color: @motorway_case_lowzoom; }
      [class='primary'] {
        line-width: linear([view::zoom], (6.5, 0.0), (9, @7_primary), (10, @10_primary), (11, @11_maj_f + 1.5), (12, @12_maj_f + 2.0), (13, @13_maj_f + 2.0), (14, @14_maj_f + 2.5), (15, @15_maj_f + 2.5), (16, @16_maj_f + 2.5), (17, @17_maj_f + 3.0), (18, @18_maj_f + 3.0));
      }
    }

    ::fill{
      line-cap: [zoom]<=10 ? butt : round;
      line-join: round;
      line-color: @main;
      line-width: linear([view::zoom], (10.5, 0.0), (11, @11_maj_f), (12, @12_maj_f), (13, @13_maj_f), (14, @14_maj_f), (15, @15_maj_f), (16, @16_maj_f), (17, @17_maj_f), (18, @18_maj_f));
      line-opacity: linear([view::zoom], (6, 0.0), (7, 1.0));
      [brunnel='tunnel'] { line-color: @tunnel; }
      [class='trunk'] { line-color: @motorway; }
    }
  }

  [class='secondary']['mapnik::geometry_type'=2][zoom>=11],
  [class='tertiary']['mapnik::geometry_type'=2][zoom>=11]{
    ::case{
      line-cap: [zoom]<=13 ? butt : round;
      line-join: round;
      line-color: linear([view::zoom], (11, @secondary_case_lowzoom), (12, @secondary_case));
      line-width: linear([view::zoom], (10.5, 0.0), (11, @11_sec_f), (12, @12_sec_f + 1.5), (13, @13_sec_f + 2.0), (14, @14_sec_f + 2.5), (15, @15_sec_f + 2.5), (16, @16_sec_f + 2.5), (17, @17_sec_f + 3.0), (18, @18_sec_f + 3.0));
      [brunnel='tunnel'] { line-color: @tunnel_case; }
    }
    ::fill{
      line-cap: [zoom]<=13 ? butt : round;
      line-join: round;
      line-color: @secondary;
      line-width: linear([view::zoom], (11, 0.0), (11.5, 1.2), (12, 1.4), (13, @13_sec_f), (14, @14_sec_f), (15, @15_sec_f), (16, @16_sec_f), (17, @17_sec_f), (18, @18_sec_f));
      [brunnel='tunnel'] { line-color: @tunnel; }
    }
  }

  [class='minor']['mapnik::geometry_type'=2][zoom>=11]{
    ::case{
      line-cap: [zoom]<=13 ? butt : round;
      line-join: round;
      line-color: linear([view::zoom], (13, @street_lowzoom), (14, @minor_case));
      line-width: linear([view::zoom], (11.5, 0.0), (12.0, @12_min_f), (13, @13_min_f), (14, @14_min_f + 1.5), (15, @15_min_f + 2.0), (16, @16_min_f + 2.0), (17, @17_min_f + 3.0), (18, @18_min_f + 3.0));
      [brunnel='tunnel'] { line-color: @tunnel_case; }
    }
    ::fill{
      line-cap: [zoom]<=13 ? butt : round;
      line-join: round;
      line-color: linear([view::zoom], (13, @street_lowzoom), (14, @street));
      line-width: linear([view::zoom], (13.5, 0.0), (14, @14_min_f), (15, @15_min_f), (16, @16_min_f), (17, @17_min_f), (18, @18_min_f));
      [brunnel='tunnel'] { line-color: @tunnel; }
    }
  }
  
  [class='motorway'][ramp=1]['mapnik::geometry_type'=2][zoom>=11],
  [class='trunk'][ramp=1]['mapnik::geometry_type'=2][zoom>=11], 
  [class='primary'][ramp=1]['mapnik::geometry_type'=2][zoom>=11],
  [class='secondary'][ramp=1]['mapnik::geometry_type'=2][zoom>=11],
  [class='tertiary'][ramp=1]['mapnik::geometry_type'=2][zoom>=11]{
    ::case{
      line-cap: [zoom]<=12 ? butt : round;
      line-join: round;
      line-color: linear([view::zoom], (13, @motorway_ramp_lowzoom), (14, @motorway_case));
      line-width: linear([view::zoom], (11, 0.0), (13, 0.8), (14, @14_hwy_f/2.0 + 1.0), (15, @15_hwy_f/2.0 + 2.0), (16, @16_hwy_f/2.0 + 2.0), (17, @17_hwy_f/2.0 + 2.0), (18, @18_hwy_f/2.0 + 2.0));
      [class='primary']{
        line-color: @main_case;
        line-width: linear([view::zoom], (12, 0.0), (13, 0.8), (14, @14_hwy_f/2.0 + 1.0), (15, @15_hwy_f/2.0 + 2.0), (16, @16_hwy_f/2.0 + 2.0), (17, @17_hwy_f/2.0 + 2.0), (18, @18_hwy_f/2.0 + 2.0));
      }
      
      [class='secondary'],
      [class='tertiary']{
        line-color: @secondary_case;
        line-width: linear([view::zoom], (12, 0.0), (13, 0.8), (14, @14_hwy_f/2.0 + 1.0), (15, @15_hwy_f/2.0 + 2.0), (16, @16_hwy_f/2.0 + 2.0), (17, @17_hwy_f/2.0 + 2.0), (18, @18_hwy_f/2.0 + 2.0));
      }
      
      [brunnel='tunnel'] { line-color: @tunnel_case; }
    }

    ::fill{
      line-cap: [zoom]<=12 ? butt : round;
      line-join: round;
      line-color: @motorway;
      line-width: linear([view::zoom], (13, 0.0), (14, @14_hwy_f/2.0), (15, @15_hwy_f/2.0), (16, @16_hwy_f/2.0), (17, @17_hwy_f/2.0), (18, @18_hwy_f/2.0));
      [class='primary'] { line-color: @main; }
      [class='secondary'],[class='tertiary'] { line-color: @minor_ramp_highzoom; }
      [brunnel='tunnel'] { line-color: @tunnel; }
    }
  }
 
  [class='service']['mapnik::geometry_type'=2][zoom>=14]{
    ::case{
      line-cap: [zoom]<=15 ? butt : round;
      line-join: round;
      line-color: linear([view::zoom], (15, @street), (16, @minor_case));
      line-width: linear([view::zoom], (14.5, 0.0), (15, @15_min_f/4.0*2.0), (16, @16_min_f/2.0*2.0), (17, @17_min_f/2.0*2.0), (18, @18_min_f/3.0*2.0));
      [brunnel='tunnel'] { line-color: @tunnel_case; }
    }
    ::fill{
      line-color: @street;
      line-cap: [zoom]<=15 ? butt : round;
      line-join: round;
      line-width: linear([view::zoom], (15.5, 0.0), (16, @16_min_f/2.0), (17, @17_min_f/2.0), (18, @18_min_f/3.0));
      [brunnel='tunnel'] { line-color: @tunnel; }
    }
  }

  [class='path']['mapnik::geometry_type'=2][zoom>=14],
  [class='track']['mapnik::geometry_type'=2][zoom>=14]{
    ::case{
      line-cap: butt;
      line-color: @path;
      line-opacity: 0.8;
      line-dasharray: 1, 1;
      line-width: linear([view::zoom], (14.5, 0.0), (15, 1.2), (16, 1.5), (17, 2.0), (18, 2.5));
      [zoom>=15] { line-dasharray: 1.2, 1.2; }
      [zoom>=16] { line-dasharray: 1.5,1.5; }
      [zoom>=17] { line-dasharray: 2,2; }
      [zoom>=18] { line-dasharray: 2.5,2.5; }
    }
  }
  
  [class='rail'][brunnel!='tunnel'][zoom>=12]{
    ::case{
      line-cap: [zoom]<=14 ? butt : round;
      line-width: linear([view::zoom], (12, 0.0), (13, 0.5), (15, 2.0), (17, 3.0), (18, 6.0));
      line-color: @rail;
      dash/line-cap: butt;
      dash/line-width: linear([view::zoom], (14.5, 0.0), (15, 1.0), (17, 2.0), (18, 4.0));
      dash/line-color: @rail_dash;
      dash/line-dasharray: 6,6;
    }
  }
}
