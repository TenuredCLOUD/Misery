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
    [QEGVAR(common,tileText), localize LSTRING(NoSource)] call CBA_fnc_localEvent;
};

if (isNull _miningObject) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(NoSource)] call CBA_fnc_localEvent;
};

private _miningTime = _objectData select 1;
private _audio = _objectData select 2;

if !([[QCLASS(pickaxe)]] call EFUNC(common,hasItem)) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(NoTools)] call CBA_fnc_localEvent;
};

if (GVAR(minedPositions) findIf {_x distance getPosWorld ACE_player < 2.5} isNotEqualTo -1) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(VeinDepleted)] call CBA_fnc_localEvent;
};

if (currentWeapon ACE_player isNotEqualTo "") then {
    [ACE_player] call ACEFUNC(weaponselect,putWeaponAway);
};

private _soundDummy = "Land_HelipadEmpty_F" createVehicle (getPosWorld ACE_player);
_soundDummy attachTo [ACE_player, [0, 0, 0], "Pelvis"];

if (_audio isNotEqualTo "") then {
    _soundDummy say3D [_audio, 250];
};

ACE_player setVariable [QGVAR(miningOre), true];

call FUNC(degradePick);

[localize LSTRING(ActionProgress),
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

    ACE_player setVariable [QGVAR(miningOre), nil];

    private _itemCargo = [];

    {
        _x params ["_classname", "_amount", "_chance"];
        if ([_chance] call EFUNC(common,rollChance)) then {
            _itemCargo pushBack [_classname, _amount];
            [ACE_player, _classname, _amount] call EFUNC(common,addItem);
        };
    } forEach _items;

    if (_itemCargo isNotEqualTo []) then {
        [ACE_player, QCLASS(stoneChunk), selectRandom [1, 2, 3, 4, 5]] call EFUNC(common,addItem);
        [QEGVAR(common,tileText), localize LSTRING(Success)] call CBA_fnc_localEvent;
    } else {
        [ACE_player, QCLASS(stoneChunk), selectRandom [1, 2, 3, 4, 5]] call EFUNC(common,addItem);
        [QEGVAR(common,tileText), localize LSTRING(NoOreFound)] call CBA_fnc_localEvent;
    };

    if ([_oreDepletion] call EFUNC(common,rollChance)) then {
        private _position = getPosWorld ACE_player;

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

    ACE_player setVariable [QGVAR(miningOre), nil];

    if (_soundDummy isNotEqualTo objNull) then {
        deleteVehicle _soundDummy;
    };

    [QEGVAR(common,tileText), localize LSTRING(Interrupted)] call CBA_fnc_localEvent;
},
[_objectData, _miningTime, _soundDummy]
] call CBA_fnc_progressBar;
