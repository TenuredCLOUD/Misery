#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Infection system with CBA HIT EH
 * Processes Zombie infection transmission
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_compat_wzc_fnc_infect;
 *
*/

[player, "WBK_IMS_Hit", {
    params ["_unit","_damage","_enemy"];

    // Must be a player, on foot being attacked by a zombie.
    if !(isPlayer _unit || isNull objectParent _unit || _enemy isKindOf "WBK_C_ExportClass") exitWith {};

    if ([GVAR(infectionChance)] call EFUNC(common,rollChance)) exitWith {
        [0.01, "infection"] call EFUNC(common,addStatusModifier);
    };
}] call BIS_fnc_addScriptedEventHandler;
