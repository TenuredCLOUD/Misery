#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Main survival loop
 * Client survival loop runs after Client settings are defined
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_survival_fnc_loop;
 *
 * Public: No
*/

[{
    params ["_args", "_handle"];

    if (!alive player) exitWith {};

    if (isGamePaused) exitWith {};

    private _isMultiplayer = isMultiplayer;
    private _decrementValue = 3.333e-6 * GVAR(metabolicCoef);

    private _weightDeficiency = 0;

    if (EGVAR(weight,deficiency)) then {
        private _weightFactor = call EFUNC(weight,calculated);

        _weightDeficiency = linearConversion [0, 1, _weightFactor, 0, 0.000066 * GVAR(metabolicCoef), true];
    };

    // If player is not on foot, reduction stays at a low value.
    if (isNull objectParent player) then {
        private _currentSpeed = abs (speed player);

        private _speedPenalty = linearConversion [0, 30, _currentSpeed, 0, 0.00001 * GVAR(metabolicCoef), true];

        _decrementValue = _decrementValue + _speedPenalty + _weightDeficiency;
    };

    private _randomNutrientSelection = selectRandom ["hunger", "thirst"];
    [-_decrementValue, _randomNutrientSelection] call EFUNC(common,addStatusModifier);

    // Temperature
    call EFUNC(temperature,core);
    call FUNC(handleTemperature);

    // Ailments & Needs
    call FUNC(handleAilments);
    [_decrementValue, _isMultiplayer] call FUNC(handleEnergy);
    [_decrementValue] call FUNC(handleHunger);
    call FUNC(handleRadiation);
    [_decrementValue] call FUNC(handleThirst);
    call FUNC(decayHealth) params ["_decay"];
    [_decay] call FUNC(visualizeDecay);
    call FUNC(ailmentDecay);
    call FUNC(feedback);

}, 1] call CBA_fnc_addPerFrameHandler;

