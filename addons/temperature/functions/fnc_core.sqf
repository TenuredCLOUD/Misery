#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Core temperature mechanics
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_temperature_fnc_core;
 *
 * Public: No
*/

call EFUNC(common,getPlayerVariables) params ["", "", "", "_thermalIndex", "_exposure", "_wetness", "", "_infection", "_parasites"];

if !(GVAR(enabled)) exitWith {};

call FUNC(environment) params ["_airTemp", "_seaTemp"];

[player] call FUNC(clothing) params ["_clothesWarmth"];
_clothesWarmth = _clothesWarmth * (1 - _wetness * 0.5);

private _wetnessChill = linearConversion [0, 1, _wetness, 0, 0.8, true];
private _ambientTarget = linearConversion [TEMP_MIN, TEMP_MAX, _airTemp, -1, 1, true];
private _targetExposure = _ambientTarget;
private _thermalIndexModifier = _airTemp + (_clothesWarmth / 5);
private _wetnessModifier = 0;
private _changeMultiplier = 1;

call EFUNC(common,nearFire) params ["", "_isInflamed"];

switch (true) do {
    case (GVAR(thermalPackHeatActive)): {
        _targetExposure = 0.1;
        _changeMultiplier = 50;
    };
    case (GVAR(thermalPackColdActive)): {
        _targetExposure = -0.1;
        _changeMultiplier = 50;
    };
    case (GVAR(thermalBagActive)): {
        _targetExposure = 0;
        _thermalIndexModifier = TEMP_NEUTRAL;
        _wetnessModifier = -0.01;
        _changeMultiplier = 50;
    };
    case (insideBuilding player isEqualTo 1 && _isInflamed): {
        [player, 150] call EFUNC(generator,nearGenerator) params ["", "_generator"];
        private _hasPower = (!isNil "_generator" && {_generator getVariable [QEGVAR(generator,isRunning), false]});

        if (_hasPower) then {
            _targetExposure = 0.25 - (_wetnessChill * 0.5);
            _thermalIndexModifier = (_airTemp + 30) min 35;
            _wetnessModifier = -0.01;
            _changeMultiplier = 50;
        } else {
            _targetExposure = ([0.5, 0.1] select (_airTemp < TEMP_NEUTRAL)) - (_wetnessChill * 0.5);
            _thermalIndexModifier = (_airTemp + 20) min 35;
            _wetnessModifier = -0.005;
            _changeMultiplier = 50;
        };
    };
    case (_isInflamed): {
        _targetExposure = ([0.5, 0.1] select (_airTemp < TEMP_NEUTRAL)) - (_wetnessChill * 0.5);
        _thermalIndexModifier = (_airTemp + 20) min 35;
        _wetnessModifier = -0.005;
        _changeMultiplier = 50;
    };
    case (insideBuilding player isEqualTo 1): {
        [player, 150] call EFUNC(generator,nearGenerator) params ["", "_generator"];
        private _hasPower = (!isNil "_generator" && {_generator getVariable [QEGVAR(generator,isRunning), false]});

        if (_hasPower) then {
            _targetExposure = 0 - (_wetnessChill * 0.2);
            _thermalIndexModifier = TEMP_NEUTRAL;
            _wetnessModifier = -0.001;
            _changeMultiplier = 50;
        } else {
            _targetExposure = ((_ambientTarget + 0.3) min 0) - _wetnessChill;
            _thermalIndexModifier = _airTemp + 10;
            _wetnessModifier = -0.0001;
            _changeMultiplier = 50;
        };
    };
    case !(isNull objectParent player): {
        if (_shelteredVeh) then {
            _targetExposure = 0 - (_wetnessChill * 0.3);
            _thermalIndexModifier = TEMP_NEUTRAL;
            _wetnessModifier = -0.001;
            _changeMultiplier = 50;
        } else {
            _targetExposure = (_ambientTarget + 0.1) - _wetnessChill;
            _thermalIndexModifier = _airTemp + (_clothesWarmth / 10);
        };
    };
    default {
        private _hasWetsuit = ((toLower uniform player) find "wetsuit") > -1;
        private _isSwimming = (animationState player in [MACRO_ANIMATION_SWIMMING]);

        private _rainWet = false;
        private _waterWet = false;

        if (surfaceIsWater getPosWorld player || _isSwimming) then {
            _waterWet = true;
            _thermalIndexModifier = _seaTemp;
            _targetExposure = linearConversion [TEMP_MIN, TEMP_MAX, _seaTemp, -1, 1, true];
            _wetnessModifier = [0.05, 1.0] select (_isSwimming);

            if (!_hasWetsuit && _seaTemp < TEMP_NEUTRAL) then {
                _targetExposure = -1;
            };
        } else {
            _targetExposure = linearConversion [TEMP_MIN, TEMP_MAX, (_airTemp + (_clothesWarmth / 5)), -1, 1, true];
            _targetExposure = (_targetExposure - _wetnessChill) max -1;

            if (rain > 0 && !_hasWetsuit) then {
                _wetnessModifier = rain * 0.03;
                _rainWet = true;
            } else {
                if (!_rainWet && !_waterWet) then {
                    _wetnessModifier = -0.00001;
                };
            };
        };
    };
};

private _driftChange = NEUTRAL_RATE * _changeMultiplier;
private _exposureModifier = (_targetExposure - _exposure) * _driftChange;

if (_wetness > 0 && _thermalIndex < TEMP_NEUTRAL) then {
    _exposureModifier = (_exposureModifier - (_wetness * WETNESS_RATE * 5)) * (3 + _wetness);
};

private _hungerModifier = HUNGER_RATE;
private _thirstModifier = THIRST_RATE;

private _impactAbs = abs(_exposure);

if (_parasites > 0 || _infection > 0) then {
    _exposureModifier = _exposureModifier + (EXPOSURE_RATE * SICKNESS_FACTOR * _impactAbs);
};

if (GVAR(deficiency)) then {
    if (_thermalIndex < TEMP_NEUTRAL) then {
        _hungerModifier = _hungerModifier + (HUNGER_RATE * _impactAbs);
    } else {
        _thirstModifier = _thirstModifier + (THIRST_RATE * _impactAbs);
    };
};

[_thermalIndexModifier, "thermalindex"] call EFUNC(common,addStatusModifier);
[_wetnessModifier, "wetness"] call EFUNC(common,addStatusModifier);
[_exposureModifier, "exposure"] call EFUNC(common,addStatusModifier);
[-_hungerModifier, "hunger"] call EFUNC(common,addStatusModifier);
[-_thirstModifier, "thirst"] call EFUNC(common,addStatusModifier);
