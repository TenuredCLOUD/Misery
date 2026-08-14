#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Wood foraging
 *
 * Arguments:
 * 0: Found <BOOL>
 * 1: Tree <OBJECT>
 *
 * Return Value:
 * None
 *
 * [] call misery_forestry_fnc_forageTreeAction;
 *
*/

params ["_found", "_tree"];

if !(_found) exitWith {
    [QEGVAR(common,tileText), format [localize LSTRING(NeedTreeGathering)]] call CBA_fnc_localEvent;
};

if (GVAR(gatheredPositions) findIf {_x distance getPosATL ACE_player < 2.5} isNotEqualTo -1) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(DeadGathered)] call CBA_fnc_localEvent;
};

if (currentWeapon ACE_player isNotEqualTo "") then {
    [ACE_player] call ACEFUNC(weaponselect,putWeaponAway);
};

private _soundDummy = "Land_HelipadEmpty_F" createVehicle (getPosWorld ACE_player);
_soundDummy attachTo [ACE_player, [0, 0, 0], "Pelvis"];

_soundDummy say3D [QCLASS(audio_sound_gatheringFirewood), 25];

[localize LSTRING(GatheringProgress),
60,
{[ACE_player] call EFUNC(common,nearTree) params ["_found", "", "", "", ""]; _found},
{
    params ["_args"];
    _args params ["_tree", "_soundDummy"];

    if (_soundDummy isNotEqualTo objNull) then {
        deleteVehicle _soundDummy;
    };

    [ACE_player, QCLASS(woodensticks), selectRandom [1, 2, 3, 4, 5]] call EFUNC(common,addItem);

    private _position = getPosWorld ACE_player;

    // Check if position is already cached (within 2.5 meters)
    if (GVAR(gatheredPositions) findIf {_x distance _position < 2.5} isEqualTo -1) then {

        GVAR(gatheredPositions) pushBack _position;

        publicVariable QGVAR(gatheredPositions);

        [QUOTE(COMPONENT_BEAUTIFIED), format ["Cached position %1 for gathered wood", _position]] call EFUNC(common,debugMessage);
    };
},
{
    params ["_args"];
    _args params ["_tree", "_soundDummy"];

    if (_soundDummy isNotEqualTo objNull) then {
        deleteVehicle _soundDummy;
    };

    [QEGVAR(common,tileText), localize LSTRING(StopGathering)] call CBA_fnc_localEvent;
},
[_tree, _soundDummy]
] call CBA_fnc_progressBar;
