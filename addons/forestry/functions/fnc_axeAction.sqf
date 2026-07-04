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

params ["_found", "_tree", "_damaged", "_hasAxe"];

if !(_found) exitWith {
    [QEGVAR(common,tileText), format [localize LSTRING(NeedTreeChopping)]] call CBA_fnc_localEvent;
};

if (_damaged) exitWith {
    [QEGVAR(common,tileText), format [localize LSTRING(TreeEmpty)]] call CBA_fnc_localEvent;
};

if !(_hasAxe) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(NoAxeForWoodNoti)] call CBA_fnc_localEvent;
};

if (currentWeapon player isNotEqualTo "") then {
    [player] call ACEFUNC(weaponselect,putWeaponAway);
};

private _soundDummy = "Land_HelipadEmpty_F" createVehicle (getPosWorld player);
_soundDummy attachTo [player, [0, 0, 0], "Pelvis"];

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

    private _markerPos = getPosATL player;
    private _playerName = name player;
    private _markerName = format ["%1_%2_%3", CBA_missionTime, _playerName, random 100];
    private _marker = createMarkerLocal [_markerName, _markerPos];
    _marker setMarkerShapeLocal "ELLIPSE";
    _marker setMarkerSizeLocal [2.5, 2.5];
    _marker setMarkerAlphaLocal 0;

    [[_marker, true] call CBA_fnc_randPosArea, [[]], [[]], [[QCLASS(woodensticks), selectRandom [1, 2, 3, 4, 5]]]] call EFUNC(common,spawnLoot);
    [[_marker, true] call CBA_fnc_randPosArea, [[]], [[]], [[QCLASS(firewood), selectRandom [1, 2]]]] call EFUNC(common,spawnLoot);
    [[_marker, true] call CBA_fnc_randPosArea, [[]], [[]], [[QCLASS(woodenlog), 1]]] call EFUNC(common,spawnLoot);

    _tree setDamage 1;

    [{
        deleteMarkerLocal _this;
    }, _marker, 1] call CBA_fnc_waitAndExecute;
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
