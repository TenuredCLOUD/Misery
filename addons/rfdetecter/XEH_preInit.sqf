#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

#include "initSettings.inc.sqf"

/*
if (MiseryRFEMFacts && hasInterface) then {
if (EGVAR(common,dsa) && hasInterface) then {
private _gvars = ["dsaSpookBases", "dsaDevMutants", "dsaWebknightCreatures"];
{
waitUntil {!isNil _x}; // Check Gvar arrays every second
} forEach _gvars;
[] call "\z\misery\addons\rfdetector\functions\fnc_RFsyncLoop.sqf";
}else{
[] call "\z\misery\addons\rfdetector\functions\fnc_RFsyncLoop.sqf";
    };
};

// if (((count (entities QCLASS(RadioSettings")) > 0) && hasInterface) then {
// [] call "\z\misery\addons\framework\scripts\survival\Radio\RadiosyncLoop.sqf";
// };

//Auto Detector changes after player killed:
if (MiseryRFEMFacts && isServer) then {
addMissionEventHandler ["EntityKilled", {
  params ["_killed", "_killer", "_instigator"];
  if (_killed isEqualTo player) then {
    if ((_this select 0) getVariable [QCLASS(rfdetectorStatus), true]) then {
        (_this select 0) setVariable [QCLASS(rfdetectorStatus), false,true];
            };
          };
    }];
};

//Kill Audio loop when dropping active RF detector:
if (MiseryRFEMFacts && hasInterface) then {
player addEventHandler ["Put", {
params ["_unit", "_container", "_item"];
if (_item isEqualTo QCLASS(rfHighRange_On)) then {
if ((_this select 0) getVariable [QCLASS(rfdetectorStatus), true]) then {
    (_this select 0) setVariable [QCLASS(rfdetectorStatus), false,true];
            };
        };
    }];
};
*/

ADDON = true;
