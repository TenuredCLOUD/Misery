#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Maintenance Scavenge Handler
 * Scavenges parts from vehicles
 *
 * Arguments:
 * 0: HitpointIndex <STRING>
 * 1: SelectedIndex <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["0", 0] call misery_maintenance_fnc_scavenge;
 *
 * Public: No
*/

params ["_hitpointIndex", "_selectedIndex"];

if !([["ToolKit"]] call EFUNC(common,hasItem)) exitWith {
    ctrlSetText [1001, format ["You need a toolkit to scavenge from vehicles..."]];
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
    ctrlSetText [1001, format ["Invalid vehicle..."]];
};

private _hitpoint = _hitpointNames select _index;
private _selectionName = _selectionNames select _index;
private _scavengedItem = "";
private _hitpointLower = toLower _selectionName;
private _hitpointDamage = _vehicle getHitIndex _index;

{
    if ((_x select 0) in _hitpointLower) exitWith {_scavengedItem = _x select 1};
} forEach MACRO_MAINTENANCE_SCAVENGE;

switch (true) do {
    case ("wheel" in _hitpointLower): {
        if (_hitpointDamage > 0) exitWith {
            ctrlSetText [1001, format ["%1 is too damaged to scavenge...", _selectionName]];
            [_vehicle] call FUNC(listed);
        };

        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], false] call EFUNC(common,displayEnableControls);
        player switchMove "AinvPknlMstpSnonWnonDnon_medic0";
        [{
            params ["_vehicle", "_index", "_selectionName", "_scavengedItem"];
            [player, _scavengedItem, true] call CBA_fnc_addItem;
            _vehicle setHitIndex [_index, 1];
            ctrlSetText [1001, format ["%1 scavenged...", _selectionName]];
            [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
            [_vehicle] call FUNC(listed);
        }, [_vehicle, _index, _selectionName, _scavengedItem], 3] call CBA_fnc_waitAndExecute;
    };
    case (_hitpointDamage isEqualTo 1): {
        ctrlSetText [1001, format ["Cannot scavenge %1...", _selectionName]];
        [_vehicle] call FUNC(listed);
    };
    case (_scavengedItem isEqualTo ""): {
        ctrlSetText [1001, format ["Cannot scavenge %1...", _selectionName]];
        [_vehicle] call FUNC(listed);
    };
    case (_scavengedItem isNotEqualTo ""): {
        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], false] call EFUNC(common,displayEnableControls);
        if !([[_scavengedItem, QCLASS(emptyToolKit)]] call EFUNC(common,hasItem)) exitWith {
            ctrlSetText [1001, format ["You need %1 or an %2 in order to scavenge %3...", [_scavengedItem] call EFUNC(common,getItemData) select 0, [QCLASS(emptyToolKit)] call EFUNC(common,getItemData) select 0, _selectionName]];
            [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
            [_vehicle] call FUNC(listed);
        };
        if ([[QCLASS(emptyToolKit)]] call EFUNC(common,hasItem)) exitWith {
            player switchMove "AinvPknlMstpSnonWnonDnon_medic0";
            [{
                params ["_vehicle", "_index", "_selectionName", "_scavengedItem"];
                player removeItem QCLASS(emptyToolKit);
                [player, _scavengedItem, 1, true] call CBA_fnc_addMagazine;
                _vehicle setHitIndex [_index, 1];
                ctrlSetText [1001, format ["Scavenged %1 from %3, used %2...", [_scavengedItem] call EFUNC(common,getItemData) select 0, [QCLASS(emptyToolKit)] call EFUNC(common,getItemData) select 0, _selectionName]];
                [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
                [_vehicle] call FUNC(listed);
            }, [_vehicle, _index, _selectionName, _scavengedItem], 3] call CBA_fnc_waitAndExecute;
        };
        if ([[_scavengedItem]] call EFUNC(common,hasItem)) then {
            [_scavengedItem] call EFUNC(common,itemIncrement) params ["_incremented"];
            if !(_incremented) exitWith {
                ctrlSetText [1001, format ["%1 doesn't have enough room left for scavenging %2...", [_scavengedItem] call EFUNC(common,getItemData) select 0, _selectionName]];
                [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
                [_vehicle] call FUNC(listed);
            };
            if (_incremented) exitWith {
                player switchMove "AinvPknlMstpSnonWnonDnon_medic0";
                [{
                    params ["_vehicle", "_index", "_selectionName", "_scavengedItem"];
                    _vehicle setHitIndex [_index, 1];
                    ctrlSetText [1001, format ["Scavenged parts for %1 from %2...", [_scavengedItem] call EFUNC(common,getItemData) select 0, _selectionName]];
                    [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610], true] call EFUNC(common,displayEnableControls);
                    [_vehicle] call FUNC(listed);
                }, [_vehicle, _index, _selectionName, _scavengedItem], 3] call CBA_fnc_waitAndExecute;
            };
        };
    };
};
