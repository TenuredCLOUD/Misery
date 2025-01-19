#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Generator UI populator
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_generator_fnc_uiPrep
 *
*/

waitUntil {!isNull findDisplay 573849};

_Generator = player getVariable QCLASS(currentGenerator);
_GeneratorType = typeOf _Generator;

private _radius = nil;

switch (_GeneratorType) do {
    case QCLASS(100KVA_Generator): {
        _radius = 500;
    };
    case QCLASS(heavilyUsedDiesel_Generator): {
        _radius = 150;
    };
    case QCLASS(heavilyUsedGas_Generator): {
        _radius = 25;
    };
};

while {!isNull findDisplay 573849} do {

_fuelProgressBar = findDisplay 573849 displayCtrl 1003;

_PowerButton = findDisplay 573849 displayCtrl 1600;

_RefuelButton = findDisplay 573849 displayCtrl 1601;

_Generator = player getVariable QCLASS(currentGenerator);

_GeneratorType = typeOf _Generator;

_Generatorname = getText (configFile >> "CfgVehicles" >> _GeneratorType >> "displayName");

if (_Generatorname isEqualTo "") exitWith {};

private _fuelLevel = _Generator getVariable [QCLASS(generatorFuelLevel), 100];

_progressIndicator = "";

for "_i" from 0 to _fuelLevel do {
    if (_i % 5 isEqualTo 0) then {_progressIndicator = _progressIndicator + "-"};
};

_displayedText = format ["Fuel Level:%1%2%3%1[%4]", endl, _fuelLevel, "%", _progressIndicator];
ctrlSetText [1003, _displayedText];

private _isRunning = _Generator getVariable [QCLASS(generatorRunning), false];
private _powerState = "";
private _buttonText = "";
private _showRefuelButton = false;

switch (_isRunning) do {
    case false: {
        _powerState = "OFF";
        _buttonText = "Start";
        _showRefuelButton = true;
    };
    default {
        _powerState = "RUNNING";
        _buttonText = "Stop";
        _showRefuelButton = false;
    };
};

ctrlSetText [1600, _buttonText];
_RefuelButton ctrlShow _showRefuelButton;

private _displayedState = format ["Power State: %1", _powerState];
ctrlSetText [1001, _displayedState];

sleep 1;
};
