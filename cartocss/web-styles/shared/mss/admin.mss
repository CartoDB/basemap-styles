// =====================================================================
// ADMIN Boundaries, Places, and Place Labels
// - #boundary: countries
// - #boundary: states and provinces
// =====================================================================



// BEGIN STYLING //

//country boundaries
#boundary[admin_level=2]{
::outline {
    line-width: 0;
  }
	line-color: @admin0_3;
    line-width: 1;
    [disputed=1]{line-dasharray: 3,3;}
   

  [zoom>=4] {
    line-color: @admin0_4;
    
  }

  [zoom>=5] {
    line-color: @admin0_5;
  }

  [zoom>=6] {
    ::outline {
      line-width: 8;
      line-color: @admin0_6;
      line-opacity: 0.5;
    }

    line-width: 1.5;
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
    [disputed=1]{line-dasharray: 4,4;}
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
      eraser/line-width: 1.2;
      line-width: 1.2;
      
      [admin_level=6]{line-width:1;}
    }
}

