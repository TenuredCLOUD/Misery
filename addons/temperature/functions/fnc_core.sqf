#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Core temperature mechanics
 *
 * Arguments:
 * 0: Thermal Index <NUMBER>
 * 1: Exposure <NUMBER>
 * 2: Parasites <NUMBER>
 * 3: Infection <NUMBER>
 *
 * Return Value:
 * 0: Array of Variables <ARRAY>
 *     0: Exposure Modifier <NUMBER>
 *     1: Hunger Modifier <NUMBER>
 *     2: Thirst Modifier <NUMBER>
 *     3: ThermalIndex Modifier <NUMBER>
 *     4: Wetness Modifier <NUMBER>
 *
 *
 * Example:
 * [_thermalIndex, _exposure, _wetness, _parasites, _infection] call misery_temperature_fnc_core;
 *
 * Public: No
*/

params ["_thermalIndex", "_exposure", "_wetness", "_parasites", "_infection"];

if !(GVAR(enabled)) exitWith {[0, 0, 0, 0, 0]};

// Get environmental data
call FUNC(environment) params ["_airTemp", "_seaTemp"];

// Calculate base temperature impact (-1 to 1)
private _tempDelta = _thermalIndex - TEMP_NEUTRAL;
private _tempImpact = switch (true) do {
    case (_thermalIndex < TEMP_NEUTRAL): { (_tempDelta / (TEMP_NEUTRAL - TEMP_MIN)) }; // -1 to 0
    case (_thermalIndex > TEMP_NEUTRAL): { (_tempDelta / (TEMP_MAX - TEMP_NEUTRAL)) }; // 0 to 1
    default { 0 };
};

// Adjust for clothing warmth, reduced by wetness
private _clothesWarmth = (player call FUNC(clothing)) select 0;
_clothesWarmth = _clothesWarmth * (1 - _wetness * 0.5); // Up to 50% loss when soaked
private _effectiveTempImpact = _tempImpact - (_clothesWarmth / 50); // Max warmth negates impact
_effectiveTempImpact = (_effectiveTempImpact max -1) min 1;

// Base modifiers
private _exposureModifier = EXPOSURE_RATE * _effectiveTempImpact; // -0.033 to 0.033
private _hungerModifier = HUNGER_RATE;
private _thirstModifier = THIRST_RATE;
private _thermalIndexModifier = _airTemp + (_clothesWarmth / 5); // Very slow drift
private _wetnessModifier = 0;

// Environment
switch (true) do {
    case ([player] call EFUNC(common,nearFire)): {
        if (_thermalIndex < TEMP_NEUTRAL) then {
            _exposureModifier = NEUTRAL_RATE; // Warm up
            _thermalIndexModifier = _thermalIndex + 1 min TEMP_NEUTRAL; // Slow warming
            _wetnessModifier = -0.025; // Dry faster near fire
        };
        if (_thermalIndex > TEMP_NEUTRAL + 5) then {
            _exposureModifier = _exposureModifier + (EXPOSURE_RATE * 0.15);
        };
    };
    case (insideBuilding player isEqualTo 1): {
        _exposureModifier = -_exposure * NEUTRAL_RATE; // Trend to 0
        _thermalIndexModifier = _thermalIndex + ((TEMP_NEUTRAL - _thermalIndex) * 0.1); // Near neutral
        _wetnessModifier = -0.01; // Dry indoors
    };
    case !(isNull objectParent player): {
        _exposureModifier = -_exposure * NEUTRAL_RATE; // Trend to 0
        _thermalIndexModifier = _thermalIndex + ((TEMP_NEUTRAL - _thermalIndex) * 0.08); // Less neutral
        _wetnessModifier = -0.01; // Dry in vehicle
    };
    default {
        // Exposed to elements
        _exposureModifier = _exposureModifier + (EXPOSURE_RATE * 0.1);
        if (rain > 0) then {
            _wetnessModifier = rain * 0.03;
        };
    };
};

// Water
private _hasWetsuit = ((toLower uniform player) find "wetsuit") > -1;
if (underwater player) then {
    if (!_hasWetsuit && _seaTemp < TEMP_NEUTRAL) then {
        private _waterImpact = ((TEMP_NEUTRAL - _seaTemp) / (TEMP_NEUTRAL - TEMP_MIN));
        _exposureModifier = _exposureModifier - (EXPOSURE_RATE * 1.1 * _waterImpact);
    };
    _wetnessModifier = 0.25;
};

// Wetness
if (_wetness > 0) then {
    private _wetImpact = _wetness * WETNESS_RATE;
    if (_thermalIndex < TEMP_NEUTRAL) then {
        _exposureModifier = _exposureModifier - _wetImpact;
    } else {
        _exposureModifier = _exposureModifier + (_wetImpact * 0.5);
    };
};

// Sickness
if (_parasites > 0 || _infection > 0) then {
    _exposureModifier = _exposureModifier + (EXPOSURE_RATE * SICKNESS_FACTOR * abs _effectiveTempImpact);
    _thirstModifier = _thirstModifier + (THIRST_RATE * 1.2 * abs _effectiveTempImpact);
    _hungerModifier = _hungerModifier + (HUNGER_RATE * 0.5 * abs _effectiveTempImpact);
};

// Deficiency
if (GVAR(deficiency)) then {
    if (_thermalIndex < TEMP_NEUTRAL) then {
        _hungerModifier = _hungerModifier + (HUNGER_RATE * abs _effectiveTempImpact);
    } else {
        _thirstModifier = _thirstModifier + (THIRST_RATE * abs _effectiveTempImpact);
    };
};

// Finalize Wetness
_wetnessModifier = _wetness + _wetnessModifier;
_wetnessModifier = (_wetnessModifier max 0) min 1;

// Finalize ThermalIndex
_thermalIndexModifier = (_thermalIndexModifier max TEMP_MIN) min TEMP_MAX;

[_exposureModifier, _hungerModifier, _thirstModifier, _thermalIndexModifier, _wetnessModifier]
