#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * WoodAxe usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_forestry_fnc_axeAction;
 *
*/

[player] call EFUNC(common,nearTree) params ["_found", "_nearestTree", "_damaged", "_hasAxe", "_hasSaw"];

if !(_found) exitWith {
    [QEGVAR(common,tileText), format ["You need to be near a tree to start chopping wood..."]] call CBA_fnc_localEvent;
};

if (_damaged) exitWith {
    [QEGVAR(common,tileText), format ["Tree has fallen, doesn't have anymore wood..."]] call CBA_fnc_localEvent;
};

if !(_hasAxe) exitWith {
    [QEGVAR(common,tileText), format ["You need an axe to start chopping wood..."]] call CBA_fnc_localEvent;
};

if (currentWeapon player isNotEqualTo "") then {
    player action ["SWITCHWEAPON", player, player, -1];
};

private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position player);
_soundDummy attachTo [player, [0, 0, 0], "Pelvis"];

_soundDummy say3D [QCLASS(audio_sound_chopWood), 500];

["Chopping wood...",
15,
{[player] call EFUNC(common,nearTree) params ["_found", "", "", "_hasAxe", ""]; _found && _hasAxe},
{
    params ["_args"];
    _args params ["_nearestTree", "_soundDummy"];

    if (_soundDummy isNotEqualTo objNull) then {
        deleteVehicle _soundDummy;
    };

    [position player, [[QCLASS(firewood), selectRandom [1, 2]]], [[QCLASS(woodenlog), 1]], [[QCLASS(woodensticks), selectRandom [1, 2, 3, 4, 5]]]] call EFUNC(common,spawnLoot);

    {
        _x setDamage 1;
    } forEach _nearestTree;
},
{
    params ["_args"];
    _args params ["_nearestTree", "_soundDummy"];

    if (_soundDummy isNotEqualTo objNull) then {
        deleteVehicle _soundDummy;
    };

    [QEGVAR(common,tileText), "You stop cutting down the tree..."] call CBA_fnc_localEvent;
},
[_nearestTree, _soundDummy]
] call CBA_fnc_progressBar;
