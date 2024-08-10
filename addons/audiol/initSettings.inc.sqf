			[
			"MiseryChrenhan", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Character Enhanced effects", "Enable Extra Character Immersion? (Enables Player coughing, sneezing when sick or cold, and stomach growling if you are starting to get hungry.)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Audio"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryEnhinv", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Enhanced Inventory sounds", "Enable Inventory audio overhaul?"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Audio"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryEnhamb", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Ambient audio soundscape overhaul", "Enable Extra world audio with input sounds? (must utilize the 'Ambient soundscape array' data)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Audio"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"Misery_EnhancedAmbsoundscape_Listed_audio", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Ambient soundscape array", "Listed sounds to play randomly around players (Format: Mysound_1,Mysound_2,etc...)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Audio"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			Misery_EnhancedAmbsoundscape_Listed_audio = _value splitString ",";
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryEnhForge", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Ambient audio for Forges", "Enable Audio loop for forges? (Makes them crackle & hum - immersion)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Audio"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"Misery_AmbientMusic_Listed_audio", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Ambient Music array", "Listed music to play randomly for players (Format: Mymusic_1,Mymusic_2,etc...)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Audio"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			Misery_AmbientMusic_Listed_audio = _value splitString ",";
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;