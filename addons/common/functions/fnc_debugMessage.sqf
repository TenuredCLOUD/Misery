#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Prints Error Messages to the RPT, except if Debug mode is enabled then it will also do a systemChat
 *
 * Arguments:
 * 0: Component <STRING>
 * 1: Message <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_common_fnc_debugMessage
*/

params ["_component", "_message"];

private _errorMsg = format ["[Misery - %1] - %2", _component, _message];
diag_log _errorMsg;

if (GVAR(debug)) then {
    systemChat _errorMsg;
};
