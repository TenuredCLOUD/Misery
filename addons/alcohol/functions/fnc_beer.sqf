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

private _fatigue = player getVariable [QCLASS(energyDeficit), MACRO_PLAYER_DEFAULTS_LOW];

if (EGVAR(psychosis,enabled)) then {
    [-0.2] call EFUNC(psychosis,addModifier);
};

if (isMultiplayer) exitWith {};

player setVariable [QCLASS(energyDeficit), _fatigue + 5];

enableCamShake true;
addCamShake [1, 10, 2];
