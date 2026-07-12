#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
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

private _serializedData = call FUNC(clientDataSet);

private _saveNameString = call FUNC(formatSaveName);

profileNamespace setVariable [_saveNameString, _serializedData];

