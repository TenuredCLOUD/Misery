#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * WoodAxe usage
 *
 * Arguments:
 * 0: Found <BOOL>
 * 1: Tree <OBJECT>
 * 2: Damaged <BOOL>
 * 3: Has Axe <BOOL>
 *
 * Return Value:
 * None
 *
 * [] call misery_forestry_fnc_axeAction;
 *
*/

params ["_found", "_tree"];

private _hasAxe = [[QCLASS(woodaxe), MACRO_AXES]] call EFUNC(common,hasItem);

if !(_found) exitWith {
    [QEGVAR(common,tileText), format [localize LSTRING(NeedTreeChopping)]] call CBA_fnc_localEvent;
};

if !(_hasAxe) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(NoAxeForWoodNoti)] call CBA_fnc_localEvent;
};

if (currentWeapon ACE_player isNotEqualTo "") then {
    [ACE_player] call ACEFUNC(weaponselect,putWeaponAway);
};

private _soundDummy = "Land_HelipadEmpty_F" createVehicle (getPosWorld ACE_player);
_soundDummy attachTo [ACE_player, [0, 0, 0], "Pelvis"];

_soundDummy say3D [QCLASS(audio_sound_chopWood), 500];

[localize LSTRING(ChoppingProgress),
15,
{_found && _hasAxe},
{
    params ["_args"];
    _args params ["_tree", "_soundDummy"];

    if (_soundDummy isNotEqualTo objNull) then {
        deleteVehicle _soundDummy;
    };

    [ACE_player, QCLASS(woodensticks), selectRandom [1, 2, 3, 4, 5]] call EFUNC(common,addItem);
    [ACE_player, QCLASS(firewood), selectRandom [1, 2]] call EFUNC(common,addItem);
    [ACE_player, QCLASS(woodenlog), true] call CBA_fnc_addItem;

    _tree setDamage 1;
},
{
    params ["_args"];
    _args params ["_tree", "_soundDummy"];

    if (_soundDummy isNotEqualTo objNull) then {
        deleteVehicle _soundDummy;
    };

    [QEGVAR(common,tileText), localize LSTRING(StopCutting)] call CBA_fnc_localEvent;
},
[_tree, _soundDummy]
] call CBA_fnc_progressBar;
