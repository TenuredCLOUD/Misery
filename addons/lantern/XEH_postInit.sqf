#include "script_component.hpp"

// Blacklist the camping lantern for GRAD persistence
if (isServer) then {
    [
        "lantern_menu",
        "Add 9v battery to lantern",
        {[[QCLASS(9vBattery), QCLASS(lantern_NoBattery)]] call EFUNC(common,hasItem)},
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            call FUNC(batteries);
        },
        "",
        QPATHTOEF(icons,data\battery_charging_ca.paa),
        ""
    ] call EFUNC(actions,addAction);

    // if (!isNil "grad_persistence_blacklist") then {
    //     if ((grad_persistence_blacklist find (toLower "Land_Camping_Light_F") isEqualTo -1) && (grad_persistence_blacklist find (toUpper "Land_Camping_Light_F") isEqualTo -1)) then {
    //         ["Land_Camping_Light_F"] call grad_persistence_fnc_blacklistClasses;
    //         [QUOTE(COMPONENT_BEAUTIFIED), "GRAD Persistence detected, Adding lantern object class to blacklist for saving / reloading.."] call EFUNC(common,debugMessage);
    //     };
    // };

    addMissionEventHandler ["EntityKilled", {
        params ["_killed", "_killer", "_instigator"];
        if (_killed isEqualTo player && {local _killed}) then {
            if (!isNil {_killed getVariable [QGVAR(state), nil]}) then {
                private _lantern = _killed getVariable [QGVAR(state), nil];
                [_lantern] remoteExec ["deleteVehicle", [0, -2] select isDedicated, _lantern];
                _killed setVariable [QGVAR(state), nil, true];
            };
        };
    }];
};

if (hasInterface) then {
    call FUNC(managePower);

    player addEventHandler ["Put", {
        params ["_unit", "_container", "_item"];
        if (_item isEqualTo QCLASS(lantern_On) && {local _unit}) then {
            if (!isNil {_unit getVariable [QGVAR(state), nil]}) then {
                private _lantern = _unit getVariable [QGVAR(state), nil];
                [_lantern] remoteExec ["deleteVehicle", [0, -2] select isDedicated, _lantern];
                _unit setVariable [QGVAR(state), nil, true];
            };
        };
    }];

    player addEventHandler ["Take", {
        params ["_unit", "_container", "_item"];
        if (_item isEqualTo QCLASS(lantern_On) && {local _unit}) then {
            if (isNil {_unit getVariable [QGVAR(state), nil]}) then {
                private _lantern = "Land_Camping_Light_F" createVehicle position _unit;
                if (!isNil "grad_persistence_blacklist") then {
                    [_lantern] call grad_persistence_fnc_blacklistObjects;
                };
                [_lantern, [_unit, [-0.17, -0.14, -0.06], "Pelvis", true]] remoteExec ["attachTo", [0, -2] select isDedicated, _lantern];
                _unit setVariable [QGVAR(state), _lantern, true];
            };
        };
    }];
};
