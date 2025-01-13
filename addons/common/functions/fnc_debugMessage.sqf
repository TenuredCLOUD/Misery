#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Prints error messages, basic debugging is systemChat, additional info is logging to RPT.
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

if (GVAR(debugMode) == 0) exitWith {};

private _errorMsg = format ["[Misery - %1] - %2", _component, _message];

if (GVAR(debugMode) == 1) then {
    systemChat _errorMsg;
};

if (GVAR(debugMode) == 2) then {
    diag_log _errorMsg;
};
