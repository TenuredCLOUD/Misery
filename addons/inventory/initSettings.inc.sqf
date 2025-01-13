            [
            QGVAR(defineItemsScript), 
            "EDITBOX", 
            ["Custom define items script", "Path to Script to run custom item usage / defines"], 
            ["Misery","Custom Item Usage structure"], 
            "", 
            1 
            ] call CBA_fnc_addSetting;

            [
            QGVAR(hudLayout), 
            "LIST", 
            ["HUD layout", "(Integer style or Progress bar style)"], 
            ["Misery","Client HUD settings"], 
            [[1, 0], ["Integers","Bar"], 1], 
            2 // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
            ] call CBA_fnc_addSetting;
