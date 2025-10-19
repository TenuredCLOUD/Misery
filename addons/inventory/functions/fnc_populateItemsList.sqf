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
    private _itemName = _x select 0;
    private _itemCategory = _x select 1;

    if (_itemCategory isEqualTo _category && {_itemName in _playerItems}) then {

        [_itemName] call EFUNC(common,getItemData) params ["_displayName", "_picture"];

        private _idx = _list lbAdd _displayName;
        _list lbSetData [_idx, _itemName];
        _list lbSetPictureRight [_idx, _picture];
    };
} forEach GVAR(itemData);


