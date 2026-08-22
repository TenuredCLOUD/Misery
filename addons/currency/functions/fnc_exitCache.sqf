#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Cache UI exit
 * Resets variables
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_currency_fnc_exitCache;
 *
*/

private _cache = ACE_player getVariable [QGVAR(currentCache), objNull];

if (!isNull _cache) then {
    ACE_player setVariable [QGVAR(currentCache), nil];
};

// If GRAD persistence is loaded and SP session, immediately save on exit of cache to prevent infinite money exploit in SP
if !(isClass (missionConfigFile >> "CfgGradPersistence")) exitWith {};

if !(isMultiplayer) then {
    [1] call EFUNC(persistence,handleGrad);
};
