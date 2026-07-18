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

private _isLookingAtWater = surfaceIsWater (screenToWorld [0.5,0.5]);
private _overShore = (position ACE_player isFlatEmpty  [-1, -1, -1, -1, 0, true] isNotEqualTo []);
private _overWater = (position ACE_player isFlatEmpty  [-1, -1, -1, -1, 2, false] isNotEqualTo []);

if (insideBuilding ACE_player isEqualTo 1) exitWith { false };

if ((_overShore && _isLookingAtWater) || (_overWater && _isLookingAtWater) || (vehicle ACE_player isKindOf 'Ship')) exitWith {
    true
};

false
