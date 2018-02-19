
// =====================================================================
// VOYAGER LABELS ON TOP
// =====================================================================

// GLOBAL MAP PROPERTIES //

Map {
  background-color: @landmass_fill_labels_only;
  font-directory: url(fonts/);
}

//CARTO Fonts
@mont:       "Montserrat Regular","Open Sans Regular","DejaVu Sans Bold", "Arial Unicode MS Regular", "Noto Sans Regular","Noto Sans Khmer Regular","Noto Sans Mongolian Regular","HanWangHeiLight Regular","NanumBarunGothic Regular";
@mont_md:    "Montserrat Medium","Open Sans Bold","DejaVu Sans Bold", "Arial Unicode MS Regular", "Noto Sans Regular","Noto Sans Khmer Regular","Noto Sans Mongolian Regular","HanWangHeiLight Regular","NanumBarunGothic Regular";
@mont_bd:    "Montserrat SemiBold","Open Sans Bold","DejaVu Sans Bold", "Arial Unicode MS Regular", "Noto Sans Regular","Noto Sans Khmer Regular","Noto Sans Mongolian Regular","HanWangHeiLight Regular","NanumBarunGothic Regular";
@mont_it:    "Montserrat Italic","Open Sans Italic","DejaVu Sans Bold", "Arial Unicode MS Regular", "Noto Sans Regular","Noto Sans Khmer Regular","Noto Sans Mongolian Regular","HanWangHeiLight Regular","NanumBarunGothic Regular";
@mont_it_md: "Montserrat Medium Italic","DejaVu Sans Bold", "Arial Unicode MS Regular", "Noto Sans Regular","Noto Sans Khmer Regular","Noto Sans Mongolian Regular","HanWangHeiLight Regular","NanumBarunGothic Regular";

//Base Colors
@landmass_fill:             #fbf8f3;
@landmass_fill_labels_only: transparent;

// LABELS //

//the colors below are used to make variations of place label colors
@dark_text:          #4b5357;
@med_text:           #405c78;
@light_text:         #959eaa;

@continent_text:     #405c78; 
@continent_halo:     #fbf8f3; 

@country_text_dark:  #6b7d91; 
@country_text_med:   #8894a3; 
@country_text_light: #a3abb5; 
@country_halo:       #fbf8f3; 

@state_text:         #7c8a9b; 
@state_text_light:   #959eaa; 
@state_halo:         #fbf8f3; 

@place_text:         #405c78; 
@place_halo:         #f2f5f8; 

//city shield
@city_shield: url(images/city-square.png);

//ocean/sea label colors
@marine_labels:       #fff;
@marine_labels_halo:  #98c2ca; 

//Lake and River Labels
@water_label:         #51909c; 
@water_halo:          #e2eef0; 

//Road labels
@road_text_light:     #87919e; 
@road_text_med:       #798493; 
@road_text:           #6a7584; 
@motorway_halo:       #fbf8f3;
@primary_halo:        #fbf8f3;
@minor_halo:          #fbf8f3;
@tunnel_halo:         #fbf8f3; 
@text_transform:      none;

//poi
@poi_light:           #666;
@poi_dark:            #555;
@poi_halo:            rgba(255,255,255,0.8);

@housenumber:         #b7996a; 
@housenumber_halo:    rgba(255,255,255,0.8);


// STYLING VARIABLES //

//country boundaries
@admin0_3:           #ead5d7; 
@admin0_4:           #ead5d7; 
@admin0_5:           #ebd6d8; 
@admin0_6:           #f3efed; 
@admin0_7:           #ebd6d8; 

//state and province boundaries
@admin1_low:         #d4d5d6; 
@admin1_high:        #e1c5c7; 
//@state:              @country_low;

//water
@water:              #b0d0d6; 
@rivers_stroke:      #cce7ea; 
@water_shadow:       #e2eef0; 
@ocean_line:         #a9ccd3; 


//urban areas
@urbanareas:         #f3eadc;
@urban_fade_1:       rgba(243, 234, 220, 0.5);  
@urban_fade_2:       rgba(243, 234, 220, 0.45); 
@urban_fade_3:       rgba(243, 234, 220, 0.4);  
@urban_fade_4:       rgba(243, 234, 220, 0.35); 
@urban_fade_5:       rgba(243, 234, 220, 0.3);  
@urban_fade_6:       rgba(243, 234, 220, 0.25); 
@urban_fade_7:       rgba(243, 234, 220, 0.15); 

//parks and green areas
@greenareas:             #C5E1B2;
@greenarea_fade_1:       rgba(197, 225, 178, 0.2);  
@greenarea_fade_2:       rgba(197, 225, 178, 0.25); 
@greenarea_fade_3:       rgba(197, 225, 178, 0.35);  
@greenarea_fade_4:       rgba(197, 225, 178, 0.4); 

@green_area_highzoom:    #e0ecd3;
@pattern_opacity:        0;

//buildings
@buildings:           #f3eadc;
@building_shadow:     #e4dcd0; 
@building_a:          #f6efe4; 
@building_outline:    #e9d8be; 

//aeroways
@aeroways:            #e8e8e8;

//Road colors
@motorway:                #FFE9A5;
@motorway_case:           #fbdb98; 
@motorway_case_lowzoom:   #fbdb98; 

@main:                    #fefdd7;
@main_case_lowzoom:       #ffe7b7; 
@main_case:               #ffeabb; 

@secondary:               #fff;
@secondary_case_lowzoom:  #fffef9; 
@secondary_case:          #ffedc0; 

@street:                  #fff;
@street_lowzoom:          #fff;
@minor_case:              #fdebce; 

@path:                    #d7d7d7;
@path_case:               #fdebce; 
@path_poly:               #dedcd8; 

@tunnel:                  #f0eee7; 
@tunnel_case:             #e6dfcb; 

@rail:                    #ddd;
@rail_dash:               #fff;

//we need these for positron and dark matter
@motorway_ramp_lowzoom:   #FFE9A5; 
@minor_ramp_highzoom:     #fff;    

//Road widths

//motorway trunk fill widths
@05_hwy_f:   0.5;
@07_hwy_f:   0.5;
@08_hwy_f:   1;
@09_hwy_f:   1.2;

@10_hwy_f:   1.8;
@11_hwy_f:   1.5;
@12_hwy_f:   2;
@13_hwy_f:   3;
@14_hwy_f:   4;
@15_hwy_f:   5;
@16_hwy_f:   8;
@17_hwy_f:   12;
@18_hwy_f:   20;

//primary and trunk fill widths
@5_trunk:     0.5;
@7_primary:   0.5;
@7_maj_f:     0.8;
@8_maj_f:     1;
@10_maj_f:    1.2;
@10_primary:  1;
@11_maj_f:    1.5;
@12_maj_f:    2;
@13_maj_f:    3;
@14_maj_f:    4;
@15_maj_f:    5;
@16_maj_f:    7;
@17_maj_f:    10;
@18_maj_f:    15;

//secondary, tertiary fill widths
@10_sec_f:   0.5;
@11_sec_f:   1.2;
@12_sec_f:   1.5;
@13_sec_f:   2;
@14_sec_f:   3;
@15_sec_f:   4;
@16_sec_f:   6;
@17_sec_f:   10;
@18_sec_f:   15;

//minor fill widths
@12_min_f:   0.8;
@13_min_f:   1;
@14_min_f:   1.5;
@15_min_f:   2;
@16_min_f:   3;
@17_min_f:   5;
@18_min_f:   10;

