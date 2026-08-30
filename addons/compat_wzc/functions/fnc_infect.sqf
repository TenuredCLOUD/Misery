#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Infection system with IMS HIT EH
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

[] call ACEFUNC(common,player) params ["_player"];

[_player, "WBK_IMS_Hit", {
    params ["_unit","_damage","_enemy"];

    // Must be a player, on foot being attacked by a zombie
    if !(isPlayer _unit || isNull objectParent _unit) exitWith {};

    // Only register infection from spawner regular zombies
    if (typeOf _enemy isEqualTo "WBK_C_ExportClass") then {
        if ([GVAR(infectionChance)] call EFUNC(common,rollChance)) exitWith {
            [0.1, "infection"] call EFUNC(common,addStatusModifier);
        };
    };
}] call BIS_fnc_addScriptedEventHandler;
