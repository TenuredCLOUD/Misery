			[
			"MiseryFearenabled", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Misery Fear framework", "Enable Misery Fear Framework? (Enables Fear / Sanity simulation to the player) *Fear Framework Module is required*"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Fear framework"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryFearHealing", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Fear reduction", "Fear decrease every cycle *Requires Fear Framework module* (low decimal values recommended, NOT SCALED - Full value input applies)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Fear framework"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"0.05", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryFearHealing = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryFearRvg", // Internal setting name
			"LIST", // setting type
			["Ravage Zombies", "Enable Fear from Ravage zombies?"], // Pretty name shown inside the ingame settings menu
			["Misery","Fear framework"], // Pretty name of the category where the setting can be found
			[[0, 1], ["Disabled", "Enabled"], 0], // data for this setting: [array of options, default index]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"RavageFear", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Ravage zombies Fear amount", "Added fear value from zombies (calculates each survival cycle)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Fear framework"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"30", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			RavageFear = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryFearRem", // Internal setting name
			"LIST", // setting type
			["Remnant Phantoms", "Enable Fear from Remnant mod phantoms?"], // Pretty name shown inside the ingame settings menu
			["Misery","Fear framework"], // Pretty name of the category where the setting can be found
			[[0, 1], ["Disabled", "Enabled"], 0], // data for this setting: [array of options, default index]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"RemnantFear", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Remnant Phantoms Fear amount", "Added fear value from phantoms (calculates each survival cycle)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Fear framework"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"30", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			RemnantFear = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryFearDSA", // Internal setting name
			"LIST", // setting type
			["DSA - Drongo's Spooks & Anomalies", "Enable Fear from Spooks?"], // Pretty name shown inside the ingame settings menu
			["Misery","Fear framework"], // Pretty name of the category where the setting can be found
			[[0, 1], ["Disabled", "Enabled"], 0], // data for this setting: [array of options, default index]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"DSAFear", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["DSA Spooks Fear amount", "Added fear value from Spooks (calculates each survival cycle)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Fear framework"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"30", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			DSAFear = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryFearNight", // Internal setting name
			"LIST", // setting type
			["Night time", "Enable Fear from Darkness - being outside during night fall? (Changes Fear healing conditions - Must be daylight, or being near a fire, or in a building at night aids sanity / reduces fear)"], // Pretty name shown inside the ingame settings menu
			["Misery","Fear framework"], // Pretty name of the category where the setting can be found
			[[0, 1], ["Disabled", "Enabled"], 0], // data for this setting: [array of options, default index]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"NightFear", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Night fall Fear amount", "Added fear value from Night time (calculates each survival cycle)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Fear framework"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"30", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			NightFear = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryFearPsy", // Internal setting name
			"LIST", // setting type
			["PsyField", "Enable Fear from Psyfields?"], // Pretty name shown inside the ingame settings menu
			["Misery","Fear framework"], // Pretty name of the category where the setting can be found
			[[0, 1], ["Disabled", "Enabled"], 0], // data for this setting: [array of options, default index]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"PsyFear", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Psyfield Fear amount", "Added fear value from Psyfield (calculates each survival cycle)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Fear framework"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"50", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			PsyFear = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;