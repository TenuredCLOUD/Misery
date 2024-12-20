            [
            QGVAR(enabled), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "CHECKBOX", // setting type
            ["Misery Fear framework", "Enable Misery Fear Framework? (Enables Fear / Sanity simulation to the player) *Fear Framework Module is required*"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Fear framework"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            false, // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(healingVal), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "SLIDER", // setting type
            ["Fear reduction", "Fear decrease every cycle *Requires Fear Framework module* (low decimal values recommended, NOT SCALED - Full value input applies)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Fear framework"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            [0.01, 10, 0.05, 2], // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(ravage), // Internal setting name
            "CHECKBOX", // setting type
            ["Ravage Zombies", "Enable Fear from Ravage zombies?"], // Pretty name shown inside the ingame settings menu
            ["Misery","Fear framework"], // Pretty name of the category where the setting can be found
            false, // data for this setting: [array of options, default index]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(ravageVal), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "SLIDER", // setting type
            ["Ravage zombies Fear amount", "Added fear value from zombies (calculates each survival cycle)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Fear framework"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            [1, 500, 30, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(remnant), // Internal setting name
            "CHECKBOX", // setting type
            ["Remnant Phantoms", "Enable Fear from Remnant mod phantoms?"], // Pretty name shown inside the ingame settings menu
            ["Misery","Fear framework"], // Pretty name of the category where the setting can be found
            false, // data for this setting: [array of options, default index]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(remnantVal), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "SLIDER", // setting type
            ["Remnant Phantoms Fear amount", "Added fear value from phantoms (calculates each survival cycle)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Fear framework"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            [1, 500, 30, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(dsa), // Internal setting name
            "CHECKBOX", // setting type
            ["DSA - Drongo's Spooks & Anomalies", "Enable Fear from Spooks?"], // Pretty name shown inside the ingame settings menu
            ["Misery","Fear framework"], // Pretty name of the category where the setting can be found
            false, // data for this setting: [array of options, default index]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(dsaVal), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "SLIDER", // setting type
            ["DSA Spooks Fear amount", "Added fear value from Spooks (calculates each survival cycle)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Fear framework"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            [1, 500, 30, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(night), // Internal setting name
            "CHECKBOX", // setting type
            ["Night time", "Enable Fear from Darkness - being outside during night fall? (Changes Fear healing conditions - Must be daylight, or being near a fire, or in a building at night aids sanity / reduces fear)"], // Pretty name shown inside the ingame settings menu
            ["Misery","Fear framework"], // Pretty name of the category where the setting can be found
            false, // data for this setting: [array of options, default index]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(nightVal), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "SLIDER", // setting type
            ["Night fall Fear amount", "Added fear value from Night time (calculates each survival cycle)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Fear framework"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            [1, 500, 30, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(psy), // Internal setting name
            "CHECKBOX", // setting type
            ["PsyField", "Enable Fear from Psyfields?"], // Pretty name shown inside the ingame settings menu
            ["Misery","Fear framework"], // Pretty name of the category where the setting can be found
            false, // data for this setting: [array of options, default index]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(psyVal), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "SLIDER", // setting type
            ["Psyfield Fear amount", "Added fear value from Psyfield (calculates each survival cycle)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Fear framework"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            [1, 500, 50, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;
