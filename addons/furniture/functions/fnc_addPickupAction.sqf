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

private _pickupAction = [
    QGVAR(pickup_menu),
    format ["Pick up %1", _displayName],
    QUOTE(a3\missions_f_oldman\data\img\holdactions\holdaction_box_ca.paa),
    {
        params ["_target", "_player", "_args"];
        _args params ["_className"];

        private _owner = _target getVariable [QGVAR(placementOwner), ""];

        if (_owner isNotEqualTo "" && {_owner isNotEqualTo (getPlayerUID player)}) exitWith {
            ["You do not own this...", 1, [1, 1, 1, 1]] call CBA_fnc_notify;
        };

        if !([_target] call EFUNC(common,emptyObject)) exitWith {
            ["Remove objects cargo before picking it up...", 1, [1, 1, 1, 1]] call CBA_fnc_notify;
        };

        // Remove owner
        _target setVariable [QGVAR(placementOwner), nil, true];

        // Find and remove tracked object
        private _objectTag = vehicleVarName _target;
        if (!isNil "_objectTag") then {
            private _index = GVAR(registeredPlacement) find _objectTag;

            if (_index isNotEqualTo -1) then {
                GVAR(registeredPlacement) deleteAt _index;
                publicVariableServer QGVAR(registeredPlacement);
            };
        };

        [_className] call FUNC(addToInventory);
        private _placed = player getVariable [QGVAR(placedFurniture), []];
        _placed deleteAt (_placed find _target);
        player setVariable [QGVAR(placedFurniture), _placed];
        deleteVehicle _target;
    },
    {true},
    {},
    [_className],
    [0, 0, 0],
    3
] call ace_interact_menu_fnc_createAction;

[_serverObject, 0, ["ACE_MainActions"], _pickupAction] call ace_interact_menu_fnc_addActionToObject;
