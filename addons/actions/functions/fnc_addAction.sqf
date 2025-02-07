#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Registers a new action into the framework
 *
 * Arguments:
 * 0: Action ID <STRING>
 * 1: Display Name <STRING>
 * 2: Condition to show action <CODE> (default: {true})
 * 3: Execution on action run <CODE>
 * 4: Parent Action <STRING> (default: "")
 * 5: Icon Path <STRING> (default: "")
 * 6: Tooltip <STRING> (default: "")
 *
 * Return Value:
 * None
 *
 * Example:
 * [
 *   "myAction_menu",
 *   "My Action",
 *   {true},
 *   {systemChat "This action does something!"},
 *   "rootMenu",
 *   "path\to\icon.paa",
 *   "This action does something cool"
 * ] call misery_actions_fnc_addAction;
*/

params ["_id", "_displayName", ["_condition", {true}, [{}]], ["_code", {}, [{}]], ["_parent", "", [""]], ["_icon", "", [""]], ["_tooltip", "", [""]]];

private _actionRegistry = player getVariable [QGVAR(actionRegistry), []];

// Check if action already exists
if (_actionRegistry findIf { _x select 0 isEqualTo _id } isNotEqualTo -1) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), format ["Action %1 already registered!", _id]] call EFUNC(common,debugMessage);
};

_actionRegistry pushBack [
    _id,
    _displayName,
    _condition,
    _code,
    _parent,
    _icon,
    _tooltip
];

player setVariable [QGVAR(actionRegistry), _actionRegistry];
