#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Total protection ratings return
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Total Protection Ratings <ARRAY>
 *    0: GasMask
 *    1: SCBA
 *    2: Skin Protection
 *    3: Respiratory Protection
 *    4: Eye Protection
 *    5: Hearing Protection
 *
 * Example:
 * [] call misery_protection_fnc_totalProtection;
 *
*/

// Gather all protection arrays
private _allGear = [
    call FUNC(facewear),
    call FUNC(headgear),
    call FUNC(uniform),
    call FUNC(vest)
];

// Start with the backpack as the base
private _totals = call FUNC(backpack);

{
    private _currentGearArray = _x;

    if !(_currentGearArray isEqualTo MACRO_NO_PROTECTIONS) then {
        {
            private _currentValue = _totals select _forEachIndex;
            _totals set [_forEachIndex, _currentValue + _x];
        } forEach _currentGearArray;
    };
} forEach _allGear;

_totals
