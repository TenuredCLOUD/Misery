            [
            "MiserysurvivalSaveMode", 
            "LIST", 
            ["Save mode", "Which save mode to enable?"], 
            ["Misery","Data"], 
            [[0, 1, 2], ["None", "Singleplayer", "Persistent"], 0], 
            1, 
            {
            params ["_value"];
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;

            [
            "MiserysurvivalHardCoreSaveMode", 
            "LIST", 
            ["Hardcore Save mode", "Enable Hardcore saving? (This setting allows saving ONLY when a player is near a campfire)"], 
            ["Misery","Data"], 
            [[0, 1], ["Disabled", "Enabled"], 0], 
            1, 
            {
            params ["_value"];
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;

            [
            "MiserysurvivalPersistence", 
            "LIST", 
            ["Misery Persistence", "Enable Persistent saving? (Activates saving system cycle)"], 
            ["Misery","Data"], 
            [[0, 1, 2], ["Disabled", "Enabled", "Enabled with Keyhandle script option"], 0], 
            1, 
            {
            params ["_value"];
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;

            [
            "MiseryManualPData", 
            "LIST", 
            ["Manual player data", "Enable optional manual player data control? (Enables players the option to 'Save' or 'Delete' thier character data manually)"], 
            ["Misery","Data"], 
            [[0, 1], ["Disabled", "Enabled"], 0], 
            1, 
            {
            params ["_value"];
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;

            [
            "EGVAR(common,checkMultiplayer)savecycle", 
            "EDITBOX", 
            ["Save cycle", "Seconds between saves (note: depending on data being saved, very low cycle values may cause lag - *Misery Persistence must be enabled*) *set to -1 to disable*"], 
            ["Misery","Data"], 
            "30", 
            1, 
            {
            params ["_value"];
            EGVAR(common,checkMultiplayer)savecycle = parseNumber _value;
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;

            [
            "MiserysurvivalSaveName", 
            "EDITBOX", 
            ["Save name", "Unique name for saving (keep blank to autogenerate)"], 
            ["Misery","Data"], 
            "", 
            1, 
            {
            params ["_value"];
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;

            [
            "MiserysurvivalSaveScript", 
            "EDITBOX", 
            ["Save script", "Optional Script to run before a character is saved (ex. Myscripts\myscript.sqf - doesn't require qoutes '') *using excessive code and not just setting variables might cause lag*"], 
            ["Misery","Data"], 
            "", 
            1, 
            {
            params ["_value"];
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;

            [
            "MiserysurvivalLoadScript", 
            "EDITBOX", 
            ["Load script", "Optional Script to run after a character is loaded (ex. Myscripts\myscript.sqf - doesn't require qoutes '') *using excessive code and not just setting variables might cause lag*"], 
            ["Misery","Data"], 
            "", 
            1, 
            {
            params ["_value"];
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;

            [
            "MiserysurvivalKeyhandleScript", 
            "EDITBOX", 
            ["Keyhandle script", "Optional Script to run after pressed key example: [ESC key] (ex. Myscripts\myscript.sqf - doesn't require qoutes '') *Must be enabled under 'Keyhandle option' in Persistency setting!*"], 
            ["Misery","Data"], 
            "", 
            1, 
            {
            params ["_value"];
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;

            [
            "MiserysurvivalKillhandleScript", 
            "EDITBOX", 
            ["Kill handle script", "Optional Script to run on a player / client once killed: (ex. Myscripts\myscript.sqf - doesn't require qoutes '')"], 
            ["Misery","Data"], 
            "", 
            1, 
            {
            params ["_value"];
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;

            [
            "MiseryCombatlog", 
            "EDITBOX", 
            ["Combat logging prevention", "Enforce a wait period before players can logout? (Note: Input value will be the logout timer value. Server admins should use thier discretion when enforcing this rule, as it may not completely prevent combat logging...) *Must have 'Keyhandle option' enabled! - Set to -1 to disable*"], 
            ["Misery","Data"], 
            "0", 
            1, 
            {
            params ["_value"];
            MiseryCombatlog = parseNumber _value;
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;
