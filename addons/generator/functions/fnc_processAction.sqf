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

private _soundStart = _generator getVariable [QGVAR(soundStart), ""];
private _startupDelay = _generator getVariable [QGVAR(startupDelay), 0];
private _soundRadius = _generator getVariable [QGVAR(soundRadius), 0];

private _dummyPosition = getPosATL _generator;
private _soundDummy = createVehicle ["Land_HelipadEmpty_F", _dummyPosition, [], 0, "CAN_COLLIDE"];

[QEGVAR(audio,say3D), [_soundDummy, _soundStart, _soundRadius]] call CBA_fnc_globalEvent;

// Failure to start RNG logic since most Generators do not start with one pull etc...
if ([50] call EFUNC(common,rollChance) && _generatorType isEqualTo "Land_Portable_generator_F") exitWith {
    [QEGVAR(common,tileText), localize LSTRING(FailedStart)] call CBA_fnc_localEvent;
    [{
        deleteVehicle _this;
    }, [_soundDummy], _startupDelay] call CBA_fnc_waitAndExecute;
};

_generator setVariable [QGVAR(isRunning), true, true];

[{
    params ["_generator", "_generatorType", "_soundDummy"];

    if (!isNull _soundDummy) then {
        deleteVehicle _soundDummy;
    };

    [QGVAR(processFuel), [_generator, _generatorType]] call CBA_fnc_globalEvent;
    [QGVAR(processPower), [_generator, _generatorType]] call CBA_fnc_globalEvent;
    [QGVAR(running), [_generator, _generatorType]] call CBA_fnc_globalEvent;
    [QGVAR(watchPos), [_generator]] call CBA_fnc_globalEvent;
}, [_generator, _generatorType, _soundDummy], _startupDelay] call CBA_fnc_waitAndExecute;

