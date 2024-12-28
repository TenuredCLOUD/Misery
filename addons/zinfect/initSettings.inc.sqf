            [
            QGVAR(enabled), 
            "CHECKBOX", 
            ["Ravage Zombie infection", "Allow Zombies to inflict disease? (Requires Ravage Zombie Module)"], 
            ["Misery","Disease & infection"], 
            false, 
            1 
            ] call CBA_fnc_addSetting;

            [
            QGVAR(chance), 
            "SLIDER", 
            ["Ravage Zombie Infection chance", "% chance per zombie hit to become infected... (0 to disable)"], 
            ["Misery","Disease & infection"], 
            [0, 100, 0, 0], 
            1 
            ] call CBA_fnc_addSetting;
