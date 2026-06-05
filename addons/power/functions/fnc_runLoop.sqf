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

private _config = configFile >> "CfgVehicles" >> _generatorType;

private _soundRunning   = getText (_config >> QGVAR(soundRunning));

private _soundSource = createSoundSource [_soundRunning, getPosATL _generator, [], 0];
_generator setVariable [QGVAR(runningSoundSource), _soundSource];

// Delete Sound Source if Generator disappears
_generator addEventHandler ["Deleted", {
    params ["_generator"];
    private _soundSource = _generator getVariable [QGVAR(runningSoundSource), objNull];
    deleteVehicle _soundSource;
    [QGVAR(removeGeneratorFromServer), [_generator]] call CBA_fnc_serverEvent;
}];

[{
    params ["_args", "_handle"];
    _args params ["_generator", "_generatorType", "_soundSource"];

    private _config = configFile >> "CfgVehicles" >> _generatorType;

    private _shutDownDelay = getNumber (_config >> QGVAR(shutDownDelay));
    private _soundShutdown = getText (_config >> QGVAR(soundStop));
    private _soundRadius = getNumber (_config >> QGVAR(soundRadius));

    private _fuelLevel = _generator getVariable [QGVAR(generatorFuel), 0];
    private _runState = _generator getVariable [QGVAR(generatorRunning), false];

    private _dummyPosition = getPosATL _generator;
    private _soundDummy = createVehicle ["Land_HelipadEmpty_F", _dummyPosition, [], 0, "CAN_COLLIDE"];

    if !(_runState) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
        // Running audio
        deleteVehicle _soundSource;

        [QEGVAR(audio,say3D), [_soundDummy, _soundShutdown, _soundRadius]] call CBA_fnc_globalEvent;
        [{
            deleteVehicle _this;
        }, [_soundDummy], _shutDownDelay] call CBA_fnc_waitAndExecute;
    };

    if (_fuelLevel <= 0) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
        // Running audio
        deleteVehicle _soundSource;

        [QEGVAR(audio,say3D), [_soundDummy, _soundShutdown, _soundRadius]] call CBA_fnc_globalEvent;
        [{
            deleteVehicle _this;
        }, [_soundDummy], _shutDownDelay] call CBA_fnc_waitAndExecute;

        [QGVAR(removeGeneratorFromServer), [_generator]] call CBA_fnc_serverEvent;
    };
}, 1, [_generator, _generatorType, _soundSource]] call CBA_fnc_addPerFrameHandler;
