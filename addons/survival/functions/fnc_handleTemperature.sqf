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

params ["_thermalIndexModifier", "_wetnessModifier"];

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "_exposure"];

if !(EGVAR(temperature,enabled)) exitWith {};

if (EGVAR(temperature,breathFogAllowed)) then {
    if (isNil {player getVariable QCLASS(breathCondensationEffect)}) then {
        [] call EFUNC(temperature,breathFog);
    };
};

private _finalExposure = ((_exposure + EGVAR(temperature,exposureModifiers)) min 1) max -1;
EGVAR(temperature,exposureModifiers) = 0;
player setVariable [QEGVAR(temperature,exposure), _finalExposure];

player setVariable [QEGVAR(temperature,thermalIndex), _thermalIndexModifier];
player setVariable [QEGVAR(temperature,wetness), _wetnessModifier];
