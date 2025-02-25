#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Handles temperature related things for survival loop.
 *
 * Arguments:
 * 0: Exposure <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_survival_fnc_handleTemperature;
 *
 * Public: No
*/

params ["_exposure"];

if !(EGVAR(temperature,enabled)) exitWith {};

[player] call EFUNC(temperature,warmup);
[player] call EFUNC(temperature,overtemp);
[player] call EFUNC(temperature,sick);
[player] call EFUNC(temperature,cold);
[player] call EFUNC(temperature,water);
[player] call EFUNC(temperature,effectiveTemperature);

if (EGVAR(temperature,breathFogAllowed)) then {
    if (isNil {player getVariable QCLASS(breathCondensationEffect)}) then {
        [] call EFUNC(temperature,breathFog);
    };
};

private _finalExposure = round _exposure;
player setVariable [QGVAR(exposure), _finalExposure];

if ((_exposure <= -1 || _exposure >= 1) || (_playerTemperature <= -30 || _playerTemperature >= 55)) then {
    if ((random 100) > 90) then {
        [player, 100] call EFUNC(common,specialDamage);
    };
};

