#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * 0: ailment or buff <STRING>
 * 1: name of ailment or buff <STRING>
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * ["ailment","name of ailment"] call misery_vitals_fnc_RemoveBuffOrAilment;
 *
*/

_this params ["_type", "_index"];
_index = parseNumber _index;  // Ensure _index is a number
private _arrayName = ["ailments", "buffs"] select (_type == "buff");
private _array = player getVariable [_arrayName, []];
if (_index >= 0 && _index < count _array) then {
    _array deleteAt _index;
    player setVariable [_arrayName, _array];
};
