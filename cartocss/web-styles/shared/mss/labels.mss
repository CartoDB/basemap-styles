

//ocean labels
#water_name[class='ocean'][zoom>=2][zoom<=8],
#water_name[class='sea'][zoom>=5]{
    text-name: "[name]";
    text-face-name: @mont_it_md;
    text-wrap-width: 50;
    text-wrap-before: true;
    text-size: 14;
    text-fill: @marine_labels;
    text-halo-fill: @marine_labels_halo;
    text-halo-radius: 1;
    text-line-spacing: -2;
    text-character-spacing: 1.1;

    [zoom>=3] {text-size: 16;}
    [zoom>=4] {text-size: 18;}
    [zoom>=5] {text-size: 20;}
    
    [class='sea']{
      text-size: 12;
    }
}

//Continent Labels zooms 0-2
#place[class='continent'][zoom>=1][zoom<=2]{
  text-size: 10;
  text-name: "[name]";
  text-fill: @continent_text;
  text-face-name: @mont_md;
  text-transform: uppercase;
  text-halo-fill: @continent_halo;
  text-halo-radius: 1;
  text-wrap-width: 20;
  text-character-spacing: 0.5;
  text-align: center;
  
  [zoom>=2] {
    text-size: 14;
    text-wrap-width:40;
  
    [name='Asia']{
      text-dy: 35;
      text-dx: -35;
    }
  
    [name='North America'],[name='Africa']{
      text-dx: 1;
      text-dy: 1;
    }
  
    [name='Europe'],[name='Oceania']{
      text-dy: 20;
    }
  
    [name='South America']{
      text-dy: -8;
    }
  }
}


#place[class='country'] {
  [rank=1][zoom>=3][zoom<=6], 
  [rank=2][zoom>=3][zoom<=7],
  [rank=3][zoom>=4][zoom<=8], 
  [rank=4][zoom>=5][zoom<=9], 
  [rank=5][zoom>=6][zoom<=10], 
  [rank>=6][zoom>=7][zoom<=10]{
    text-name: [name_en];
    text-face-name: @mont_md;
    text-placement: point;
    text-size: 0;
    text-fill: @country_text_dark;
    text-halo-fill: @country_halo;
    text-halo-radius: 1;
    text-halo-rasterizer: fast;
    text-wrap-width: 30;
    text-wrap-before: true;
    text-line-spacing: -2;
    text-min-distance: 2;
    text-transform: uppercase;
    text-character-spacing: 0.5;

    [zoom>=5]{text-fill:@country_text_med;}
    [zoom>=6]{text-fill:@country_text_light;}

    [iso_a2=null]{
      text-name: '';
      text-face-name: @mont_md;
      text-fill: transparent;
    }
    
    [rank=1]{
      [zoom=2]  { text-size: 10; text-wrap-width: 60; }
      [zoom=3]  { text-size: 11; text-wrap-width: 80; }
      [zoom=4]  { text-size: 12; text-wrap-width: 100; }
      [zoom=5]  { text-size: 13; text-wrap-width: 120; }
      [zoom>=6] { text-size: 15; text-wrap-width: 140; }
    }
    [rank=2]{
      [zoom=3]  { text-size: 10;text-wrap-width: 60; }
      [zoom=4]  { text-size: 11; text-wrap-width: 70;}
      [zoom=5]  { text-size: 12; text-wrap-width: 80;}
      [zoom>=6] { text-size: 13; text-wrap-width: 100;}
    }
    [rank=3]{
      [zoom=4]  { text-size: 10; }
      [zoom=5]  { text-size: 11; }
      [zoom=6]  { text-size: 12; }
      [zoom=7]  { text-size: 13; text-wrap-width: 60; }
      [zoom>=8] { text-size: 14; text-wrap-width: 120; }
    }
    [rank=4]{
      [zoom=5] { text-size: 10; }
      [zoom=6] { text-size: 11; text-wrap-width: 60  }
      [zoom=7] { text-size: 12; text-wrap-width: 90; }
      [zoom=8] { text-size: 13; text-wrap-width: 120; }
      [zoom>=9] { text-size: 14; text-wrap-width: 120; }
    }
    [rank=5]{
      [zoom=5] { text-size: 10; }
      [zoom=6] { text-size: 11; }
      [zoom=7] { text-size: 12; text-wrap-width: 60; }
      [zoom=8] { text-size: 13; text-wrap-width: 90; }
      [zoom>=9] { text-size: 14; text-wrap-width: 120; }
    }
    [rank>=6]{
      [zoom=6] { text-size: 10; }
      [zoom=7] { text-size: 11; }
      [zoom=8] { text-size: 12; }
      [zoom>=9] { text-size: 13; }
    }
  }  
}

