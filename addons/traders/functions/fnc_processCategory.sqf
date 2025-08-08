#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Trader Shop Category Processor
 * Populates category dropdown in trader UI
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_traders_fnc_processCategory;
 *
*/

[{!isNull findDisplay 982390}, {

    private _dialog = findDisplay 982390;
    private _categoryDropdown = _dialog displayCtrl 2100;
    private _trader = player getVariable [QGVAR(currentTrader), objNull];

    if (isNull _trader) exitWith {(findDisplay 982390) closeDisplay 2};

    private _shop = _trader getVariable [QGVAR(shop), []];

    if (_shop isEqualTo []) exitWith {(findDisplay 982390) closeDisplay 2};

    private _items = _shop select 2;
    private _categories = [];

    {
        private _category = _x select 6;
        if (_category isEqualTo "") then {
            _category = "Default";
        };
        if !(_category in _categories) then {
            _categories pushBack _category;
        };
    } forEach _items;

    lbClear _categoryDropdown;
    private _index = _categoryDropdown lbAdd "All";
    _categoryDropdown lbSetData [_index, ""];
    {
        private _index = _categoryDropdown lbAdd _x;
        _categoryDropdown lbSetData [_index, _x];
    } forEach _categories;

    if (lbSize _categoryDropdown > 0) then {
        _categoryDropdown lbSetCurSel 0;
    };
}, []] call CBA_fnc_waitUntilAndExecute;
