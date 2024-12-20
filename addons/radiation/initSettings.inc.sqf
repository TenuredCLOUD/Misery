            [
            QGVAR(enabled), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "CHECKBOX", // setting type
            ["Misery Radiation", "Enable Radiation exposure once in radiation zones?"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Zone Logics"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            false, // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(healingVal), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "SLIDER", // setting type
            ["Radiation healing", "Radiation decrease every cycle"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Radiation & Artifacts"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            [1, 10, 0.1, 2], // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(enahancedExposure), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "CHECKBOX", // setting type
            ["Advanced Radiation exposure", "Enable more serious radiation poisoning? (Enables shaking, coughing, and extra hunger and thirst drainage from radiation poisoning - scales with exposure)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Radiation & Artifacts"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            false, // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(enhancedArtifiacts), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "CHECKBOX", // setting type
            ["Artifact Radiation exposure", "Enable radiation exposure from artifacts? (If the player possesses an artifact of any type they are exposed to radiation, unless the artifact is placed in a lead lined container)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Radiation & Artifacts"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            false, // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;
