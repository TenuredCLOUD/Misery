/*
Misery Trader Shop Categorizer processor
Adds Category's to UI 
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

waitUntil {!isNull findDisplay 982390};

private _dialog = findDisplay 982390;
private _categoryDropdown = _dialog displayCtrl 2100;
_trader = player getVariable "currentTrader";
_shop = _trader getVariable "shop";
_items = _shop select (_shop findIf {_x select 0 == "Items"}) select 1;

    _categories = [];
    {
        _category = _x select 1;
    if (_categories findIf {_x isEqualTo _category} == -1) then {
        _categories pushBack _category;
    	};
    } forEach _items;

{
    _category = _x;
    _index = _categoryDropdown lbAdd _category;
    _categoryDropdown lbSetData [_index, _category];
} forEach _categories;

if (lbSize _categoryDropdown > 0) then {
    _categoryDropdown lbSetCurSel 0;
};

