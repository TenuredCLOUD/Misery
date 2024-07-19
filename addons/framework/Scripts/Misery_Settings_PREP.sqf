#include "\z\misery\addons\framework\scripts\Misery_PreParser.hpp"

/*
Misery Main framework settings
Pushes all CBA settings data to startup PREP for further processing...
Settings are processed prior to session startup, values are defined prior to session start as well...
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

			#include "\a3\ui_f\hpp\defineDIKCodes.inc"

			[
			"MiseryHUDlayout", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"LIST", // setting type
			["HUD layout", "(Integer style or Progress bar style)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Client HUD settings"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[[1, 0], ["Integers","Bar"], 1], // data for this setting: [min, max, default, number of shown trailing decimals]
			2, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			// [
			// "MiseryHUDcolorPDAClimate", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			// "EDITBOX", // setting type
			// ["PDA Climate Display color", "(HTML color code)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			// ["Misery","Client HUD settings"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			// "#ffffff", // data for this setting: [min, max, default, number of shown trailing decimals]
			// 2, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			// {
			// params ["_value"];
			// MiseryHUDcolorPDAClimate = _value;
			// } // function that will be executed once on mission start and every time the setting is changed.
			// ] call CBA_fnc_addSetting;

			// [
			// "MiseryHUDcolorPDACompass", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			// "EDITBOX", // setting type
			// ["PDA Compass Display color", "(HTML color code)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			// ["Misery","Client HUD settings"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			// "#ffffff", // data for this setting: [min, max, default, number of shown trailing decimals]
			// 2, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			// {
			// params ["_value"];
			// MiseryHUDcolorPDACompass = _value;
			// } // function that will be executed once on mission start and every time the setting is changed.
			// ] call CBA_fnc_addSetting;

			// [
			// "MiseryHUDcolorPDAClock", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			// "EDITBOX", // setting type
			// ["PDA Clock Display color", "(HTML color code)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			// ["Misery","Client HUD settings"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			// "#ffffff", // data for this setting: [min, max, default, number of shown trailing decimals]
			// 2, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			// {
			// params ["_value"];
			// MiseryHUDcolorPDAClock = _value;
			// } // function that will be executed once on mission start and every time the setting is changed.
			// ] call CBA_fnc_addSetting;

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

			[
			"MiserysurvivalCycle", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["survival Cycle length", "Seconds between updates / calculations (Misery hunger, thirst, temperature calculations, etc...) (note: very low cycle values may cause lag)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","survival framework"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
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
			["Misery","survival framework"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
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
			["Misery","survival framework"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
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
			"MiseryWeightcheck", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Weight action", "Enable an action to check current gear weight?"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Sub-Actions"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
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
			"MiseryRadiationHealing", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Radiation healing", "Radiation decrease every cycle"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Radiation & Artifacts"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"0.1", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryRadiationHealing = parseNumber _value;
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
			"MiseryTemperature", // Internal setting name
			"LIST", // setting type
			["Temperature Framework", "Enable Temperature framework? (Enables player temperature calculations)"], // Pretty name shown inside the ingame settings menu
			["Misery","Temperature"], // Pretty name of the category where the setting can be found
			[[0, 1], ["Disabled", "Enabled"], 0], // data for this setting: [array of options, default index]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
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
			"MiseryEnhrads", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Advanced Radiation exposure", "Enable more serious radiation poisoning? (Enables shaking, coughing, and extra hunger and thirst drainage from radiation poisoning - scales with exposure)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Radiation & Artifacts"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryEnhartifacts", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Artifact Radiation exposure", "Enable radiation exposure from artifacts? (If the player possesses an artifact of any type they are exposed to radiation, unless the artifact is placed in a lead lined container)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Radiation & Artifacts"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
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

			[
			"Miserycook", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Cooking", "Enable Cooking actions when near a fire?"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Sub-Actions"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

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

			[
			"Miseryfish", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Fishing", "Enable Fishing near open water sources? (Requires fishing rod, bait, hook, and fishing spool...)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Sub-Actions"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"Miseryforage", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Foraging", "Enable Foraging? (Enables digging for worms, and searching for tinder actions...)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Sub-Actions"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryMine", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Mining, Smithing, Forging", "Enable Mining, forging and smithing? (Ore collection, metal working, etc...)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Sub-Actions"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryCraft", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Crafting Menus Framework", "Enable Crafting Menus? (Crafting allowed at workbenches)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Sub-Actions"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"Miserywoodcut", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Wood collection", "Enable Wood collection actions? (Axe's and chainsaw's will have actions near trees)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
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

			[
			"MiseryPDAacts", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["PDA actions", "Enable PDA actions? (Adds actions to PDA)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Detectors & Devices"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryPDAEMSAL", // Internal setting name
			"LIST", // setting type
			["PDA alerts for Emission storms", "Enable PDA alerts for Emission storms? (*Requires TTS_Emissions - You can get it from Github or Steam*)"], // Pretty name shown inside the ingame settings menu
			["Misery","Detectors & Devices"], // Pretty name of the category where the setting can be found
			[[0, 1], ["Disabled", "Enabled"], 0], // data for this setting: [array of options, default index]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryGeigeracts", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Geiger actions", "Enable Geiger actions? (Adds actions to Geiger)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Detectors & Devices"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryRFEMFacts", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["RF / EMF detector actions", "Enable RF / EMF detector actions? (Adds actions to RF / EMF detector)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Detectors & Devices"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLeadcontaineracts", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Leadlined container actions", "Enable Lead container actions? (Adds safe transportation of artifacts if artifact exposure is enabled)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Radiation & Artifacts"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

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
			"", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
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

			[
			"MiseryPhantDrops", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Phantom Artifact drops", "Allow Phantoms to drop artifacts? (*Requires Haleks Remnant Mod*)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Remnant Phantoms"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"Miseryphantdropchance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Phantoms artifact drop chance", "% chance per phantom kill to drop an artifact (-1 to disable)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Remnant Phantoms"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"-1", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			Miseryphantdropchance = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

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

			[
			"MiseryDefineItemsScript", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Custom define items script", "Path to Script to run custom item usage / defines"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Custom Item Usage structure"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiserysurvivalSaveMode", // Internal setting name
			"LIST", // setting type
			["Save mode", "Which save mode to enable?"], // Pretty name shown inside the ingame settings menu
			["Misery","Data"], // Pretty name of the category where the setting can be found
			[[0, 1, 2], ["None", "Singleplayer", "Persistent"], 0], // data for this setting: [array of options, default index]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiserysurvivalHardCoreSaveMode", // Internal setting name
			"LIST", // setting type
			["Hardcore Save mode", "Enable Hardcore saving? (This setting allows saving ONLY when a player is near a campfire)"], // Pretty name shown inside the ingame settings menu
			["Misery","Data"], // Pretty name of the category where the setting can be found
			[[0, 1], ["Disabled", "Enabled"], 0], // data for this setting: [array of options, default index]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;
	
			[
			"MiserysurvivalPersistence", // Internal setting name
			"LIST", // setting type
			["Misery Persistence", "Enable Persistent saving? (Activates saving system cycle)"], // Pretty name shown inside the ingame settings menu
			["Misery","Data"], // Pretty name of the category where the setting can be found
			[[0, 1, 2], ["Disabled", "Enabled", "Enabled with Keyhandle script option"], 0], // data for this setting: [array of options, default index]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryManualPData", // Internal setting name
			"LIST", // setting type
			["Manual player data", "Enable optional manual player data control? (Enables players the option to 'Save' or 'Delete' thier character data manually)"], // Pretty name shown inside the ingame settings menu
			["Misery","Data"], // Pretty name of the category where the setting can be found
			[[0, 1], ["Disabled", "Enabled"], 0], // data for this setting: [array of options, default index]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryMPsavecycle", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Save cycle", "Seconds between saves (note: depending on data being saved, very low cycle values may cause lag - *Misery Persistence must be enabled*) *set to -1 to disable*"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Data"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"30", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryMPsavecycle = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiserysurvivalSaveName", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Save name", "Unique name for saving (keep blank to autogenerate)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Data"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiserysurvivalSaveScript", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Save script", "Optional Script to run before a character is saved (ex. Myscripts\myscript.sqf - doesn't require qoutes '') *using excessive code and not just setting variables might cause lag*"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Data"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiserysurvivalLoadScript", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Load script", "Optional Script to run after a character is loaded (ex. Myscripts\myscript.sqf - doesn't require qoutes '') *using excessive code and not just setting variables might cause lag*"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Data"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiserysurvivalKeyhandleScript", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Keyhandle script", "Optional Script to run after pressed key example: [ESC key] (ex. Myscripts\myscript.sqf - doesn't require qoutes '') *Must be enabled under 'Keyhandle option' in Persistency setting!*"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Data"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiserysurvivalKillhandleScript", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Kill handle script", "Optional Script to run on a player / client once killed: (ex. Myscripts\myscript.sqf - doesn't require qoutes '')"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Data"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryCombatlog", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Combat logging prevention", "Enforce a wait period before players can logout? (Note: Input value will be the logout timer value. Server admins should use thier discretion when enforcing this rule, as it may not completely prevent combat logging...) *Must have 'Keyhandle option' enabled! - Set to -1 to disable*"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Data"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"0", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryCombatlog = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			//CBA settings added for Map "optimization" (optional):
			[
			"MiseryMapOptimizeTrash", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Misery Map Optimization (Trash)", "Filters through the active map and actively hides and disables simulation on specific object models (For this option, TRASH). Can in some instances increase framerate, especially useful on maps that are densly populated with certain objects..."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Server Map Rendering settings"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
			params ["_value"];
			if (_value) then {[] execVM MIS_FILESYS(survival\Performance\Trash\MapTrash-)}else{[] execVM MIS_FILESYS(survival\Performance\Trash\MapTrash+)}; 
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			//CBA settings added for Map "optimization" (optional):
			[
			"MiseryMapOptimizeCraters", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Misery Map Optimization (Craters)", "Filters through the active map and actively hides and disables simulation on specific object models (For this option, CRATERS). Can in some instances increase framerate, especially useful on maps that are densly populated with certain objects..."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Server Map Rendering settings"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
			params ["_value"];
			if (_value) then {[] execVM MIS_FILESYS(survival\Performance\Craters\MapCraters-)}else{[] execVM MIS_FILESYS(survival\Performance\Craters\MapCraters+)}; 
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			//CBA settings added for Map "optimization" (optional):
			[
			"MiseryMapOptimizeWrecks", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Misery Map Optimization (Wrecks)", "Filters through the active map and actively hides and disables simulation on specific object models (For this option, WRECKS). Can in some instances increase framerate, especially useful on maps that are densly populated with certain objects..."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Server Map Rendering settings"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
			params ["_value"];
			if (_value) then {[] execVM MIS_FILESYS(survival\Performance\Wrecks\MapWrecks-)}else{[] execVM MIS_FILESYS(survival\Performance\Wrecks\MapWrecks+)};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			//CBA settings added for TPP No NVG's (optional):
			[
			"MiseryNoNVG_TPP", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Misery TPP No NVG's", "Actively disables NVG's if the player is in third person (TPP) trying to use them, can greatly increase difficulty, also levels the playing field..."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Server Difficulty"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
			params ["_value"];
			if (_value) then {
			MiseryNoNVG_TPP_ENABLED = true;
			if (hasInterface) then {
			[] execVM MIS_FILESYS(survival\Immersion\TPPNONVG);
			};
    			}else{
			MiseryNoNVG_TPP_ENABLED = false;
			};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

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

			[
			"MiseryLootEnabled", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Enable loot", "Enable or disable Misery loot framework"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLoottimer", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Loot checks timer", "Timer for loot spawning and clean checks"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"20", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLoottimer = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootrefreshtimer", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Loot refresh timer", "Timer for loot to refresh - Loot can respawn at previous positions (** Set to -1 to disable **)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"3600", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootrefreshtimer = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootspawnDist", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Loot spawn distance", "Distance around players loot will spawn (NOTE: 50 - 200m recommended for performance)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"200", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootspawnDist = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootDeleteDist", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Deletion distance", "Distance at which loot piles are deleted (NOTE: HIGHER values can be very performance demanding! ** Set to -1 to disable **)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"1000", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootDeleteDist = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootChanceHouse", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Chance building", "Chance a non-military building has loot"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"20", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootChanceHouse = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootChanceHouseM", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Chance building (Military)", "Chance a military building has loot"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"50", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootChanceHouseM = parseNumber _value;
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootCustomArrays", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Custom Arrays", "Only Allow Custom arrays? (This setting makes it so no loot arrays are automatically populated, instead only the classnames you list will be available for loot)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			false, // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootChanceFood", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Food chance", "Chance food (% chance,min items,max items)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"10,1,1", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootChanceFood = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootChanceMedical", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Medical chance", "Chance medical items (% chance,min items,max items)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"10,1,1", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootChanceMedical = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootChanceMisc", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Misc item chance", "Chance misc items (% chance,min items,max items)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"15,1,2", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootChanceMisc = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootChanceWeapon", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Weapon chance", "Chance weapon (% chance,min items,max items)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"15,1,1", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootChanceWeapon = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootChanceAttachment", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Attachment chance", "Chance attachments (% chance,min items,max items)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"10,1,1", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootChanceAttachment = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootChanceMagazine", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Magazine chance", "Chance magazines for contained weapons (% chance,min items,max items)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"15,1,2", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootChanceMagazine = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootChanceUniform", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Uniform chance", "Chance uniforms (% chance,min items,max items)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"15,1,1", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootChanceUniform = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootChanceVest", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Vest chance", "Chance vests (% chance,min items,max items)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"10,1,1", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootChanceVest = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootChanceHeadgear", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Headgear chance", "Chance headgear (% chance,min items,max items)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"15,1,1", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootChanceHeadgear = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootChancePack", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Backpack chance", "Chance backpacks (% chance,min items,max items)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"15,1,1", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootChancePack = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootChanceGoggle", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Goggle chance", "Chance goggles / Facewear (% chance,min items,max items)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"15,1,1", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootChanceGoggle = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootChanceMagazineRandom", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Random magazine chance", "Chance random magazines (% chance,min items,max items)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"15,1,2", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootChanceMagazineRandom = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootChanceGrenade", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Grenade chance", "Chance grenades (% chance,min items,max items)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"0,0,0", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootChanceGrenade = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootChanceExplosive", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Explosive chance", "Chance explosives (% chance,min items,max items)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"0,0,0", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootChanceExplosive = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootChanceFoodM", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Food chance (Military)", "Chance food (% chance,min items,max items)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"50,1,1", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootChanceFoodM = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootChanceMedicalM", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Medical chance (Military)", "Chance medical items (% chance,min items,max items)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"50,1,1", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootChanceMedicalM = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootChanceMiscM", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Misc item chance (Military)", "Chance misc items (% chance,min items,max items)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"75,1,2", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootChanceMiscM = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootChanceWeaponM", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Weapon chance (Military)", "Chance weapon (% chance,min items,max items)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"75,1,1", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootChanceWeaponM = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootChanceAttachmentM", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Attachment chance (Military)", "Chance attachments (% chance,min items,max items)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"75,1,1", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootChanceAttachmentM = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootChanceMagazineM", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Magazine chance (Military)", "Chance magazines for contained weapons (% chance,min items,max items)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"75,1,2", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootChanceMagazineM = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootChanceUniformM", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Uniform chance (Military)", "Chance uniforms (% chance,min items,max items)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"50,1,1", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootChanceUniformM = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootChanceVestM", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Vest chance (Military)", "Chance vests (% chance,min items,max items)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"50,1,1", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootChanceVestM = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootChanceHeadgearM", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Headgear chance (Military)", "Chance headgear (% chance,min items,max items)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"75,1,1", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootChanceHeadgearM = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootChancePackM", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Backpack chance (Military)", "Chance backpacks (% chance,min items,max items)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"50,1,1", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootChancePackM = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootChanceGoggleM", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Goggle chance (Military)", "Chance goggles (% chance,min items,max items)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"75,1,1", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootChanceGoggleM = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootChanceMagazineRandomM", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Random magazine chance (Military)", "Chance random magazines (% chance,min items,max items)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"75,1,2", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootChanceMagazineRandomM = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootChanceGrenadeM", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Grenade chance (Military)", "Chance random magazines (% chance,min items,max items)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"50,1,2", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootChanceGrenadeM = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootChanceExplosiveM", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Explosive chance (Military)", "Chance explosives (% chance,min items,max items)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"50,1,2", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootChanceExplosiveM = (_value splitString ",") apply {parseNumber _x};
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootItemsFood", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Food items (Civilian)", "Listed food items for Civilian food loot"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootItemsFood = _value splitString ",";
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootItemsFoodM", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Food items (Military)", "Listed food items for Military food loot"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootItemsFoodM = _value splitString ",";
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootItemsMedical", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Medical items (Civilian)", "Listed medical items for Civilian medical loot"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootItemsMedical = _value splitString ",";
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootItemsMedicalM", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Medical items (Military)", "Listed medical items for Military medical loot"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootItemsMedicalM = _value splitString ",";
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootItemsMisc", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Misc items (Civilian)", "Listed misc items for civilian loot"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootItemsMisc = _value splitString ",";
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootItemsMiscM", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Misc items (Military)", "Listed misc items for military loot"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootItemsMiscM = _value splitString ",";
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootWeapons", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Weapons (Civilian)", "Magazines are auto populated into arrays"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootWeapons = _value splitString ",";
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootWeaponsM", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Weapons (Military)", "Magazines are auto populated into arrays"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootWeaponsM = _value splitString ",";
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootWeaponattachments", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Weapon attachments (Civilian)", "Listed weapon attachments civilian"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootWeaponattachments = _value splitString ",";
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootWeaponattachmentsM", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Weapon attachments (Military)", "Listed weapon attachments military"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootWeaponattachmentsM = _value splitString ",";
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootUniforms", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Uniforms (Civilian)", "Listed uniforms civilian"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootUniforms = _value splitString ",";
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootUniformsM", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Uniforms (Military)", "Listed uniforms military"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootUniformsM = _value splitString ",";
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootVests", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Vests (Civilian)", "Listed vests civilian"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootVests = _value splitString ",";
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootVestsM", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Vests (Military)", "Listed vests military"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootVestsM = _value splitString ",";
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootHeadgear", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Headgear (Civilian)", "Listed headgear civilian"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootHeadgear = _value splitString ",";
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootHeadgearM", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Headgear (Military)", "Listed headgear military"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootHeadgearM = _value splitString ",";
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootPacks", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Backpacks (Civilian)", "Listed back packs civilian"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootPacks = _value splitString ",";
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootPacksM", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Backpacks (Military)", "Listed back packs military"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootPacksM = _value splitString ",";
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootGoggles", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Goggles / Facewear (Civilian)", "Listed goggles / facewear civilian"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootGoggles = _value splitString ",";
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootGogglesM", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Goggles / Facewear (Military)", "Listed goggles / facewear military"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootGogglesM = _value splitString ",";
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootGrenades", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Grenades", "Listed possible grenades"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootGrenades = _value splitString ",";
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootExplosives", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Explosives", "Listed possible explosives"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootExplosives = _value splitString ",";
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootItemsBlacklist", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Blacklisted items", "Input classnames of items you do not wish to spawn, or be available, this array removes input items from every loot list."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootItemsBlacklist = _value splitString ",";
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			[
			"MiseryLootBldgBlacklist", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"EDITBOX", // setting type
			["Blacklisted Buildings", "Input classnames of Buildings you don't want any loot to spawn in"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
			"", // data for this setting: [min, max, default, number of shown trailing decimals]
			1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
			{
			params ["_value"];
			MiseryLootBldgBlacklist = _value splitString ",";
			} // function that will be executed once on mission start and every time the setting is changed.
			] call CBA_fnc_addSetting;

			
			