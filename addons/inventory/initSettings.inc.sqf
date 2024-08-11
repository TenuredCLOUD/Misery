            [
            "MiseryDefineItemsScript", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Custom define items script", "Path to Script to run custom item usage / defines"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Custom Item Usage structure"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;

            [
            "MiseryHUDlayout", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "LIST", // setting type
            ["HUD layout", "(Integer style or Progress bar style)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Client HUD settings"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            [[1, 0], ["Integers","Bar"], 1], // data for this setting: [min, max, default, number of shown trailing decimals]
            2, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
            {
            params ["_value"];
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;
