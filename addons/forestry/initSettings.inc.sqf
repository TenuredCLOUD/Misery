            [
            QGVAR(woodCollection), 
            "CHECKBOX", 
            ["Wood collection", "Enable Wood collection actions? (Axe's and chainsaw's will have actions near trees)"], 
            ["Misery","Sub-Actions"], 
            false, 
            1 
            ] call CBA_fnc_addSetting;

            [
            QGVAR(foraging), 
            "CHECKBOX", 
            ["Foraging", "Enable Foraging? (Enables digging for worms, and searching for tinder actions...)"], 
            ["Misery","Sub-Actions"], 
            false, 
            1 
            ] call CBA_fnc_addSetting;
