            [
            QGVAR(cycle), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "SLIDER", // setting type
            ["survival Cycle length", "Seconds between updates / calculations (Misery hunger, thirst, temperature calculations, etc...) (note: very low cycle values may cause lag)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Survival framework"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            [1, 300, 30, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(thirstIncrement), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "SLIDER", // setting type
            ["Thirst increment", "Thirst increase every cycle"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Survival framework"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            [0.01, 100, 0.05, 2], // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(hungerIncrement), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "SLIDER", // setting type
            ["Hunger increment", "Hunger increase every cycle"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Survival framework"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            [0.01, 100, 0.05, 2], // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(weightDeficiency), // Internal setting name
            "LIST", // setting type
            ["Weight penalty", "Enable a penalty for players gear weight? (Enables a deficiency to hunger / thirst for player weight, also increases tired calc values in SP - Dynamically calculated)"], // Pretty name shown inside the ingame settings menu
            ["Misery","Penalties"], // Pretty name of the category where the setting can be found
            [[0, 1], ["Disabled", "Enabled"], 0], // data for this setting: [array of options, default index]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(temperatureDeficiency), // Internal setting name
            "LIST", // setting type
            ["Temperature penalty", "Enable a penalty for players Temperature? (Cold - hunger increase / Hot or fever thirst increase - Dynamically calculated)"], // Pretty name shown inside the ingame settings menu
            ["Misery","Penalties"], // Pretty name of the category where the setting can be found
            [[0, 1], ["Disabled", "Enabled"], 0], // data for this setting: [array of options, default index]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(sleepinessIncrement), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "SLIDER", // setting type
            ["Sleepiness increment", "Sleepiness increase every cycle (SP only)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Sleep & Fatigue"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            [0.01, 100, 0.1, 2], // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(poisonHealing), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "SLIDER", // setting type
            ["Poison healing", "Poison decrease every cycle"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Disease & infection"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            [0.01, 100, 0.1, 2], // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(infectionHealing), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "SLIDER", // setting type
            ["Infection healing", "Infection decrease every cycle"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Disease & infection"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            [0.01, 100, 0.1, 2], // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(blackoutChance), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "SLIDER", // setting type
            ["Blackout chance", "% chance per cycle to blackout when Tired (SP only)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Sleep & Fatigue"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            [1, 100, 30, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(ailments), // Internal setting name
            "CHECKBOX", // setting type
            ["Misery Ailments", "Enable Ailments? (Enables bacterial infections, parasites, etc...)"], // Pretty name shown inside the ingame settings menu
            ["Misery","Disease & infection"], // Pretty name of the category where the setting can be found
            false, // data for this setting: [array of options, default index]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(turbidWaterChance), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "SLIDER", // setting type
            ["Turbid water disease chance", "% chance Turbid water consumption causes disease (0 to disable)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Disease & infection"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            [0, 100, 0, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(meatDiseaseChance), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "SLIDER", // setting type
            ["Raw meat disease chance", "% chance Raw meat consumption causes disease (0 to disable)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Disease & infection"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            [0, 100, 0, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;
