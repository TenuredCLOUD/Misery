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
    private _decrementValue = 0.0001;

    private _weightDeficiency = 0;

    if (EGVAR(weight,deficiency)) then {
        _weightDeficiency = (call EFUNC(weight,calculated)) / 500; // Max ~0.001 at 50kg
    };

    // If player is not on foot, reduction stays at a low value.
    if (isNull objectParent player) then {
        private _speedPenalty = abs (speed player) / 100000;
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
    call FUNC(handleThirst);
    call FUNC(decayHealth) params ["_decay"];
    [_decay] call FUNC(visualizeDecay);
    call FUNC(ailmentDecay);

}, 30] call CBA_fnc_addPerFrameHandler;

