#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Weapon AutoSwapper
 * Filters through active items in inventory and if matches an auto swap instance will automatically convert weapons
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: old weapon <STRING>
 * 2: new weapon <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, QCLASS(woodaxe), "WBK_axe"] call misery_common_fnc_weaponSwap;
 *
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

