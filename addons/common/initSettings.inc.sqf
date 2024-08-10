			[
			"MiseryDebug", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Misery Debug", "Show debug text for Misery systems? (Recommended to disable after scenario testing. NOTE: Spawns systemchat dialogue for Misery systems...)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Debugging"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;