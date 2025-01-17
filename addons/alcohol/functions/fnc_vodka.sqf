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

private _fatigue = player getVariable [QCLASS(energyDeficit), MACRO_PLAYER_DEFAULTS_LOW];
private _psychosis = player getVariable [EGVAR(psychosis,state), MACRO_PLAYER_DEFAULTS_LOW];

if (EGVAR(psychosis,enabled)) then {
    [-0.35] call EFUNC(psychosis,addModifier);
};

if (isMultiplayer) exitWith {};

player setVariable [QCLASS(energyDeficit), _fatigue + 15];

// ToDo: Add Radiation Reduction
