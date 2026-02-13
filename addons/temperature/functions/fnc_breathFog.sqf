#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * BreathFog cycle
 * For players (runs on clients only)
 * Breath speeds are from player's fatigue
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_temperature_fnc_breathFog;
 *
 * Public: No
*/

call FUNC(environment) params ["", "", "_breathFog"];

// Wait till _breathFog check is true, otherwise run check every 10 seconds
if (!_breathFog || !alive player) exitWith {
    [{
        call FUNC(breathFog);
    }, [], 10] call CBA_fnc_waitAndExecute;
};

private _fatigueValue = [getFatigue player, player getVariable ["ace_advanced_fatigue_aimFatigue", 0]] select (!isNil "ace_advanced_fatigue_enabled" && {ace_advanced_fatigue_enabled});

// Work delay calculation off fatigue value - 0 to 1 value, 12 seconds near 0 and 2 seconds near 1 (full fatigue)
GVAR(breathDelay) = linearConversion [0, 1, _fatigueValue, 12, 2];

private _fogLogic = "logic" createVehicleLocal (getPosWorld player);
private _fogEffect = "#particlesource" createVehicleLocal getPosWorld _fogLogic;
_fogEffect setParticleParams [["\A3\Data_F\ParticleEffects\Universal\Universal", 16, 12, 13,0],
"", "Billboard", 0.5, 0.5, [0,0,0],    [0, 0.2, -0.2], 1, 1.275,    1, 0.2, [0, 0.2, 0],
[[1, 1, 1, 0.0001], [1, 1, 1, 0.01], [1, 1, 1, 0]], [1000], 1, 0.04, "", "", _fogLogic];
_fogEffect setParticleRandom [2, [0, 0, 0], [0.25, 0.25, 0.25], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];

_fogEffect setDropInterval 0.05;
_fogLogic attachTo [player, [0, 0.15, 0.1], "neck", true];

[{
    {
        deleteVehicle _x;
    } forEach _this;
}, [_fogLogic, _fogEffect], 2] call CBA_fnc_waitAndExecute;

[QUOTE(COMPONENT_BEAUTIFIED), format ["BreathFog: Delay %1s | Fatigue %2%3 | Active: %4", round(_delay), round(_fatigueValue * 100), "%", true]] call EFUNC(common,debugMessage);

[{
    call FUNC(breathFog);
}, [], GVAR(breathDelay)] call CBA_fnc_waitAndExecute;
