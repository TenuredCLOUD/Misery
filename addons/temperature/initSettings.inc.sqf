            [
            "MiseryTemperature", // Internal setting name
            "LIST", // setting type
            ["Temperature Framework", "Enable Temperature framework? (Enables player temperature calculations)"], // Pretty name shown inside the ingame settings menu
            ["Misery","Temperature"], // Pretty name of the category where the setting can be found
            [[0, 1], ["Disabled", "Enabled"], 0], // data for this setting: [array of options, default index]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;
