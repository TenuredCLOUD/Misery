#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Pickaxe usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_mining_fnc_pickaxe;
 *
*/

params ["_found", "_miningObject", "_objectData"];

if !(_found) exitWith {
    [QEGVAR(common,tileText), format ["No mining source found..."]] call CBA_fnc_localEvent;
};

if (isNull _miningObject) exitWith {
    [QEGVAR(common,tileText), format ["No mining source found..."]] call CBA_fnc_localEvent;
};

private _miningTime = _objectData select 1;
private _audio = _objectData select 2;

if !([[QCLASS(pickaxe)]] call EFUNC(common,hasItem)) exitWith {
    [QEGVAR(common,tileText), localize "STR_MISERY_MINEORENOTOOLS"] call CBA_fnc_localEvent;
};

if (GVAR(minedPositions) findIf {_x distance getPosATL player < 2.5} isNotEqualTo -1) exitWith {
    [QEGVAR(common,tileText), "This ore vein has been depleted..."] call CBA_fnc_localEvent;
};

if (currentWeapon player isNotEqualTo "") then {
    player action ["SWITCHWEAPON", player, player, -1];
};

private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position player);
_soundDummy attachTo [player, [0, 0, 0], "Pelvis"];

_soundDummy say3D [_audio, 250];

player setVariable [QGVAR(miningOre), true];

call FUNC(degradePick);

["Mining ore...",
_miningTime,
{[[QCLASS(pickaxe)]] call EFUNC(common,hasItem)},
{
    params ["_args"];
    _args params ["_objectData", "_miningTime", "_soundDummy"];
    private _items = _objectData select 3;
    private _oreDepletion = _objectData select 4;

    if (_soundDummy isNotEqualTo objNull) then {
        deleteVehicle _soundDummy;
    };

    player setVariable [QGVAR(miningOre), nil];

    private _itemCargo = [];

    {
        _x params ["_classname", "_amount", "_chance"];
        if ([_chance] call EFUNC(common,rollChance)) then {
            _itemCargo pushBack [_classname, _amount];
        };
    } forEach _items;

    if (_itemCargo isNotEqualTo []) then {
        private _holder = [position player, _itemCargo] call EFUNC(common,spawnLoot);
        [QEGVAR(common,tileText), "You found some ore..."] call CBA_fnc_localEvent;
    } else {
        [QEGVAR(common,tileText), "No ore found..."] call CBA_fnc_localEvent;
    };

    if ([_oreDepletion] call EFUNC(common,rollChance)) then {
        private _position = getPosATL player;

        // Check if position is already cached (within 2.5 meters)
        if (GVAR(minedPositions) findIf {_x distance _position < 2.5} isEqualTo -1) then {

            GVAR(minedPositions) pushBack _position;

            publicVariable QGVAR(minedPositions);

            [QUOTE(COMPONENT_BEAUTIFIED), format ["Cached position %1 for mined ore", _position]] call EFUNC(common,debugMessage);
        };
    };
},
{
    params ["_args"];
    _args params ["_objectData", "_miningTime", "_soundDummy"];

    player setVariable [QGVAR(miningOre), nil];

    if (_soundDummy isNotEqualTo objNull) then {
        deleteVehicle _soundDummy;
    };

    [QEGVAR(common,tileText), "You stop mining..."] call CBA_fnc_localEvent;
},
[_objectData, _miningTime, _soundDummy]
] call CBA_fnc_progressBar;
