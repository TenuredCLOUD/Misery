            [
            "MiseryLootEnabled", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "CHECKBOX", // setting type
            ["Enable loot", "Enable or disable Misery loot framework"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            false, // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            if (MiseryLootEnabled) then {[FUNC(loop)] remoteExec ["call", 2]};
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;

            [
            "MiseryLootDebug", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "CHECKBOX", // setting type
            ["Enable loot debugging", "Enable or disable Misery loot debugging"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            false, // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            } // function that will be executed once on mission start and every time the setting is changed.
            ] call CBA_fnc_addSetting;

            [
            "MiseryLootChance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
            "EDITBOX", // setting type
            ["Chance building", "Chance a building has loot (military buildings automatically have a higher chance based on this value)"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
            ["Misery","Loot"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
            "20", // data for this setting: [min, max, default, number of shown trailing decimals]
            1, // 1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) ARRAY
            {
            params ["_value"];
            MiseryLootChance = parseNumber _value;
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
