#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Switches magazines on / off types but carries quantities over types
 * For simulating "batteries" with magazine objects
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Magazine filter <ARRAY>
 * 2: Power State <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, ["misery_lantern_On", "misery_lantern_Off"], true] call misery_common_fnc_switchPowerState
*/

params ["_unit", "_magazineFilter", "_switchToOn"];
_magazineFilter params ["_onMag", "_offMag"];

private _currentMag = "";
private _ammoCount = 0;

private _magazines = magazinesAmmo _unit;

private _magIndex = _magazines findIf {(_x select 0) in _magazineFilter};

if (_magIndex isEqualTo -1) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), "No matching magazine found..."] call EFUNC(common,debugMessage);
};

_currentMag = (_magazines select _magIndex) select 0;
_ammoCount = (_magazines select _magIndex) select 1;

private _targetMag = [_offMag, _onMag] select _switchToOn;

if (_currentMag isEqualTo _targetMag) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), "Magazine is already in the desired state..."] call EFUNC(common,debugMessage);
};

[_unit, _currentMag] call CBA_fnc_removeMagazine;

[_unit, _targetMag, _ammoCount, true] call CBA_fnc_addMagazine;

private _debugHint = format ["Magazine switched to %1 with %2 battery life", ["Off", "On"] select _switchToOn,_ammoCount];
[QUOTE(COMPONENT_BEAUTIFIED), _debugHint] call EFUNC(common,debugMessage);
