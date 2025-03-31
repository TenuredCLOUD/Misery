#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Remove Buff or Ailment
 *
 * Arguments:
 * 0: Type <STRING> ("buff" or "ailment")
 * 1: Name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["buff", "Near Fire"] call misery_vitals_fnc_removeBuffOrAilment;
 */

params ["_type", "_name"];

private _arrayName = ["ailments", "buffs"] select (_type isEqualTo "buff");
private _array = player getVariable [_arrayName, []];
private _index = _array findIf {(_x select 0) isEqualTo _name};

if (_index isNotEqualTo -1) then {
    _array deleteAt _index;
    player setVariable [_arrayName, _array];
};
