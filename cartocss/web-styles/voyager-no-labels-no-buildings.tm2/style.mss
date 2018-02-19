// =====================================================================
// VOYAGER NO LABELS
// =====================================================================

// GLOBAL MAP PROPERTIES //

Map {
  background-color: @landmass_fill;
  font-directory: url(fonts/);
}

//CARTO Fonts
@mont:       "Montserrat Regular","Open Sans Regular","DejaVu Sans Bold", "Arial Unicode MS Regular", "Noto Sans Regular","Noto Sans Khmer Regular","Noto Sans Mongolian Regular","HanWangHeiLight Regular","NanumBarunGothic Regular";
@mont_md:    "Montserrat Medium","Open Sans Bold","DejaVu Sans Bold", "Arial Unicode MS Regular", "Noto Sans Regular","Noto Sans Khmer Regular","Noto Sans Mongolian Regular","HanWangHeiLight Regular","NanumBarunGothic Regular";
@mont_bd:    "Montserrat SemiBold","Open Sans Bold","DejaVu Sans Bold", "Arial Unicode MS Regular", "Noto Sans Regular","Noto Sans Khmer Regular","Noto Sans Mongolian Regular","HanWangHeiLight Regular","NanumBarunGothic Regular";
@mont_it:    "Montserrat Italic","Open Sans Italic","DejaVu Sans Bold", "Arial Unicode MS Regular", "Noto Sans Regular","Noto Sans Khmer Regular","Noto Sans Mongolian Regular","HanWangHeiLight Regular","NanumBarunGothic Regular";
@mont_it_md: "Montserrat Medium Italic","DejaVu Sans Bold", "Arial Unicode MS Regular", "Noto Sans Regular","Noto Sans Khmer Regular","Noto Sans Mongolian Regular","HanWangHeiLight Regular","NanumBarunGothic Regular";

//Base Colors
@landmass_fill:             #fbf8f3; //lighten(#F8F3EB,2);
@landmass_fill_labels_only: transparent;

// LABELS //

//the colors below are used to make variations of place label colors
@dark_text:          #4b5357;
@med_text:           #405c78;
@light_text:         #959eaa;

@continent_text:     #405c78; //@med_text
@continent_halo:     #fbf8f3; //@landmass_fill

@country_text_dark:  #6b7d91; //mix(@med_text,@light_text,50);
@country_text_med:   #8894a3; //mix(@med_text,@light_text,15)
@country_text_light: #a3abb5; //lighten(@light_text,5);
@country_halo:       #fbf8f3; //@landmass_fill

@state_text:         #7c8a9b; //mix(@med_text,@light_text,30);
@state_text_light:   #959eaa; //@light_text
@state_halo:         #fbf8f3; //@landmass_fill

@place_text:         #405c78; //@med_text
@place_halo:         #f2f5f8; //lighten(@med_text,60);

//city shield
@city_shield: url(images/city-square.png);

//ocean/sea label colors
@marine_labels:       #fff;
@marine_labels_halo:  #98c2ca; //darken(@water,7);

//Lake and River Labels
@water_label:         #51909c; //darken(@water, 30%);
@water_halo:          #e2eef0; //lighten(@water, 15%);

//Road labels
@road_text_light:     #87919e; //lighten(@road_text_light,5)
@road_text_med:       #798493; //darken(@light_text,10);
@road_text:           #6a7584; //darken(@light_text,16);
@motorway_halo:       #fff0c4; //lighten(@motorway,6);
@primary_halo:        #fefde1; //lighten(@main,2);
@minor_halo:          #fbf8f3;
@tunnel_halo:         #faf9f7; //lighten(@tunnel,5);
@text_transform:      none;

//poi
@poi_light:           #666;
@poi_dark:            #555;
@poi_halo:            rgba(255,255,255,0.15); //fadeout(#fff,85);

@housenumber:         #d2b17d; //darken(@buildings,25);
@housenumber_halo:    rgba(255,255,255,0.15); //@poi_halo;


