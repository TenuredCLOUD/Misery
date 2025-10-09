#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Wood foraging
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_forestry_fnc_forageTreeAction;
 *
*/

[player] call EFUNC(common,nearTree) params ["_found", "_nearestTree", "_damaged", "_hasAxe", "_hasSaw"];

if !(_found) exitWith {
    [QEGVAR(common,tileText), format ["You need to be near a tree to gather wood..."]] call CBA_fnc_localEvent;
};

if (_damaged) exitWith {
    [QEGVAR(common,tileText), format ["Tree has fallen, doesn't have anymore wood..."]] call CBA_fnc_localEvent;
};

if (GVAR(gatheredPositions) findIf {_x distance getPosATL player < 2.5} isNotEqualTo -1) exitWith {
    [QEGVAR(common,tileText), "This tree's dead wood has been gathered. The remaining wood can be gathered by cutting it down..."] call CBA_fnc_localEvent;
};

if (currentWeapon player isNotEqualTo "") then {
    player action ["SWITCHWEAPON", player, player, -1];
};

private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position player);
_soundDummy attachTo [player, [0, 0, 0], "Pelvis"];

_soundDummy say3D [QCLASS(audio_sound_gatheringFirewood), 25];

["Gathering wood...",
60,
{[player] call EFUNC(common,nearTree) params ["_found", "", "", "", ""]; _found},
{
    params ["_args"];
    _args params ["_nearestTree", "_soundDummy"];

    if (_soundDummy isNotEqualTo objNull) then {
        deleteVehicle _soundDummy;
    };

    [position player, [[QCLASS(woodensticks), selectRandom [1, 2, 3, 4, 5]]]] call EFUNC(common,spawnLoot);

    private _position = getPosATL player;

    // Check if position is already cached (within 2.5 meters)
    if (GVAR(gatheredPositions) findIf {_x distance _position < 2.5} isEqualTo -1) then {

        GVAR(gatheredPositions) pushBack _position;

        publicVariable QGVAR(gatheredPositions);

        [QUOTE(COMPONENT_BEAUTIFIED), format ["Cached position %1 for gathered wood", _position]] call EFUNC(common,debugMessage);
    };
},
{
    params ["_args"];
    _args params ["_nearestTree", "_soundDummy"];

    if (_soundDummy isNotEqualTo objNull) then {
        deleteVehicle _soundDummy;
    };

    [QEGVAR(common,tileText), "You stop gathering wood..."] call CBA_fnc_localEvent;
},
[_nearestTree, _soundDummy]
] call CBA_fnc_progressBar;
