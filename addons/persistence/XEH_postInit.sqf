#include "script_component.hpp"

GVAR(autosaveTimer) = GVAR(autosaveInterval) * 60;
GVAR(gradAutosaveTimer) = GVAR(gradAutosaveInterval) * 60;
GVAR(saveName) = call FUNC(formatSaveName);

// Multiplayer save/load
if (isServer) then {
    [QGVAR(saveDataToServer), FUNC(multiplayerDataSave)] call CBA_fnc_addEventHandler;
    [QGVAR(loadDataFromServer), FUNC(multiplayerDataLoad)] call CBA_fnc_addEventHandler;

    [QGVAR(saveWorldState), {[GVAR(gradWarning), 0] call GRADFUNC(persistence,saveMission)}] call CBA_fnc_addEventHandler;
    [QGVAR(wipeWorldState), {[GVAR(gradPersistenceTag)] call GRADFUNC(persistence,clearMissionData)}] call CBA_fnc_addEventHandler;

    if (GVAR(saveAE3States)) then {
        [QGVAR(grabAE3Devices), {call EFUNC(power,grabDeviceStates)}] call CBA_fnc_addEventHandler;

        [{
            call EFUNC(power,applyStates);
        }, [], 0.2] call CBA_fnc_waitAndExecute;
    };

    if (GVAR(saveACECargo)) then {
        [QCLASSACE(cargoLoaded), {
            params ["_item", "_vehicle"];
            _item setVariable [QGVAR(isCargo), true, true];
        }] call CBA_fnc_addEventHandler;

        [QCLASSACE(cargoUnloaded), {
            params ["_item", "_vehicle"];
            _item setVariable [QGVAR(isCargo), false, true];
        }] call CBA_fnc_addEventHandler;

        [QGVAR(grabCargo), {call FUNC(syncCargo)}] call CBA_fnc_addEventHandler;

        [{
            call FUNC(restoreCargo);
        }, [], 0.2] call CBA_fnc_waitAndExecute;
    };

    if (GVAR(saveACEFuelStations)) then {
        [QGVAR(grabFuelStationLitres), {call EFUNC(fuel,grabFuelStates)}] call CBA_fnc_addEventHandler;

        [{
            call EFUNC(fuel,applyFuelStates);
        }, [], 0.2] call CBA_fnc_waitAndExecute;
    };
};

[QGVAR(loadDataFromServerCallback), {
    params ["_playerData"];

    if (_playerData isEqualTo []) exitWith {
        [true] call FUNC(newPlayer);
    };

    _playerData call FUNC(clientDataGet);
}] call CBA_fnc_addEventHandler;

if (!hasInterface) exitWith {};

GVAR(blockSave) = false;

["CBA_settingsInitialized", {
    [] call FUNC(init);
}] call CBA_fnc_addEventHandler;
