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

//Enforce code runs on Server ONLY:
if (isServer) then {

addMissionEventHandler ["EntityKilled",

{

params ["_killed", "_killer"];
if (_killed isKindOf "myst_phantom_hidden_f" || _killed isKindOf "myst_phantom_naked_f") then {


if((random 100) > Miseryphantdropchance) exitWith{};

_unit = _this select 0;
_uniform = uniformContainer _unit;
_wh = "groundWeaponHolder" createVehicle (getpos _unit);
_wh addItemCargoGlobal [

[
"Misery_artifact01",
"Misery_artifact02",
"Misery_artifact03",
"Misery_artifact04",
"Misery_artifact05",
"Misery_artifact06",
"Misery_artifact07",
"Misery_artifact08",
"Misery_artifact09",
"Misery_artifact10"
]call BIS_fnc_selectRandom,1];

};
    }];
        };
