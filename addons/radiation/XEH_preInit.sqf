#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

#include "initSettings.inc.sqf"

/*
//Artifact exposure+:
if (MiseryEnhartifacts && hasInterface) then {
[] call "\z\misery\addons\artifacts\functions\fnc_Artifactexposure.sqf";
};

if ((MiseryRadZoneInit) && hasInterface) then {
[] call "\z\misery\addons\radiation\functions\fnc_RadZoneinit.sqf";
};

//Radiation Exp+:
if (MiseryEnhrads && hasInterface) then {
[] call "\z\misery\addons\radiation\functions\fnc_radiationex.sqf";

// //Reactivate Geiger if picking up active one:
// player addEventHandler ["Take", {
// params ["_unit", "_container", "_item"];
// if (_item == "Misery_personalgeiger") then {
// if (isNil {(_this select 0) getVariable "GeigerON"}) then {
// (_this select 0) setVariable ["GeigerON", true,true];
//         };
//     };
// }];
// //Kill Detection var for Geiger if you drop it:
// player addEventHandler ["Put", {
// params ["_unit", "_container", "_item"];
// if (_item == "Misery_personalgeiger") then {
// if ((_this select 0) getVariable ["GeigerON", true]) then {
//         (_this select 0) setVariable ["GeigerON", nil, true];
//             };
//         };
//     }];
};
*/

ADDON = true;
