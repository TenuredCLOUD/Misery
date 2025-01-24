#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Artifact dropper for Halek's Phantoms (Remnant mod)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_compat_remnant_fnc_drops;
 *
*/

addMissionEventHandler ["EntityKilled", {
params ["_killed", "_killer"];
if (_killed isKindOf "myst_phantom_hidden_f" || _killed isKindOf "myst_phantom_naked_f") then {
if ((random 100) > GVAR(dropChance)) exitWith {};
[getPosATL _killed, [[selectRandom [MACRO_ARTIFACTS], 1]]] call EFUNC(common,spawnLoot)
};
    }];
