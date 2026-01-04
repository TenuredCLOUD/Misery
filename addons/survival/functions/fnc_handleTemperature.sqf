#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Handles temperature related effects for survival loop
 *
 * Arguments:
 * 0: ThermalIndex Modifier <NUMBER>
 * 1: Wetness Modifier <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_survival_fnc_handleTemperature;
 *
 * Public: No
*/

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "_exposure", "_wetness"];

if !(EGVAR(temperature,enabled)) exitWith {};

if (EGVAR(temperature,breathFogAllowed)) then {
    if (isNil {player getVariable QCLASS(breathCondensationEffect)}) then {
        [] call EFUNC(temperature,breathFog);
    };
};

// Exposure
private _finalExposure = ((_exposure + EGVAR(temperature,exposureModifiers)) min 1) max -1;
EGVAR(temperature,exposureModifiers) = 0;
player setVariable [QEGVAR(temperature,exposure), _finalExposure];

// Thermal Index / caches players temperature
player setVariable [QEGVAR(temperature,thermalIndex), EGVAR(temperature,thermalIndexModifiers)];

// Wetness
private _finalWetness = ((_wetness + EGVAR(temperature,wetnessModifiers)) min 1) max -1;
EGVAR(temperature,wetnessModifiers) = 0;
player setVariable [QEGVAR(temperature,wetness), _finalWetness];
if (_wetness <= 0) then {
    player setVariable [QEGVAR(temperature,wetness), MACRO_PLAYER_DEFAULTS_LOW];
};
