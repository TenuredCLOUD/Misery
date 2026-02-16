#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Cold pack usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_temperature_fnc_coldPack;
 *
*/

if (GVAR(thermalBagActive) || GVAR(thermalPackHeatActive) || GVAR(thermalPackColdActive)) exitWith {};

GVAR(thermalPackColdActive) = true;

[player, QCLASS(coldpack)] call CBA_fnc_removeItem;

private _currentTimer = 0;

[{
    params ["_args", "_handle"];
    _args params ["_currentTimer"];

    private _isSwimming = (animationState player in [MACRO_ANIMATION_SWIMMING]);

    if (isGamePaused) exitWith {};

    if (isNull objectParent player && surfaceIsWater getPosWorld player || _isSwimming) exitWith {
        GVAR(thermalPackColdActive) = false;
        _handle call CBA_fnc_removePerFrameHandler;
    };

    if (!alive player) exitWith {
        GVAR(thermalPackColdActive) = false;
        _handle call CBA_fnc_removePerFrameHandler;
    };

    if (_currentTimer >= 120) exitWith {
        GVAR(thermalPackColdActive) = false;
        _handle call CBA_fnc_removePerFrameHandler;
    };

    _currentTimer = _currentTimer + 1;
    _args set [0, _currentTimer];
}, 1, [_currentTimer]] call CBA_fnc_addPerFrameHandler;
