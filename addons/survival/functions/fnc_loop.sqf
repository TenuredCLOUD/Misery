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

    if (!alive ACE_player) exitWith {};

    if (isGamePaused) exitWith {};

    // Automatically scale metabolic coef to ACE advanced fatigue metabolic cost factor if enabled
    if (ACEGVAR(advanced_fatigue,enabled)) then {
        private _metabolicCosts = call FUNC(getMetabolicCosts);
        GVAR(metabolicCoef) = _metabolicCosts;
    };

    private _isMultiplayer = isMultiplayer;
    private _decrementValue = 3.333e-6 * GVAR(metabolicCoef);

    private _gearMass = 0 max (((ACE_player getVariable [QACEGVAR(movement,totalLoad), loadAbs ACE_player]) / 22.046 - 3.5) * 1);

    private _weightFactor = linearConversion [0, 40, _gearMass, 0, 1, true];

    private _weightDeficiency = linearConversion [0, 1, _weightFactor, 0, 0.000066 * GVAR(metabolicCoef), true];

    // If player is not on foot, reduction stays at a low value.
    if (isNull objectParent ACE_player) then {
        private _currentSpeed = abs (speed ACE_player);

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

