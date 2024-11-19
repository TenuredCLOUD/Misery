            [
            QGVAR(enabled), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "CHECKBOX", // setting type
            ["Enable loot", "Enable or disable Misery loot framework"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            false, // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(debug), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "CHECKBOX", // setting type
            ["Enable loot debugging", "Enable or disable Misery loot debugging"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            false, // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(chance), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "SLIDER", // setting type
            ["Chance building", "Chance a building has loot (military buildings automatically have a higher chance based on this value)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            [1, 100, 25, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(itemsFood), 
            "EDITBOX",
            ["Food items (Civilian)", "Listed food items for Civilian food loot"],
            ["Misery", "Loot"], 
            "[]", 
            1,
            {
            params ["_value"];
            GVAR(itemsFood) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(itemsFoodM), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Food items (Military)", "Listed food items for Military food loot"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "[]", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            GVAR(itemsFoodM) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(itemsMedical), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Medical items (Civilian)", "Listed medical items for Civilian medical loot"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "[]", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            GVAR(itemsMedical) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(itemsMedicalM), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Medical items (Military)", "Listed medical items for Military medical loot"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "[]", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            GVAR(itemsMedicalM) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(itemsMisc), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Misc items (Civilian)", "Listed misc items for civilian loot"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "[]", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            GVAR(itemsMisc) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(itemsMiscM), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Misc items (Military)", "Listed misc items for military loot"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "[]", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            GVAR(itemsMiscM) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(weapons), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Weapons (Civilian)", "Magazines are auto populated into arrays"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "[]", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            GVAR(weapons) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(weaponsM), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Weapons (Military)", "Magazines are auto populated into arrays"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "[]", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            GVAR(weaponsM) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(uniforms), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Uniforms (Civilian)", "Listed uniforms civilian"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "[]", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            GVAR(uniforms) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(uniformsM), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Uniforms (Military)", "Listed uniforms military"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "[]", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            GVAR(uniformsM) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(uniformItemChance), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "SLIDER", // setting type
            ["Chance item uniform", "Chance a uniform loot item contains loot"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            [1, 100, 25, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(vests), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Vests (Civilian)", "Listed vests civilian"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "[]", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            GVAR(vests) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(vestsM), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Vests (Military)", "Listed vests military"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "[]", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            GVAR(vestsM) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(vestsItemChance), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "SLIDER", // setting type
            ["Chance item vest", "Chance a vest loot item contains loot"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            [1, 100, 25, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(headgear), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Headgear (Civilian)", "Listed headgear civilian"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "[]", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            GVAR(headgear) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(headgearM), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Headgear (Military)", "Listed headgear military"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "[]", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            GVAR(headgearM) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(packs), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Backpacks (Civilian)", "Listed back packs civilian"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "[]", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            GVAR(packs) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(packsM), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Backpacks (Military)", "Listed back packs military"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "[]", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            GVAR(packsM) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(backpacksItemChance), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "SLIDER", // setting type
            ["Chance item backpack", "Chance a backpack loot item contains loot"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            [1, 100, 25, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
            1 // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            ] call CBA_fnc_addSetting;

            [
            QGVAR(goggles), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Goggles / Facewear (Civilian)", "Listed goggles / facewear civilian"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "[]", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            GVAR(goggles) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(gogglesM), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Goggles / Facewear (Military)", "Listed goggles / facewear military"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "[]", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            GVAR(gogglesM) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(grenades), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Grenades", "Listed possible grenades"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "[]", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            GVAR(grenades) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(explosives), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Explosives", "Listed possible explosives"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "[]", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            GVAR(explosives) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(special), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Special equipment", "Night vision, maps, radio, GPS, etc..."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "[]", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            GVAR(special) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(itemsBlacklist), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Blacklisted items", "Input classnames of items you do not wish to spawn, or be available, this array removes input items from every loot list."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "[]", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            GVAR(itemsBlacklist) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(buildingBlacklist), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Blacklisted Buildings", "Input classnames of Buildings you don't want any loot to spawn in"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "[]", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            GVAR(buildingBlacklist) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;
