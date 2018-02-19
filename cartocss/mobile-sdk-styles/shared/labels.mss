
// =====================================================================
// LABELS
// - #water_name (ocean and sea)
// - #place (continent, country, state, city, etc.)
// - #water_name (lakes)
// - #waterway (rivers)
// - #transportation_name (roads)
// - #poi (park, cemetery, stadium)
// =====================================================================

//STYLING VARIABLES//
@name: [nuti::lang] ? ([name:[nuti::lang]] ? [name:[nuti::lang]] : ([name:[nuti::fallback_lang]] ? [name:[nuti::fallback_lang]] : [name])) : [name];


//BEGIN STYLING//

//ocean labels
#water_name[class='ocean'][zoom>=2][zoom<=8],
#water_name[class='sea'][zoom>=5]{
  text-name: @name;
  text-face-name: @mont_it_md;
  text-wrap-width: 50;
  text-wrap-before: true;
  text-fill: @marine_labels;
  text-halo-fill: @marine_labels_halo;
  text-halo-radius: 1;
  text-line-spacing: -2;
  text-character-spacing: 1.1;
  text-size: linear([view::zoom], (2, 14.0), (5, 20.0));
  
  [class='sea']{
    text-size: 12;
  }
}

//Continent Labels zooms 0-2
#place[class='continent'][zoom>=1][zoom<=2]{
  text-name: @name;
  text-fill: @continent_text;
  text-face-name: @mont_md;
  text-transform: uppercase;
  text-halo-fill: @continent_halo;
  text-halo-radius: 1;
  text-character-spacing: 0.5;
  text-size: linear([view::zoom], (1, 10.0), (2, 14.0));
  text-wrap-width: step([zoom], (1, 20), (2, 40));
}

#place[class='country']{
  [rank=1][zoom>=3][zoom<=6], 
  [rank=2][zoom>=3][zoom<=7],
  [rank=3][zoom>=4][zoom<=8], 
  [rank=4][zoom>=5][zoom<=9], 
  [rank=5][zoom>=6][zoom<=10], 
  [rank>=6][zoom>=7][zoom<=10]{
    text-name: @name;
    text-face-name: @mont_md;
    text-placement: [nuti::texts3d];
    text-size: 0;
    text-halo-fill: @country_halo;
    text-halo-radius: 1;
    text-halo-rasterizer: fast;
    text-wrap-width: 30;
    text-wrap-before: true;
    text-line-spacing: -2;
    text-min-distance: 2;
    text-transform: uppercase;
    text-character-spacing: 0.5;
    text-fill: linear([view::zoom], (4, @country_text_dark), (5, @country_text_med), (6, @country_text_light));
  
    [name_en='Nagorno-Karabakh Republic'],
    [name_en='South Ossetia'],
    [name_en='Abkhazia'] {
      text-name: '';
      text-face-name: @mont_md;
      text-fill: transparent;
    }

    [rank=1][zoom>=2]{
      text-size: linear([view::zoom], (2, 10.0), (5, 13.0), (6, 15.0));
      text-wrap-width: step([zoom], (2, 60), (3, 80), (4, 100), (5, 120), (6, 140));
    }
    [rank=2][zoom>=3]{
      text-size: linear([view::zoom], (3, 10.0), (6, 13.0));
      text-wrap-width: step([zoom], (3, 60), (4, 70), (5, 80), (6, 100));
    }
    [rank=3][zoom>=4]{
      text-size: linear([view::zoom], (4, 10.0), (8, 14.0));
      text-wrap-width: step([zoom], (4, 30), (5, 60), (8, 120));
    }
    [rank=4][zoom>=5]{
      text-size: linear([view::zoom], (5, 10.0), (9, 14.0));
      text-wrap-width: step([zoom], (5, 30), (6, 60), (7, 90), (8, 120));
    }
    [rank=5][zoom>=5]{
      text-size: linear([view::zoom], (5, 10.0), (9, 14.0));
      text-wrap-width: step([zoom], (6, 30), (7, 60), (8, 90), (9, 120));
    }
    [rank>=6][zoom>=6]{
      text-size: linear([view::zoom], (6, 10.0), (9, 13.0));
      text-wrap-width: 30;
    }
  }
}

