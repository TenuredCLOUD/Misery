#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Adds Load hold Interaction for created Object
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
 * [] call misery_furniture_fnc_addLoadAction
 *
*/

params ["_className", "_displayName", "_serverObject"];

[
    _serverObject,
    format ["Load %1 in nearby vehicle", _displayName],
    QUOTE(a3\data_f_destroyer\data\ui\igui\cfg\holdactions\holdaction_loadvehicle_ca.paa),
    QUOTE(a3\data_f_destroyer\data\ui\igui\cfg\holdactions\holdaction_loadvehicle_ca.paa),
    QUOTE(_this distance _target < 2 && [ARR_1(_target)] call EFUNC(common,nearVehicle) params [ARR_2('','_nearestVehicle')]; _nearestVehicle isNotEqualTo objNull),
    QUOTE(_caller distance _target < 2),
    {},
    {},
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _arguments params ["_className"];
        [_target] call EFUNC(common,nearVehicle) params ["", "_nearestVehicle"];
        if (_nearestVehicle isEqualTo objNull) exitWith {
            ["No vehicle nearby!", 1, [1, 1, 1, 1]] call CBA_fnc_notify;
        };
        [_className, _nearestVehicle, "load", _caller, _target, _actionId] call FUNC(processVehicleAction);
    },
    {},
    [_className],
    2,
    nil,
    false,
    false
] call BIS_fnc_holdActionAdd;


