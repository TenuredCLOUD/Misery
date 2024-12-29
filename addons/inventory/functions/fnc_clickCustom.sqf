#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Click action for custom item usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_inventory_fnc_clickCustom
 *
*/


private _item=_this select 0;
private _description="";

{
    _description = getText (configFile >> _x >> _item >> "descriptionShort");
    if (_description != "") exitWith {};
} forEach ["CfgWeapons", "CfgMagazines"];

if (_description == "") exitWith {};
