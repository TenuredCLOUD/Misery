            [
            "MiserysurvivalSaveMode", // Internal setting name
            "LIST", // setting type
            ["Save mode", "Which save mode to enable?"], // Pretty name shown inside the ingame settings menu
            ["Misery","Data"], // Pretty name of the category where the setting can be found
            [[0, 1, 2], ["None", "Singleplayer", "Persistent"], 0], // data for this setting: [array of options, default index]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;

            [
            "MiserysurvivalHardCoreSaveMode", // Internal setting name
            "LIST", // setting type
            ["Hardcore Save mode", "Enable Hardcore saving? (This setting allows saving ONLY when a player is near a campfire)"], // Pretty name shown inside the ingame settings menu
            ["Misery","Data"], // Pretty name of the category where the setting can be found
            [[0, 1], ["Disabled", "Enabled"], 0], // data for this setting: [array of options, default index]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;

            [
            "MiserysurvivalPersistence", // Internal setting name
            "LIST", // setting type
            ["Misery Persistence", "Enable Persistent saving? (Activates saving system cycle)"], // Pretty name shown inside the ingame settings menu
            ["Misery","Data"], // Pretty name of the category where the setting can be found
            [[0, 1, 2], ["Disabled", "Enabled", "Enabled with Keyhandle script option"], 0], // data for this setting: [array of options, default index]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;

            [
            "MiseryManualPData", // Internal setting name
            "LIST", // setting type
            ["Manual player data", "Enable optional manual player data control? (Enables players the option to 'Save' or 'Delete' thier character data manually)"], // Pretty name shown inside the ingame settings menu
            ["Misery","Data"], // Pretty name of the category where the setting can be found
            [[0, 1], ["Disabled", "Enabled"], 0], // data for this setting: [array of options, default index]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;

            [
            "EGVAR(common,checkMultiplayer)savecycle", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Save cycle", "Seconds between saves (note: depending on data being saved, very low cycle values may cause lag - *Misery Persistence must be enabled*) *set to -1 to disable*"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Data"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "30", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            EGVAR(common,checkMultiplayer)savecycle = parseNumber _value;
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;

            [
            "MiserysurvivalSaveName", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Save name", "Unique name for saving (keep blank to autogenerate)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Data"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;

            [
            "MiserysurvivalSaveScript", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Save script", "Optional Script to run before a character is saved (ex. Myscripts\myscript.sqf - doesn't require qoutes '') *using excessive code and not just setting variables might cause lag*"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Data"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;

            [
            "MiserysurvivalLoadScript", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Load script", "Optional Script to run after a character is loaded (ex. Myscripts\myscript.sqf - doesn't require qoutes '') *using excessive code and not just setting variables might cause lag*"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Data"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;

            [
            "MiserysurvivalKeyhandleScript", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Keyhandle script", "Optional Script to run after pressed key example: [ESC key] (ex. Myscripts\myscript.sqf - doesn't require qoutes '') *Must be enabled under 'Keyhandle option' in Persistency setting!*"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Data"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;

            [
            "MiserysurvivalKillhandleScript", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Kill handle script", "Optional Script to run on a player / client once killed: (ex. Myscripts\myscript.sqf - doesn't require qoutes '')"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Data"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;

            [
            "MiseryCombatlog", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Combat logging prevention", "Enforce a wait period before players can logout? (Note: Input value will be the logout timer value. Server admins should use thier discretion when enforcing this rule, as it may not completely prevent combat logging...) *Must have 'Keyhandle option' enabled! - Set to -1 to disable*"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Data"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "0", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            MiseryCombatlog = parseNumber _value;
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;
