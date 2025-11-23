#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Vodka usage
 * Simple function that changes psychosis values from alcohol consumption, and increases fatigue (tiredness)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_alcohol_fnc_vodka
*/

if (!hasInterface) exitWith {};

if (EGVAR(psychosis,enabled)) then {
    [-0.02, "psychosis"] call EFUNC(common,addStatusModifier);
};

[-0.015, "radiation"] call EFUNC(common,addStatusModifier);

if (isMultiplayer) exitWith {};

[0.015, "energy"] call EFUNC(common,addStatusModifier);
