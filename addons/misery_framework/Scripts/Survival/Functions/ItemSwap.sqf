 /* -----------------------------------
Misery Item AutoSwapper
Filters through active items in inventory and if matches an auto swap instance will automatically convert Items 
Utilizing CBA_fnc_addItem if no room in inventory new item will automatically drop to the ground
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

params ["_unit", "_oldItem", "_newItem"];
if (_oldItem in items _unit) then {
    _unit removeItem _oldItem;
    [_unit, _newItem, true] call CBA_fnc_addItem;
};
if (_oldItem in magazines _unit) then {
    _unit removeMagazine _oldItem;
    [_unit, _newItem, true] call CBA_fnc_addItem;
};

