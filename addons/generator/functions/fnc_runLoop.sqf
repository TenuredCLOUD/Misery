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
 * [] call misery_generator_fnc_runLoop
 *
*/

params ["_generator", "_generatorType"];

[{
        params ["_args", "_handle"];
        _args params ["_generator", "_generatorType"];

        private _fuelLevel = _generator getVariable [QGVAR(fuelLevel), 1];
        private _runState = _generator getVariable [QGVAR(isRunning), false];
        private _shutDown = _generator getVariable [QGVAR(shuttingDown), false];

        private _soundRunning = nil;
        private _runningDelay = nil;

        switch (_generatorType) do {
            case "Land_Portable_generator_F": {
                _soundRunning = QCLASS(audio_sound_petrolRunning);
                _runningDelay = 11.5;
            };
            case "Land_PowerGenerator_F": {
                _soundRunning = QCLASS(audio_sound_dieselRunning);
                _runningDelay = 11.5;
            };
        };

        private _soundDummyRunning = "Land_HelipadEmpty_F" createVehicle (getPosATL _generator);
        _generator setVariable [QCLASS(generatorSound), true, true];

        [_soundDummyRunning, [_soundRunning, 500]] remoteExec ["say3D", 0, _soundDummyRunning];

        [{!(_generator getVariable [QCLASS(generatorSound), false])},{
            deleteVehicle _this;
        }, _soundDummyRunning] call CBA_fnc_waitUntilAndExecute;

        if (_shutDown) exitWith {
            deleteVehicle _soundDummyRunning;

            private _soundShutdown = nil;

            switch (_generatorType) do {
                case "Land_Portable_generator_F": {
                    _soundShutdown = QCLASS(audio_sound_petrolStop);
                };
                case "Land_PowerGenerator_F": {
                    _soundShutdown = QCLASS(audio_sound_dieselStop);
                };
            };

            private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position _generator);
            _generator setVariable [QGVAR(shutDownAudio), true, true];
            [_soundDummy, [_soundShutdown, 500]] remoteExec ["say3D", 0, _soundDummy];
            [{!(_generator getVariable [QGVAR(shutDownAudio), false])},{
                deleteVehicle _this;
            }, _soundDummy] call CBA_fnc_waitUntilAndExecute;
            _generator setVariable [QGVAR(isRunning), false, true];
            _generator setVariable [QGVAR(shuttingDown), false, true];
            _handle call CBA_fnc_removePerFrameHandler;
        };

        if (_fuelLevel <= 0) exitWith {
        deleteVehicle _soundDummyRunning;
        _generator setVariable [QGVAR(shuttingDown), true, true];

        private _soundStop = nil;

        switch (_generatorType) do {
            case "Land_Portable_generator_F": {
                _soundStop = QCLASS(audio_sound_petrolStop);
            };
            case "Land_PowerGenerator_F": {
                _soundStop = QCLASS(audio_sound_dieselStop);
            };
        };

        private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position _generator);

        _generator setVariable [QGVAR(shutDownAudio), true, true];
        [_soundDummy, [_soundStop, 500]] remoteExec ["say3D", 0, _soundDummy];

        [{!(_generator getVariable [QGVAR(shutDownAudio), false])},{
            deleteVehicle _this;
        }, _soundDummy] call CBA_fnc_waitUntilAndExecute;
        _generator setVariable [QGVAR(isRunning), false, true];
        _generator setVariable [QGVAR(shuttingDown), false, true];
        _handle call CBA_fnc_removePerFrameHandler;
    };
}, 11.5, [_generator, _generatorType]] call CBA_fnc_addPerFrameHandler;
