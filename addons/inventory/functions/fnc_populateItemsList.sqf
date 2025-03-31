#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Populate inventory items list
 *
 * Arguments:
 * 0: Dialog <DISPLAY>
 * 1: Selected combo index <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [dialog, 0] call misery_inventory_fnc_populateItemsList;
 *
 * Public: No
*/

params ["_dialog", "_index"];

private _combo = _dialog displayCtrl 2100;
private _category = _combo lbData _index;
private _list = _dialog displayCtrl 1503;
lbClear _list;

private _playerItems = (items player) + (magazines player);

{
    private _itemCategory = _x select 0;
    private _itemName = _x select 1;

    if (_itemCategory isEqualTo _category && {_itemName in _playerItems}) then {
        private _displayName = getText (configFile >> "CfgWeapons" >> _itemName >> "displayName");
        if (_displayName isEqualTo "") then {
            _displayName = getText (configFile >> "CfgMagazines" >> _itemName >> "displayName");
        };
        if (_displayName isEqualTo "") then {
            _displayName = _itemName;
        };

        private _picture = getText (configFile >> "CfgWeapons" >> _itemName >> "picture");
        if (_picture isEqualTo "") then {
            _picture = getText (configFile >> "CfgMagazines" >> _itemName >> "picture");
        };
        if (_picture isEqualTo "") then {
            _picture = "\A3\ui_f\data\gui\cfg\Hints\icon_task_ca.paa"; // Fallback icon
        };

        private _idx = _list lbAdd _displayName;
        _list lbSetData [_idx, _itemName];
        _list lbSetPictureRight [_idx, _picture];
    };
} forEach GVAR(itemData);


