#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Maintenance UI List populater
 * Defines the needed repairs, or possible scavenging
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_maintenance_fnc_listed;
 *
 * Public: No
*/

waitUntil {!isNull findDisplay 274839};

if (!isNull findDisplay 274839) exitWith {

    private ["_list","_RepairB","_ScavengeB","_Vehiclename","_index"];

    _list = findDisplay 274839 displayCtrl 1500;
    _RepairB = findDisplay 274839 displayCtrl 1600;
    _ScavengeB = findDisplay 274839 displayCtrl 1601;

    if (EGVAR(common,targetVehicleType) isEqualTo "") exitWith {
        _RepairB ctrlShow false;
        _ScavengeB ctrlShow false;
    };

    _Vehiclename = getText (configFile >> "CfgVehicles" >> EGVAR(common,targetVehicleType) >> "displayName");

    lbClear _list;

    if (isNil "_Vehiclename") exitWith {};


    private _vehicle = EGVAR(common,targetVehicle);
    private _hitpoints = getAllHitPointsDamage _vehicle;
    private _hitpointNames = _hitpoints select 0;
    private _damages = _hitpoints select 2;
    {
        private _hitpointName = _hitpointNames select _forEachIndex;
        private _damage = _damages select _forEachIndex;
        private _damagePercent = _damage * 100;
        _index = _list lbAdd format ["%1 - Damage: %2%3", _hitpointName, _damagePercent,"%"];
        _list lbSetData [_index, _hitpointName];
    } forEach _hitpointNames;
};



