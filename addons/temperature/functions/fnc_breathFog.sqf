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

[{
    params ["_args", "_handle"];
    _args params ["_lastActivation", "_effectActive"];

    call FUNC(environment) params ["", "", "_breathFog"];

    if (!_breathFog) exitWith {}; // Wait till _breathFog check is true

    private _delay = linearConversion [0, 1, getFatigue player, 4, 12, true];

    if (CBA_missionTime - _lastActivation >= _delay) then {
        _fogLogic = "logic" createVehicleLocal (getPos player);
        _fogEffect = "#particlesource" createVehicleLocal getPos _fogLogic;
        _fogEffect setParticleParams [["\A3\Data_F\ParticleEffects\Universal\Universal", 16, 12, 13,0],
        "", "Billboard", 0.5, 0.5, [0,0,0],    [0, 0.2, -0.2], 1, 1.275,    1, 0.2, [0, 0.2, 0],
        [[1, 1, 1, 0.0001], [1, 1, 1, 0.01], [1, 1, 1, 0]], [1000], 1, 0.04, "", "", _fogLogic];
        _fogEffect setParticleRandom [2, [0, 0, 0], [0.25, 0.25, 0.25], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];

        _fogEffect setDropInterval 0.05;
        _fogLogic attachTo [player, [0, 0.15, 0.1], "neck", true];

        [{
            deleteVehicle _this;
            player setVariable [QCLASS(breathCondensation), false];
        }, [_fogLogic], 2] call CBA_fnc_waitAndExecute;

        _args set [0, CBA_missionTime];
        _args set [1, true];
        player setVariable [QCLASS(breathCondensation), true];
    };

[QUOTE(COMPONENT_BEAUTIFIED), format ["BreathFog: Delay %1s | Fatigue %2%3 | Active: %4", round(_delay), round(getFatigue player * 100), "%", _effectActive]] call EFUNC(common,debugMessage);
}, 1, [CBA_missionTime - 5, false]] call CBA_fnc_addPerFrameHandler;


