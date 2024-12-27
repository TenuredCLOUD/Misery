            [
            QGVAR(enabled), 
            "CHECKBOX", 
            ["Enable loot", "Enable or disable Misery loot framework"], 
            ["Misery","Loot"], 
            false, 
            1 
            ] call CBA_fnc_addSetting;

            [
            QGVAR(debug), 
            "CHECKBOX", 
            ["Enable loot debugging", "Enable or disable Misery loot debugging"], 
            ["Misery","Loot"], 
            false, 
            1 
            ] call CBA_fnc_addSetting;

            [
            QGVAR(chance), 
            "SLIDER", 
            ["Chance building", "Chance a building has loot (military buildings automatically have a higher chance based on this value)"], 
            ["Misery","Loot"], 
            [1, 100, 25, 0], 
            1 
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
            QGVAR(itemsFoodM), 
            "EDITBOX", 
            ["Food items (Military)", "Listed food items for Military food loot"], 
            ["Misery","Loot"], 
            "[]", 
            1, 
            {
            params ["_value"];
            GVAR(itemsFoodM) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(itemsMedical), 
            "EDITBOX", 
            ["Medical items (Civilian)", "Listed medical items for Civilian medical loot"], 
            ["Misery","Loot"], 
            "[]", 
            1, 
            {
            params ["_value"];
            GVAR(itemsMedical) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(itemsMedicalM), 
            "EDITBOX", 
            ["Medical items (Military)", "Listed medical items for Military medical loot"], 
            ["Misery","Loot"], 
            "[]", 
            1, 
            {
            params ["_value"];
            GVAR(itemsMedicalM) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(itemsMisc), 
            "EDITBOX", 
            ["Misc items (Civilian)", "Listed misc items for civilian loot"], 
            ["Misery","Loot"], 
            "[]", 
            1, 
            {
            params ["_value"];
            GVAR(itemsMisc) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(itemsMiscM), 
            "EDITBOX", 
            ["Misc items (Military)", "Listed misc items for military loot"], 
            ["Misery","Loot"], 
            "[]", 
            1, 
            {
            params ["_value"];
            GVAR(itemsMiscM) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(weapons), 
            "EDITBOX", 
            ["Weapons (Civilian)", "Magazines are auto populated into arrays"], 
            ["Misery","Loot"], 
            "[]", 
            1, 
            {
            params ["_value"];
            GVAR(weapons) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(weaponsM), 
            "EDITBOX", 
            ["Weapons (Military)", "Magazines are auto populated into arrays"], 
            ["Misery","Loot"], 
            "[]", 
            1, 
            {
            params ["_value"];
            GVAR(weaponsM) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(uniforms), 
            "EDITBOX", 
            ["Uniforms (Civilian)", "Listed uniforms civilian"], 
            ["Misery","Loot"], 
            "[]", 
            1, 
            {
            params ["_value"];
            GVAR(uniforms) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(uniformsM), 
            "EDITBOX", 
            ["Uniforms (Military)", "Listed uniforms military"], 
            ["Misery","Loot"], 
            "[]", 
            1, 
            {
            params ["_value"];
            GVAR(uniformsM) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(uniformItemChance), 
            "SLIDER", 
            ["Chance item uniform", "Chance a uniform loot item contains loot"], 
            ["Misery","Loot"], 
            [1, 100, 25, 0], 
            1 
            ] call CBA_fnc_addSetting;

            [
            QGVAR(vests), 
            "EDITBOX", 
            ["Vests (Civilian)", "Listed vests civilian"], 
            ["Misery","Loot"], 
            "[]", 
            1, 
            {
            params ["_value"];
            GVAR(vests) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(vestsM), 
            "EDITBOX", 
            ["Vests (Military)", "Listed vests military"], 
            ["Misery","Loot"], 
            "[]", 
            1, 
            {
            params ["_value"];
            GVAR(vestsM) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(vestsItemChance), 
            "SLIDER", 
            ["Chance item vest", "Chance a vest loot item contains loot"], 
            ["Misery","Loot"], 
            [1, 100, 25, 0], 
            1 
            ] call CBA_fnc_addSetting;

            [
            QGVAR(headgear), 
            "EDITBOX", 
            ["Headgear (Civilian)", "Listed headgear civilian"], 
            ["Misery","Loot"], 
            "[]", 
            1, 
            {
            params ["_value"];
            GVAR(headgear) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(headgearM), 
            "EDITBOX", 
            ["Headgear (Military)", "Listed headgear military"], 
            ["Misery","Loot"], 
            "[]", 
            1, 
            {
            params ["_value"];
            GVAR(headgearM) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(packs), 
            "EDITBOX", 
            ["Backpacks (Civilian)", "Listed back packs civilian"], 
            ["Misery","Loot"], 
            "[]", 
            1, 
            {
            params ["_value"];
            GVAR(packs) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(packsM), 
            "EDITBOX", 
            ["Backpacks (Military)", "Listed back packs military"], 
            ["Misery","Loot"], 
            "[]", 
            1, 
            {
            params ["_value"];
            GVAR(packsM) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(backpacksItemChance), 
            "SLIDER", 
            ["Chance item backpack", "Chance a backpack loot item contains loot"], 
            ["Misery","Loot"], 
            [1, 100, 25, 0], 
            1 
            ] call CBA_fnc_addSetting;

            [
            QGVAR(goggles), 
            "EDITBOX", 
            ["Goggles / Facewear (Civilian)", "Listed goggles / facewear civilian"], 
            ["Misery","Loot"], 
            "[]", 
            1, 
            {
            params ["_value"];
            GVAR(goggles) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(gogglesM), 
            "EDITBOX", 
            ["Goggles / Facewear (Military)", "Listed goggles / facewear military"], 
            ["Misery","Loot"], 
            "[]", 
            1, 
            {
            params ["_value"];
            GVAR(gogglesM) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(grenades), 
            "EDITBOX", 
            ["Grenades", "Listed possible grenades"], 
            ["Misery","Loot"], 
            "[]", 
            1, 
            {
            params ["_value"];
            GVAR(grenades) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(explosives), 
            "EDITBOX", 
            ["Explosives", "Listed possible explosives"], 
            ["Misery","Loot"], 
            "[]", 
            1, 
            {
            params ["_value"];
            GVAR(explosives) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(special), 
            "EDITBOX", 
            ["Special equipment", "Night vision, maps, radio, GPS, etc..."], 
            ["Misery","Loot"], 
            "[]", 
            1, 
            {
            params ["_value"];
            GVAR(special) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(itemsBlacklist), 
            "EDITBOX", 
            ["Blacklisted items", "Input classnames of items you do not wish to spawn, or be available, this array removes input items from every loot list."], 
            ["Misery","Loot"], 
            "[]", 
            1, 
            {
            params ["_value"];
            GVAR(itemsBlacklist) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;

            [
            QGVAR(buildingBlacklist), 
            "EDITBOX", 
            ["Blacklisted Buildings", "Input classnames of Buildings you don't want any loot to spawn in"], 
            ["Misery","Loot"], 
            "[]", 
            1, 
            {
            params ["_value"];
            GVAR(buildingBlacklist) = parseSimpleArray _value;    
            }
            ] call CBA_fnc_addSetting;