//State and province labels
#place[class='state'][zoom>=6][zoom<=10]{
  [zoom>=5][rank<=2],
  [zoom>=6][rank<=4],
  [zoom>=7][rank<=99]{
  text-name: [name_en];
  text-face-name: @mont_md;
  text-fill: @state_text;
  text-halo-fill: @state_halo;
  text-halo-radius: 1;
  text-halo-rasterizer: fast;
  text-size: 11;
  text-transform: uppercase;
  text-allow-overlap: false;
  text-wrap-width: 60;
  text-wrap-before: true;
  text-min-distance:5;
  text-placement-type: simple;

  [zoom>=6]{text-size: 12;text-wrap-width:80;}
  [zoom>=7]{text-size:13; text-wrap-width:100;}
  [zoom>=8]{text-fill:@state_text_light;text-character-spacing: 0.5;}
    
  }
}
//city dots
#place::citydots[class='city'][zoom>=5][zoom<=7][name_en!='Monterey'] {
  [zoom>=4][rank<=2],
  [zoom>=5][rank<=4],
  [zoom>=6][rank<=6],
  [zoom>=7][rank<=7]{
    shield-file: @city_shield;
    shield-unlock-image: true;
    shield-name: '[name_en]';
    shield-size: 10;
    shield-face-name: @mont_md;
    shield-fill: @place_text;
    shield-halo-fill: @place_halo;
    shield-halo-radius: 1;
    shield-halo-rasterizer: fast;
    shield-placement-type: simple;
    shield-placements: "W,E,NW,NE,SE,10";
    shield-line-spacing: -2;
    shield-text-dx: -3;
    shield-text-dy: 0;
    shield-min-distance: 3;
    shield-wrap-width: 40;
    shield-size: 11;
    
    [zoom>=4] {
      [rank>=0][rank<=2] { shield-size: 10; }
      [rank>=3][rank<=5] { shield-size: 9; }
    }
    [zoom>=5] {
      [rank>=0][rank<=2] { 
        shield-size: 11; 
        shield-text-transform:uppercase;
        shield-wrap-width:50;
      }
      [rank>=3][rank<=5] { shield-size: 10; }
    }
    [zoom>=6] {
      shield-fill: @place_text;
      [rank>=0][rank<=2] { shield-size: 12; }
      [rank>=3][rank<=5] { shield-size: 10; }
      shield-wrap-width:60;
    }
    [zoom=7] {
      shield-wrap-width:60;
      [rank>=0][rank<=2] { shield-size: 12; }
      [rank>=3][rank<=5] { 
        shield-size: 11;
        shield-text-transform:uppercase; 
      }
      [rank>=6] { shield-size: 10; }
    }
  }
}

