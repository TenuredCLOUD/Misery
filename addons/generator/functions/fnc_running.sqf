#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Generator Running Audio loop
 *
 * Arguments:
 * 0: Object <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_generator_fnc_running
 *
*/

_Generator = _this select 0;

while {true} do {

    _soundRunning = ["petorlgeneratorrunning", "dieselgeneratorrunning"] select (typeOf _Generator isEqualTo "Land_PowerGenerator_F");

    _GeneratorType = typeOf _Generator;

    switch (_GeneratorType) do {
        case QCLASS(100KVA_Generator): {
            _soundRunning = "100_KVA_Running";
        };
        case QCLASS(heavilyUsedGas_Generator): {
            _soundRunning = "petorlgeneratorrunning";
        };
        case QCLASS(heavilyUsedDiesel_Generator): {
            _soundRunning = "dieselgeneratorrunning";
        };
    };

    private _soundDummyRunning = "Land_HelipadEmpty_F" createVehicle (getPosATL _Generator);
    _Generator setVariable [QCLASS(generatorSound), true,true];
    [_soundDummyRunning, [_soundRunning, 500]] remoteExec ["say3D", 0, _soundDummyRunning];
    [{
    !(_Generator getVariable [QCLASS(generatorSound), false])
    },{
    deleteVehicle _this;
    }, _soundDummyRunning] call CBA_fnc_waitUntilAndExecute;

    if (_Generator getVariable [QCLASS(generatorRunning), false] isEqualTo false) exitWith {
        deleteVehicle _soundDummyRunning;
    };

     if (_Generator getVariable [QCLASS(generatorFuelLevel), 100] <= 0) exitWith {
    _PowerOnB = findDisplay 573849 displayCtrl 1600;
    _PowerOffB = findDisplay 573849 displayCtrl 1601;
    _RefuelB = findDisplay 573849 displayCtrl 1602;
    deleteVehicle _soundDummyRunning;
    _Generator setVariable [QCLASS(generatorSound), false,true];
    _Generator setVariable [QCLASS(generatorRunning), false, true];
    _soundStop = ["petrolgeneratorstop", "dieselgeneratorstop"] select (typeOf _Generator isEqualTo "Land_PowerGenerator_F");
    private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position _Generator);
    _Generator setVariable [QCLASS(generatorNoFuelSound), true,true];
    [_soundDummy, [_soundStop, 500]] remoteExec ["say3D", 0, _soundDummy];
    [{
    !(_Generator getVariable [QCLASS(generatorNoFuelSound), false])
    },{
    deleteVehicle _this;
    }, _soundDummy] call CBA_fnc_waitUntilAndExecute;

    _PowerOnB ctrlShow true;
    _RefuelB ctrlShow true;
    };

    sleep 11;
};