// STYLING VARIABLES //

//country boundaries
@admin0_3:           #ead5d7; //lighten(#c79297, 20%);
@admin0_4:           #ead5d7; //lighten(#c79297, 20%);
@admin0_5:           #ebd6d8; //lighten(#c99297,20%);
@admin0_6:           #f3efed; //mix(lighten(#c99297, 20%),lighten(#e3e3dc, 8%), 20);
@admin0_7:           #ebd6d8; //lighten(#c99297,20%);

//state and province boundaries
@admin1_low:         #d4d5d6; //lighten(#6d6e71, 40%);
@admin1_high:        #e1c5c7; //lighten(#c79297, 15%);
//@state:              @country_low;

//water
@water:              #b0d0d6; //desaturate(#A0DBE6,26);
@rivers_stroke:      #cce7ea; //rgb(204,231,234);
@water_shadow:       #e2eef0; //lighten(@water,15);
@ocean_line:         #a9ccd3; //darken(@water,2);


//urban areas
@urbanareas:         #f3eadc;
@urban_fade_1:       rgba(243, 234, 220, 0.5);  //fadeout(@urbanareas,50%);
@urban_fade_2:       rgba(243, 234, 220, 0.45); //fadeout(@urbanareas,55%);
@urban_fade_3:       rgba(243, 234, 220, 0.4);  //fadeout(@urbanareas,60%);
@urban_fade_4:       rgba(243, 234, 220, 0.35); //fadeout(@urbanareas,65%);
@urban_fade_5:       rgba(243, 234, 220, 0.3);  //fadeout(@urbanareas,70%);
@urban_fade_6:       rgba(243, 234, 220, 0.25); //fadeout(@urbanareas,75%);
@urban_fade_7:       rgba(243, 234, 220, 0.15); //fadeout(@urbanareas,85%);

//parks and green areas
@greenareas:             #C5E1B2;
@greenarea_fade_1:       rgba(197, 225, 178, 0.2);  //fadeout(@greenareas,80)
@greenarea_fade_2:       rgba(197, 225, 178, 0.25); //fadeout(@greenareas,75)
@greenarea_fade_3:       rgba(197, 225, 178, 0.35);  //fadeout(@greenareas,65)
@greenarea_fade_4:       rgba(197, 225, 178, 0.4); //fadeout(@greenareas,60)

@green_area_highzoom:    #e0ecd3; //rgb(224,236,211);
@pattern_opacity:        0;

//buildings
@buildings:           transparent;
@building_shadow:     transparent;
@building_a:          transparent;
@building_outline:    transparent;

//aeroways
@aeroways:            #e8e8e8;

//Road colors
@motorway:                #FFE9A5;
@motorway_case:           #fbdb98; //mix(@motorway,#f6cd8b,50);
@motorway_case_lowzoom:   #fbdb98; //mix(@motorway,#f6cd8b,50);

@main:                    #fefdd7;
@main_case_lowzoom:       #ffe7b7; //mix(@main,#ffdda9,30);
@main_case:               #ffeabb; //mix(@main,#ffdda9,40);

@secondary:               #fff;
@secondary_case_lowzoom:  #fffef9; //rgb(255,254,249);
@secondary_case:          #ffedc0; //mix(@main,#ffdda9,50);

@street:                  #fff;
@street_lowzoom:          #fff;
@minor_case:              #fdebce; //mix(@landmass_fill,#ffdda9,50);

@path:                    #d7d7d7;
@path_case:               #fdebce; //@minor_case; 
@path_poly:               #dedcd8; //mix(@path,@buildings,75);

@tunnel:                  #f0eee7; //mix(@motorway,#eee,10);
@tunnel_case:             #e6dfcb; //mix(@motorway,#dbdbdb,30);

@rail:                    #ddd;
@rail_dash:               #fff;

//we need these for positron and dark matter
@motorway_ramp_lowzoom:   #FFE9A5; //@motorway;
@minor_ramp_highzoom:     #fff;    //@street;

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

