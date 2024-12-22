#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Generator Running Audio loop
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_generator_fnc_runningUserAction
 *
*/

_Generator = _this select 0;

_GeneratorType = typeOf _Generator;

if (_Generator getVariable ["Misery_Gen_FuelLVL", 100] <= 0) exitWith {
private _generatorNoFuel = format ["<t font='PuristaMedium'>%1</t>", format ["This Generator has no fuel..."]];
[parseText _generatorNoFuel, true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
};

private _soundStart = nil;
private _startupDelay = nil;

switch (_GeneratorType) do {
        case "Misery_100KVA_Gen": {
            _soundStart = "100_KVA_Startup";
            _startupDelay = 8;
        };
        case "Misery_HeavilyUsedGen_Gas": {
            _soundStart = "petorlgeneratorstart";
            _startupDelay = 1;
        };
        case "Misery_HeavilyUsedGen_Diesel": {
            _soundStart = "dieselgeneratorstart";
            _startupDelay = 2;
        };
    };

    _Generator setVariable ["Misery_Gen_IsRunning",true,true];

private _soundDummy = "Land_HelipadEmpty_F" createVehicle (getPosATL _Generator);
    _Generator setVariable ["Misery_GenSound", true,true];
    [_soundDummy, [_soundStart, 500]] remoteExec ["say3D", 0, _soundDummy];
    [{
    !(_Generator getVariable ["Misery_GenSound", false])
    },{
    deleteVehicle _this;
    }, _soundDummy] call CBA_fnc_waitUntilAndExecute;

    sleep _startupDelay;

    [[_Generator], FUNC(fuel)] remoteExec ["call", [0, -2] select isDedicated, true];
    [[_Generator], FUNC(powerNearby)] remoteExec ["call", [0, -2] select isDedicated, true];
    [[_Generator], FUNC(trackPos)] remoteExec ["call", [0, -2] select isDedicated, true];

while {true} do {

    _GeneratorType = typeOf _Generator;

    private _soundRunning = nil;
    private _RunningDelay = nil;

    switch (_GeneratorType) do {
        case "Misery_100KVA_Gen": {
            _soundRunning = "100_KVA_Running";
            _RunningDelay = 9.5;
        };
        case "Misery_HeavilyUsedGen_Gas": {
            _soundRunning = "petorlgeneratorrunning";
            _RunningDelay = 11.5;
        };
        case "Misery_HeavilyUsedGen_Diesel": {
            _soundRunning = "dieselgeneratorrunning";
            _RunningDelay = 11.5;
        };
    };

    private _soundDummyRunning = "Land_HelipadEmpty_F" createVehicle (getPosATL _Generator);
    _Generator setVariable ["Misery_GenSound", true,true];
    [_soundDummyRunning, [_soundRunning, 500]] remoteExec ["say3D", 0, _soundDummyRunning];
    [{
    !(_Generator getVariable ["Misery_GenSound", false])
    },{
    deleteVehicle _this;
    }, _soundDummyRunning] call CBA_fnc_waitUntilAndExecute;

    if (_Generator getVariable ["Misery_Gen_IsRunning", false] isEqualTo false) exitWith {

    deleteVehicle _soundDummyRunning;

    _GeneratorType = typeOf _Generator;

    private _soundShutdown = nil;

    switch (_GeneratorType) do {
        case "Misery_100KVA_Gen": {
            _soundShutdown = "100_KVA_Shutdown";
        };
        case "Misery_HeavilyUsedGen_Gas": {
            _soundShutdown = "petrolgeneratorstop";
        };
        case "Misery_HeavilyUsedGen_Diesel": {
            _soundShutdown = "dieselgeneratorstop";
        };
    };

    private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position _Generator);
    _Generator setVariable ["Misery_GenSoundNOFUEL", true,true];
    [_soundDummy, [_soundShutdown, 500]] remoteExec ["say3D", 0, _soundDummy];
    [{
    !(_Generator getVariable ["Misery_GenSoundNOFUEL", false])
    },{
    deleteVehicle _this;
    }, _soundDummy] call CBA_fnc_waitUntilAndExecute;
    };

    if (_Generator getVariable ["Misery_Gen_FuelLVL", 100] <= 0) exitWith {

    deleteVehicle _soundDummyRunning;

    _Generator setVariable ["Misery_Gen_IsRunning", false, true];

    _GeneratorType = typeOf _Generator;

    private _soundStop = nil;

    switch (_GeneratorType) do {
        case "Misery_100KVA_Gen": {
            _soundStop = "100_KVA_Shutdown";
        };
        case "Misery_HeavilyUsedGen_Gas": {
            _soundStop = "petrolgeneratorstop";
        };
        case "Misery_HeavilyUsedGen_Diesel": {
            _soundStop = "dieselgeneratorstop";
        };
    };

    private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position _Generator);
    _Generator setVariable ["Misery_GenSoundNOFUEL", true,true];
    [_soundDummy, [_soundStop, 500]] remoteExec ["say3D", 0, _soundDummy];
    [{
    !(_Generator getVariable ["Misery_GenSoundNOFUEL", false])
    },{
    deleteVehicle _this;
    }, _soundDummy] call CBA_fnc_waitUntilAndExecute;
    };

    sleep _RunningDelay;
};

