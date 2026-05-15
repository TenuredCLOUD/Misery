#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Maps interaction data to ACE self interactions
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_interactions_fnc_init;
 *
*/

private _categories = [];

{
    _categories pushBackUnique (_x select 1);
} forEach GVAR(data);

{
    private _categoryName = _x;

    private _categoryID = format [QGVAR(category_%1), _categoryName];

    private _categoryAction = [
        _categoryID,
        _categoryName,
        "",
        {true},
        {
            params ["", "", "_args"];
            (GVAR(data) findIf {
                (_x select 1) isEqualTo (_args select 0) && {[[_x select 0]] call EFUNC(common,hasItem)}
            }) isNotEqualTo -1
        },
        {},
        [_categoryName]
    ] call ACEFUNC(interact_menu,createAction);

    [player, 1, [QUOTE(ACE_SelfActions), QUOTE(ACE_Equipment)], _categoryAction] call ACEFUNC(interact_menu,addActionToObject);

    {
        private _itemEntry = _x;
        _itemEntry params ["_itemName", "_category", "_parent"];

        if (_category isEqualTo _categoryName) then {

            if !([_itemName, "CfgWeapons"] call EFUNC(common,configCheck) || [_itemName, "CfgMagazines"] call EFUNC(common,configCheck)) then { continue };

            [_itemName] call EFUNC(common,getItemData) params ["_displayName", "_picture"];

            private _itemAction = [
                format [QCLASS(action_%1), _itemName],
                _displayName,
                _picture,
                {
                    params ["", "", "_args"];
                    _args call FUNC(process);
                },
                {
                    params ["", "", "_args"];
                    [[_args select 0]] call EFUNC(common,hasItem)
                },
                {},
                _itemEntry
            ] call ACEFUNC(interact_menu,createAction);

            [player, 1, [QUOTE(ACE_SelfActions), QUOTE(ACE_Equipment), _categoryID], _itemAction] call ACEFUNC(interact_menu,addActionToObject);
        };
    } forEach GVAR(data);
} forEach _categories;
