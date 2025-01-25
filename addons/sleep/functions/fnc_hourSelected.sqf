#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Sleep system (Singleplayer only)
 * Defines the selected hour for processing time skip, and stat drops, etc...
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Hours to sleep <NUMBER>
 *
 * Example:
 * [] call misery_sleep_fnc_hourSelected;
 *
*/

private _ctrl = findDisplay 982374 displayCtrl 982375;
private _index = lbCurSel _ctrl;
private _selectedHour = 0;

if (_index isNotEqualTo -1) then {
    _selectedHour = _index + 1;
};

_selectedHour
