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
    private _needTools = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "You need a toolkit to repair vehicles..."];
    [QEGVAR(common,tileText), _needTools] call CBA_fnc_localEvent;
};

[player] call EFUNC(common,nearVehicle) params ["_nearVehicle", "_vehicle"];

if (isNull _vehicle) exitWith {
    private _invalid = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "Invalid vehicle..."];
    [QEGVAR(common,tileText), _invalid] call CBA_fnc_localEvent;
};

private _hitpoints = getAllHitPointsDamage _vehicle;
private _hitpointNames = _hitpoints select 0;
private _selectionNames = _hitpoints select 1;
private _index = parseNumber _hitpointIndex;

if (_index < 0 || _index >= count _hitpointNames) exitWith {
    private _invalid = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "Invalid hitpoint..."];
    [QEGVAR(common,tileText), _invalid] call CBA_fnc_localEvent;
};

private _hitpoint = _hitpointNames select _index;
private _selectionName = _selectionNames select _index;
private _requiredForRepair = "";
private _hitpointLower = toLower _hitpoint;
private _hitpointDamage = _vehicle getHitPointDamage _hitpoint;

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
                params ["_vehicle", "_hitpoint", "_selectionName"];
                [player, QCLASS(spareTire)] call CBA_fnc_removeItem;
                _vehicle setHitPointDamage [_hitpoint, 0];
                private _tireRepairSuccess = format ["<t font='PuristaMedium' size='0.7'>%1</t>", format ["Repaired %1 with spare tire.", _selectionName]];
                [QEGVAR(common,tileText), _tireRepairSuccess] call CBA_fnc_localEvent;
                [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
                [_vehicle] call FUNC(listed);
            }, [_vehicle, _hitpoint, _selectionName], 3] call CBA_fnc_waitAndExecute;
        } else {
            if (_hitpointDamage isEqualTo 1) then {
                private _tireRepairFail = format ["<t font='PuristaMedium' size='0.7'>%1</t>", format ["You need a spare tire to repair %1.", _selectionName]];
                [QEGVAR(common,tileText), _tireRepairFail] call CBA_fnc_localEvent;
            } else {
                if (_hitpointDamage > 0 && _hasPatchKit) then {
                    [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], false] call EFUNC(common,displayEnableControls);
                    player switchMove "AinvPknlMstpSnonWnonDnon_medic0";
                    [{
                        params ["_vehicle", "_hitpoint", "_selectionName"];
                        [QCLASS(tirePatchKit)] call EFUNC(common,itemDecrement);
                        _vehicle setHitPointDamage [_hitpoint, 0];
                        private _tirePatchSuccess = format ["<t font='PuristaMedium' size='0.7'>%1</t>", format ["Patched %1 with tire patch kit.", _selectionName]];
                        [QEGVAR(common,tileText), _tirePatchSuccess] call CBA_fnc_localEvent;
                        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
                        [_vehicle] call FUNC(listed);
                    }, [_vehicle, _hitpoint, _selectionName], 3] call CBA_fnc_waitAndExecute;
                } else {
                    private _tirePatchFail = format ["<t font='PuristaMedium' size='0.7'>%1</t>", format ["You need a tire patch kit to repair %1.", _selectionName]];
                    [QEGVAR(common,tileText), _tirePatchFail] call CBA_fnc_localEvent;
                };
            };
        };
    };
    case (_hitpointDamage isEqualTo 0): {
        private _cannotRepair = format ["<t font='PuristaMedium' size='0.7'>%1</t>", format ["Cannot repair %1...", _selectionName]];
        [QEGVAR(common,tileText), _cannotRepair] call CBA_fnc_localEvent;
        [_vehicle] call FUNC(listed);
    };
    case (_requiredForRepair isEqualTo ""): {
        private _cannotRepair = format ["<t font='PuristaMedium' size='0.7'>%1</t>", format ["Cannot repair %1...", _selectionName]];
        [QEGVAR(common,tileText), _cannotRepair] call CBA_fnc_localEvent;
        [_vehicle] call FUNC(listed);
    };
    case ([[_requiredForRepair]] call EFUNC(common,hasItem)): {
        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], false] call EFUNC(common,displayEnableControls);
        player switchMove "AinvPknlMstpSnonWnonDnon_medic0";
        [{
            params ["_vehicle", "_hitpoint", "_requiredForRepair", "_selectionName"];
            [_requiredForRepair, QCLASS(emptyToolKit)] call EFUNC(common,itemDecrement);
            _vehicle setHitPointDamage [_hitpoint, 0];
            private _successfulRepair = format ["<t font='PuristaMedium' size='0.7'>%1</t>", format ["Repaired %1 with %2.", _selectionName, [_requiredForRepair] call EFUNC(common,getItemData) select 0]];
            [QEGVAR(common,tileText), _successfulRepair] call CBA_fnc_localEvent;
            [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
            [_vehicle] call FUNC(listed);
        }, [_vehicle, _hitpoint, _requiredForRepair, _selectionName], 3] call CBA_fnc_waitAndExecute;
    };
};
