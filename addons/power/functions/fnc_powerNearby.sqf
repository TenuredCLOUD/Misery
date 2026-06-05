#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Generator Power nearby loop
 *
 * Arguments:
 * 0: Generator <OBJECT>
 * 1: Type <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_generator_fnc_powerNearby
 *
*/

params ["_generator", "_generatorType"];

[{
    params ["_args", "_handle"];
    _args params ["_generator", "_generatorType"];

    private _runState = _generator getVariable [QGVAR(generatorRunning), false];

    if (!_runState) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
    };

    // if ([_generator] call AE3FUNC(power,updatePower)) exitWith {
    //     _handle call CBA_fnc_removePerFrameHandler;
    //     [QGVAR(removeGeneratorFromServer), [_generator]] call CBA_fnc_serverEvent;
    // };

    // private _devices = [_generator] call FUNC(getConnectedDevices);

    // if (_devices isNotEqualTo []) then {
    //     {
    //         private _batteryCapacity = _x getVariable QAE3GVAR(power,batteryCapacity);
    //         private _batteryLevel = _batteryCapacity * (1 / 100);

    //         private _currentPower = _x getVariable [QAE3GVAR(power,batteryLevel), 0];

    //         if (_currentPower >= _batteryCapacity) then {
    //             _x setVariable [QAE3GVAR(power,batteryLevel), _batteryCapacity];
    //         } else {
    //             _x setVariable [QAE3GVAR(power,batteryLevel), _currentPower + _batteryLevel];
    //         };
    //     } forEach _devices;
    // };

    // private _runState = _generator getVariable [QGVAR(isRunning), false];

    // private _radius = _generator getVariable [QGVAR(powerRadius), 0];

    // private _lights = nearestObjects [getPosATL _generator, ["HOUSE","STATIC","BUILDING"], _radius, false];
    // private _lightsTerrain = nearestTerrainObjects [getPosATL _generator, ["BUILDING","HOUSE"], _radius, false];

    // if (_runState) then {
    //     {
    //         private _object = _x;
    //         private _hitpoints = getAllHitPointsDamage _object select 0;

    //         _x switchLight "ON";

    //         if (!isNil "_hitpoints") then {
    //             {
    //                 private _lower = toLower _x;
    //                 if ("light" in _lower) then {
    //                     _object setHitPointDamage [_x, 0];
    //                 };
    //             } forEach _hitpoints;
    //         };
    //     } forEach _lights + _lightsTerrain;
    // };

    // if (!_runState) exitWith {
    //     {
    //         private _object = _x;
    //         private _hitpoints = getAllHitPointsDamage _object select 0;

    //         _x switchLight "OFF";

    //         if (!isNil "_hitpoints") then {
    //             {
    //                 private _lower = toLower _x;
    //                 if ("light" in _lower) then {
    //                     _object setHitPointDamage [_x, 0];
    //                 };
    //             } forEach _hitpoints;
    //         };
    //     } forEach _lights + _lightsTerrain;
    //     _handle call CBA_fnc_removePerFrameHandler;
    // };
}, 1, [_generator, _generatorType]] call CBA_fnc_addPerFrameHandler;
