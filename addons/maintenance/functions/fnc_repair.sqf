#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Maintenance Repair Handler
 * Adds required items to vehicle inventory or repairs hitpoints
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Hitpoint <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle player, "Battery"] call misery_maintenance_fnc_repair;
 *
 * Public: No
*/

params ["_hitpoint", "_hitpointIndex"];

if !([["ToolKit"]] call EFUNC(common,hasItem)) exitWith {
    private _needTools = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "You need a toolkit to repair vehicles..."];
    [QEGVAR(common,tileText), _needTools] call CBA_fnc_localEvent;
};

[player] call EFUNC(common,nearVehicle) params ["_nearVehicle", "_vehicle"];

if (isNull _vehicle || _hitpoint isEqualTo "") exitWith {
    private _invalid = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "Invalid vehicle or hitpoint..."];
    [QEGVAR(common,tileText), _invalid] call CBA_fnc_localEvent;
};

private _requiredForRepair = "";
private _hitpointLower = toLower _hitpoint;
private _hitpointDamage = _vehicle getHitIndex _hitpointIndex;

{
    if ((_x select 0) in _hitpointLower) exitWith {_requiredForRepair = _x select 1};
} forEach MACRO_REPAIR_KITS;

switch (true) do {
    case (_hitpointDamage isEqualTo 0): {
        private _cannotRepair = format ["<t font='PuristaMedium' size='0.7'>%1</t>", format ["Cannot repair %1...", _hitpoint]];
        [QEGVAR(common,tileText), _cannotRepair] call CBA_fnc_localEvent;

        [_vehicle] call FUNC(listed);
    };
    case (_requiredForRepair isEqualTo ""): {
        private _cannotRepair = format ["<t font='PuristaMedium' size='0.7'>%1</t>", format ["Cannot repair %1...", _hitpoint]];
        [QEGVAR(common,tileText), _cannotRepair] call CBA_fnc_localEvent;

        [_vehicle] call FUNC(listed);
    };
    case ([[_requiredForRepair]] call EFUNC(common,hasItem)): {

        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607], false] call EFUNC(common,displayEnableControls);

        player switchMove "AinvPknlMstpSnonWnonDnon_medic0";
        [{
            params ["_vehicle", "_hitpoint", "_requiredForRepair"];

            [_requiredForRepair, QCLASS(emptyToolKit)] call EFUNC(common,itemDecrement);
            _vehicle setHitPointDamage [_hitpoint, 0];
            private _successfulRepair = format ["<t font='PuristaMedium' size='0.7'>%1</t>", format ["Repaired %1 with %2.", _hitpoint, [_requiredForRepair] call EFUNC(common,getItemData) select 0]];
            [QEGVAR(common,tileText), _successfulRepair] call CBA_fnc_localEvent;
            [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607], true] call EFUNC(common,displayEnableControls);
            [_vehicle] call FUNC(listed);
        }, [_vehicle, _hitpoint, _requiredForRepair], 5] call CBA_fnc_waitAndExecute;
    };
    case ("wheel" in _hitpointLower): {
        private _hasSpare = [[QCLASS(spareTire)]] call EFUNC(common,hasItem);
        private _hasPatchKit = [[QCLASS(tirePatchKit)]] call EFUNC(common,hasItem);

        if (_hitpointDamage isEqualTo 1 && _hasSpare) then {

            [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607], false] call EFUNC(common,displayEnableControls);

            player switchMove "AinvPknlMstpSnonWnonDnon_medic0";
            [{
                params ["_vehicle", "_hitpoint"];

                [player, QCLASS(spareTire)] call CBA_fnc_removeItem;
                _vehicle setHitPointDamage [_hitpoint, 0];
                private _tireRepairSuccess = format ["<t font='PuristaMedium' size='0.7'>%1</t>", format ["Repaired %1 with spare tire.", _hitpoint]];
                [QEGVAR(common,tileText), _tireRepairSuccess] call CBA_fnc_localEvent;
                [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607], true] call EFUNC(common,displayEnableControls);
                [_vehicle] call FUNC(listed);
            }, [_vehicle, _hitpoint], 5] call CBA_fnc_waitAndExecute;
        } else {
            if (_hitpointDamage isEqualTo 1) then {
                private _tireRepairFail = format ["<t font='PuristaMedium' size='0.7'>%1</t>", format ["You need a spare tire to repair %1.", _hitpoint]];
                [QEGVAR(common,tileText), _tireRepairFail] call CBA_fnc_localEvent;
            } else {
                if (_hitpointDamage > 0 && _hasPatchKit) then {

                    [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607], false] call EFUNC(common,displayEnableControls);

                    player switchMove "AinvPknlMstpSnonWnonDnon_medic0";
                    [{
                        params ["_vehicle", "_hitpoint"];

                        [QCLASS(tirePatchKit)] call EFUNC(common,itemDecrement);
                        _vehicle setHitPointDamage [_hitpoint, 0];
                        private _tirePatchSuccess = format ["<t font='PuristaMedium' size='0.7'>%1</t>", format ["Patched %1 with tire patch kit.", _hitpoint]];
                        [QEGVAR(common,tileText), _tirePatchSuccess] call CBA_fnc_localEvent;
                        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607], true] call EFUNC(common,displayEnableControls);
                        [_vehicle] call FUNC(listed);
                    }, [_vehicle, _hitpoint], 3] call CBA_fnc_waitAndExecute;
                } else {
                    private _tirePatchFail = format ["<t font='PuristaMedium' size='0.7'>%1</t>", format ["You need a tire patch kit to repair %1.", _hitpoint]];
                    [QEGVAR(common,tileText), _tirePatchFail] call CBA_fnc_localEvent;
                };
            };
        };
    };
};
