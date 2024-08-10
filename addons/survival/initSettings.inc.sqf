			[
			"MiserysurvivalCycle", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["survival Cycle length", "Seconds between updates / calculations (Misery hunger, thirst, temperature calculations, etc...) (note: very low cycle values may cause lag)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Survival framework"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"30", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiserysurvivalCycle = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryThirstIncrement", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Thirst increment", "Thirst increase every cycle"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Survival framework"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"1", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryThirstIncrement = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryHungerIncrement", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Hunger increment", "Hunger increase every cycle"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Survival framework"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"1", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryHungerIncrement = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryWeightdeficiency", // Internal setting name
			"LIST", // setting type
			["Weight penalty", "Enable a penalty for players gear weight? (Enables a deficiency to hunger / thirst for player weight, also increases tired calc values in SP - Dynamically calculated)"], // Pretty name shown inside the ingame settings menu
			["Misery","Penalties"], // Pretty name of the category where the setting can be found
			[[0, 1], ["Disabled", "Enabled"], 0], // data for this setting: [array of options, default index]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryTemperaturedeficiency", // Internal setting name
			"LIST", // setting type
			["Temperature penalty", "Enable a penalty for players Temperature? (Cold - hunger increase / Hot or fever thirst increase - Dynamically calculated)"], // Pretty name shown inside the ingame settings menu
			["Misery","Penalties"], // Pretty name of the category where the setting can be found
			[[0, 1], ["Disabled", "Enabled"], 0], // data for this setting: [array of options, default index]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiserySleepinessIncrement", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Sleepiness increment", "Sleepiness increase every cycle (SP only)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Sleep & Fatigue"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"0.1", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiserySleepinessIncrement = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryPoisonHealing", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Poison healing", "Poison decrease every cycle"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Disease & infection"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"0.1", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryPoisonHealing = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryInfectionHealing", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Infection healing", "Infection decrease every cycle"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Disease & infection"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"0.1", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryInfectionHealing = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryBlackoutChance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Blackout chance", "% chance per cycle to blackout when Tired (SP only)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Sleep & Fatigue"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"30", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryBlackoutChance = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryAilments", // Internal setting name
			"LIST", // setting type
			["Misery Ailments", "Enable Ailments? (Enables bacterial infections, parasites, etc...)"], // Pretty name shown inside the ingame settings menu
			["Misery","Disease & infection"], // Pretty name of the category where the setting can be found
			[[0, 1], ["Disabled", "Enabled"], 0], // data for this setting: [array of options, default index]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"Miseryturbidwaterchance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Turbid water disease chance", "% chance Turbid water consumption causes disease (-1 to disable)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Disease & infection"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"-1", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			Miseryturbidwaterchance = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"Miseryrawmeatchance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Raw meat disease chance", "% chance Raw meat consumption causes disease (-1 to disable)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Disease & infection"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"-1", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			Miseryrawmeatchance = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;