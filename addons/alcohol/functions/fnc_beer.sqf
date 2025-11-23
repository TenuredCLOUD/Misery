#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Beer usage
 * Simple function that changes psychosis values from alcohol consumption, and increases fatigue (tiredness)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_alcohol_fnc_beer
*/

if (!hasInterface) exitWith {};

if (EGVAR(psychosis,enabled)) then {
    [-0.01, "psychosis"] call EFUNC(common,addStatusModifier);
};

[-0.01, "radiation"] call EFUNC(common,addStatusModifier);

if (isMultiplayer) exitWith {};

[0.05, "energy"] call EFUNC(common,addStatusModifier);
