#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Core temperature mechanics
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Array of Variables <ARRAY>
 *     0: ThermalIndex Modifier <NUMBER>
 *     1: Wetness Modifier <NUMBER>
 *
 *
 * Example:
 * [] call misery_temperature_fnc_core;
 *
 * Public: No
*/

call EFUNC(common,getPlayerVariables) params ["", "", "", "_thermalIndex", "_exposure", "_wetness", "", "_infection", "_parasites"];

if !(GVAR(enabled)) exitWith {};

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
[player] call FUNC(clothing) params ["_clothesWarmth"];
_clothesWarmth = _clothesWarmth * (1 - _wetness * 0.5); // Up to 50% loss when soaked
private _effectiveTempImpact = _tempImpact - (_clothesWarmth / 50); // Max warmth negates impact
_effectiveTempImpact = (_effectiveTempImpact max -1) min 1;

// Base modifiers
private _exposureModifier = EXPOSURE_RATE * _effectiveTempImpact; // -0.033 to 0.033
private _hungerModifier = HUNGER_RATE;
private _thirstModifier = THIRST_RATE;
private _thermalIndexModifier = _airTemp + (_clothesWarmth / 5); // Very slow drift
private _wetnessModifier = 0;

call EFUNC(common,nearFire) params ["", "_isInflamed"];

// Environment
switch (true) do {
    case (_isInflamed): {
        if (_thermalIndex < TEMP_NEUTRAL) then {
            _exposureModifier = NEUTRAL_RATE; // Warm up
            _thermalIndexModifier = _thermalIndex + 1 min TEMP_NEUTRAL; // Slow warming
            if (_wetness > 0) then {
                _wetnessModifier = -0.025; // Dry faster near fire
            };
        };
        if (_thermalIndex > TEMP_NEUTRAL + 5) then {
            _exposureModifier = _exposureModifier + (EXPOSURE_RATE * 0.15);
        };
    };
    // case (insideBuilding player isEqualTo 1): {
    //     _exposureModifier = -_exposure * NEUTRAL_RATE; // Trend to 0
    //     _thermalIndexModifier = _thermalIndex + ((TEMP_NEUTRAL - _thermalIndex) * 0.1); // Near neutral
    //     if (_wetness > 0) then {
    //         _wetnessModifier = -0.01; // Dry indoors
    //     };
    // };
    case (insideBuilding player isEqualTo 1): {
        // Building provides ~10°C insulation (without generator running, if near running generator, building will float more to neutral temperature)
        private _generatorPower = false;

        [player, 150] call EFUNC(generator,nearGenerator) params ["", "_generator"];

        if (!isNil "_generator" && _generator getVariable [QEGVAR(generator,isRunning), false]) then {
            _generatorPower = true;
        };

        if (_generatorPower) then {
            _thermalIndexModifier = _thermalIndex + ((TEMP_NEUTRAL - _thermalIndex) * 0.1); // Near neutral
            _exposureModifier = -_exposure * NEUTRAL_RATE; // Trend to 0
            if (_wetness > 0) then {
                _wetnessModifier = -0.012; // Dry indoors (faster with power)
            };
        } else {
            private _buildingInsulation = 10;
            private _shelterTemp = _airTemp + _buildingInsulation;
            _thermalIndexModifier = _thermalIndex + ((_shelterTemp - _thermalIndex) * 0.1);
            _exposureModifier = -_exposure * NEUTRAL_RATE; // Trend to 0
            if (_wetness > 0) then {
                _wetnessModifier = -0.01; // Dry indoors (slower no power)
            };
        };
    };
    case !(isNull objectParent player): {
        _exposureModifier = -_exposure * NEUTRAL_RATE; // Trend to 0
        _thermalIndexModifier = _thermalIndex + ((TEMP_NEUTRAL - _thermalIndex) * 0.08); // Less neutral
        if (_wetness > 0) then {
            _wetnessModifier = -0.01; // Dry in vehicle
        };
    };
    default {
        // Exposed to elements
        _exposureModifier = _exposureModifier + (EXPOSURE_RATE * 0.1);

        // Water / Wetness
        private _rainWet = false;
        private _waterWet = false;

        private _hasWetsuit = ((toLower uniform player) find "wetsuit") > -1;
        if (rain > 0 && !_hasWetsuit) then {
            _wetnessModifier = rain * 0.03;
            private _rainWet = true;
        };
        if (surfaceIsWater getPosATL player) then {
            if (!_hasWetsuit && _seaTemp < TEMP_NEUTRAL) then {
                private _waterImpact = ((TEMP_NEUTRAL - _seaTemp) / (TEMP_NEUTRAL - TEMP_MIN));
                _exposureModifier = _exposureModifier - (EXPOSURE_RATE * 1.1 * _waterImpact);
            };
            _wetnessModifier = 0.25;
            private _waterWet = true;
        };
        // Default dry slightly if no rain & not in water
        if (!_rainWet && !_waterWet) then {
            if (_wetness > 0) then {
                _wetnessModifier = -0.005;
            };
        };
    };
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
//_wetnessModifier = _wetness + _wetnessModifier;

//systemChat format ["Wetness: %1", _wetnessModifier];

// Finalize ThermalIndex
//_thermalIndexModifier = (_thermalIndexModifier max TEMP_MIN) min TEMP_MAX;

// Temperature severity scaling
private _tempSeverity = 1;

// Cold severity
if (_thermalIndex < TEMP_MIN) then {
    private _coldExcess = abs(_thermalIndex - TEMP_MIN);
    _tempSeverity = _tempSeverity * (1 + (_coldExcess * 0.5));
    _exposureModifier = _exposureModifier * _tempSeverity;
};

// Heat severity
if (_thermalIndex > TEMP_MAX) then {
    private _heatExcess = _thermalIndex - TEMP_MAX;
    _tempSeverity = _tempSeverity * (1 + (_heatExcess * 0.5));
    _exposureModifier = _exposureModifier * _tempSeverity;
};

//systemChat format ["Exposure: %1", _exposureModifier];

[_thermalIndexModifier, "thermalindex"] call EFUNC(common,addStatusModifier);
[_wetnessModifier, "wetness"] call EFUNC(common,addStatusModifier);
[_exposureModifier, "exposure"] call EFUNC(common,addStatusModifier);
[-_hungerModifier, "hunger"] call EFUNC(common,addStatusModifier);
[-_thirstModifier, "thirst"] call EFUNC(common,addStatusModifier);
