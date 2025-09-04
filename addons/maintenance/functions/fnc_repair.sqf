#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Maintenance Repair Handler
 * Repairs vehicle hitpoints
 *
 * Arguments:
 * 0: HitpointIndex <STRING>
 * 1: SelectedIndex <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["0", 0] call misery_maintenance_fnc_repair;
 *
 * Public: No
*/

params ["_hitpointIndex", "_selectedIndex"];

if !([["ToolKit"]] call EFUNC(common,hasItem)) exitWith {
    ctrlSetText [1001, format ["You need a toolkit to repair vehicles..."]];
};

[player] call EFUNC(common,nearVehicle) params ["_nearVehicle", "_vehicle"];

if (isNull _vehicle) exitWith {
    ctrlSetText [1001, format ["Invalid vehicle..."]];
};

private _hitpoints = getAllHitPointsDamage _vehicle;
private _hitpointNames = _hitpoints select 0;
private _selectionNames = _hitpoints select 1;
private _index = parseNumber _hitpointIndex;

if (_index < 0 || _index >= count _hitpointNames) exitWith {
    ctrlSetText [1001, format ["Invalid hitpoint..."]];
};

private _hitpoint = _hitpointNames select _index;
private _selectionName = _selectionNames select _index;
private _requiredForRepair = "";
private _hitpointLower = toLower _hitpoint; //toLower _selectionName;
private _hitpointDamage = _vehicle getHitIndex _index;

{
    if ((_x select 0) in _hitpointLower) exitWith {_requiredForRepair = _x select 1};
} forEach MACRO_MAINTENANCE_REPAIR;

switch (true) do {
    case ("wheel" in _hitpointLower): {
        private _hasSpare = [[QCLASS(spareTire)]] call EFUNC(common,hasItem);
        private _hasPatchKit = [[QCLASS(tirePatchKit)]] call EFUNC(common,hasItem);

        if (_hitpointDamage isEqualTo 1 && _hasSpare) then {
            [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], false] call EFUNC(common,displayEnableControls);
            player switchMove "AinvPknlMstpSnonWnonDnon_medic0";
            [{
                params ["_vehicle", "_index"];
                [player, QCLASS(spareTire)] call CBA_fnc_removeItem;
                _vehicle setHitIndex [_index, 0];
                ctrlSetText [1001, format ["Repaired wheel with spare tire"]];
                [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
                [_vehicle] call FUNC(listed);
            }, [_vehicle, _index], 3] call CBA_fnc_waitAndExecute;
        } else {
            if (_hitpointDamage isEqualTo 1) then {
                ctrlSetText [1001, format ["You need a spare tire to repair wheel."]];
            } else {
                if (_hitpointDamage > 0 && _hasPatchKit) then {
                    [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], false] call EFUNC(common,displayEnableControls);
                    player switchMove "AinvPknlMstpSnonWnonDnon_medic0";
                    [{
                        params ["_vehicle", "_index"];
                        [QCLASS(tirePatchKit)] call EFUNC(common,itemDecrement);
                        _vehicle setHitIndex [_index, 0];
                        ctrlSetText [1001, format ["Patched wheel with tire patch kit."]];
                        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
                        [_vehicle] call FUNC(listed);
                    }, [_vehicle, _index], 3] call CBA_fnc_waitAndExecute;
                } else {
                    ctrlSetText [1001, format ["You need a tire patch kit to repair wheel."]];
                };
            };
        };
    };
    case (_hitpointDamage isEqualTo 0): {
        ctrlSetText [1001, format ["Cannot repair %1...", _selectionName]];
        [_vehicle] call FUNC(listed);
    };
    case (_requiredForRepair isEqualTo ""): {
        ctrlSetText [1001, format ["Cannot repair %1...", _selectionName]];
        [_vehicle] call FUNC(listed);
    };
    case (_requiredForRepair isNotEqualTo ""): {
        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], false] call EFUNC(common,displayEnableControls);
        if !([[_requiredForRepair]] call EFUNC(common,hasItem)) exitWith {
            ctrlSetText [1001, format ["You need %1 in order to repair %2...", [_requiredForRepair] call EFUNC(common,getItemData) select 0, _selectionName]];
            [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
            [_vehicle] call FUNC(listed);
        };
        if ([[_requiredForRepair]] call EFUNC(common,hasItem)) exitWith {
            player switchMove "AinvPknlMstpSnonWnonDnon_medic0";
            [{
                params ["_vehicle", "_requiredForRepair", "_index", "_selectionName"];
                [_requiredForRepair, QCLASS(emptyToolKit)] call EFUNC(common,itemDecrement);
                _vehicle setHitIndex [_index, 0];
                ctrlSetText [1001, format ["Repaired %1 with %2.", _selectionName, [_requiredForRepair] call EFUNC(common,getItemData) select 0]];
                [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
                [_vehicle] call FUNC(listed);
            }, [_vehicle, _requiredForRepair, _index, _selectionName], 3] call CBA_fnc_waitAndExecute;
        };
    };
};
