#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

//Auto Radio changes after player killed:
// if (((count (entities "Misery_RadioSettings")) > 0) && isServer) then {
// addMissionEventHandler ["EntityKilled", {
//   params ["_killed", "_killer", "_instigator"];
//   if (_killed == player) then {
//     if ((_this select 0) getVariable ["Misery_HHRadio", true]) then {
//         (_this select 0) setVariable ["Misery_HHRadio", false,true];
//             };
//           };
//     }];
// };

// //Kill Audio loop when dropping active Radio
// if (((count (entities "Misery_RadioSettings")) > 0) && hasInterface) then {
// player addEventHandler ["Put", {
// params ["_unit", "_container", "_item"];
// if (_item == "Misery_PortableradioON") then {
// if ((_this select 0) getVariable ["Misery_HHRadio", true]) then {
//     (_this select 0) setVariable ["Misery_HHRadio", false,true];
//             };
//         };
//     }];
// };

ADDON = true;
