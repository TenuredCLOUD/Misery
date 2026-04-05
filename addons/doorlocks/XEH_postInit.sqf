#include "script_component.hpp"

if (hasInterface) then {
    [
        "installLock_menu",
        localize LSTRING(Install),
        {[[QCLASS(lockKit)]] call EFUNC(common,hasItem) && {call FUNC(countDoors) params ["_doorCount", "_building", "_noLock"]; !_noLock && _doorCount > 0 && !isNull _building && isNil {_building getVariable QGVAR(doorPin)}}},
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            GVAR(pinMode) = 0;
            [] call FUNC(installLocks);
        },
        "",
        QPATHTOEF(icons,data\key_round_ca.paa),
        ""
    ] call EFUNC(actions,addAction);

    [
        "unlockDoors_menu",
        localize LSTRING(Unlock),
        {call FUNC(countDoors) params ["_doorCount", "_building"]; _doorCount > 0 && !isNull _building && (_building getVariable [QGVAR(doorsLocked), false])},
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            GVAR(pinMode) = 1;
            [] call FUNC(promptPin);
        },
        "",
        QPATHTOEF(icons,data\door_open_ca.paa),
        ""
    ] call EFUNC(actions,addAction);

    [
        "lockDoors_menu",
        localize LSTRING(Lock),
        {call FUNC(countDoors) params ["_doorCount", "_building"]; _doorCount > 0 && !isNull _building && !(_building getVariable [QGVAR(doorsLocked), false]) && {!isNil {_building getVariable QGVAR(doorPin)}}},
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            GVAR(pinMode) = 1;
            [] call FUNC(promptPin);
        },
        "",
        QPATHTOEF(icons,data\door_closed_locked_ca.paa),
        ""
    ] call EFUNC(actions,addAction);
};

if (isServer) then {
    [{
        call FUNC(applyBuildingStates);
    }, [], 1] call CBA_fnc_waitAndExecute;

    if (GVAR(areas) isNotEqualTo "[]") then {
        [{CBA_missionTime > 1}, {
            call FUNC(checkAreas);
        }, []] call CBA_fnc_waitUntilAndExecute;
    };
};
