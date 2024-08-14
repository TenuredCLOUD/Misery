#include "..\script_component.hpp"
/*
Check player position relative to shoreline, water, or if they're on a watercraft
Designed specifically for Misery mod
by TenuredCLOUD
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
