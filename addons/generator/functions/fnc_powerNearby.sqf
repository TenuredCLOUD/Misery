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

    private _runState = _generator getVariable [QGVAR(isRunning), false];

    private _radius = nil;

    switch (_generatorType) do {
        case "Land_Portable_generator_F": {
            _radius = 25;
        };
        case "Land_PowerGenerator_F": {
            _radius = 150;
        };
    };

    private _lights = nearestObjects [getPosATL _generator, ["HOUSE","STATIC","BUILDING"], _radius, false];
    private _lightsTerrain = nearestTerrainObjects [getPosATL _generator, ["BUILDING","HOUSE"], _radius, false];

    if (_runState) then {
        {
            private _object = _x;
            private _hitpoints = getAllHitPointsDamage _object select 0;

            _x switchLight "ON";

            if (!isNil "_hitpoints") then {
                {
                    private _lower = toLower _x;
                    if ("light" in _lower) then {
                        _object setHitPointDamage [_x, 0];
                    };
                } forEach _hitpoints;
            };
        } forEach _lights + _lightsTerrain;
    };

    if (!_runState) exitWith {
        {
            private _object = _x;
            private _hitpoints = getAllHitPointsDamage _object select 0;

            _x switchLight "OFF";

            if (!isNil "_hitpoints") then {
                {
                    private _lower = toLower _x;
                    if ("light" in _lower) then {
                        _object setHitPointDamage [_x, 0];
                    };
                } forEach _hitpoints;
            };
        } forEach _lights + _lightsTerrain;
    };
}, 1, [_generator, _generatorType]] call CBA_fnc_addPerFrameHandler;
