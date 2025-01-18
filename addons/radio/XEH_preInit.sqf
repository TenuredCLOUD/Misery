#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

//Auto Radio changes after player killed:
// if (((count (entities QCLASS(RadioSettings")) > 0) && isServer) then {
// addMissionEventHandler ["EntityKilled", {
//   params ["_killed", "_killer", "_instigator"];
//   if (_killed isEqualTo player) then {
//     if ((_this select 0) getVariable [QCLASS(HHRadio", true]) then {
//         (_this select 0) setVariable [QCLASS(HHRadio", false,true];
//             };
//           };
//     }];
// };

// //Kill Audio loop when dropping active Radio
// if (((count (entities QCLASS(RadioSettings")) > 0) && hasInterface) then {
// player addEventHandler ["Put", {
// params ["_unit", "_container", "_item"];
// if (_item isEqualTo QCLASS(PortableradioON") then {
// if ((_this select 0) getVariable [QCLASS(HHRadio", true]) then {
//     (_this select 0) setVariable [QCLASS(HHRadio", false,true];
//             };
//         };
//     }];
// };

ADDON = true;
