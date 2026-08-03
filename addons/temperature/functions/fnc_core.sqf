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

if !(GVAR(enabled) && ACEGVAR(weather,enabled)) exitWith {};

call FUNC(environment) params ["_temperature", "_heatIndex", "_windChill", "_humidity", "_breathFog"];

[ACE_player] call FUNC(clothing) params ["_clothesWarmth"];
_clothesWarmth = _clothesWarmth * (1 - _wetness * 0.5);

private _wetnessChill = linearConversion [0, 1, _wetness, 0, 0.8, true];

private _perceivedTemp = _temperature;
if (_temperature >= 26) then {
    _perceivedTemp = _heatIndex;
} else {
    if (_temperature <= 10) then {
        _perceivedTemp = _windChill;
    };
};

private _ambientTarget = linearConversion [TEMP_MIN, TEMP_MAX, _perceivedTemp, -1, 1, true];
private _targetExposure = _ambientTarget;
private _thermalIndexModifier = _perceivedTemp + (_clothesWarmth / 5);
private _wetnessModifier = 0;
private _changeMultiplier = 1;
private _hasWetsuit = ((toLower uniform ACE_player) find "wetsuit") > -1;

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
        _wetnessModifier = -0.0025;
        _changeMultiplier = 50;
    };
    case (insideBuilding ACE_player isEqualTo 1 && _isInflamed): {
        _targetExposure = ([0.5, 0.1] select (_temperature < TEMP_NEUTRAL)) - (_wetnessChill * 0.5);
        _thermalIndexModifier = (_temperature + 20) min 35;
        _wetnessModifier = -0.007;
        _changeMultiplier = 50;
    };
    case (_isInflamed): {
        _targetExposure = ([0.5, 0.1] select (_temperature < TEMP_NEUTRAL)) - (_wetnessChill * 0.5);
        _thermalIndexModifier = (_temperature + 20) min 35;
        _wetnessModifier = -0.005;
        _changeMultiplier = 50;
    };
    case (insideBuilding ACE_player isEqualTo 1): {
        _targetExposure = ((_ambientTarget + 0.3) min 0) - _wetnessChill;
        _thermalIndexModifier = _temperature + 10;
        _wetnessModifier = -0.0001;
        _changeMultiplier = 50;
    };
    case !(isNull objectParent ACE_player): {
        private _config = missionConfigFile >> "CfgMisery_VehicleData";
        private _shelteredVeh = false;

        if (isClass _config && {isNumber (_config >> typeOf vehicle ACE_player >> "shelter")}) then {
            _shelterValue = getNumber (_config >> typeOf vehicle ACE_player >> "shelter");
            if (_shelterValue > 0 && isEngineOn vehicle ACE_player) then {
                _shelteredVeh = true;
            };
        } else {
            if (getNumber (configOf (vehicle ACE_player) >> "transportSoldier") > 0 && isEngineOn vehicle ACE_player) then {
                _shelteredVeh = true;
            };
        };
        if (_shelteredVeh) then {
            _targetExposure = 0 - (_wetnessChill * 0.3);
            _thermalIndexModifier = TEMP_NEUTRAL;
            _wetnessModifier = -0.0005;
            _changeMultiplier = 50;
        } else {
            _targetExposure = (_ambientTarget + 0.1) - _wetnessChill;
            _thermalIndexModifier = _perceivedTemp + (_clothesWarmth / 10);
        };
    };
    default {
        private _isSwimming = [ACE_player] call ACEFUNC(common,isSwimming);

        if (_isSwimming) then {
            _wetnessModifier = [0.05, 0.005] select (_hasWetsuit);

            if (_temperature < 20) then {
                private _coldSeverity = linearConversion [TEMP_MIN, 20, _temperature, -1, -0.2, true];
                _targetExposure = if (_hasWetsuit) then { _coldSeverity * 0.3 } else { _coldSeverity };
            } else {
                _targetExposure = linearConversion [20, TEMP_MAX, _temperature, -0.1, 0.2, true];
            };
        } else {
            private _tempDelta = _perceivedTemp - TEMP_NEUTRAL;

            if (_tempDelta < 0) then {
                private _insulationFactor = (1 - ((_clothesWarmth min 80) / 100)) max 0.1;
                _tempDelta = _tempDelta * _insulationFactor;
                _targetExposure = linearConversion [TEMP_MIN - TEMP_NEUTRAL, 0, _tempDelta, -1, 0, true];
            } else {
                _targetExposure = linearConversion [0, TEMP_MAX - TEMP_NEUTRAL, _tempDelta, 0, 1, true];
            };

            _targetExposure = (_targetExposure - _wetnessChill) max -1;

            _changeMultiplier = 1 + ((abs (speed ACE_player)) / 4);

            if (rain > 0 && !_hasWetsuit) then {
                _wetnessModifier = rain * 0.03;
            } else {
                _wetnessModifier = -0.00001;
            };
        };
    };
};

private _driftChange = NEUTRAL_RATE * _changeMultiplier;
private _exposureModifier = (_targetExposure - _exposure) * _driftChange;

[QUOTE(COMPONENT_BEAUTIFIED), format ["Target Exposure: %1 | Change Multiplier: %2 | Exposure Modifier: %3", _targetExposure, _changeMultiplier, _exposureModifier]] call EFUNC(common,debugMessage);

if (_wetness > 0 && _thermalIndex < TEMP_NEUTRAL && !_hasWetsuit) then {
    _exposureModifier = (_exposureModifier - (_wetness * WETNESS_RATE * 5)) * (3 + _wetness);
};

private _hungerModifier = HUNGER_RATE * EGVAR(survival,metabolicCoef);
private _thirstModifier = THIRST_RATE * EGVAR(survival,metabolicCoef);

if (_perceivedTemp > 30) then {
    _thirstModifier = _thirstModifier * (1 + ((_perceivedTemp - 30) * 0.06));
};

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
