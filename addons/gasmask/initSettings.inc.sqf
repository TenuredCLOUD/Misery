			[
			"MiseryGMdeficiencyCycle", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Gasmask deficiency cycle", "Defines when Cartridge capacity decreases (Requires Enhanced gasmasks)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Radiation & Artifacts"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"15", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryGMdeficiencyCycle = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"Miserygasmasks", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Enhanced gasmasks", "Enable enhanced gasmasks? (Makes all gasmasks vulnerable to cartridge failure, while gasmasks are worn cartridges deplete. If a rebreather is equipped, this isn't active due to using a rebreather for supplied air)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Radiation & Artifacts"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;