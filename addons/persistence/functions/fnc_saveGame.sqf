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

[QUOTE(COMPONENT_BEAUTIFIED), "Saving Client Data"] call EFUNC(common,debugMessage);

// Refresh save variables
call FUNC(loadData);

private _playerData = call FUNC(clientDataSet);

if (!isMultiplayer) exitWith {
    profileNamespace setVariable [GVAR(saveName), _playerData];
};

[QGVAR(saveDataToServer), _playerData] call CBA_fnc_serverEvent;
