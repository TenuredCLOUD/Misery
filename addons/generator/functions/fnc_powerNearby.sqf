#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Generator Power nearby loop
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_generator_fnc_powerNearby
 *
*/

_Generator = _this select 0;

while {true} do {

    _GeneratorType = typeOf _Generator;

    private _radius = nil;

    switch (_GeneratorType) do {
        case "Misery_100KVA_Gen": {
            _radius = 500;
        };
        case "Misery_HeavilyUsedGen_Gas": {
            _radius = 25;
        };
        case "Misery_HeavilyUsedGen_Diesel": {
            _radius = 150;
        };
    };

    _lights = nearestObjects [getPosATL _Generator, ["HOUSE","STATIC","BUILDING"], _radius, false];
    _lightsTerrain = nearestTerrainObjects [getPosATL _Generator, ["BUILDING","HOUSE"], _radius, false];

    if (_Generator getVariable ["Misery_Gen_IsRunning", false] isEqualTo true) then {
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

    if (_Generator getVariable ["Misery_Gen_IsRunning", false] isEqualTo false) exitWith {
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
};
