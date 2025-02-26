#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Inventory Click handle
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_inventory_fnc_click
 *
*/

private _idc = ctrlIDC (_this select 0);
private _selectedIndex = _this select 1;
private _itemText = format ["%1",lbText[_idc,_selectedIndex]];
private _displayName = "";
private _item = "";
private _selectedItem = "";

{
_item=_x;
    {
    _displayName=getText(configFile>>_x>>_item>>"displayName");
    if(_displayName isEqualTo _itemText)exitWith{_selectedItem=_item};
    }forEach["cfgWeapons","cfgMagazines"]; //["cfgWeapons","cfgMagazines","cfgGlasses","cfgVehicles"];
    if (_selectedItem isNotEqualTo "") exitWith {};
}forEach((items player)+(magazines player)); //((items player)+(assignedItems player)+(magazines player)+(weapons player))
if(_selectedItem isEqualTo "")exitWith{};
if(((toUpper _selectedItem)in GVAR(items)))exitWith{
    _selectedItem call FUNC(useItem);
};

GVAR(itemCustomActions) params [_selectedItem, _script];

private _script="";
{
if (toLower(_x select 0) isEqualTo (toLower _selectedItem)) exitWith {_script=_x select 1}
} forEach GVAR(itemCustomActions);

if (_script isNotEqualTo "") exitWith {
    _selectedItem call _script
};

[_selectedItem] call FUNC(clickCustom);