#place[class='city'][zoom>=8][zoom<=14][rank<=11],
#place[class='city'][zoom>=9][zoom<=14][rank<=12],
#place[classd='city'][zoom>=10][zoom<=14][rank<=15]{
  text-name: [name_en];
  text-face-name: @mont_md;
  text-placement: point;
  text-fill: @place_text;
  text-halo-fill: @place_halo;
  text-halo-radius: 1;
  text-halo-rasterizer: fast;
  //text-wrap-width: 40;
  text-line-spacing: -2;
  text-min-distance: 2;
  //text-wrap-before: true;
  [zoom>=10]{text-transform: uppercase;}
  [zoom>=13]{text-name: [name];}
  [zoom=8]{
    text-size: 9;
    text-wrap-width: 50;
    [rank<=7]{text-transform: uppercase;}
    [rank>=0][rank<=4] { text-size: 13; }
    [rank>=5][rank<=7] { text-size: 11; }
    [rank>=8][rank<=9] { text-size: 10; }
  }
  
  [zoom=9] {
    text-size: 10;
    text-wrap-width: 60;
    [rank<=10]{text-transform: uppercase;}
    [rank>=0][rank<=4] { text-size: 14; }
    [rank>=5][rank<=7] { text-size: 13; }
    [rank>=8][rank<=9] { text-size: 11; }
  }
  
  [zoom=10] {
    text-size: 11;
    text-wrap-width: 60;
    text-transform: uppercase;
    [rank>=0][rank<=4] { text-size: 15; }
    [rank>=5][rank<=7] { text-size: 14; }
    [rank>=8][rank<=9] { text-size: 12; }
  }
  
  [zoom=11]{
    text-size: 12;
    text-wrap-width: 70;
    [rank<=10]{text-transform: uppercase;}
    [rank>=0][rank<=5] { text-size: 16; }
    [rank>=6][rank<=7] { text-size: 14; }
    [rank>=8][rank<=11] { text-size: 13; }
  }
  
  [zoom=12] {
    text-size: 13;
    text-wrap-width: 80;
    [rank<=11]{text-transform: uppercase;}
    [rank>=0][rank<=5] { text-size: 17; }
    [rank>=6][rank<=7] { text-size: 15; }
    [rank>=8][rank<=11] { text-size: 14; }
  }
  
  [zoom=13] {
    text-size: 14;
    text-wrap-width: 120;
    [rank>=0][rank<=5] { text-size: 20; }
    [rank>=6][rank<=7] { text-size: 18; }
    [rank>=8][rank<=11] { text-size: 16; }
  }
  
  [zoom=14] {
    text-size: 20;
    text-wrap-width: 200;
    text-name: [name];
  }
  
  [zoom=15]{
    text-name: "";
  }
}

//Towns
#place[class='town'][zoom>=9][zoom<=14][rank<=12],
#place[class='town'][zoom>=15][zoom<=16]{
  text-name: [name_en];
  text-face-name: @mont_md;
  text-placement: point;
  text-fill: @place_text;
  text-halo-fill: @place_halo;
  text-halo-radius: 1;
  text-halo-rasterizer: fast;
  text-wrap-before: true;
  text-line-spacing: -2;
  text-size: 9;
  text-min-distance: 5;

  [zoom>=9] { text-size: 9; text-wrap-width: 70; }
  [zoom>=10] { text-size: 10;text-wrap-width:80; }
  [zoom>=11] { text-size: 11; text-wrap-width:90;}
  [zoom>=12] { text-size: 12; text-wrap-width:100;}
  [zoom>=13] { 
    text-size: 13;
    text-name: [name];
    text-wrap-width:110;
  }
  
  [zoom>=14] { 
    text-size: 15; 
    text-wrap-width: 130;
  }
  
  [zoom>=15]{
    text-size: 17;
    text-wrap-width: 140;
  }

  [zoom>=16] {text-name:""; }
}

