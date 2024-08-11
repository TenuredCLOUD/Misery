/*
Misery Weapon AutoSwapper
Filters through active items in inventory and if matches an auto swap instance will automatically convert weapons
Utilizing CBA_fnc_addWeapon if no room in inventory new weap will automatically drop to the ground
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

params ["_unit", "_oldWeapon", "_newWeapon"];
if (_oldWeapon in items _unit) then {
    [_unit, _newWeapon, true] call CBA_fnc_addWeapon;
    _unit removeItem _oldWeapon;
};
if (_oldWeapon in magazines _unit) then {
    [_unit, _newWeapon, true] call CBA_fnc_addWeapon;
    _unit removeMagazine _oldWeapon;
};

