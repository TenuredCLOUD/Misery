#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Generator Running Audio loop
 *
 * Arguments:
 * 0: Generator <OBJECT>
 * 1: Type <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_generator_fnc_processAction
 *
*/

params ["_generator", "_generatorType"];

if (_generator getVariable [QGVAR(fuelLevel), 1] <= 0) exitWith {
    private _generatorNoFuel = format ["<t font='PuristaMedium' size='0.7'>This generator has no fuel...</t>"];
    [QEGVAR(common,tileText), _generatorNoFuel] call CBA_fnc_localEvent;
};

private _soundStart = nil;
private _startupDelay = nil;

switch (_generatorType) do {
    case "Land_Portable_generator_F": {
        _soundStart = QCLASS(audio_sound_petrolStart);
        _startupDelay = 1;
    };
    case "Land_PowerGenerator_F": {
        _soundStart = QCLASS(audio_sound_dieselStart);
        _startupDelay = 2;
    };
};

_generator setVariable [QGVAR(isRunning), true, true];

private _soundDummy = "Land_HelipadEmpty_F" createVehicle (getPosATL _generator);
_generator setVariable [QCLASS(generatorSound), true, true];

[_soundDummy, [_soundStart, 500]] remoteExec ["say3D", 0, _soundDummy];

[{!(_generator getVariable [QCLASS(generatorSound), false])},{
    deleteVehicle _this;
}, _soundDummy] call CBA_fnc_waitUntilAndExecute;

[{
    params ["_generator", "_generatorType"];

    [[_generator, _generatorType], FUNC(fuel)] remoteExec ["call", [0, -2] select isDedicated, true];
    [[_generator, _generatorType], FUNC(powerNearby)] remoteExec ["call", [0, -2] select isDedicated, true];
    [[_generator, _generatorType], FUNC(runLoop)] remoteExec ["call", [0, -2] select isDedicated, true];
    [[_generator], FUNC(trackPos)] remoteExec ["call", [0, -2] select isDedicated, true];
}, [_generator, _generatorType], _startupDelay] call CBA_fnc_waitAndExecute;

