#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Chainsaw usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_forestry_fnc_sawAction;
 *
*/

[player] call EFUNC(common,nearTree) params ["_found", "_nearestTree", "_damaged", "_hasAxe", "_hasSaw"];

if !(_found) exitWith {
    [QEGVAR(common,tileText), format ["You need to be near a tree to start cutting wood..."]] call CBA_fnc_localEvent;
};

if (_damaged) exitWith {
    [QEGVAR(common,tileText), format ["Tree has fallen, doesn't have anymore wood..."]] call CBA_fnc_localEvent;
};

if !(_hasSaw) exitWith {
    [QEGVAR(common,tileText), format ["You need a chainsaw with fuel to start cutting wood..."]] call CBA_fnc_localEvent;
};

if (currentWeapon player isNotEqualTo "") then {
    player action ["SWITCHWEAPON", player, player, -1];
};

private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position player);
_soundDummy attachTo [player, [0, 0, 0], "Pelvis"];

_soundDummy say3D [QCLASS(audio_sound_chainsaw2), 500];

player setVariable [QGVAR(cuttingWood), true];

call FUNC(chainsawFuelDecrement);

["Sawing tree...",
45,
{[player] call EFUNC(common,nearTree) params ["_found", "", "", "", "_hasSaw"]; _found && _hasSaw},
{
    params ["_args"];
    _args params ["_nearestTree", "_soundDummy"];

    if (_soundDummy isNotEqualTo objNull) then {
        deleteVehicle _soundDummy;
    };

    [position player, [[QCLASS(firewood), selectRandom [1, 2, 3, 4, 5]]], [[QCLASS(woodenlog), selectRandom [1, 2, 3]]], [[QCLASS(woodensticks), selectRandom [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]]]] call EFUNC(common,spawnLoot);

    {
        _x setDamage 1;
    } forEach _nearestTree;

    player setVariable [QGVAR(cuttingWood), nil];
},
{
    params ["_args"];
    _args params ["_nearestTree", "_soundDummy"];

    if (_soundDummy isNotEqualTo objNull) then {
        deleteVehicle _soundDummy;
    };

    [QEGVAR(common,tileText), "You stop sawing the tree..."] call CBA_fnc_localEvent;

    player setVariable [QGVAR(cuttingWood), nil];
},
[_nearestTree, _soundDummy]
] call CBA_fnc_progressBar;
