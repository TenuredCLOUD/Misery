#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Starts drop processor
 *
 * Arguments:
 * 0: Classname <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_furniture_fnc_dropFurniture
 *
*/

params ["_className"];

// Remove from inventory
private _inventory = player getVariable [QGVAR(furnitureInventory), []];
private _index = _inventory find _className;
if (_index isEqualTo -1) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), "Item not in inventory!"] call EFUNC(common,debugMessage);
};

_inventory deleteAt _index;
player setVariable [QGVAR(furnitureInventory), _inventory];

// Spawn object at player with pickup action for furniture object
private _droppedObject = "Land_WoodenBox_F" createVehicle getPosATL player;

[_className] call EFUNC(common,getObjectData) params ["_displayName"];

[
    _droppedObject,
    format ["Pick up %1", _displayName],
    QUOTE(a3\missions_f_oldman\data\img\holdactions\holdaction_box_ca.paa),
    QUOTE(a3\missions_f_oldman\data\img\holdactions\holdaction_box_ca.paa),
    QUOTE(_this distance _target < 2),
    QUOTE(_caller distance _target < 2),
    {},
    {},
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _arguments params ["_className"];

        [_className] call FUNC(addToInventory);

        [_target, _actionId] call BIS_fnc_holdActionRemove;
        deleteVehicle _target;
    },
    {},
    [_className],
    2,
    nil,
    false,
    false
] call BIS_fnc_holdActionAdd;
