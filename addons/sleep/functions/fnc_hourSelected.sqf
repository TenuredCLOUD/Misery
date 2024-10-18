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
 * None
 *
 * Example:
 * [] call misery_sleep_fnc_hourSelected;
 *
*/

private ["_ctrl","_index","_SelectedHourVal","_SleepDecrease","_HungerDecrease","_ThirstDecrease"];

_ctrl = findDisplay 982374 displayCtrl 982375;
_index = lbCurSel _ctrl;
if (_index != -1) then {
    _SelectedHourVal = _index + 1;
} else {
    _SelectedHourVal = 0;
};

player setVariable ["Misery_SleepDataVal", _SelectedHourVal];

_SleepDecrease = player getVariable "Misery_SleepDataVal";
_HungerDecrease = player getVariable "Misery_SleepDataVal";
_ThirstDecrease = player getVariable "Misery_SleepDataVal";

MisSleep_sleepinessDecrease = _SleepDecrease * 5;
MisSleep_hungerDecrease = _HungerDecrease * 5;
MisSleep_thirstDecrease = _ThirstDecrease * 5;
