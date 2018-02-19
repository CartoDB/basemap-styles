// =====================================================================
// POSITRON
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
@landmass_fill:             #fafaf8;
@landmass_fill_labels_only: transparent;

//LABELS//

//place label colors
@dark_text:          #4e5e69;
@med_text:           #4e5e69;
@light_text:         #5d6f7c;

@continent_text:     #697b89; 
@continent_halo:     #fafaf8; 

@country_text_dark:  #697b89; //#566773; // //mix(@med_text,@light_text,50);
@country_text_med:   #8a99a4; //#5b6c79; //mix(@med_text,@light_text,15)
@country_text_light: #8a99a4; //#b9c2c9; //#687c8b //lighten(@light_text,5);
@country_halo:       #fafaf8; //@landmass_fill

@state_text:         #97a4ae; //mix(@med_text,@light_text,30);
@state_text_light:   #abb6be; //@light_text
@state_halo:         #fafaf8; //@landmass_fill

@place_text:         #48545e; //darken(#8494a1, 25%);//#4e5e69; //@med_text
@place_halo:         rgba(250,250,250,0.8);//#fafafa; //lighten(@med_text,60);


//city shield
@city_shield:   url(images/city-square.png);

//ocean/sea label colors
@marine_labels:          #abb6be;
@marine_labels_halo:     #d4dadc;

//Lake and River Labels
@water_label:           #4f666f;
@water_halo:            rgba(247, 247, 247, 0.8);

//Road labels
@road_text_med:       #697b89;
@road_text_light:     #697b89; 
@road_text:           #697b89;
@motorway_halo:       rgba(247, 247, 247, 0.8);
@primary_halo:        rgba(247, 247, 247, 0.8);
@minor_halo:          rgba(247, 247, 247, 0.8);
@tunnel_halo:         rgba(247, 247, 247, 0.8);
//@text_transform:      uppercase;

//poi
@poi_light:           #7d9c83; 
@poi_dark:            #7d9c83; 
@poi_halo:            rgba(247, 247, 247, 0.8); 


//housenumbers don't show on dark matter and positron
@housenumber:         transparent;
@housenumber_halo:    transparent;

//Admin Boundaries

//country boundaries
@admin0_3:     #f2e6e7; //lighten(#c79297, 25%);
@admin0_4:     #ead5d7; //lighten(#c79297, 20%);
@admin0_5:     #ebd6d8; //lighten(#c99297,20%);
@admin0_6:     #f3efed; //mix(lighten(#c99297, 20%),lighten(#e3e3dc, 8%), 20);
@admin0_7:     #ebd6d8; //lighten(#c99297,20%);

//state and province boundaries
@admin1_low:   #ead5d7; //lighten(#c79297, 20%);
@admin1_high:  #e1c5c7; //lighten(#c79297, 15%);
@state:        @country_low;

//Hydro
@water:          #d4dadc;
@water_shadow:   transparent;
@ocean_line:     transparent;
@rivers_stroke:  #d1dbdf;

//Landuse

//urban areas
@urbanareas:         #ededed;

@urban_fade_1:       rgba(237, 237, 237, 0.5);  
@urban_fade_2:       rgba(237, 237, 237, 0.45); 
@urban_fade_3:       rgba(237, 237, 237, 0.4);  
@urban_fade_4:       rgba(237, 237, 237, 0.35); 
@urban_fade_5:       rgba(237, 237, 237, 0.3);  
@urban_fade_6:       rgba(237, 237, 237, 0.25); 
@urban_fade_7:       rgba(237, 237, 237, 0.15); 

//parks and green areas
@greenareas:            #dbe9df;
@green_area_highzoom:   rgba(220, 232, 224, 0.4);
@pattern_opacity:       0;

@greenarea_fade_1:       rgba(219, 233, 223, 0.2);  
@greenarea_fade_2:       rgba(219, 233, 223, 0.25); 
@greenarea_fade_3:       rgba(219, 233, 223, 0.35); 
@greenarea_fade_4:       rgba(219, 233, 223, 0.4);  

//buildings
@buildings:         #ededed;
@building_shadow:   #dfdfdf;
@building_a:        #ededed;
@building_outline:  #dfdfdf;

//aeroways
@aeroways:      #e8e8e8;

//Road Colors
@motorway:                 #fff;
@motorway_case:            #ddd;
@motorway_case_lowzoom:    #e6e6e6;

@main:                     #fff;
@main_case_lowzoom:        #e6e6e6;
@main_case:                #ddd;

@secondary:                #fdfdfd;
@secondary_case_lowzoom:   #e6e6e6;
@secondary_case:           #ddd;

@street:                   #fdfdfd;
@street_lowzoom:           #e6e6e6;
@minor_case:               #ddd;

@path:                     #d5d5d5;
@path_case:                #ddd;
@path_poly:                #e3e3e3;

@tunnel:                   #eee;
@tunnel_case:              #ddd;

@rail:                     #ddd;
@rail_dash:                #fff;
@text_transform:           none;

//we need these for positron and dark matter
@motorway_ramp_lowzoom:    #ddd;
@minor_ramp_highzoom:      #fdfdfd;

//Road Widths
//motorway and trunk fill widths switches to motorway only
@05_hwy_f:   0;
@07_hwy_f:   0.5;
@08_hwy_f:   0.5;
@09_hwy_f:   1;

@10_hwy_f:   3;
@11_hwy_f:   2;
@12_hwy_f:   3;
@13_hwy_f:   4;
@14_hwy_f:   5;
@15_hwy_f:   6;
@16_hwy_f:   8;
@17_hwy_f:   12;
@18_hwy_f:   20;

//trunk/primary only for small zooms
@5_trunk:    0;
@7_primary:  0.5;
@10_primary: 0.5;

//primary and trunk
@7_maj_f:    0.5;
@8_maj_f:    0.5;
@10_maj_f:   1;
@11_maj_f:   1.5;
@12_maj_f:   2;
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
@15_sec_f:   4;
@16_sec_f:   6;
@17_sec_f:   10;
@18_sec_f:   15;

//minor fill widths
@12_min_f:   0.5;
@13_min_f:   0.5;
@14_min_f:   1.5;
@15_min_f:   2.5;
@16_min_f:   3;
@17_min_f:   5;
@18_min_f:   10;





