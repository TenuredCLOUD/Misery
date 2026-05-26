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
    [QEGVAR(common,tileText), localize LSTRING(NoFuel)] call CBA_fnc_localEvent;
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

private _soundDummy = "Land_HelipadEmpty_F" createVehicle (getPosATL _generator);
_generator setVariable [QCLASS(generatorSound), true, true];

[_soundDummy, [_soundStart, 500]] remoteExec ["say3D", 0, _soundDummy];

[{!(_generator getVariable [QCLASS(generatorSound), false])},{
    deleteVehicle _this;
}, _soundDummy] call CBA_fnc_waitUntilAndExecute;

// Failure to start RNG logic since most Generators do not start with one pull etc...
if ([50] call EFUNC(common,rollChance)) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(FailedStart)] call CBA_fnc_localEvent;
};

_generator setVariable [QGVAR(isRunning), true, true];

[{
    params ["_generator", "_generatorType"];

    [QGVAR(processFuel), [_generator, _generatorType]] call CBA_fnc_globalEvent;
    [QGVAR(processPower), [_generator, _generatorType]] call CBA_fnc_globalEvent;
    [QGVAR(running), [_generator, _generatorType]] call CBA_fnc_globalEvent;
    [QGVAR(watchPos), [_generator]] call CBA_fnc_globalEvent;

}, [_generator, _generatorType], _startupDelay] call CBA_fnc_waitAndExecute;

