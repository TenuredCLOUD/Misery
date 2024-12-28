            [
            QGVAR(debug), 
            "CHECKBOX", 
            ["Misery Debug", "Show debug text for Misery systems? (Recommended to disable after scenario testing. NOTE: Spawns systemChat dialogue for Misery systems...)"], 
            ["Misery","Debugging"], 
            false, 
            1 
            ] call CBA_fnc_addSetting;

            [
            QGVAR(specialGear), 
            "CHECKBOX", 
            ["Misery Special Gear", "Enable special gear for protection factors for certain zones? - requires manual data input"], 
            ["Misery","Protection"], 
            false, 
            1 
            ] call CBA_fnc_addSetting;
