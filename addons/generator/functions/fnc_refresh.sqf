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
 * [] call misery_generator_fnc_refresh
 *
*/

[player] call FUNC(nearGenerator) params ["", "_generator", "_generatorType"];

[{!isNull findDisplay 573849}, {
    params ["_args"];
    _args params ["_generator", "_generatorType"];

    private _radius = nil;

    switch (_generatorType) do {
        case "Land_PowerGenerator_F": {
            _radius = 150;
        };
        case "Land_Portable_generator_F": {
            _radius = 25;
        };
    };

    [{
        params ["_args", "_handle"];
        _args params ["_generator", "_generatorType"];

        if (isNull findDisplay 573849) exitWith {
            _handle call CBA_fnc_removePerFrameHandler;
        };

        private _dialog = findDisplay 573849;

        private _iconName = _dialog displayCtrl 1000;

        private _fuelProgressBar = findDisplay 573849 displayCtrl 1004;

        private _powerButton = findDisplay 573849 displayCtrl 1600;

        private _refuelButton = findDisplay 573849 displayCtrl 1601;

        [_generatorType] call EFUNC(common,getObjectData) params ["_objectDisplayName"];

        if (_objectDisplayName isEqualTo "") exitWith {};

        private _fuelLevel = _generator getVariable [QGVAR(fuelLevel), 1];

        _fuelProgressBar progressSetPosition _fuelLevel;

        private _runState = _generator getVariable [QGVAR(isRunning), false];
        private _shutDownState = _generator getVariable [QGVAR(shuttingDown), false];
        private _powerState = "";
        private _powerButtonText = "";
        private _showPowerButton = false;
        private _showRefuelButton = false;

        switch (true) do {
            case (!_runState && !_shutDownState): {
                _powerState = "OFF";
                _powerButtonText = "Start";
                _showPowerButton = true;
                _showRefuelButton = true;
            };
            case (_runState && !_shutDownState): {
                _powerState = "RUNNING";
                _powerButtonText = "Stop";
                _showPowerButton = true;
                _showRefuelButton = false;
            };
            case (_runState && _shutDownState): {
                _powerState = "SHUTTING DOWN";
                _showPowerButton = false;
                _showRefuelButton = false;
            };
        };

        ctrlSetText [1600, _powerButtonText];
        _refuelButton ctrlEnable _showRefuelButton;
        _powerButton ctrlEnable _showPowerButton;

        private _displayedState = format ["Power State: %1", _powerState];
        ctrlSetText [1001, _displayedState];

    }, 0, [_generator, _generatorType]] call CBA_fnc_addPerFrameHandler;
}, [_generator, _generatorType]] call CBA_fnc_waitUntilAndExecute;
