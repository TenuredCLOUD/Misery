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

[ACE_player] call EFUNC(common,nearTree) params ["_found", "_nearestTree", "_damaged", "_hasAxe", "_hasSaw"];

if !(_found) exitWith {
    [QEGVAR(common,tileText), format [localize LSTRING(NearFoliage)]] call CBA_fnc_localEvent;
};

if (GVAR(digPositions) findIf {_x distance getPosATL ACE_player < 2.5} isNotEqualTo -1) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(AreaDug)] call CBA_fnc_localEvent;
};

ACE_player playActionNow "Crouch";

if (currentWeapon ACE_player isNotEqualTo "") then {
    [ACE_player] call ACEFUNC(weaponselect,putWeaponAway);
};

[localize LSTRING(DiggingWorms),
15,
{[ACE_player] call EFUNC(common,nearTree) params ["_found", "", "", "", ""]; _found},
{
    if ([70] call EFUNC(common,rollChance)) then {
        [QEGVAR(common,tileText), localize LSTRING(FoundWorms)] call CBA_fnc_localEvent;
        [ACE_player, QCLASS(worms)] call CBA_fnc_addItem;
    } else {
        [QEGVAR(common,tileText), localize LSTRING(FoundNothing)] call CBA_fnc_localEvent;
    };

    private _position = getPosWorld ACE_player;

    // Check if position is already cached (within 2.5 meters)
    if (GVAR(digPositions) findIf {_x distance _position < 2.5} isEqualTo -1) then {

        GVAR(digPositions) pushBack _position;

        publicVariable QGVAR(digPositions);

        [QUOTE(COMPONENT_BEAUTIFIED), format ["Cached position %1 for worms", _position]] call EFUNC(common,debugMessage);
    };
},
{
    [QEGVAR(common,tileText), localize LSTRING(StopDigging)] call CBA_fnc_localEvent;
},
[]
] call CBA_fnc_progressBar;
