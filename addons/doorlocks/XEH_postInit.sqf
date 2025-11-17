#include "script_component.hpp"

if (hasInterface) then {
    [
        "installLock_menu",
        "Install Door Locks",
        {[[QCLASS(lockKit)]] call EFUNC(common,hasItem) && {call FUNC(countDoors) params ["_doorCount", "_building", "_noLock"]; !_noLock && _doorCount > 0 && !isNull _building && isNil {_building getVariable QGVAR(doorPin)}}},
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            GVAR(pinMode) = 0;
            [] call FUNC(installLocks);
        },
        "",
        QUOTE(a3\modules_f\data\editterrainobject\texturechecked_door_ca.paa),
        ""
    ] call EFUNC(actions,addAction);

    [
        "unlockDoors_menu",
        "Unlock Doors",
        {call FUNC(countDoors) params ["_doorCount", "_building"]; _doorCount > 0 && !isNull _building && (_building getVariable [QGVAR(doorsLocked), false])},
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            GVAR(pinMode) = 1;
            [] call FUNC(promptPin);
        },
        "",
        QUOTE(a3\modules_f\data\editterrainobject\textureunchecked_door_ca.paa),
        ""
    ] call EFUNC(actions,addAction);

    [
        "lockDoors_menu",
        "Lock Doors",
        {call FUNC(countDoors) params ["_doorCount", "_building"]; _doorCount > 0 && !isNull _building && !(_building getVariable [QGVAR(doorsLocked), false]) && {!isNil {_building getVariable QGVAR(doorPin)}}},
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            GVAR(pinMode) = 1;
            [] call FUNC(promptPin);
        },
        "",
        QUOTE(a3\modules_f\data\editterrainobject\texturedoor_locked_ca.paa),
        ""
    ] call EFUNC(actions,addAction);
};

if (isServer) then {
    [{
        call FUNC(applyBuildingStates);
    }, [], 1] call CBA_fnc_waitAndExecute;
};
