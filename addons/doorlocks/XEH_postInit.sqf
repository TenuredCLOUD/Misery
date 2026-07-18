#include "script_component.hpp"

if (isServer) then {
    [{
        call FUNC(applyBuildingStates);
    }, [], 1] call CBA_fnc_waitAndExecute;

    [{CBA_missionTime > 1}, {
        call FUNC(checkAreas);
    }, []] call CBA_fnc_waitUntilAndExecute;

    [QGVAR(serverInstallLock), {
        params ["_player", "_building", "_pin"];

        if (_player distance _building > 30) exitWith {};

        _building setVariable [QGVAR(doorPin), _pin, true];

        private _config = [_building] call CBA_fnc_getObjectConfig;
        private _doorCount = getNumber (_config >> "numberOfDoors");
        for "_i" from 1 to _doorCount do {
            _building setVariable [format ["bis_disabled_Door_%1", _i], 1, true];
        };
        _building setVariable [QGVAR(doorsLocked), true, true];

        [_building, true, _pin] call FUNC(updateBuildingState);

        [QGVAR(clientLockInstallSuccess), [_pin], _player] call CBA_fnc_targetEvent;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(serverToggleLock), {
        params ["_player", "_building", "_enteredPin"];

        if (_player distance _building > 30) exitWith {};

        private _savedPin = _building getVariable [QGVAR(doorPin), 0];

        if (_enteredPin isEqualTo _savedPin) then {
            private _isCurrentlyLocked = _building getVariable [QGVAR(doorsLocked), false];
            private _newLockState = !_isCurrentlyLocked;

            private _config = [_building] call CBA_fnc_getObjectConfig;
            private _doorCount = getNumber (_config >> "numberOfDoors");
            private _doorStateValue = parseNumber _newLockState;

            for "_i" from 1 to _doorCount do {
                _building setVariable [format ["bis_disabled_Door_%1", _i], _doorStateValue, true];
            };
            _building setVariable [QGVAR(doorsLocked), _newLockState, true];

            [_building, _newLockState, _savedPin] call FUNC(updateBuildingState);

            [QGVAR(clientLockToggleResult), [true, _newLockState], _player] call CBA_fnc_targetEvent;
        } else {
            [QGVAR(clientLockToggleResult), [false, false], _player] call CBA_fnc_targetEvent;
        };
    }] call CBA_fnc_addEventHandler;
};

if !(hasInterface) exitWith {};

["CBA_loadingScreenDone", {

    [QGVAR(clientLockInstallSuccess), {
        params ["_pin"];
        [ACE_player, QCLASS(lockKit)] call CBA_fnc_removeItem;
        private _pinSetTip = format ["%2 %1", [_pin, 1, 0, false] call CBA_fnc_formatNumber, localize LSTRING(PINSet)];
        [_pinSetTip, 1, [1, 1, 1, 1]] call CBA_fnc_notify;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(clientLockToggleResult), {
        params ["_success", "_isLocked"];
        if (_success) then {
            private _msg = if (_isLocked) then { localize LSTRING(DoorsLocked) } else { localize LSTRING(DoorsUnlocked) };
            [_msg, 1, [1, 1, 1, 1]] call CBA_fnc_notify;
        } else {
            [localize LSTRING(WrongPIN), 1, [1, 0, 0, 1]] call CBA_fnc_notify;
        };
    }] call CBA_fnc_addEventHandler;

    private _installLock = [
        QGVAR(installLock_menu),
        localize LSTRING(Install),
        QPATHTOEF(icons,data\key_round_ca.paa),
        {
            GVAR(pinMode) = 0;
            [] call FUNC(installLocks);
        },
        {
            [[QCLASS(lockKit)]] call EFUNC(common,hasItem) && {call FUNC(countDoors) params ["_doorCount", "_building", "_noLock"];
            !_noLock && _doorCount > 0 && !isNull _building && isNil {_building getVariable QGVAR(doorPin)}}
        }
    ] call ACEFUNC(interact_menu,createAction);

    [ACE_player, 1, [QUOTE(ACE_SelfActions)], _installLock] call ACEFUNC(interact_menu,addActionToObject);

    private _unlockDoors = [
        QGVAR(unlockDoors_menu),
        localize LSTRING(Unlock),
        QPATHTOEF(icons,data\door_open_ca.paa),
        {
            GVAR(pinMode) = 1;
            [] call FUNC(promptPin);
        },
        {
            call FUNC(countDoors) params ["_doorCount", "_building"];
            _doorCount > 0 && !isNull _building && (_building getVariable [QGVAR(doorsLocked), false])
        }
    ] call ACEFUNC(interact_menu,createAction);

    [ACE_player, 1, [QUOTE(ACE_SelfActions)], _unlockDoors] call ACEFUNC(interact_menu,addActionToObject);

    private _lockDoors = [
        QGVAR(lockDoors_menu),
        localize LSTRING(Lock),
        QPATHTOEF(icons,data\door_closed_locked_ca.paa),
        {
            GVAR(pinMode) = 1;
            [] call FUNC(promptPin);
        },
        {
            call FUNC(countDoors) params ["_doorCount", "_building"];
            _doorCount > 0 && !isNull _building && !(_building getVariable [QGVAR(doorsLocked), false]) && {!isNil {_building getVariable QGVAR(doorPin)}}
        }
    ] call ACEFUNC(interact_menu,createAction);

    [ACE_player, 1, [QUOTE(ACE_SelfActions)], _lockDoors] call ACEFUNC(interact_menu,addActionToObject);

}] call CBA_fnc_addEventHandler;
