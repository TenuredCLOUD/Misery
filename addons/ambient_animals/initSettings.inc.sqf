            [
            QGVAR(ambientWildlife), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "CHECKBOX", // setting type
            ["Ambient wildlife", "Enable roaming ambient wildlife?"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Ambient wildlife"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            false, // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(animalTypes), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Possible types", "Possible animals to spawn: ('Sheep','Goat','Chicken')"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Ambient wildlife"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "['Sheep','Goat','Chicken']", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            GVAR(animalTypes) = parseSimpleArray _value;
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;

            [
            QGVAR(maxAnimalUnits), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "SLIDER", // setting type
            ["Maximum animals", "Maximum animals allowed to spawn"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Ambient wildlife"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            [1, 50, 10, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(animalMinimumDistance), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "SLIDER", // setting type
            ["Minimum distance", "Minimum distance at which animals can spawn"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Ambient wildlife"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            [25, 5000, 500, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(animalSafeDistance), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "SLIDER", // setting type
            ["Safe distance", "Minimum distance at which animals can spawn from other players"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Ambient wildlife"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            [25, 5000, 200, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(animalDeleteDistance), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "SLIDER", // setting type
            ["Delete distance", "Minimum distance from a player at which animals will be deleted"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Ambient wildlife"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            [25, 5000, 1000, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(animalCycleLength), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "SLIDER", // setting type
            ["Cycle length", "Time in seconds between spawn checks"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Ambient wildlife"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            [1, 300, 30, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(animalSpawnChance), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "SLIDER", // setting type
            ["Spawn chance %", "% chance per cycle that clusters will spawn"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Ambient wildlife"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            [1, 100, 10, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(animalClusters), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Clusters", "Clusters of animals spawned per spawn cycle"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Ambient wildlife"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "1,3", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            GVAR(animalClusters) = (_value splitString ",") apply {parseNumber _x};
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;

            [
            QGVAR(animalsSheepCount), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Sheep count", "Number of sheep spawned per cluster"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Ambient wildlife"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "1,10", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            GVAR(animalsSheepCount) = (_value splitString ",") apply {parseNumber _x};
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;

            [
            QGVAR(animalsGoatCount), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Goat count", "Number of goats spawned per cluster"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Ambient wildlife"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "1,6", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            GVAR(animalsGoatCount) = (_value splitString ",") apply {parseNumber _x};
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;

            [
            QGVAR(animalsChickenCount), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Chicken count", "Number of chickens spawned per cluster"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Ambient wildlife"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "2,7", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            GVAR(animalsChickenCount) = (_value splitString ",") apply {parseNumber _x};
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;
