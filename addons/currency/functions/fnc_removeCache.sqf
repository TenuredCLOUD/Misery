#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Remove Money cache
 * Processes removal of current cache
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_currency_fnc_removeCache;
 *
*/

private _cache = ACE_player getVariable [QGVAR(currentCache), objNull];

private _cacheFunds = _cache getVariable [QGVAR(cacheFunds), 0];

if (_cacheFunds > 0) exitWith {
    [QEGVAR(common,tileText), "This cache still has money..."] call CBA_fnc_localEvent;
};

private _removedCache = _cache;

// Remove cache object
deleteVehicle _removedCache;
[ACE_player, QCLASS(money_case), true] call CBA_fnc_addItem;

closeDialog 2;
