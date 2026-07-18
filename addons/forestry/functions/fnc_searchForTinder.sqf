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

[ACE_player] call EFUNC(common,nearTree) params ["_found", "_nearestTree", "_damaged", "_hasAxe", "_hasSaw"];

if !(_found) exitWith {
    [QEGVAR(common,tileText), format [localize LSTRING(NearTreeTinder)]] call CBA_fnc_localEvent;
};

if (GVAR(tinderPositions) findIf {_x distance getPosATL ACE_player < 2.5} isNotEqualTo -1) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(AreaSearched)] call CBA_fnc_localEvent;
};

if (currentWeapon ACE_player isNotEqualTo "") then {
    [ACE_player] call ACEFUNC(weaponselect,putWeaponAway);
};

private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position ACE_player);
_soundDummy attachTo [ACE_player, [0, 0, 0], "Pelvis"];

_soundDummy say3D [QCLASS(audio_sound_dryGrass), 25];

[localize LSTRING(SearchingTinder),
15,
{[ACE_player] call EFUNC(common,nearTree) params ["_found", "", "", "", ""]; _found},
{
    params ["_args"];
    _args params ["_nearestTree", "_soundDummy"];

    if (_soundDummy isNotEqualTo objNull) then {
        deleteVehicle _soundDummy;
    };

    if ([50] call EFUNC(common,rollChance)) then {
        [QEGVAR(common,tileText), localize LSTRING(FoundTinder)] call CBA_fnc_localEvent;
        [ACE_player, QCLASS(tinder)] call CBA_fnc_addItem;
    } else {
        [QEGVAR(common,tileText), localize LSTRING(FoundNothing)] call CBA_fnc_localEvent;
    };

    private _position = getPosWorld ACE_player;

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

    [QEGVAR(common,tileText), localize LSTRING(StopSearchingTinder)] call CBA_fnc_localEvent;
},
[_nearestTree, _soundDummy]
] call CBA_fnc_progressBar;
