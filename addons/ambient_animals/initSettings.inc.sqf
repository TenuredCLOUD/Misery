			[
			"MiseryAmbientWildlife", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Ambient wildlife", "Enable roaming ambient wildlife?"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Ambient wildlife"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryAnimalTypes", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Possible types", "Possible animals to spawn: ('Sheep','Goat','Chicken')"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Ambient wildlife"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"Sheep,Goat,Chicken", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryAnimalTypes = _value splitString ",";
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryMaxAnimalUnits", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Maximum animals", "Maximum animals allowed to spawn"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Ambient wildlife"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"30", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryMaxAnimalUnits = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryAnimalMinimumDistance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Minimum distance", "Minimum distance at which animals can spawn"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Ambient wildlife"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"500", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryAnimalMinimumDistance = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryAnimalSafeDistance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Safe distance", "Minimum distance at which animals can spawn from other players"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Ambient wildlife"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"200", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryAnimalSafeDistance = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryAnimalDeleteDistance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Delete distance", "Minimum distance from a player at which animals will be deleted"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Ambient wildlife"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"1000", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryAnimalDeleteDistance = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryAnimalCycleLength", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Cycle length", "Time in seconds between spawn checks"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Ambient wildlife"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"30", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryAnimalCycleLength = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryAnimalSpawnChance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Spawn chance %", "% chance per cycle that clusters will spawn"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Ambient wildlife"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"10", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryAnimalSpawnChance = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryAnimalClusters", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Clusters", "Clusters of animals spawned per spawn cycle"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Ambient wildlife"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"1,3", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryAnimalClusters = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"Misery_AnimalsSheepCount", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Sheep count", "Number of sheep spawned per cluster"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Ambient wildlife"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"1,10", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryAnimalsSheepCount = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"Misery_AnimalsGoatCount", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Goat count", "Number of goats spawned per cluster"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Ambient wildlife"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"1,6", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryAnimalsGoatCount = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"Misery_AnimalsChickenCount", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Chicken count", "Number of chickens spawned per cluster"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Ambient wildlife"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"2,7", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryAnimalsChickenCount = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;
