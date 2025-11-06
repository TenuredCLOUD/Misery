#include "script_component.hpp"

if !(hasInterface) exitWith {};

if (GVAR(enabled)) then {
    [] call FUNC(infect);
};

["CAManBase", "hit", {_this call FUNC(infect)}, true, [], true] call CBA_fnc_addClassEventHandler;

if (GVAR(specimensEnabled)) then {
    [
        "rvg_zed_skin_menu",
        "Collect specimen (skin)",
        {[[MACRO_KNIVES]] call EFUNC(common,hasItem) && ([player, ["zombie"], 2] call EFUNC(common,nearCorpse)) select 0},
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            call FUNC(skinCorpse);
        },
        "",
        QPATHTOEF(icons,data\zedhand_ca.paa),
        ""
    ] call EFUNC(actions,addAction);

    [
        "rvg_zed_saw_menu",
        "Collect specimen (saw)",
        {[[QCLASS(boneSaw)]] call EFUNC(common,hasItem) && ([player, ["zombie"], 2] call EFUNC(common,nearCorpse)) select 0},
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            call FUNC(sawCorpse);
        },
        "",
        QPATHTOEF(icons,data\zedhand_ca.paa),
        ""
    ] call EFUNC(actions,addAction);
};

// Auto swap logic for Rvg items to prevent conflicts
player addEventHandler ["Take", {
	params ["_unit", "_container", "_item"];

    // Tents & sleeping bags
    private _campingGear = MACRO_RVG_CAMPING findIf { _item isEqualTo (_x select 0) };
    // Only push swap logic if furniture framework is enabled
    if (_campingGear isNotEqualTo -1 && EGVAR(furniture,enabled)) then {
        private _oldCampItem = _item;
        private _campKitToAdd = (MACRO_RVG_CAMPING select _campingGear) select 1;
        [_unit, _oldCampItem] call CBA_fnc_removeItem;
        [_campKitToAdd] call EFUNC(furniture,addToInventory);
    };

    // Tools
    private _toolGear = MACRO_RVG_TOOLS findIf { _item isEqualTo (_x select 0) };
    if (_toolGear isNotEqualTo -1) then {
        private _oldToolItem = _item;
        private _newToolItem = (MACRO_RVG_TOOLS select _toolGear) select 1;
        if ([_unit, _oldToolItem] call CBA_fnc_removeItem) then {
            [_unit, _newToolItem, true] call CBA_fnc_addItem;
        };
    };

    // Medication
    private _medGear = MACRO_RVG_MEDS findIf { _item isEqualTo (_x select 0) };
    if (_medGear isNotEqualTo -1) then {
        private _oldMedItem = _item;
        private _newMedItem = (MACRO_RVG_MEDS select _medGear) select 1;
        if ([_unit, _oldMedItem] call CBA_fnc_removeItem) then {
            [_unit, _newMedItem, true] call CBA_fnc_addItem;
        };
    };

    // Food & Drink
    private _satietyGear = MACRO_RVG_FOOD findIf { _item isEqualTo (_x select 0) };
    if (_satietyGear isNotEqualTo -1) then {
        private _oldFoodItem = _item;
        private _newFoodItem = (MACRO_RVG_FOOD select _satietyGear) select 1;
        if ([_unit, _oldFoodItem] call CBA_fnc_removeItem) then {
            [_unit, _newFoodItem, true] call CBA_fnc_addItem;
        };
    };

    // Fuel
    private _fuelGear = MACRO_RVG_FUEL findIf { _item isEqualTo (_x select 0) };
    if (_fuelGear isNotEqualTo -1) then {
        private _oldFuelItem = _item;
        private _newFuelItem = (MACRO_RVG_FUEL select _fuelGear) select 1;
        if ([_unit, _oldFuelItem] call CBA_fnc_removeItem) then {
            [_unit, _newFuelItem, true] call CBA_fnc_addItem;
        };
    };

    // Currency
    if (_item isEqualTo "rvg_money") then {
        [_unit, _item] call CBA_fnc_removeItem;
        [random 500] call EFUNC(currency,modifyMoney);
    };
}];

// Edge cases for someone adding items manually to the player
player addEventHandler ["InventoryOpened", {
    params ["_unit", "_primaryContainer", "_secondaryContainer"];

    // Tents & sleeping bags
    {
        private _oldCampItem = _x select 0;
        private _newCampItem = _x select 1;

        if ([[_oldCampItem]] call EFUNC(common,hasItem) && EGVAR(furniture,enabled)) then {
            [_unit, _oldCampItem] call CBA_fnc_removeItem;
            [_newCampItem] call EFUNC(furniture,addToInventory);
        };
    } forEach MACRO_RVG_CAMPING;


    // Tool items
    {
        private _oldToolItem = _x select 0;
        private _newToolItem = _x select 1;

        if ([[_oldToolItem]] call EFUNC(common,hasItem)) then {
            [_unit, _oldToolItem] call CBA_fnc_removeItem;
            [_unit, _newToolItem, true] call CBA_fnc_addItem;
        };
    } forEach MACRO_RVG_TOOLS;

    // Medication items
    {
        private _oldMedItem = _x select 0;
        private _newMedItem = _x select 1;

        if ([[_oldMedItem]] call EFUNC(common,hasItem)) then {
            [_unit, _oldMedItem] call CBA_fnc_removeItem;
            [_unit, _newMedItem, true] call CBA_fnc_addItem;
        };
    } forEach MACRO_RVG_MEDS;

    // Food & Drink
    {
        private _oldFoodItem = _x select 0;
        private _newFoodItem = _x select 1;

        if ([[_oldFoodItem]] call EFUNC(common,hasItem)) then {
            [_unit, _oldFoodItem] call CBA_fnc_removeItem;
            [_unit, _newFoodItem, true] call CBA_fnc_addItem;
        };
    } forEach MACRO_RVG_FOOD;

    // Fuel
    {
        private _oldFuelItem = _x select 0;
        private _newFuelItem = _x select 1;

        if ([[_oldFuelItem]] call EFUNC(common,hasItem)) then {
            [_unit, _oldFuelItem] call CBA_fnc_removeItem;
            [_unit, _newFuelItem, true] call CBA_fnc_addItem;
        };
    } forEach MACRO_RVG_FUEL;

    // Currency
    if ([["rvg_money"]] call EFUNC(common,hasItem)) then {
        [_unit, "rvg_money"] call CBA_fnc_removeItem;
        [random 500] call EFUNC(currency,modifyMoney);
    };
}];
