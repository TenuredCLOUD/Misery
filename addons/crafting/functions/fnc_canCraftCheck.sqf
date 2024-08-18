#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Crafting Framework Item check
 *
 * Arguments:
 * 0: Requirements <ARRAY>
 *
 * Return Value:
 * 0: BOOL 
 *
 * Example:
 * [_requirements] call misery_crafting_fnc_canCraftCheck
 *
 * Public: No
*/

params ["_requirements"];
if (MiseryDebug) then {
systemChat str _requirements;
systemChat format ["Type of _requirements: %1", typeName _requirements]; //debug output
systemChat format ["Count of _requirements: %1", count _requirements]; //debug output
};
private _playerItems = (items player) + (magazines player);
private _hasAll = true;

{
    private _itemArray = _x;
    if (MiseryDebug) then {
    systemChat format["Checking 1: %1",_itemArray];
    };
    if (_itemArray isEqualType [] && {_itemArray select 0 != "CraftingTime"} && {_itemArray select 0 != "OutputCount"} && {_itemArray select 0 != "ToBeReplaced"} && {_itemArray select 0 != "Audio"}) then {
        if (MiseryDebug) then {
        systemChat format["Checking 2: %2",_itemArray];
        };
        private _requiredItem = _itemArray select 0;
        private _requiredCount = _itemArray select 1;
        private _playerCount = {_x isEqualTo _requiredItem} count _playerItems;

        if (MiseryDebug) then {
        systemChat format ["Required item: %1, Required count: %2, Player count: %3", _requiredItem, _requiredCount, _playerCount]; //debug output
        systemChat format ["Count function result: %1", {_x isEqualTo _requiredItem} count _playerItems]; //debug output
        };

        if (_playerCount < _requiredCount) then {
            if (MiseryDebug) then {
            systemChat "Not enough items, setting _hasAll to false"; //debug output
            };
            _hasAll = false;
        };
    };
} forEach _requirements;

_hasAll






