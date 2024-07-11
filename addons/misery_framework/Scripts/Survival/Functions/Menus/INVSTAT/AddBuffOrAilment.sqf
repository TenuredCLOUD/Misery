/*
Misery Buff or Ailment Data Parser 
Designed specifically for Misery mod 
by TenuredCLOUD 

Usage example:
["ailment","name of ailment", "path/to/image/file.paa", "description"] call Misery_fnc_AddBuffOrAilment;
*/

_this params ["_type", "_name", "_image", "_description"];
private _arrayName = if (_type == "buff") then {"buffs"} else {"ailments"};
private _array = player getVariable [_arrayName, []];
if !(_array findIf {(_x select 0) isEqualTo _name} > -1) then {
    _array pushBack [_name, _image, _description];
    player setVariable [_arrayName, _array];
};