//Villages
#place[class='village'][zoom>=12][zoom<=14][rank<=11],
#place[class='village'][zoom>=15][zoom<=16] {
  text-name: [name_en];
  text-face-name: @mont_md;
  text-placement: point;
  text-fill: @place_text;
  text-halo-fill: @place_halo;
  text-size: 9;
  text-halo-radius: 1;
  text-halo-rasterizer: fast;
  text-wrap-width: 60;
  text-wrap-before: true;
  text-line-spacing: -2;
  [zoom>=12] { 
    text-size: 10; 
    text-wrap-width:80;
  }
  
  [zoom>=13] {
    text-size: 11;
    text-wrap-width: 90; 
    text-name:[name];
  }
  
  [zoom>=14] { 
    text-size: 13; 
    text-wrap-width: 120; 
  }
  
  [zoom>=15] { 
    text-size: 14; 
    text-wrap-width: 140; 
  }
  
  [zoom>=16] { 
    text-size: 16; 
    text-wrap-width: 160; 
  }
}

//Suburbs
#place[class='suburb'][zoom>=12][zoom<=14][rank<=11],
#place[class='suburb'][zoom>=15][zoom<=16] {
  text-name: [name_en];
  text-face-name: @mont;
  text-placement: point;
  text-size: 9;
  text-fill: @place_text;
  text-halo-fill: @place_halo;
  text-halo-radius: 1;
  text-halo-rasterizer: fast;
  text-wrap-width: 60;
  text-wrap-before: true;
  text-line-spacing: -2;
  
  [zoom>=12]{text-transform: uppercase;}
  
  [zoom>=13] {
    text-name: [name];
    text-size: 10; 
    text-min-distance: 20;
    text-wrap-width: 80;
    text-line-spacing: 0;
    text-face-name: @mont_md;
  }
  [zoom>=14] { 
    text-size: 11;
    text-wrap-width: 90;    
  }
  [zoom>=15] { 
    text-size: 12; 
    text-wrap-width: 100;
  }
  
  [zoom>=16] { 
    text-size: 13; 
    text-wrap-width: 120;
  }
}

//Neighbourhoods & Hamlets
#place[zoom>=13][zoom<=15][rank<=11],
#place[zoom>=16][zoom<=17] {
  [class='hamlet'][zoom>=14],
  [class='neighbourhood'] {
    text-name: [name_en];
    text-face-name: @mont;
    text-placement: point;
    text-fill: @place_text;
    text-halo-fill: @place_halo;
    text-size: 9;
    text-halo-radius: 1;
    text-halo-rasterizer: fast;
    text-wrap-width: 80;
    text-wrap-before: true;
    text-line-spacing: -2;
    
    [zoom>=14]{
      text-transform: uppercase;
      text-size: 9; 
      text-wrap-width: 80;
      text-name: [name];
      text-face-name: @mont_md;
    }
    [zoom>=15] { 
      text-size: 11; 
      text-line-spacing: 0;
      text-wrap-width: 100;
    }
    [zoom>=16] { 
      text-size: 13; 
      text-wrap-width: 120;
    }
    [zoom>=17] { 
      text-size: 15; 
      text-wrap-width: 140;
    }
  }
}


//Lake labels
#water_name [class='lake'][zoom>=9] {
    text-name: [name];
    text-face-name: @mont_it;
    text-fill: @water_label;
    text-size: 9;
    text-halo-fill: @water_halo;
    text-halo-radius: 1;
    text-wrap-width: 80;
    text-wrap-before: true;
    text-min-distance:30;
    //text-avoid-edges: true;
    [zoom>=13]{text-name: [name];}
    [zoom>=17]{
      text-size:10;
      text-wrap-width:100; 
      //text-min-distance:80;
    }
    [zoom>=18]{
      text-min-distance: 10; 
      text-size:12;
    }
}

//river labels
#waterway[class='river'][zoom>=14]{
      text-name: [name];
      text-face-name: @mont_it;
      text-fill: @water_label;
      text-size: 9;
      text-halo-fill: @water_halo;
      text-halo-radius: 1.2;
      text-avoid-edges: true;
      text-placement: line;
      text-repeat-distance:10;
      text-character-spacing: 1;
      [zoom>=13]{text-name: [name];}
      [zoom>=16]{text-size:10;}
      [zoom>=17]{text-size:11;}
}

