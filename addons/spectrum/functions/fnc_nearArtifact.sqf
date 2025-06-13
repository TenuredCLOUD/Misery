#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Checks if player is near holder that has an artifact
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Distance <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_spectrum_fnc_audioLogic
*/

params ["_object", "_distance"];

private _holders = nearestObjects [getPos _object, ["WeaponHolderSimulated", "GroundWeaponHolder", "Default"], _distance];

private _result = false;

{
    private _items = itemCargo _x;
    {
    if (_x in _items) then {
        _result = true;
    };
    } forEach [MACRO_ARTIFACTS];
} forEach _holders;

_result
