/*
Inventory Click handle
Designed specifically for Misery mod 
by TenuredCLOUD 
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
	if(_displayName==_itemText)exitWith{_selectedItem=_item};
	}forEach["cfgWeapons","cfgMagazines"]; //["cfgWeapons","cfgMagazines","cfgGlasses","cfgVehicles"];
	if!(_selectedItem=="")exitWith{};
}forEach((items player)+(magazines player)); //((items player)+(assignedItems player)+(magazines player)+(weapons player))
if(_selectedItem=="")exitWith{};
if(((toUpper _selectedItem)in MiserysurvivalItems))exitWith{
	_selectedItem execVM "\z\misery\addons\inventory\functions\fnc_UseItem.sqf";
};

private _script="";
{if(toLower(_x select 0)==(toLower _selectedItem))exitWith{_script=_x select 1}}forEach MiseryActionsItemCustom;
if!(_script=="")exitWith{_selectedItem execVM _script};
[_selectedItem] spawn Misery_fnc_InventoryClickCustom;