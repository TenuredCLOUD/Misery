#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Adds furniture to vehicle inventory, respecting cargo limits
 *
 * Arguments:
 * 0: Classname <STRING>
 * 1: Vehicle <OBJECT>
 * 2: Caller <OBJECT>
 * 3: Target <OBJECT>
 * 4: Action ID <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["Land_ChairWood_F", _vehicle] call misery_furniture_fnc_addToVehicleInventory
 *
*/

params ["_className", "_vehicle", "_caller", "_target", "_actionId"];

private _furnitureCfg = missionConfigFile >> "CfgMisery_Furniture" >> _className;
private _itemMass = getNumber (_furnitureCfg >> "mass");
private _itemName = getText (configFile >> "CfgVehicles" >> _className >> "displayName");

private _vehicleCfg = missionConfigFile >> "CfgMisery_VehicleData" >> (typeOf _vehicle);
private _maxCargoMass = getNumber (_vehicleCfg >> "maxCargoMass");

private _currentCargoMass = _vehicle getVariable [QGVAR(furnitureCargoMass), 0];
private _inventory = _vehicle getVariable [QGVAR(furnitureCargoInventory), []];

if (_currentCargoMass + _itemMass > _maxCargoMass) exitWith {
    private _tooHeavyTip = format ["Cannot load %1 (too heavy, %2 kg) into %3", _itemName, _itemMass, getText (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")];
    [_tooHeavyTip, 1, [1, 1, 1, 1]] call CBA_fnc_notify;
};

private _placed = _caller getVariable [QGVAR(placedFurniture), []];
_placed deleteAt (_placed find _target);
_caller setVariable [QGVAR(placedFurniture), _placed, true];
[_target, _actionId] call BIS_fnc_holdActionRemove;
deleteVehicle _target;

_inventory pushBack _className;
_vehicle setVariable [QGVAR(furnitureCargoInventory), _inventory, true];
_vehicle setVariable [QGVAR(furnitureCargoMass), _currentCargoMass + _itemMass, true];

private _addedTip = format ["Loaded %1 (%2 kg) into %3", _itemName, _itemMass, getText (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")];
[_addedTip, 1, [1, 1, 1, 1]] call CBA_fnc_notify;
