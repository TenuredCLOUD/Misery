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
