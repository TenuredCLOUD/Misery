#include "script_component.hpp"

[QGVAR(deleteLantern), {
    params ["_lantern"];
    if (alive _lantern) then {
        deleteVehicle _lantern;
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(attachLantern), {
    params ["_lantern", "_attachParams"];
    _lantern attachTo _attachParams;

    // Since power component removes light from lanterns re-add it after its attached
    [{
        params ["_lantern"];
        _lantern switchLight "ON";
    }, [_lantern], 0.02] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;

if (isServer) then {

    private _lanternBatteries = [
        QGVAR(lantern_menu),
        localize LSTRING(Action),
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
                [QGVAR(deleteLantern), [_lantern]] call CBA_fnc_globalEvent;
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
                [QGVAR(deleteLantern), [_lantern]] call CBA_fnc_globalEvent;
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
                [QGVAR(attachLantern), [_lantern, [_unit, [-0.17, -0.14, -0.06], "Pelvis", true]]] call CBA_fnc_globalEvent;
                _unit setVariable [QGVAR(state), _lantern, true];
            };
        };
    }];

    // Safety fallback for auto-removal of lanterns if still active (on load / reload)
    [{!isNull player && !isNull findDisplay 46}, {
        if ([[QCLASS(lantern_On)]] call EFUNC(common,hasItem)) then {
            if (!isNil {player getVariable [QGVAR(state), nil]}) then {
                private _lantern = player getVariable [QGVAR(state), nil];

                [QGVAR(deleteLantern), [_lantern]] call CBA_fnc_globalEvent;

                [player, [QCLASS(lantern_On), QCLASS(lantern_Off)], false] call EFUNC(common,switchPowerState);

                player setVariable [QGVAR(state), nil, true];
            } else {
                // Fallback for reloader issues
                [player, [QCLASS(lantern_On), QCLASS(lantern_Off)], false] call EFUNC(common,switchPowerState);
            };
        };
    }, []] call CBA_fnc_waitUntilAndExecute;
};