//State and province labels
#place[class='state'][zoom>=6][zoom<=10]{
  [zoom>=5][rank<=2],
  [zoom>=6][rank<=4],
  [zoom>=7][rank<=99]{
    text-name: @name;
    text-face-name: @mont_md;
    text-placement: [nuti::texts3d];
    text-fill: @state_text;
    text-halo-fill: @state_halo;
    text-halo-radius: 1;
    text-halo-rasterizer: fast;
    text-transform: uppercase;
    text-allow-overlap: false;
    text-wrap-before: true;
    text-min-distance:5;
    text-size: linear([view::zoom], (5, 11.0), (6, 12.0), (7, 13.0));
    text-wrap-width: step([zoom], (5, 60), (6, 80), (7, 100));
  }
}

//city dots
#place::citydots[class='city'][zoom>=5][zoom<=7]{
  [zoom>=4][rank<=2],
  [zoom>=5][rank<=4],
  [zoom>=6][rank<=6],
  [zoom>=7][rank<=7]{
    shield-file: @city_shield;
    shield-unlock-image: true;
    shield-name: @name;
    shield-size: 10;
    shield-face-name: @mont_md;
    shield-placement: [nuti::texts3d];
    shield-fill: @place_text;
    shield-halo-fill: @place_halo;
    shield-halo-radius: 1;
    shield-halo-rasterizer: fast;
    shield-line-spacing: -2;
    shield-text-dx: -3;
    shield-text-dy: 0;
    shield-min-distance: 3;
    shield-size: linear([view::zoom], (4, 10.0), (5, 11.0), (6, 12.0), (7, 13.0)) - ([rank] / 3.0);
    shield-wrap-width: step([zoom], (4, 40), (5, 50), (6, 60));

    [zoom>=5][rank>=0][rank<=2],
    [zoom>=7][rank>=3][rank<=5] { 
      shield-text-transform:uppercase;
    }
  }
}

#place[class='city'][zoom>=8][zoom<=14][rank<=11],
#place[class='city'][zoom>=9][zoom<=14][rank<=12],
#place[class='city'][zoom>=10][zoom<=14][rank<=15]{
  text-name: @name;
  text-face-name: @mont_md;
  text-placement: [nuti::texts3d];
  text-fill: @place_text;
  text-halo-fill: @place_halo;
  text-halo-radius: 1;
  text-halo-rasterizer: fast;
  text-line-spacing: -2;
  text-size: linear([view::zoom], (8, 13.0), (14, 21.0)) - ([rank] / 2.0);
  text-wrap-width: step([zoom], (8, 50), (9, 60), (10, 60), (11, 70), (12, 80), (13, 120), (14, 200));

  [zoom=8][rank<=7],
  [zoom=9][rank<=10],
  [zoom>=10] {
    text-transform: uppercase;
  }
}

//Towns
#place[class='town'][zoom>=9][zoom<=14][rank<=12],
#place[class='town'][zoom=15]{
  text-name: @name;
  text-face-name: @mont_md;
  text-placement: [nuti::texts3d];
  text-fill: @place_text;
  text-halo-fill: @place_halo;
  text-halo-radius: 1;
  text-halo-rasterizer: fast;
  text-wrap-before: true;
  text-line-spacing: -2;
  text-size: linear([view::zoom], (9, 9.0), (10, 10.0), (11, 11.0), (12, 12.0), (13, 13.0), (14, 15.0), (15, 17.0));
  text-wrap-width: step([zoom], (9, 70), (10, 80), (11, 90), (12, 100), (13, 110), (14, 130), (15, 140));
}

//Villages
#place[class='village'][zoom>=12][zoom<=14][rank<=11],
#place[class='village'][zoom>=15][zoom<=16]{
  text-name: @name;
  text-face-name: @mont_md;
  text-placement: [nuti::texts3d];
  text-fill: @place_text;
  text-halo-fill: @place_halo;
  text-halo-radius: 1;
  text-halo-rasterizer: fast;
  text-wrap-before: true;
  text-line-spacing: -2;
  text-size: linear([view::zoom], (11, 9.0), (12, 10.0), (13, 11.0), (16, 16.0));
  text-wrap-width: step([zoom], (12, 80), (13, 90), (14, 120), (15, 140), (16, 160));
}

