#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Disables both vanilla and ACE fuel systems
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fnc_nofuel_removeFuelSources
*/

private _axis = worldSize / 2;
private _center = [_axis, _axis, 0];
private _allObjects = _center nearObjects ["All", worldSize];

{
    private _type = toLower typeOf _x;
    if ("fuel" in _type || "tank" in _type || "feed" in _type) then {
        _x setFuelCargo -1;
        _x setVariable ["ace_refuel_currentFuelCargo", 0, true];
    };
} forEach _allObjects;
