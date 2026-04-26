#include "script_component.hpp"

if (hasInterface) then {
    private _installLock = [
        "installLock_ace",
        "Install Door Locks",
        QPATHTOEF(icons,data\key_round_ca.paa),
        {
            GVAR(pinMode) = 0;
            [] call FUNC(installLocks);
        },
        {
            [[QCLASS(lockKit)]] call EFUNC(common,hasItem) && {call FUNC(countDoors) params ["_doorCount", "_building", "_noLock"]; !_noLock && _doorCount > 0 && !isNull _building && isNil {_building getVariable QGVAR(doorPin)}}
        }
    ] call ACEFUNC(interact_menu,createAction);

    [player, 1, [QUOTE(ACE_SelfActions)], _installLock] call ACEFUNC(interact_menu,addActionToObject);

    private _unlockDoors = [
        "unlockDoors_ace",
        "Unlock Doors",
        QPATHTOEF(icons,data\door_open_ca.paa),
        {
            GVAR(pinMode) = 1;
            [] call FUNC(promptPin);
        },
        {
            call FUNC(countDoors) params ["_doorCount", "_building"]; _doorCount > 0 && !isNull _building && (_building getVariable [QGVAR(doorsLocked), false])
        }
    ] call ACEFUNC(interact_menu,createAction);

    [player, 1, [QUOTE(ACE_SelfActions)], _unlockDoors] call ACEFUNC(interact_menu,addActionToObject);

    private _lockDoors = [
        "lockDoors_ace",
        "Lock Doors",
        QPATHTOEF(icons,data\door_closed_locked_ca.paa),
        {
            GVAR(pinMode) = 1;
            [] call FUNC(promptPin);
        },
        {
            call FUNC(countDoors) params ["_doorCount", "_building"]; _doorCount > 0 && !isNull _building && !(_building getVariable [QGVAR(doorsLocked), false]) && {!isNil {_building getVariable QGVAR(doorPin)}}
        }
    ] call ACEFUNC(interact_menu,createAction);

    [player, 1, [QUOTE(ACE_SelfActions)], _lockDoors] call ACEFUNC(interact_menu,addActionToObject);
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
