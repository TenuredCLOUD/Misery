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

    call EFUNC(common,getPlayerVariables) params ["_hunger", "_thirst", "_energyDeficit", "_thermalIndex", "_exposure", "_wetness", "_radiation", "_infection", "_parasites", "_toxicity", "", "", "_ailments"];

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

    [_thermalIndex, _exposure, _wetness, _parasites, _infection] call EFUNC(temperature,core) params ["_exposureModifier", "_hungerModifier", "_thirstModifier", "_thermalIndexModifier", "_wetnessModifier"];
    [_exposureModifier, "exposure"] call EFUNC(common,addStatusModifier);
    [-_hungerModifier, "hunger"] call EFUNC(common,addStatusModifier);
    [-_thirstModifier, "thirst"] call EFUNC(common,addStatusModifier);

    [_ailments, _parasites, _toxicity, _infection, _isMultiplayer] call FUNC(handleAilments);
    [_decrementValue, _energyDeficit, _isMultiplayer] call FUNC(handleEnergy);
    [_decrementValue, _parasites, _hunger] call FUNC(handleHunger);
    [_radiation] call FUNC(handleRadiation);
    [_exposure, _thermalIndexModifier, _wetnessModifier] call FUNC(handleTemperature);
    [_thirst] call FUNC(handleThirst);

}, 30] call CBA_fnc_addPerFrameHandler;

