// =====================================================================
// ROADS
// - #transportation: ::case and ::fill for roads, rail, bridges, tunnels
// =====================================================================

#transportation {
  ::case { opacity: 1; }
  ::fill { opacity: 1; }
}

#transportation {
  [class='motorway']['mapnik::geometry_type'=2]{
    ::case[zoom>=5] {
      line-color: @motorway_case;
      line-cap:round;
      line-join: round;
      line-width: @05_hwy_f;
      line-opacity: 0.5;
      [brunnel='tunnel']{line-color: @tunnel_case;}
      [zoom<=9] {line-color: @motorway_case_lowzoom;}
      [zoom>=7]   { line-width:@07_hwy_f; line-opacity:1; }
      [zoom>=8]   { line-width: @08_hwy_f; }
      [zoom>=9]   { line-width:@09_hwy_f; }
      [zoom>=10]  { line-width: @10_hwy_f; }
      [zoom>=11]   {line-width: @11_hwy_f + 2;}
      [zoom>=12]   {line-width: @12_hwy_f + 2.5;}
      [zoom>=13]   {line-width: @13_hwy_f + 2.5;}
      [zoom>=14]   {line-width: @14_hwy_f + 3;}
      [zoom>=15]   {line-width: @15_hwy_f + 3;}
      [zoom>=16]   {line-width: @16_hwy_f + 4;}
      [zoom>=17]   {line-width: @17_hwy_f + 4;}
      [zoom>=18]   {line-width: @18_hwy_f + 5;}
    }
    ::fill[zoom>=10] {
        line-color:@motorway;
        line-cap:round;
        line-join: round;
        line-opacity: 1;
        [brunnel='tunnel']{line-color: @tunnel;}
        [zoom>=10] {line-width: 1;}
        [zoom=11]  {line-width: @11_hwy_f;}
        [zoom=12]  {line-width: @12_hwy_f;}
        [zoom=13]  {line-width: @13_hwy_f;}
        [zoom=14]  {line-width: @14_hwy_f;}
        [zoom=15]  {line-width: @15_hwy_f;}
        [zoom=16]  {line-width: @16_hwy_f;}
        [zoom=17]  {line-width: @17_hwy_f;}
        [zoom>=18] {line-width: @18_hwy_f;}
      }
   }
 
  [class='trunk']['mapnik::geometry_type'=2],
  [class='primary']['mapnik::geometry_type'=2][zoom>=7]{
    ::case[zoom>=5]{ 
      line-color:@main_case;
      line-cap:round;
      line-join: round;
      line-width: @5_trunk;
      line-opacity: 0.5;
      [zoom<=11]{line-color: @main_case_lowzoom;}
      [brunnel='tunnel']{line-color: @tunnel_case;}
      [class='trunk']{line-color: @motorway_case_lowzoom;}
      [zoom>=7]  {line-width: @7_maj_f;line-opacity:1; }
      [zoom>=8]  {line-width: @8_maj_f;}
      [zoom>=10] {line-width: @10_maj_f;}
      [zoom>=11] {line-width: @11_maj_f+1.5;}
      [zoom>=12] {line-width: @12_maj_f+2;}
      [zoom>=13] {line-width: @13_maj_f+2;}
      [zoom>=14] {line-width: @14_maj_f+2.5;}
      [zoom>=15] {line-width: @15_maj_f+2.5;}
      [zoom>=16] {line-width: @16_maj_f+2.5;}
      [zoom>=17] {line-width: @17_maj_f+3;}
      [zoom>=18] {line-width: @18_maj_f+3;}
      
      [class='primary']{
        [zoom<=9]{line-width: @7_primary;}
        [zoom=10]{line-width: @10_primary;}
      }
    }

    ::fill[zoom>=11]{
      line-color: @main;
      line-cap:round;
      line-join: round;
      [brunnel='tunnel']{line-color: @tunnel;}
      [class='trunk']{line-color: @motorway;}
      [zoom>=11]  {line-width: @11_maj_f;}
      [zoom>=12]  {line-width: @12_maj_f;}
      [zoom>=13]  {line-width: @13_maj_f;}
      [zoom>=14]  {line-width: @14_maj_f;}
      [zoom>=15]  {line-width: @15_maj_f;}
      [zoom>=16]  {line-width: @16_maj_f;}
      [zoom>=17]  {line-width: @17_maj_f;}
      [zoom>=18]  {line-width: @18_maj_f;}
    }
  }

  [class='secondary']['mapnik::geometry_type'=2],
  [class='tertiary']['mapnik::geometry_type'=2]{
    ::case[zoom>=11]{
      line-color: @secondary_case;
      line-cap:round;
      line-join: round;
      [zoom<=11]{line-color: @secondary_case_lowzoom;}
      [brunnel='tunnel']{line-color: @tunnel_case;}
      [zoom>=10]  {line-width:  @10_sec_f;}
      [zoom>=11]  {line-width:  @11_sec_f;}
      [zoom>=12]  {line-width:  @12_sec_f + 1.5;}
      [zoom>=13]  {line-width:  @13_sec_f + 2;}
      [zoom>=14]  {line-width:  @14_sec_f + 2.5;}
      [zoom>=15]  {line-width:  @15_sec_f + 2.5;}
      [zoom>=16]  {line-width:  @16_sec_f + 2.5;}
      [zoom>=17]  {line-width:  @17_sec_f + 3;}
      [zoom>=18]  {line-width:  @18_sec_f + 3;}
   
    }
    ::fill[zoom>=12]{
      line-color:@secondary;
      line-cap:round;
      line-join: round;
      [brunnel='tunnel']{line-color:@tunnel;}
      [zoom>=12] {line-width: 1.4;}
      [zoom>=13]  {line-width: @13_sec_f;}
      [zoom>=14]  {line-width: @14_sec_f;}
      [zoom>=15]  {line-width: @15_sec_f;}
      [zoom>=16]  {line-width: @16_sec_f;}
      [zoom>=17]  {line-width: @17_sec_f;}
      [zoom>=18]  {line-width: @18_sec_f;}
    }
  }

  [class='minor']['mapnik::geometry_type'=2]{
    ::case[zoom>=12]{
      line-join:round;
      line-cap: round;
      line-color:@minor_case;
      [brunnel='tunnel']{line-color: @tunnel_case;}
      [zoom<=13]{line-color:@street_lowzoom;}
      [zoom=12]  {line-width: @12_min_f;}
      [zoom=13]  {line-width: @13_min_f;}
      [zoom=14]{line-width:@14_min_f+1.5;}
      [zoom=15]{line-width:@15_min_f+2;}
      [zoom=16]{line-width:@16_min_f+2;}
      [zoom=17]{line-width:@17_min_f+3;}
      [zoom=18]{line-width:@18_min_f+3;}
    }
    ::fill[zoom>=14]{
      line-join:round;
      line-cap: round;
      line-color:@street;
      [brunnel='tunnel']{line-color:@tunnel;}
      [zoom<=13]  {line-color:@street_lowzoom;}
      [zoom>=12]  {line-width: @12_min_f;}
      [zoom>=14]  {line-width: @14_min_f;}
      [zoom>=15]  {line-width: @15_min_f;}
      [zoom>=16]  {line-width: @16_min_f;}
      [zoom>=17]  {line-width: @17_min_f;}
      [zoom>=18]  {line-width: @18_min_f;}
    }
  }
   
  
  [class='motorway'][ramp=1]['mapnik::geometry_type'=2],
  [class='trunk'][ramp=1]['mapnik::geometry_type'=2], 
  [class='primary'][ramp=1]['mapnik::geometry_type'=2],
  [class='secondary'][ramp=1]['mapnik::geometry_type'=2],
  [class='tertiary'][ramp=1]['mapnik::geometry_type'=2]{
    ::case[zoom>=9]{
      line-color:@motorway_case;
      line-cap:round;
      line-join: round;
      [zoom<=11] {line-width:0;}
      [zoom<=13] {line-width: 0.8;line-color:@motorway_ramp_lowzoom;}
      
      [zoom=14]  {line-width: @14_hwy_f/2+1;}
      [zoom=15]  {line-width: @15_hwy_f/2+2;}
      [zoom=16]  {line-width: @16_hwy_f/2+2;}
      [zoom=17]  {line-width: @17_hwy_f/2+2;}
      [zoom>=18] {line-width: @18_hwy_f/2+2;}
      
     
      [class='primary']{
        line-color:@main_case;
        [zoom<=12]{line-width:0;}
      }
      
      [class='secondary'],
      [class='tertiary']{
        line-color:@secondary_case;
        [zoom<=12]{line-width:0;}
      }
      
      [brunnel='tunnel']{line-color: @tunnel_case;}
  }

  ::fill[zoom>=9]{
      line-join:round;
      line-cap: round;
      line-color:@motorway;
      
      [zoom<=13] {line-width: 0;line-color:transparent;}
  
      [zoom=14]  {line-width: @14_hwy_f/2;}
      [zoom=15]  {line-width: @15_hwy_f/2;}
      [zoom=16]  {line-width: @16_hwy_f/2;}
      [zoom=17]  {line-width: @17_hwy_f/2;}
      [zoom>=18] {line-width: @18_hwy_f/2;}
      
      [class='trunk'],
      [class='motorway']{
        line-color:@motorway;
      }

      [class='primary']{
        line-color:@main;
      }
      [class='secondary'],
      [class='tertiary']{
        line-color:@minor_ramp_highzoom;
      }
      [brunnel='tunnel']{line-color:@tunnel;}
    }
  }
 
  [class='service']['mapnik::geometry_type'=2]{
    ::case[zoom>=15]{
      line-join:round;
      line-cap: round;
      line-color: @minor_case;
      [zoom<=15] { line-color:@street;}
      [zoom>=15] { line-width:@15_min_f/4*2; }
      [zoom>=16] { line-width:@16_min_f/2*2;}
      [zoom>=17] { line-width:@17_min_f/2*2; }
      [zoom>=18] { line-width:@18_min_f/3*2; }
    }
    ::fill[zoom>=16]{
      line-color: @street;
      line-join:round;
      line-cap: round;
       [brunnel='tunnel']{line-color:@tunnel;}
      [zoom>=16] {line-width: @16_min_f/2;}
      [zoom>=17] { line-width:@17_min_f/2; }
      [zoom>=18] { line-width:@18_min_f/3; }
    }
  }

  [class='path']['mapnik::geometry_type'=2][zoom>=15],
  [class='track']['mapnik::geometry_type'=2][zoom>=16]{
    ::case{
      line-color: @path;
      line-opacity: 0.8;
      line-dasharray: 1 , 1;
      line-width: 0.5;
      [zoom>=15] { line-width: 1.2; line-dasharray: 1.2, 1.2; }
      [zoom>=16] { line-width: 1.5; line-dasharray: 1.5,1.5; }
      [zoom>=17] { line-width: 2; line-dasharray: 2,2; }
      [zoom>=18] { line-width: 2.5; line-dasharray: 2.5,2.5; }
      
    }
  }
    
  [class='rail'][brunnel!='tunnel'][zoom>=13]{
    ::case{
      line-width: 0.5;
      line-color: @rail;
      [zoom>=15]{
        line-width: 2;    
        dash/line-width: 1;
        dash/line-color: @rail_dash;
        dash/line-dasharray: 6,6;
      }
      [zoom>=17]{
        line-width: 3;    
        dash/line-width: 2;
      }
      [zoom>=18]{
        line-width: 6;    
        dash/line-width: 4;
      }
    }
  }
  
  [class='path']['mapnik::geometry_type'=3][zoom>=15]{
    ::case {
      polygon-fill: @path_poly;
      polygon-opacity: 0.7;
      line-width: 0;
      line-color: @buildings;
     }
  }
}

