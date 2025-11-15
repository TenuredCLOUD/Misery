#include "script_component.hpp"

if (!hasInterface) exitWith {};

// Auto swap logic for basic item conversion to TSP melee weapons
player addEventHandler ["Take", {
	params ["_unit", "_container", "_item"];
    // Knives & Axes
    private _toolGear = MACRO_TSP_COMPAT findIf { _item isEqualTo (_x select 0) };
    if (_toolGear isNotEqualTo -1) then {
        private _oldToolItem = _item;
        private _newToolItem = (MACRO_TSP_COMPAT select _toolGear) select 1;
        if ([_unit, _oldToolItem] call CBA_fnc_removeItem) then {
            [_unit, _newToolItem, true] call CBA_fnc_addItem;
        };
    };
}];

player addEventHandler ["InventoryOpened", {
    params ["_unit", "_primaryContainer", "_secondaryContainer"];
    // Knives & Axes
    {
        private _oldToolItem = _x select 0;
        private _newToolItem = _x select 1;

        if ([[_oldToolItem]] call EFUNC(common,hasItem)) then {
            [_unit, _oldToolItem] call CBA_fnc_removeItem;
            [_unit, _newToolItem, true] call CBA_fnc_addItem;
        };
    } forEach MACRO_TSP_COMPAT;
}];
