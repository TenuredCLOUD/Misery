#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Converts player to zombie once infection level is high enough
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_compat_wzc_fnc_convertToZombie;
 *
*/

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "_infection", "", "", "", "", "", "_funds"];

[] call ACEFUNC(common,player) params ["_player"];

if (_infection >= 1) then {

    // 75/25 split for zombification after infection reaches 1 preventing immediate zombification
    if ([75] call EFUNC(common,rollChance)) exitWith {};

    if (isNull _player || !alive _player) exitWith {};

    // Handle old body on death
    [QGVAR(zombifiedEvent), "Killed", {
        params ["_unit", "_killer", "_instigator", "_useEffects", "_shot", "_real"];

        hideObjectGlobal _unit;
    }] call CBA_fnc_addBISPlayerEventHandler;

    [QGVAR(convertToZed), [_player, _funds]] call CBA_fnc_serverEvent;

    [_player] call ACEFUNC(medical_status,setDead);
};


