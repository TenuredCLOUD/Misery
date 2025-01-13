#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Buff or Ailment Data Parser
 *
 * Arguments:
 * 0: ailment or buff <STRING>
 * 1: name of ailment or buff <STRING>
 * 2: path to icon <STRING>
 * 3: description <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["ailment","name of ailment", "path/to/image/file.paa", "description"] call misery_vitals_fnc_addBuffOrAilment;
 *
*/

_this params ["_type", "_name", "_image", "_description"];
private _arrayName = ["ailments", "buffs"] select (_type == "buff");
private _array = player getVariable [_arrayName, []];
if (_array findIf {(_x select 0) isEqualTo _name} == -1) then {
    _array pushBack [_name, _image, _description];
    player setVariable [_arrayName, _array];
};
