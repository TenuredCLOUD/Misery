#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Maintenance Repair Handler
 * Repairs vehicle hitpoints
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_maintenance_fnc_repair;
 *
 * Public: No
*/

private _dialog = findDisplay 274839;
private _list = _dialog displayCtrl 1500;
private _selectedIndex = lbCurSel _list;

if (_selectedIndex isEqualTo -1) exitWith {
    ctrlSetText [1001, localize ECSTRING(maintenance,NoRepairSelected)];
};

if !([["ToolKit"]] call EFUNC(common,hasItem)) exitWith {
    ctrlSetText [1001, localize LSTRING(NeedToolkitRepair)];
};

private _vehicle = ACE_player getVariable [QGVAR(currentVehicle), objNull];

if (isNull _vehicle) exitWith {
    ctrlSetText [1001, localize LSTRING(InvalidVehicle)];
};

private _indexData = _list lbData _selectedIndex;

// Quick Service repairs (fixes unlisted / hidden hitpoints, can fix things like bad alignments, etc... When everything else seems repaired)
if (_indexData select [0, 1] isEqualTo "[") exitWith {
    private _hiddenPoints = parseSimpleArray _indexData;

    [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], false] call EFUNC(common,displayEnableControls);
    ACE_player switchMove "AinvPknlMstpSnonWnonDnon_medic0";

    [{
        params ["_vehicle", "_hiddenPoints"];

        // Repair ONLY the unlisted / hidden hitpoints
        {
            _vehicle setHitIndex [_x, 0];
        } forEach _hiddenPoints;

        ctrlSetText [1001, localize LSTRING(LightServiceCompleted)];
        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
        [_vehicle] call FUNC(listed);
    }, [_vehicle, _hiddenPoints], 3] call CBA_fnc_waitAndExecute;
};

private _index = parseNumber _indexData;
private _hitpoints = getAllHitPointsDamage _vehicle;
private _hitpointNames = _hitpoints select 0;
private _selectionNames = _hitpoints select 1;

if (_index < 0 || _index >= count _hitpointNames) exitWith {
    ctrlSetText [1001, localize LSTRING(InvalidHitpoint)];
};

private _hitpoint = _hitpointNames select _index;
private _selectionName = _selectionNames select _index;
private _hitpointLower = toLower format ["%1 %2", _hitpoint, _selectionName];
private _hitpointDamage = _vehicle getHitIndex _index;
private _requiredForRepair = "";

if !(GVAR(difficulty)) then {
    {
        if ((_x select 0) in _hitpointLower) exitWith {_requiredForRepair = _x select 1};
    } forEach MACRO_MAINTENANCE_REPAIR;
} else {
    _requiredForRepair = "Toolkit";
};

switch (true) do {
    case ("wheel" in _hitpointLower): {
        private _hasSpare = [[QCLASS(spareTire)]] call EFUNC(common,hasItem);
        private _hasPatchKit = [[QCLASS(tirePatchKit)]] call EFUNC(common,hasItem);

        if (_hitpointDamage isEqualTo 1 && _hasSpare) then {
            [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], false] call EFUNC(common,displayEnableControls);
            ACE_player switchMove "AinvPknlMstpSnonWnonDnon_medic0";
            [{
                params ["_vehicle", "_index"];
                [ACE_player, QCLASS(spareTire)] call CBA_fnc_removeItem;
                _vehicle setHitIndex [_index, 0];
                ctrlSetText [1001, localize LSTRING(RepairedWheelSpare)];
                [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
                [_vehicle] call FUNC(listed);
            }, [_vehicle, _index], 3] call CBA_fnc_waitAndExecute;
        } else {
            if (_hitpointDamage isEqualTo 1) then {
                ctrlSetText [1001, localize LSTRING(NeedSpareTire)];
            } else {
                if (_hitpointDamage > 0 && _hasPatchKit) then {
                    [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], false] call EFUNC(common,displayEnableControls);
                    ACE_player switchMove "AinvPknlMstpSnonWnonDnon_medic0";
                    [{
                        params ["_vehicle", "_index"];
                        [QCLASS(tirePatchKit)] call EFUNC(common,itemDecrement);
                        _vehicle setHitIndex [_index, 0];
                        ctrlSetText [1001, localize LSTRING(PatchedWheelKit)];
                        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
                        [_vehicle] call FUNC(listed);
                    }, [_vehicle, _index], 3] call CBA_fnc_waitAndExecute;
                } else {
                    ctrlSetText [1001, localize LSTRING(NeedTirePatchKit)];
                };
            };
        };
    };
    case (_hitpointDamage isEqualTo 0): {
        ctrlSetText [1001, format [localize LSTRING(CannotRepair), _selectionName]];
        [_vehicle] call FUNC(listed);
    };
    case (_requiredForRepair isEqualTo ""): {
        ctrlSetText [1001, format [localize LSTRING(CannotRepair), _selectionName]];
        [_vehicle] call FUNC(listed);
    };
    case (_requiredForRepair isNotEqualTo ""): {
        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], false] call EFUNC(common,displayEnableControls);
        if !([[_requiredForRepair]] call EFUNC(common,hasItem)) exitWith {
            ctrlSetText [1001, format [localize LSTRING(NeedRepairItem), [_requiredForRepair] call EFUNC(common,getItemData) select 0, _selectionName]];
            [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
            [_vehicle] call FUNC(listed);
        };
        if ([[_requiredForRepair]] call EFUNC(common,hasItem)) exitWith {
            ACE_player switchMove "AinvPknlMstpSnonWnonDnon_medic0";
            [{
                params ["_vehicle", "_requiredForRepair", "_index", "_selectionName"];
                if !(GVAR(difficulty)) then {
                    [_requiredForRepair] call EFUNC(common,itemDecrement);
                };
                _vehicle setHitIndex [_index, 0];
                ctrlSetText [1001, format [localize LSTRING(RepairedHitpointSuccess), _selectionName, [_requiredForRepair] call EFUNC(common,getItemData) select 0]];
                [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
                [_vehicle] call FUNC(listed);
            }, [_vehicle, _requiredForRepair, _index, _selectionName], 3] call CBA_fnc_waitAndExecute;
        };
    };
};
