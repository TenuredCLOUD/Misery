            [
            QGVAR(enabled), 
            "CHECKBOX", 
            ["Misery TPP No NVG's", "Actively disables NVG's if the player is in third person (TPP) trying to use them, can greatly increase difficulty, also levels the playing field..."], 
            ["Misery","Server Difficulty"], 
            false, 
            1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
            {
            params ["_value"];
            if (_value) then {
            GVAR(enabled) = true;
            if (hasInterface) then {
            [] call FUNC(disableNightVision);
            };
                }else{
            GVAR(enabled) = false;
            };
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;
