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
    QUOTE(_this distance _target < 2 && ([ARR_1(_target)] call EFUNC(common,nearVehicle)) select 0),
    QUOTE(_caller distance _target < 2),
    {},
    {},
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _arguments params ["_className"];
        [_target] call EFUNC(common,nearVehicle) params ["", "_nearestVehicle"];

        if (_target getVariable [QGVAR(placmentOwner),""] isNotEqualTo (getPlayerUID _caller)) exitWith {
            ["You do not own this...", 1, [1, 1, 1, 1]] call CBA_fnc_notify;
        };

        if (_nearestVehicle isEqualTo objNull) exitWith {
            ["No vehicle nearby!", 1, [1, 1, 1, 1]] call CBA_fnc_notify;
        };
        if !([_target] call EFUNC(common,emptyObject)) exitWith {
            ["Remove objects cargo before loading...", 1, [1, 1, 1, 1]] call CBA_fnc_notify;
        };

        // Remove owner
        _target setVariable [QGVAR(placmentOwner), nil, true];

        // Find and remove tracked object
        private _objectTag = vehicleVarName _target;
        if (!isNil "_objectTag") then {
            private _index = GVAR(registeredPlacement) find _objectTag;

            if (_index isNotEqualTo -1) then {
                GVAR(registeredPlacement) deleteAt _index;
                publicVariableServer QGVAR(registeredPlacement);
            };
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


