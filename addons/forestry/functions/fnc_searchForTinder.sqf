#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Search for tinder
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_forestry_fnc_searchForTinder
 *
*/

[player] call EFUNC(common,nearTree) params ["_found", "_nearestTree", "_damaged", "_hasAxe", "_hasSaw"];

if !(_found) exitWith {
    [QEGVAR(common,tileText), format ["You need to be near a tree to search for tinder..."]] call CBA_fnc_localEvent;
};

if (GVAR(tinderPositions) findIf {_x distance getPosATL player < 2.5} isNotEqualTo -1) exitWith {
    [QEGVAR(common,tileText), "This area has already been searched..."] call CBA_fnc_localEvent;
};

if (currentWeapon player isNotEqualTo "") then {
    player action ["SWITCHWEAPON", player, player, -1];
};

private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position player);
_soundDummy attachTo [player, [0, 0, 0], "Pelvis"];

_soundDummy say3D [QCLASS(audio_sound_dryGrass), 25];

["Searching for tinder...",
15,
{[player] call EFUNC(common,nearTree) params ["_found", "", "", "", ""]; _found},
{
    params ["_args"];
    _args params ["_nearestTree", "_soundDummy"];

    if (_soundDummy isNotEqualTo objNull) then {
        deleteVehicle _soundDummy;
    };

    if ([50] call EFUNC(common,rollChance)) then {
        [QEGVAR(common,tileText), "You found some tinder..."] call CBA_fnc_localEvent;
        [player, QCLASS(tinder)] call CBA_fnc_addItem;
    } else {
        [QEGVAR(common,tileText), "You didn't find anything..."] call CBA_fnc_localEvent;
    };

    private _position = getPosATL player;

    // Check if position is already cached (within 2.5 meters)
    if (GVAR(tinderPositions) findIf {_x distance _position < 2.5} isEqualTo -1) then {

        GVAR(tinderPositions) pushBack _position;

        publicVariable QGVAR(tinderPositions);

        [QUOTE(COMPONENT_BEAUTIFIED), format ["Cached position %1 for tinder", _position]] call EFUNC(common,debugMessage);
    };
},
{
    params ["_args"];
    _args params ["_nearestTree", "_soundDummy"];

    if (_soundDummy isNotEqualTo objNull) then {
        deleteVehicle _soundDummy;
    };

    [QEGVAR(common,tileText), "You stop searching for tinder..."] call CBA_fnc_localEvent;
},
[_nearestTree, _soundDummy]
] call CBA_fnc_progressBar;
