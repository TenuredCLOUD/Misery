#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

/*
//Headlamp object blacklister (auto) for GRAD persistence:
if (isServer) then {
if (!isNil "grad_persistence_blacklist") then {
    if ((grad_persistence_blacklist find (toLower "#lightpoint") == -1) && (grad_persistence_blacklist find (toUpper "#lightpoint") == -1)) then {
        ["#lightpoint"] call grad_persistence_fnc_blacklistClasses;
        if (EGVAR(common,debug)) then {systemChat "[Misery Headlamp] GRAD Persistence detected, Adding light object class to blacklist for saving / reloading..."};
        };
    };
};

// Auto headlamp termination after player killed:
if (isServer) then {
    addMissionEventHandler ["EntityKilled", {
        params ["_killed", "_killer", "_instigator"];
        if (_killed == player) then {
            if (!isNil {_killed getVariable QCLASS(headlampStatus)}) then {
                private _headlamp = _killed getVariable QCLASS(headlampStatus);
                deleteVehicle _headlamp; // Delete the light
                _killed setVariable [QCLASS(headlampStatus), nil, true];
            };
        };
    }];
};

// Terminate lightsource when dropping active headlamp:
if (hasInterface) then {
    player addEventHandler ["Put", {
        params ["_unit", "_container", "_item"];
        if (_item == QCLASS(headlamp_On)) then {
            if (!isNil {_unit getVariable QCLASS(headlampStatus)}) then {
                private _headlamp = _unit getVariable QCLASS(headlampStatus);
                deleteVehicle _headlamp; // Delete the light
                _unit setVariable [QCLASS(headlampStatus), nil, true];
            };
        };
    }];
};

// Reactivate lightsource when picking up active headlamp:
if (hasInterface) then {
    player addEventHandler ["Take", {
        params ["_unit", "_container", "_item"];
        if (_item == QCLASS(headlamp_On)) then {
            // If the player doesn't already have an active headlamp...
            if (isNil {_unit getVariable QCLASS(headlampStatus)}) then {
                // Create the light and attach it to the player.
                private _headlamp = "#lightpoint" createVehicle position _unit;
                _headlamp setLightBrightness 0.15; // Set brightness
                _headlamp setLightColor [1, 1, 1]; // Set color to white
                _headlamp setLightAmbient [1, 1, 1]; // Set ambient light color to white
                _headlamp setLightAttenuation [0.5, 0, 0, 1]; // Set attenuation

                _headlamp attachTo [_unit, [0,0,0], "pilot"];
                _headlamp setDir (direction _unit);

                // Store the headlamp in the player's namespace so we can access it later.
                _unit setVariable [QCLASS(headlampStatus), _headlamp, true];
            };
        };
    }];
};
*/

ADDON = true;
