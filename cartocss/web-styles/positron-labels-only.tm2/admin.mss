// =====================================================================
// ADMIN Boundaries, Places, and Place Labels
// - #boundary: countries
// - #boundary: states and provinces
// =====================================================================
/*
// STYLING VARIABLES //

//country boundaries
@admin0_4: lighten(#c79297, 20%);
@admin0_5: lighten(#c99297,10%);
@admin0_6: mix(lighten(#c99297, 20%), lighten(#e3e3dc, 8%), 20);
@admin0_7: lighten(#c99297,20%);

//state and province boundaries
@admin1_low: lighten(#6d6e71, 40%);
@admin1_high: lighten(#c79297, 15%);
@state: @country_low;

// BEGIN STYLING //

//country boundaries
#boundary[admin_level=2][maritime!=1] {
::outline {
    line-width: 0;
  }
	line-color: @admin0_4;
    line-width: 0.5;

  [zoom=4] {
    line-color: @admin0_4;
  }

  [zoom>=5] {
    line-width: 0.5;
    line-color: @admin0_5;
  }

  [zoom>=6] {
    ::outline {
      line-width: 8;
      line-color: @admin0_6;
      line-opacity: 0.5;
    }

    line-width: 1;
    line-color: @admin0_7;
  }

  [zoom>=7] {
    ::outline {
      line-width: 8;
      line-color: @admin0_6;
      line-opacity: 0.5;
    }

    line-color: @admin0_7;
    line-width: 1.5;
  }
}

//state and province boundaries
#boundary[admin_level>2][admin_level<=6][zoom>=4] {
    eraser/line-color: @landmass_fill;
    eraser/line-width: 0.5;
    line-width: 0.5;
    line-color: @admin1_low;

    [zoom>=6] {
      line-color: @admin1_high;
    }

    [zoom>=7] {
      eraser/line-width: 1;
      line-width: 1;
      line-dasharray: 2,2;
    }
    [zoom>=9] {
      eraser/line-width: 2;
      line-width: 2;
      
      [admin_level=6]{line-width:1;}
    }
}
*/
