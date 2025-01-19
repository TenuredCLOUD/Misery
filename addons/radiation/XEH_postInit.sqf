#include "script_component.hpp"

["CBA_settingsInitialized", {
    if (isServer) then {
        call FUNC(inArea);
    };

if (hasInterface) then {
[QGVAR(radiationEvent), FUNC(process)] call CBA_fnc_addEventHandler;

if (GVAR(enhancedExposure)) then {
[] call FUNC(exposure);
};

//Reactivate Geiger if picking up active one:
player addEventHandler ["Take", {
params ["_unit", "_container", "_item"];
if (_item isEqualTo QCLASS(geiger_On)) then {
if (isNil {(_this select 0) getVariable "GeigerON"}) then {
(_this select 0) setVariable ["GeigerON", true,true];
        };
    };
}];

//Kill Detection var for Geiger if you drop it:
player addEventHandler ["Put", {
params ["_unit", "_container", "_item"];
if (_item isEqualTo QCLASS(geiger_On)) then {
if ((_this select 0) getVariable ["GeigerON", true]) then {
        (_this select 0) setVariable ["GeigerON", nil, true];
            };
        };
    }];
};

}] call CBA_fnc_addEventHandler;
