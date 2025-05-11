#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Inventory GUI menu action check
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: BOOL
 *
 * Example:
 * [] call misery_furniture_fnc_condition
 *
*/

private _inventory = player getVariable [QGVAR(furnitureInventory), []];

if (_inventory isNotEqualTo "[]" && isNull objectParent player) exitWith {
    true
};

false
