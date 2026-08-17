#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD (Adapted from McDiod's GRAD persistence)
 * Wrapper function for GRAD persistence, saves client data
 *
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_persistence_fnc_saveClient
*/

if !(hasInterface) exitWith {};

if (toUpper (lifeState ACE_player) in ["DEAD", "DEAD-RESPAWN", "DEAD-SWITCHING"]) exitWith {};

call EFUNC(common,nearFire) params ["", "_isInflamed"];

if (GVAR(hardcore) && !_isInflamed) exitWith {
    [localize LSTRING(HardcoreWarning), 1, [1, 1, 1, 1]] call CBA_fnc_notify;
};

if (GVAR(blockSave)) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), "Save is already in progress. Cancelling second save"] call EFUNC(common,debugMessage);
};

[QUOTE(COMPONENT_BEAUTIFIED), "Saving Client Data"] call EFUNC(common,debugMessage);

GVAR(blockSave) = true;

[{
    GVAR(blockSave) = false;
}, [], 5] call CBA_fnc_waitAndExecute;

private _savePlayerInventory = ([missionConfigFile >> "CfgGradPersistence", "savePlayerInventory", 1] call BIS_fnc_returnConfigEntry) isEqualTo 1;
private _savePlayerDamage = ([missionConfigFile >> "CfgGradPersistence", "savePlayerDamage", 1] call BIS_fnc_returnConfigEntry) isEqualTo 1;
private _savePlayerPosition = ([missionConfigFile >> "CfgGradPersistence", "savePlayerPosition", 1] call BIS_fnc_returnConfigEntry) isEqualTo 1;
private _savePlayerMoney = ([missionConfigFile >> "CfgGradPersistence", "savePlayerMoney", 1] call BIS_fnc_returnConfigEntry) isEqualTo 1;

private _allVariableClasses = "true" configClasses (missionConfigFile >> "CfgGradPersistence" >> "customVariables");

private _playerVariables = _allVariableClasses select {
    ([_x, "varNamespace", ""] call BIS_fnc_returnConfigEntry) isEqualTo "player"
};

// Push client save to server
[
    ACE_player,
    false,
    _savePlayerInventory,
    _savePlayerDamage,
    _savePlayerPosition,
    _savePlayerMoney,
    getPlayerUID ACE_player,
    _playerVariables
] call GRADFUNC(persistence,savePlayer);

// Handle banked funds
call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "_bankedFunds"];
profileNamespace setVariable [QGVAR(activeBank), _bankedFunds];
