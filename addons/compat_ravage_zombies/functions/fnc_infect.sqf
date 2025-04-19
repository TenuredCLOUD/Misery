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
 * [] call misery_compat_ravage_zombies_fnc_infect;
 *
*/
params ["_unit", "_source", "_damage", "_instigator"];

// Must be a player, on foot being attacked by a zombie.
if !(isPlayer _unit || isNull objectParent player || _instigator isKindOf "zombie") exitWith {};

if ((random 100) <= GVAR(chance)) exitWith {
    [0.01, "infection"] call EFUNC(common,addStatusModifier);
};