//Suburbs
#place[class='suburb'][zoom>=12][zoom<=14][rank<=11],
#place[class='suburb'][zoom>=15][zoom<=16]{
  text-name: @name;
  text-face-name: @mont_md;
  text-placement: [nuti::texts3d];
  text-fill: @place_text;
  text-halo-fill: @place_halo;
  text-halo-radius: 1;
  text-halo-rasterizer: fast;
  text-wrap-before: true;
  text-line-spacing: -2;
  text-size: linear([view::zoom], (12, 9.0), (13, 10.0), (16, 13.0));
  text-wrap-width: step([zoom], (12, 60), (13, 80), (14, 90), (15, 100), (16, 120));
}

//Neighbourhoods & Hamlets
#place[zoom>=13][zoom<=15][rank<=11],
#place[zoom>=16][zoom<=17]{
  [class='hamlet'],
  [class='neighbourhood'] {
    text-name: @name;
    text-face-name: @mont_md;
    text-placement: [nuti::texts3d];
    text-fill: @place_text;
    text-halo-fill: @place_halo;
    text-halo-radius: 1;
    text-halo-rasterizer: fast;
    text-wrap-before: true;
    text-line-spacing: -2;
    text-transform: uppercase;
    text-size: linear([view::zoom], (14, 9.0), (16, 13.0), (17, 15.0));
    text-wrap-width: step([zoom], (13, 80), (14, 80), (15, 100), (16, 120), (17, 140));
  }
}

//Lake labels
#water_name [class='lake'][zoom>=9]{
  text-name: @name;
  text-face-name: @mont_it;
  text-placement: [nuti::texts3d];
  text-fill: @water_label;
  text-halo-fill: @water_halo;
  text-halo-radius: 1;
  text-wrap-before: true;
  text-min-distance:30;
  text-size: linear([view::zoom], (16, 9.0), (17, 10.0), (18, 12.0));
  text-wrap-width: step([zoom], (16, 80), (17, 100));
}

//river labels
#waterway[class='river'][zoom>=14]{
  text-name: @name;
  text-face-name: @mont_it;
  text-fill: @water_label;
  text-halo-fill: @water_halo;
  text-halo-radius: 1.2;
  text-avoid-edges: true;
  text-placement: line;
  text-character-spacing: 1;
  text-size: linear([view::zoom], (15, 9.0), (16, 10.0), (17, 11.0));
}

//road labels
#transportation_name['mapnik::geometry_type'=2]{
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
    text-name: @name;
    text-placement: line;
    text-face-name: @mont_md;
    text-fill: linear([view::zoom], (17, @road_text_light), (18, @road_text));
    text-halo-fill: @minor_halo;
    text-halo-radius: 0.75;
    text-halo-rasterizer: fast;
    text-min-distance: 200;
    text-size: linear([view::zoom], (14, 8.0), (16, 9.0), (18, 11.0));
    
    [class='motorway'],
    [class='trunk'],
    [class='primary']{
      text-face-name: @mont_md;
      text-halo-fill: @primary_halo;
      text-fill: linear([view::zoom], (16, @road_text_med), (17, @road_text));
      text-size: linear([view::zoom], (13, 9.0), (16, 12.0), (18, 13.0));
      [class='motorway'], [class='trunk'] { text-halo-fill: @motorway_halo; }
    }
    
    [class='secondary']{
      text-fill: linear([view::zoom], (16, @road_text_med), (17, @road_text));
      text-size: linear([view::zoom], (15, 11.0), (16, 12.0));
    }
    [class='tertiary']{
      text-fill: linear([view::zoom], (16, @road_text_light), (17, @road_text));
      text-size: linear([view::zoom], (15, 10.0), (16, 11.0), (18, 12.0));
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
    text-name: @name;
    text-face-name: @mont_md;
    text-placement: [nuti::markers3d];
    text-fill: @poi_light;
    text-halo-fill: @poi_halo;
    text-halo-radius: 0.75;
    text-halo-rasterizer: fast;
    text-line-spacing: -1;
    text-wrap-before: true;
    text-avoid-edges: true;
    text-transform: uppercase;
    text-fill: linear([view::zoom], (15, @poi_light), (16, @poi_dark));
    text-size: linear([view::zoom], (15, 8.0), (16, 9.0), (18, 10.0));
    text-wrap-width: step([zoom], (15, 80), (16, 90), (18, 100));
  }
}

#housenumber[zoom>=18]['nuti::buildings'>0]{
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
