#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Dynamically builds action list based on active registry
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
*/

disableSerialization;
private _display = findDisplay 982377;
private _list = (_display) displayCtrl 1500;
lbClear _list;

private _currentParent = player getVariable [QGVAR(currentParentID), ""];
private _actionRegistry = player getVariable [QGVAR(actionRegistry), []];

// Filter relevant actions, check parent & condition
private _validActions = _actionRegistry select {
    (_x select 4 isEqualTo _currentParent) && (call (_x select 2))
};

// Add to list
{
    _x params ["_id", "_displayName", "", "", "", "_icon", "_tooltip"];

    private _index = _list lbAdd _displayName;
    _list lbSetData [_index, _id];

    if (_icon isNotEqualTo "") then {
        _list lbSetPicture [_index, _icon];
    };

    if (_tooltip isNotEqualTo "") then {
        _list lbSetTooltip [_index, _tooltip];
    };
} forEach _validActions;

// Automatically add cancel button if in submenu
if (_currentParent != "") then {
    private _index = _list lbAdd "Cancel";
    _list lbSetData [_index, "CANCEL_ROOT"];
};
