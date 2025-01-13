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
 * [] call misery_phantoms_fnc_drops;
 *
*/

if (isServer) then {

addMissionEventHandler ["EntityKilled",{

params ["_killed", "_killer"];
if (_killed isKindOf "myst_phantom_hidden_f" || _killed isKindOf "myst_phantom_naked_f") then {

if((random 100) > GVAR(dropChance)) exitWith {};

_unit = _this select 0;
_uniform = uniformContainer _unit;
_wh = "groundWeaponHolder" createVehicle (getPos _unit);
_wh addItemCargoGlobal [selectRandom [MACRO_ARTIFACTS], 1];

};
    }];
        };
