			[
			"Miserywatercoll", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Water collection", "Enable Water collection actions from water sources? (Wells, etc...)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Sub-Actions"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryJerrycanacts", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Jerrycan actions", "Enable Jerrycan actions? (Adds actions for Jerrycans)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Sub-Actions"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;