			[
			"Miseryzedinfect", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Ravage Zombie infection", "Allow Zombies to inflict disease? (Requires Ravage Zombie Module)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Disease & infection"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"Miseryzedinfectchance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Ravage Zombie Infection chance", "% chance per zombie hit to become infected... (-1 to disable)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Disease & infection"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"-1", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			Miseryzedinfectchance = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;