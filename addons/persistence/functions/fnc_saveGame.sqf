#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Handles saving in multiplayer or singleplayer.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_persistence_fnc_saveGame
*/

call EFUNC(common,nearFire) params ["", "_isInflamed"];

if (GVAR(hardcore) && !_isInflamed) exitWith {
    ["Hardcore mode enabled, you need to be near a lit fire to save...", 1, [1, 1, 1, 1]] call CBA_fnc_notify;
};

if (GVAR(blockSave)) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), "Save is already in progress. Cancelling second save"] call EFUNC(common,debugMessage);
};

[QUOTE(COMPONENT_BEAUTIFIED), "Saving Client Data"] call EFUNC(common,debugMessage);

GVAR(blockSave) = true;

[{
    GVAR(blockSave) = false;
}, [], 5] call CBA_fnc_waitAndExecute;

// Refresh save variables pre-save
call FUNC(loadData);

private _playerData = call FUNC(clientDataSet);

if (isMultiplayer) exitWith {
    [QGVAR(saveDataToServer), _playerData] call CBA_fnc_serverEvent;
};

profileNamespace setVariable [QGVAR(saveName), _playerData];

// Refresh save variables post-save
call FUNC(loadData);
