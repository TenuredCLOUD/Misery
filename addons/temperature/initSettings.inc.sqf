            [
            QGVAR(enable), // Internal setting name
            "CHECKBOX", // setting type
            ["Temperature Framework", "Enable Temperature framework? (Enables player temperature calculations)"], // Pretty name shown inside the ingame settings menu
            ["Misery","Temperature"], // Pretty name of the category where the setting can be found
            false, // data for this setting: [array of options, default index]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;
