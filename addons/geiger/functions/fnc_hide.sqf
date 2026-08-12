#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Hides the Geiger display
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_geiger_fnc_hide
 *
*/

if !(uiNamespace getVariable [QGVAR(ui_visible), false]) exitWith {};

uiNamespace setVariable [QGVAR(ui_visible), false];

QGVAR(display) cutText ["", "PLAIN"];

private _displayHandle = uiNamespace getVariable [QGVAR(displayHandle), -1];

if (_displayHandle isNotEqualTo -1) then {
    _displayHandle call CBA_fnc_removePerFrameHandler;
    uiNamespace setVariable [QGVAR(displayHandle), -1];
};
