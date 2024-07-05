/* -----------------------------------
Misery Buff or Ailment Data Remover 
Designed specifically for Misery mod 
by TenuredCLOUD 

Usage example:
["ailment","name of ailment"] call Misery_fnc_RemoveBuffOrAilment;
-------------------------------------- */

_this params ["_type", "_index"];
_index = parseNumber _index;  // Ensure _index is a number
private _arrayName = if (_type == "buff") then {"buffs"} else {"ailments"};
private _array = player getVariable [_arrayName, []];
if (_index >= 0 && _index < count _array) then {
    _array deleteAt _index;
    player setVariable [_arrayName, _array];
};