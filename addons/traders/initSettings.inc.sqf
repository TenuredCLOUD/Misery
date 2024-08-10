			[
			"MiseryDynamicMarketsActive", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Dynamic Markets", "Enable dynamic markets?"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Economy"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;
			
			[
			"Misery_MarketShift_Dist", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Distance check", "Distance that the shop manager checks for players near traders in meters"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Economy"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"1000", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			Misery_MarketShift_Dist = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;
				
			[
			"Misery_MarketShift_Cycle", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Changing cycle 'Market shift'", "Time in seconds per cycle (default: 3600 - 1 Real time hour)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Economy"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"3600", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			Misery_MarketShift_Cycle = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;