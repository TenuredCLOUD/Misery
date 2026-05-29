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

private _soundRunning = _generator getVariable [QGVAR(soundRunning), ""];

private _soundSource = createSoundSource [_soundRunning, getPosATL _generator, [], 0];
_generator setVariable [QGVAR(runningSoundSource), _soundSource];

// Delete Sound Source if Generator disappears
_generator addEventHandler ["Deleted", {
    params ["_generator"];
    private _soundSource = _generator getVariable [QGVAR(runningSoundSource), objNull];
    deleteVehicle _soundSource;
}];

[{
    params ["_args", "_handle"];
    _args params ["_generator", "_generatorType", "_soundSource"];

    private _fuelLevel = _generator getVariable [QGVAR(fuelLevel), 1];
    private _runState = _generator getVariable [QGVAR(isRunning), false];
    private _shutDown = _generator getVariable [QGVAR(shuttingDown), false];

    private _shutDownDelay = _generator getVariable [QGVAR(shutDownDelay), 0];

    private _soundShutdown = _generator getVariable [QGVAR(soundStop), ""];

    private _soundRadius = _generator getVariable [QGVAR(soundRadius), 0];

    private _dummyPosition = getPosATL _generator;
    private _soundDummy = createVehicle ["Land_HelipadEmpty_F", _dummyPosition, [], 0, "CAN_COLLIDE"];

    if (_shutDown) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
        // Running audio
        deleteVehicle _soundSource;

        [QEGVAR(audio,say3D), [_soundDummy, _soundShutdown, _soundRadius]] call CBA_fnc_globalEvent;
        [{
            deleteVehicle _this;
        }, [_soundDummy], _shutDownDelay] call CBA_fnc_waitAndExecute;

        _generator setVariable [QGVAR(isRunning), false, true];
        _generator setVariable [QGVAR(shuttingDown), false, true];
    };

    if (_fuelLevel <= 0) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
        // Running audio
        deleteVehicle _soundSource;

        _generator setVariable [QGVAR(shuttingDown), true, true];

        [QEGVAR(audio,say3D), [_soundDummy, _soundShutdown, _soundRadius]] call CBA_fnc_globalEvent;
        [{
            deleteVehicle _this;
        }, [_soundDummy], _shutDownDelay] call CBA_fnc_waitAndExecute;

        _generator setVariable [QGVAR(isRunning), false, true];
        _generator setVariable [QGVAR(shuttingDown), false, true];
    };
}, 1, [_generator, _generatorType, _soundSource]] call CBA_fnc_addPerFrameHandler;