//road labels
#transportation_name['mapnik::geometry_type'=2] {
  [class='motorway'][zoom>=13],
  [class='trunk'][zoom>=13],
  [class='primary'][zoom>=14],
  [class='secondary'][zoom>=15],
  [class='tertiary'][zoom>=15],
  [class='minor'][zoom>=16],
  [class='service'][zoom>=17],
  [class='path'][zoom>=17],
  [class='track'][zoom>=18]{
    text-avoid-edges: true;
    text-name: [name];
    text-placement: line;
    text-face-name: @mont_md; //HERE
    text-fill: @road_text_light;//lighten(@road_text_light,5);
    text-size: 8;
    text-halo-fill: @minor_halo;
    text-halo-radius: 0.75;//HERE
    text-halo-rasterizer: fast;
    text-min-distance: 200;
    //text-transform:;
    
   
    [zoom>=14] { text-size: 8; }
    [zoom>=16] { text-size: 9; }
    [zoom>=17] { text-size: 10; text-character-spacing: 0.5;}
    [zoom>=18] { text-size: 11;text-fill:@road_text; }

    
    [class='motorway'],
    [class='trunk'],
    [class='primary'] {
      text-fill: @road_text_med;
      text-face-name: @mont_md;//HERE
      text-halo-fill: @primary_halo;
      [class='motorway'],[class='trunk']{text-halo-fill: @motorway_halo;}
      [zoom>=13] { text-size: 9;}
      [zoom>=14] { text-size: 10;text-character-spacing: 0.5;}
      [zoom>=15] { text-size: 11; }
      [zoom>=16] { text-size: 12;  }
      [zoom>=17] {text-fill:@road_text;}
      [zoom>=18] { text-size: 13; }
    }
    
     [class='secondary']{
        text-fill: @road_text_med;
        [zoom>=15]{text-size:11;text-character-spacing: 0.5;}
        [zoom>=16] { text-size: 12; }
        [zoom>=17] {text-fill: @road_text;}
      }
    
    [class='tertiary']{
      [zoom>=15] { text-size: 10;  }
      [zoom>=16] { text-size: 11; }
      [zoom>=17] {text-fill: @road_text;}
      [zoom>=18] { text-size: 12;}
    }
    
    [class='path'],
    [class='track']{
      text-fill: @road_text_med;
     }
    
  }
}

//poi labels
#poi[class='park'][subclass='park'],
#poi[class='stadium'][rank<=3],
#poi[class='cemetery'][rank<=3],
#poi[class='attraction'][rank<=3]{
  [zoom>=15][rank<=1],
  [zoom>=16][rank<=2],
  [zoom>=17][rank<=3],
  [zoom>=18]{
    text-name: [name];
    text-face-name: @mont_md;
    text-fill: @poi_light;
    text-halo-fill: @poi_halo;
    text-halo-radius: 0.75;
    text-halo-rasterizer: fast;
    text-line-spacing: -1;
    text-wrap-width: 80;
    text-wrap-before: true;
    text-avoid-edges: true;
    text-transform: uppercase;
    text-min-distance: 20;
    [zoom>=15]{text-size:8;}
    [zoom>=16]{text-size:9; text-wrap-width: 90;}
    [zoom>=18]{text-size:10; text-wrap-width: 100;}
  }
}

#housenumber[zoom>=18]{
    text-name: [housenumber];
    text-face-name: @mont;
    text-fill: @housenumber;
    text-halo-fill: @housenumber_halo;
    text-halo-radius: 0.75;
    text-halo-rasterizer: fast;
    text-line-spacing: -1;
    text-wrap-width: 60;
    text-wrap-before: true;
    text-avoid-edges: true;
    text-transform: uppercase;
    text-min-distance: 20;
  }
  