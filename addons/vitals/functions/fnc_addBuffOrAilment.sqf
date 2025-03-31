#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Add Buff or Ailment
 *
 * Arguments:
 * 0: Type <STRING> ("buff" or "ailment")
 * 1: Name <STRING>
 * 2: Image <STRING>
 * 3: Description <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["buff", "Near Fire", "path/to/icon.paa", "Description"] call misery_vitals_fnc_addBuffOrAilment;
 */

params ["_type", "_name", "_image", "_description"];

private _arrayName = ["ailments", "buffs"] select (_type isEqualTo "buff");
private _array = player getVariable [_arrayName, []];

if (_array findIf {(_x select 0) isEqualTo _name} isEqualTo -1) then {
    _array pushBack [_name, _image, _description];
    player setVariable [_arrayName, _array];
};
