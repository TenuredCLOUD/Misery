#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Handles action execution
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
*/

disableSerialization;

private _ctrl = (findDisplay 982377) displayCtrl 1500;
private _index = lbCurSel _ctrl;
private _actionID = _ctrl lbData _index;

// Handle cancellation
if (_actionID isEqualTo "CANCEL_ROOT") exitWith {
    player setVariable [QGVAR(currentParentID), ""];
    call FUNC(displayActions);
};

// Find action in active registry
private _action = (player getVariable [QGVAR(actionRegistry), []]) select {
    _x select 0 isEqualTo _actionID
} param [0, []];

if (_action isEqualTo []) exitWith {};

_action params ["", "", "", "_code", "_parent"];

// Execute action code (ensure _code is compiled)
if (_code isEqualType "") then {_code = compile _code}; // Optional: Safeguard
call _code;

// Handle submenu navigation
if (_parent isNotEqualTo "") then {
    player setVariable [QGVAR(currentParentID), _actionID];
    call FUNC(displayActions);
};
