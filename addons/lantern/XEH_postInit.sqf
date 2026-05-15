#include "script_component.hpp"

if (isServer) then {

    private _lanternBatteries = [
        QGVAR(lantern_menu),
        "Add 9v battery to lantern",
        QPATHTOEF(icons,data\battery_charging_ca.paa),
        {
            call FUNC(batteries);
        },
        {
            [[QCLASS(9vBattery), QCLASS(lantern_NoBattery)]] call EFUNC(common,hasItem)
        }
    ] call ACEFUNC(interact_menu,createAction);

    [player, 1, [QUOTE(ACE_SelfActions)], _lanternBatteries] call ACEFUNC(interact_menu,addActionToObject);

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
                _lantern setVariable [QGRADGVAR(persistence,isExcluded), true, true];
                [_lantern, [_unit, [-0.17, -0.14, -0.06], "Pelvis", true]] remoteExec ["attachTo", [0, -2] select isDedicated, _lantern];
                _unit setVariable [QGVAR(state), _lantern, true];
            };
        };
    }];

    // Safety fallback for auto-removal of lanterns if still active (on load / reload)
    [{!isNull player && !isNull findDisplay 46}, {
        if ([[QCLASS(lantern_On)]] call EFUNC(common,hasItem)) then {
            if (!isNil {player getVariable [QGVAR(state), nil]}) then {
                private _lantern = player getVariable [QGVAR(state), nil];

                [_lantern] remoteExec ["deleteVehicle", [0, -2] select isDedicated, _lantern];

                [player, [QCLASS(lantern_On), QCLASS(lantern_Off)], false] call EFUNC(common,switchPowerState);

                player setVariable [QGVAR(state), nil, true];
            } else {
                // Fallback for reloader issues
                [player, [QCLASS(lantern_On), QCLASS(lantern_Off)], false] call EFUNC(common,switchPowerState);
            };
        };
    }, []] call CBA_fnc_waitUntilAndExecute;
};

