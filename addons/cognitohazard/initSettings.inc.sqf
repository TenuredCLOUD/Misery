            [
            QGVAR(enabled), 
            "CHECKBOX", 
            ["Cognitohazards", "Enable audio based Cognitohazard zones?"], 
            "Misery - Cognitohazards", 
            false, 
            1 
            ] call CBA_fnc_addSetting;

            [
            QGVAR(areas),
            "EDITBOX",
            ["Cognitohazardous Areas", "ELLIPSE or RECTANGLE marker names covering the Cognitohazard area as strings ['CognitoHaz_1', 'CognitoHaz_2']"],
            "Misery - Cognitohazards", 
            "[]",
            1
            ] call CBA_fnc_addSetting;
