            [
            QGVAR(symbol), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Misery Money Symbol", "Symbol to use for currency"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Money"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "$", // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;
