#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Maintenance Scavenge Handler
 * Scavenges parts or batteries from vehicle
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Hitpoint <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle player, "Battery"] call misery_maintenance_fnc_scavenge;
 *
 * Public: No
*/

params ["_hitpoint", "_hitpointIndex"];

if !([["ToolKit"]] call EFUNC(common,hasItem)) exitWith {
    private _needTools = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "You need a toolkit to scavenge from vehicles..."];
    [QEGVAR(common,tileText), _needTools] call CBA_fnc_localEvent;
};

[player] call EFUNC(common,nearVehicle) params ["_nearVehicle", "_vehicle"];

if (isNull _vehicle || _hitpoint isEqualTo "") exitWith {
    private _invalid = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "Invalid vehicle or hitpoint..."];
    [QEGVAR(common,tileText), _invalid] call CBA_fnc_localEvent;
};

private _scavengedItem = "";
private _hitpointLower = toLower _hitpoint;
private _hitpointDamage = _vehicle getHitIndex _hitpointIndex;

{
    if ((_x select 0) in _hitpointLower) exitWith {_scavengedItem = _x select 1};
} forEach MACRO_REPAIR_SCAVENGE;

switch (true) do {
    case (_hitpointDamage isEqualTo 1): {
        private _cannotScavenge = format ["<t font='PuristaMedium' size='0.7'>%1</t>", format ["Cannot scavenge %1...", _hitpoint]];
        [QEGVAR(common,tileText), _cannotScavenge] call CBA_fnc_localEvent;

        [_vehicle] call FUNC(listed);
    };
    case (_scavengedItem isEqualTo ""): {
        private _cannotScavenge = format ["<t font='PuristaMedium' size='0.7'>%1</t>", format ["Cannot scavenge %1...", _hitpoint]];
        [QEGVAR(common,tileText), _cannotScavenge] call CBA_fnc_localEvent;

        [_vehicle] call FUNC(listed);
    };
    case (_scavengedItem isNotEqualTo ""): {

        [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607], false] call EFUNC(common,displayEnableControls);

        player switchMove "AinvPknlMstpSnonWnonDnon_medic0";
            [{
                params ["_vehicle", "_hitpoint", "_scavengedItem"];

                [player, _scavengedItem, 1, true] call CBA_fnc_addMagazine;
                _vehicle setHitPointDamage [_hitpoint, 1];
                private _scavengeSuccess = format ["<t font='PuristaMedium' size='0.7'>%1</t>", format ["Scavenged %1 from %2...", [_scavengedItem] call EFUNC(common,getItemData) select 0, _hitpoint]];
                [QEGVAR(common,tileText), _scavengeSuccess] call CBA_fnc_localEvent;
                [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607], true] call EFUNC(common,displayEnableControls);
                [_vehicle] call FUNC(listed);
            }, [_vehicle, _hitpoint, _scavengedItem], 5] call CBA_fnc_waitAndExecute;

        [_vehicle] call FUNC(listed);
    };
    case ("wheel" in _hitpointLower): {
        if (_hitpointDamage > 0) exitWith {
            private _tireScavengeDamaged = format ["<t font='PuristaMedium' size='0.7'>%1</t>", format ["%1 is too damaged to scavenge...", _hitpoint]];
            [QEGVAR(common,tileText), _tireScavengeDamaged] call CBA_fnc_localEvent;
        };

        if (_hitpointDamage isEqualTo 0) exitWith {

            [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607], false] call EFUNC(common,displayEnableControls);

            player switchMove "AinvPknlMstpSnonWnonDnon_medic0";
            [{
                params ["_vehicle", "_hitpoint", "_scavengedItem"];

                [player, _scavengedItem, true] call CBA_fnc_addItem;
                _vehicle setHitPointDamage [_hitpoint, 1];
                private _tireScavengeSuccess = format ["<t font='PuristaMedium' size='0.7'>%1</t>", format ["%1 scavenged...", _hitpoint]];
                [QEGVAR(common,tileText), _tireScavengeSuccess] call CBA_fnc_localEvent;
                [274839, [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607], true] call EFUNC(common,displayEnableControls);
                [_vehicle] call FUNC(listed);
            }, [_vehicle, _hitpoint, _scavengedItem], 5] call CBA_fnc_waitAndExecute;
        };
    };
};
