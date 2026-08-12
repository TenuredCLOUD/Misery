#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Total protection ratings return
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Total Protection Ratings <ARRAY>
 *    0: GasMask
 *    1: SCBA
 *    2: Skin Protection
 *    3: Respiratory Protection
 *    4: Eye Protection
 *    5: Hearing Protection (ACE hearing)
 *
 * Example:
 * [] call misery_protection_fnc_totalProtection;
 *
*/

params ["_unit"];

// Gather all protection arrays
private _allGear = [
    _unit call FUNC(facewear),
    _unit call FUNC(headgear),
    _unit call FUNC(uniform),
    _unit call FUNC(vest)
];

// Start with the backpack as the base
private _totals = _unit call FUNC(backpack);

{
    private _currentGearArray = _x;

    if (_currentGearArray isNotEqualTo MACRO_NO_PROTECTIONS) then {
        {
            private _currentValue = _totals select _forEachIndex;
            _totals set [_forEachIndex, _currentValue + _x];
        } forEach _currentGearArray;
    };
} forEach _allGear;

// ACE hearing value
private _headgear = headgear ACE_player;

private _heargearConfig = configFile >> "CfgWeapons" >> _headgear;

private _protection = getNumber (_heargearConfig >> QCLASSACE(hearing_protection)) min 1;

_totals set [5, _protection];

_totals
