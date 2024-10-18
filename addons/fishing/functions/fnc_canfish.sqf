#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Check player position relative to shoreline, water, or if they're on a watercraft
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: BOOL
 *
 * Example:
 * [] call misery_fishing_fnc_canFish
 *
*/

private ["_canfish","_isLookingAtWater","_overShore","_overWater"];

_canfish=false;

_isLookingAtWater = surfaceIsWater (screenToWorld [0.5,0.5]);
_overShore = !(position player isFlatEmpty  [-1, -1, -1, -1, 0, true] isEqualTo []);
_overWater = !(position player isFlatEmpty  [-1, -1, -1, -1, 2, false] isEqualTo []);

if ((_overShore && _isLookingAtWater) || (_overWater && _isLookingAtWater) || (vehicle player isKindOf 'Ship')) then {

 _canfish = true;

 if (_canfish)exitwith{};
};
  _canfish //return
