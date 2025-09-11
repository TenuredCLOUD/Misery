#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Dig for worms action
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_forestry_fnc_digForWorms
 *
*/

[player] call EFUNC(common,nearTree) params ["_found", "_nearestTree", "_damaged", "_hasAxe", "_hasSaw"];

if !(_found) exitWith {
    [QEGVAR(common,tileText), format ["You need to be near foliage to search for worms..."]] call CBA_fnc_localEvent;
};

if (GVAR(digPositions) findIf {_x distance getPosATL player < 2.5} isNotEqualTo -1) exitWith {
    [QEGVAR(common,tileText), "This area has already been dug up..."] call CBA_fnc_localEvent;
};

player playActionNow "Crouch";

if (currentWeapon player isNotEqualTo "") then {
    player action ["SWITCHWEAPON", player, player, -1];
};

["Digging for worms...",
15,
{[player] call EFUNC(common,nearTree) params ["_found", "", "", "", ""]; _found},
{
    if (random 1 > 0.7) then {
        [QEGVAR(common,tileText), "You found some worms..."] call CBA_fnc_localEvent;
        [player, QCLASS(worms)] call CBA_fnc_addItem;
    } else {
        [QEGVAR(common,tileText), "You didn't find anything..."] call CBA_fnc_localEvent;
    };

    private _position = getPosATL player;

    // Check if position is already cached (within 2.5 meters)
    if (GVAR(digPositions) findIf {_x distance _position < 2.5} isEqualTo -1) then {

        GVAR(digPositions) pushBack _position;

        publicVariable QGVAR(digPositions);

        [QUOTE(COMPONENT_BEAUTIFIED), format ["Cached position %1 for worms", _position]] call EFUNC(common,debugMessage);
    };
},
{
    [QEGVAR(common,tileText), "You stop digging for worms..."] call CBA_fnc_localEvent;
},
[]
] call CBA_fnc_progressBar;
