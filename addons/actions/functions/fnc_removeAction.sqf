#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Removes a registered action from player
 *
 * Arguments:
 * 0: Action ID <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["myAction_menu"] call misery_actions_fnc_removeAction;
*/

params ["_id"];

private _actionRegistry = player getVariable [QGVAR(actionRegistry), []];
_actionRegistry = _actionRegistry select { _x select 0 isNotEqualTo _id };
player setVariable [QGVAR(actionRegistry), _actionRegistry];
