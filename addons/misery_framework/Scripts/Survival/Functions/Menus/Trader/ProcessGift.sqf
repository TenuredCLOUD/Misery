/* -----------------------------------
Misery Trader Shop Gift processor
Processes Gifting of items + stock management
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private ['_shop','_items','_stock','_playerFunds','_selectedItem','_index'];

_trader = player getVariable "currentTrader";
_shop = _trader getVariable "shop";
_items = _shop select (_shop findIf {_x select 0 == 'Items'}) select 1;
private _dialog = findDisplay 982390;
private _list = _dialog displayCtrl 1500;
private _currselection = lbCurSel _list;

if (_currselection == -1) exitWith {ctrlSetText [1001, "No gift option selected..."]; [] execVM 'Misery\Scripts\Survival\Functions\Menus\Trader\ShopVALs.sqf';};

private _selectedItem = _list lbData _currselection;
private _selectedItemData = _items select (_items findIf {_x select 0 == _selectedItem});

_stock = _selectedItemData select 2;

private _selectedItem = _selectedItemData select 0;

private _displayName = getText (configFile >> "CfgWeapons" >> _selectedItem >> "displayName");  
if (_displayName == "") then {
    _displayName = getText (configFile >> "CfgMagazines" >> _selectedItem >> "displayName");  
};
if (_displayName == "") then {  
    _displayName = getText (configFile >> "CfgVehicles" >> _selectedItem >> "displayName");   
};

if (_trader getVariable ["giftClicked", false]) then {
    _selectedItemData set [2, _stock + 1];
    _trader setVariable ['shop', _shop, true];
    ctrlSetText [1001, format ["Successfully gifted %1",_displayName]];
    if (_selectedItem in items player) then {
        player removeItem _selectedItem;
    };
    if (_selectedItem in magazines player) then {
        player removeMagazine _selectedItem;
    };
    _trader setVariable ["giftClicked", false];
    [] execVM 'Misery\Scripts\Survival\Functions\Menus\Trader\ShopVALs.sqf';
}else{
    _trader setVariable ["giftClicked", true];
    ctrlSetText [1001, format ["Are you sure you want to gift %1?",_displayName]];
    _time = time + 5;
    [_time] spawn {
	private ["_TimeA"];
	_TimeA=_this select 0;
	waitUntil {(time > _TimeA)};
    _trader = player getVariable "currentTrader";
    _trader setVariable ["giftClicked", false];
    };
};

