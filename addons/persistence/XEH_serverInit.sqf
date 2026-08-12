#include "script_component.hpp"

if !(isServer) exitWith {};

// Check if GRAD has a set missionTag, if not automatically use the missionName
GVAR(gradPersistenceTag) = getText (missionConfigFile >> "CfgGradPersistence" >> "missionTag");
if (GVAR(gradPersistenceTag) isEqualTo "") then {GVAR(gradPersistenceTag) = missionName};

[QGVAR(saveWorldState), {[GVAR(gradWarning), 0] call GRADFUNC(persistence,saveMission)}] call CBA_fnc_addEventHandler;
[QGVAR(wipeWorldState), {[GVAR(gradPersistenceTag)] call GRADFUNC(persistence,clearMissionData)}] call CBA_fnc_addEventHandler;

if (GVAR(saveAE3States)) then {
    [QGVAR(grabAE3Devices), {call EFUNC(power,grabDeviceStates)}] call CBA_fnc_addEventHandler;
    [{ call EFUNC(power,applyStates); }, [], 0.2] call CBA_fnc_waitAndExecute;
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
    [{ call FUNC(restoreCargo); }, [], 0.2] call CBA_fnc_waitAndExecute;
};

if (GVAR(saveACEFuelStations)) then {
    [QGVAR(grabFuelStationLitres), {call EFUNC(fuel,grabFuelStates)}] call CBA_fnc_addEventHandler;
    [{ call EFUNC(fuel,applyFuelStates); }, [], 0.2] call CBA_fnc_waitAndExecute;
};

if (GVAR(saveACETags)) then {

    if (isNil QGVAR(sprayTagsCached)) then {
        GVAR(sprayTagsCached) = createHashMap;
    };

    [QCLASSACE(tagCreated), {
        params ["_tagObject", "_texture", "_type"];
        [{
            params ["_tagObject", "_texture", "_type"];
            if (isNull _tagObject) exitWith {};

            private _pos = getPosWorld _tagObject;
            private _vectorDirAndUp = [vectorDir _tagObject, vectorUp _tagObject];
            private _tagKey = format ["tag_%1_%2_%3", _pos select 0, _pos select 1, _pos select 2];

            GVAR(sprayTagsCached) set [_tagKey, [_pos, _vectorDirAndUp, _texture, _type]];
        }, [_tagObject, _texture, _type], 0.5] call CBA_fnc_waitAndExecute;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(grabsprayTags), {call FUNC(syncSprayTags)}] call CBA_fnc_addEventHandler;

    [{ call FUNC(createGlobalSprayTags); }, [], 0.2] call CBA_fnc_waitAndExecute;
};

if (GVAR(saveWaterSources)) then {
    [{ call EFUNC(hydrology,applySourceStates); }, [], 0.2] call CBA_fnc_waitAndExecute;
};

if (GVAR(gradAutosaveInterval) isNotEqualTo 0) then {
    [{
        call FUNC(gradSave);
    }, [], GVAR(gradAutosaveTimer)] call CBA_fnc_waitAndExecute;
};

addMissionEventHandler ["HandleDisconnect", {
    params ["_unit", "_id", "_uid", "_name"];

    if (!isNull _unit) then {
        deleteVehicle _unit;
    };

    false
}];
