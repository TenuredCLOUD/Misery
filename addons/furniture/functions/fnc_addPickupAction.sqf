#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Adds pickup hold Interaction for created Object
 *
 * Arguments:
 * 0: Classname <STRING>
 * 1: Display Name <STRING>
 * 2: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_furniture_fnc_addPickupAction
 *
*/

params ["_className", "_displayName", "_serverObject"];

[
    _serverObject,
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
        if !([_target] call EFUNC(common,emptyObject)) exitWith {
            ["Remove objects cargo before picking it up...", 1, [1, 1, 1, 1]] call CBA_fnc_notify;
        };
        [_className] call FUNC(addToInventory);
        private _placed = _caller getVariable [QGVAR(placedFurniture), []];
        _placed deleteAt (_placed find _target);
        _caller setVariable [QGVAR(placedFurniture), _placed];
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
