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
_wh = "groundWeaponHolder" createVehicle (getPos _unit);
_wh addItemCargoGlobal [

[
QCLASS(artifact01),
QCLASS(artifact02),
QCLASS(artifact03),
QCLASS(artifact04),
QCLASS(artifact05),
QCLASS(artifact06),
QCLASS(artifact07),
QCLASS(artifact08),
QCLASS(artifact09),
QCLASS(artifact10)
]call BIS_fnc_selectRandom,1];

};
    }];
        };
