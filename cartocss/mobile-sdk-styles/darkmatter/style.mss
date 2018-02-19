Map {
  background-color: @landmass_fill;
  font-directory: url(fonts/);
}

//CARTO Fonts
@mont: "Montserrat Regular", "Noto Sans Regular", "NanumBarunGothic Regular", "Koruri Regular", "Noto Sans Tibetan Regular", "Noto Sans Khmer Regular";
@mont_md: "Montserrat Medium", "Noto Sans Regular", "NanumBarunGothic Regular", "Koruri Regular", "Noto Sans Tibetan Regular", "Noto Sans Khmer Regular";
@mont_bd: "Montserrat SemiBold", "Noto Sans Regular", "NanumBarunGothic Regular", "Koruri Regular", "Noto Sans Tibetan Regular", "Noto Sans Khmer Regular";
@mont_it: "Montserrat Italic", "Noto Sans Regular", "NanumBarunGothic Regular", "Koruri Regular", "Noto Sans Tibetan Regular", "Noto Sans Khmer Regular";
@mont_it_md: "Montserrat Italic", "Noto Sans Regular", "NanumBarunGothic Regular", "Koruri Regular", "Noto Sans Tibetan Regular", "Noto Sans Khmer Regular";


//Base Colors
@landmass_fill:             #090909;
@landmass_fill_labels_only: transparent;

//LABELS//

//place label colors
@dark_text:     #3a3a3a;
@med_text:      #444;
@light_text:    #555;

@continent_text:     #666;
@continent_halo:     rgba(50,50,50,0.8);  

@country_text_dark:  #888;    
@country_text_med:   #666;
@country_text_light: #666;
@country_halo:       rgba(50,50,50,0.8);    

@state_text:         #777; 
@state_text_light:   #777; 
@state_halo:         rgba(60,60,60,0.8);


@place_text:         #a1a1a1; 
@place_halo:         rgba(60,60,60,0.8);


//city shield
@city_shield:   url(images/dark-matter-square-3.png);

//ocean/sea label colors
@marine_labels:          #555;
@marine_labels_halo:     rgba(50,50,50,0.8); 

//Lake and River Labels
@water_label:            #777; 
@water_halo:             rgba(34,34,34,0.8);

//Road labels
@road_text_med:       #6f6f6f;
@road_text_light:     #6f6f6f; //darkest color for dark
@road_text:           #6f6f6f;
@motorway_halo:       rgba(45,45,45,0.8);
@primary_halo:        rgba(45,45,45,0.8);
@minor_halo:          rgba(45,45,45,0.8);
@tunnel_halo:         rgba(44,45,45,0.8);
//@text_transform:      uppercase;

/*
@place_text:         #a1a1a1; 
@place_halo:         rgba(55,55,55,0.8);


//city shield
@city_shield:   url(images/dark-matter-square-3.png);

//ocean/sea label colors
@marine_labels:          #555;
@marine_labels_halo:     rgba(50,50,50,0.8); 

//Lake and River Labels
@water_label:            #777; 
@water_halo:             rgba(34,34,34,0.8);

//Road labels
@road_text_med:       #6f6f6f;
@road_text_light:     #6f6f6f; 
@road_text:           #6f6f6f;
@motorway_halo:       rgba(45,45,45,0.8);
@primary_halo:        rgba(45,45,45,0.8);
@minor_halo:          rgba(45,45,45,0.8);

@tunnel_halo:         rgba(45,45,45,0.8);
//@text_transform:      uppercase;
*/

//poi
@poi_light:           #888;
@poi_dark:            #888;
@poi_halo:            rgba(40,40,40,0.8);


//housenumbers don't show on dark matter and positron
@housenumber:         transparent;
@housenumber_halo:    transparent;

//Admin Boundaries

//country boundaries
@admin0_3:   #222;
@admin0_4:   #292929; //country z4
@admin0_5:   #292929; //country z5
@admin0_6:   #0e0e0e; //highlight line under solid bnd
@admin0_7:   #292929; //country z>=7

//state and province boundaries
@admin1_low:   #222; //state province z=5    
@admin1_high:  #292929; //state province z>=6
@state:        @country_low;

//Hydro
@water:          #262626;
@water_shadow:   transparent;
@ocean_line:     transparent;
@rivers_stroke:  #242424;

//Landuse

//urban areas
@urbanareas:         rgb(0,0,0);

@urban_fade_1:       rgba(0,0,0, 0.4);
@urban_fade_2:       rgba(0,0,0, 0.4);
@urban_fade_3:       rgba(0,0,0, 0.4);
@urban_fade_4:       rgba(0,0,0, 0.35);
@urban_fade_5:       rgba(0,0,0, 0.35);
@urban_fade_6:       rgba(0,0,0, 0.35);
@urban_fade_7:       rgba(0,0,0, 0.15);

//parks and green areas
@greenareas:             #090909;
@green_area_highzoom:    #090909;
@pattern_opacity:        0.03;

@greenarea_fade_1:       #090909;
@greenarea_fade_2:       #090909;
@greenarea_fade_3:       #090909;
@greenarea_fade_4:       #090909;

//buildings
@buildings:        #000;
@building_shadow:  transparent;
@building_a:       transparent;
@building_outline: #111;

//aeroways
@aeroways:      #111;

//Road Colors
@motorway:              #030303;
@motorway_case:         #2a2a2a;
@motorway_case_lowzoom: #1a1a1a;

@main:                   #030303;
@main_case:              #2a2a2a;
@main_case_lowzoom:      #1a1a1a;

@secondary:              #030303;
@secondary_case:         #222;
@secondary_case_lowzoom: #1a1a1a;

@street:                 #191919;
@minor_case:             #080808;
@street_lowzoom:         #131313;

@path:                   #262626;
@path_case:              rgba(70,70,70,0.8);
@path_poly:              #030303;

@tunnel:          #040404;
@tunnel_case:     #1a1a1a;

@rail:            #1a1a1a;
@rail_dash:       #000;
@text_transform:  none;

//we need these for positron and dark matter
@motorway_ramp_lowzoom:    #030303;
@minor_ramp_highzoom:      #030303;

//Road Widths
//motorway and trunk fill widths switches to motorway only
@05_hwy_f:   0;
@07_hwy_f:   0.5;
@08_hwy_f:   0.5;
@09_hwy_f:   0.5;

@10_hwy_f:   2.5;
@11_hwy_f:   3;
@12_hwy_f:   3;
@13_hwy_f:   4;
@14_hwy_f:   5;
@15_hwy_f:   6;
@16_hwy_f:   8;
@17_hwy_f:   12;
@18_hwy_f:   20;

//trunk/primary only for small zooms
@5_trunk:    0;
@7_primary:  0.25;
@10_primary: 0;

//primary and trunk
@7_maj_f:    0.5;
@8_maj_f:    0.5;
@10_maj_f:   1;
@11_maj_f:   0.5;
@12_maj_f:   2.5;
@13_maj_f:   3;
@14_maj_f:   4;
@15_maj_f:   5;
@16_maj_f:   7;
@17_maj_f:   10;
@18_maj_f:   15;

//secondary, tertiary fill widths
@10_sec_f:   0.5;
@11_sec_f:   0.5;
@12_sec_f:   1.5;
@13_sec_f:   2;
@14_sec_f:   3;
@15_sec_f:   4.5;
@16_sec_f:   6;
@17_sec_f:   10;
@18_sec_f:   15;

//minor fill widths
@12_min_f:   0.5;
@13_min_f:   0.5;
@14_min_f:   1;
@15_min_f:   2.5;
@16_min_f:   3;
@17_min_f:   5;
@18_min_f:   10;