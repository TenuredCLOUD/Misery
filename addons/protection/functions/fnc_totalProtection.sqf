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

// Values are added onto the backpack array.
private _backpack = call FUNC(backpack);
private _facewear = call FUNC(facewear);
private _headgear = call FUNC(headgear);
private _uniform = call FUNC(uniform);
private _vest = call FUNC(vest);

{
    _backpack params ["_gas", "_scba", "_skin", "_resp", "_eye", "_hear"];
    _x params ["_newGas", "_newSCBA", "_newSkin", "_newResp", "_newEye", "_newHear"];

    // Skip arrays of 0s
    if (_x isEqualTo MACRO_NO_PROTECTIONS) exitWith {continue};

    _backpack set [0, _gas + _newGas];
    _backpack set [1, _scba + _newSCBA];
    _backpack set [2, _skin + _newSkin];
    _backpack set [3, _resp + _newResp];
    _backpack set [4, _eye + _newEye];
    _backpack set [5, _hear + _newHear];
} forEach [_facewear, _headgear, _uniform, _vest];

_backpack
