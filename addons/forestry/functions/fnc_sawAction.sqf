#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Chainsaw usage
 *
 * Arguments:
 * 0: Found <BOOL>
 * 1: Tree <OBJECT>
 * 2: Damaged <BOOL>
 * 3: Has Chainsaw <BOOL>
 *
 * Return Value:
 * None
 *
 * [] call misery_forestry_fnc_sawAction;
 *
*/

params ["_found", "_tree", "_damaged", "_hasSaw"];

if !(_found) exitWith {
    [QEGVAR(common,tileText), format [localize LSTRING(NeedTreeSawing)]] call CBA_fnc_localEvent;
};

if (_damaged) exitWith {
    [QEGVAR(common,tileText), format [localize LSTRING(TreeEmpty)]] call CBA_fnc_localEvent;
};

if !(_hasSaw) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(NoChainsaw)] call CBA_fnc_localEvent;
};

if (currentWeapon player isNotEqualTo "") then {
    [player] call ACEFUNC(weaponselect,putWeaponAway);
};

private _soundDummy = "Land_HelipadEmpty_F" createVehicle (getPosWorld player);
_soundDummy attachTo [player, [0, 0, 0], "Pelvis"];

_soundDummy say3D [QCLASS(audio_sound_chainsaw2), 500];

player setVariable [QGVAR(cuttingWood), true];

call FUNC(chainsawFuelDecrement);

[localize LSTRING(SawingProgress),
45,
{_found && _hasSaw},
{
    params ["_args"];
    _args params ["_tree", "_soundDummy"];

    if (_soundDummy isNotEqualTo objNull) then {
        deleteVehicle _soundDummy;
    };

    [getPosATL player, [[QCLASS(firewood), selectRandom [1, 2, 3, 4, 5]]], [[QCLASS(woodenlog), selectRandom [1, 2, 3]]], [[QCLASS(woodensticks), selectRandom [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]]]] call EFUNC(common,spawnLoot);

    _tree setDamage 1;

    player setVariable [QGVAR(cuttingWood), nil];
},
{
    params ["_args"];
    _args params ["_tree", "_soundDummy"];

    if (_soundDummy isNotEqualTo objNull) then {
        deleteVehicle _soundDummy;
    };

    [QEGVAR(common,tileText), localize LSTRING(StopSawing)] call CBA_fnc_localEvent;

    player setVariable [QGVAR(cuttingWood), nil];
},
[_tree, _soundDummy]
] call CBA_fnc_progressBar;
