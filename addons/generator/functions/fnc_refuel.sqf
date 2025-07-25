#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Generator Refuel Action
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_generator_fnc_refuel
 *
*/

[player] call FUNC(nearGenerator) params ["", "_generator", "_generatorType"];

[{!isNull findDisplay 573849}, {
    params ["_generator", "_generatorType"];

    private _fuelLevel = _generator getVariable [QGVAR(fuelLevel), 1];

    if (_fuelLevel >= 1) exitWith {
        private _fuelFull = format ["<t font='PuristaMedium' size='0.7'>This generator has a full tank...</t>"];
        [QEGVAR(common,tileText), _fuelFull] call CBA_fnc_localEvent;
    };

    private _fuelCan = "";
    private _requiredFuelType = "";

    switch (_generatorType) do {
        case "Land_PowerGenerator_F": {
            _fuelCan = QCLASS(diesel);
            _requiredFuelType = "Diesel";
        };
        case "Land_Portable_generator_F": {
            _fuelCan = QCLASS(petrol);
            _requiredFuelType = "Petrol";
        };
    };

    if !([[_fuelCan]] call EFUNC(common,hasItem)) exitWith {
        private _needFuel = format ["<t font='PuristaMedium' size='0.7'>You need a %1 jerrycan to refuel this generator...</t>", _requiredFuelType];
        [QEGVAR(common,tileText), _needFuel] call CBA_fnc_localEvent;
    };

    [{
        params ["_args", "_handle"];
        _args params ["_fuelCan", "_requiredFuelType", "_fuelLevel", "_generator", "_generatorType"];

        private _currentFuel = _generator getVariable [QGVAR(fuelLevel), 1];

        if (isNull findDisplay 573849) exitWith {
            _handle call CBA_fnc_removePerFrameHandler;
        };

        if !([[_fuelCan]] call EFUNC(common,hasItem)) exitWith {
            private _needFuel = format ["<t font='PuristaMedium' size='0.7'>You need a %1 jerrycan to refuel this generator...</t>", _requiredFuelType];
            [QEGVAR(common,tileText), _needFuel] call CBA_fnc_localEvent;
            _handle call CBA_fnc_removePerFrameHandler;
        };

        if (_fuelLevel >= 1) exitWith {
            private _fuelFull = format ["<t font='PuristaMedium' size='0.7'>This generator has a full tank...</t>"];
            [QEGVAR(common,tileText), _fuelFull] call CBA_fnc_localEvent;
            _handle call CBA_fnc_removePerFrameHandler;
        };

        // Land_PowerGenerator_F simulated at 80L tank, Land_Portable_generator_F simulated at 40L tank
        private _fueltoAdd = [0.025, 0.0125] select (_generatorType isEqualTo "Land_PowerGenerator_F");

        _generator setVariable [QGVAR(fuelLevel), _currentFuel + _fueltoAdd, true];

        private _emptyCan = [QCLASS(petrolEmpty), QCLASS(dieselEmpty)] select (_requiredFuelType isEqualTo "Diesel");

        [_fuelCan, _emptyCan] call EFUNC(common,itemDecrement);

    }, 1, [_fuelCan, _requiredFuelType, _fuelLevel, _generator, _generatorType]] call CBA_fnc_addPerFrameHandler;
}, [_generator, _generatorType]] call CBA_fnc_waitUntilAndExecute;

