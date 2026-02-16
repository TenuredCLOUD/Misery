#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Adds furniture item to furniture inventory or forces direct placement if too heavy
 *
 * Arguments:
 * 0: Classname <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_furniture_fnc_addToInventory
 *
*/

params ["_className"];

if (_className isKindOf "StaticWeapon") exitWith {
    [_className] call FUNC(forcedPlacement);
};

private _inventory = player getVariable [QGVAR(furnitureInventory), []];
private _currentMass = player getVariable [QGVAR(furnitureLoad), MACRO_PLAYER_DEFAULTS_LOW];
private _furnitureCfg = missionConfigFile >> "CfgMisery_Furniture" >> _className;
private _itemMass = [[_className] call EFUNC(common,getObjectMass), getNumber (_furnitureCfg >> "mass")] select (isNumber (_furnitureCfg >> "mass"));

//private _itemName = getText (configFile >> "CfgVehicles" >> _className >> "displayName");

[_className] call EFUNC(common,getObjectData) params ["_itemName"];

if ((GVAR(maxCarryMass) isNotEqualTo -1) && _currentMass + _itemMass > GVAR(maxCarryMass)) exitWith {
    private _tooHeavyTip = format ["Cannot carry %1 (too heavy, %2 kg). Place it now...", _itemName, _itemMass];
    [_tooHeavyTip, 1, [1, 1, 1, 1]] call CBA_fnc_notify;
    (findDisplay 982390) closeDisplay 2; // Force exit vehicle cargo display if open
    [_className] call FUNC(forcedPlacement);
};

_inventory pushBack _className;
player setVariable [QGVAR(furnitureInventory), _inventory];

private _newMass = _currentMass + _itemMass;
player setVariable [QGVAR(furnitureLoad), _newMass];

private _addedToInventory = format ["Added %1 to furniture inventory (%2 kg)", _itemName, _itemMass];
[_addedToInventory, 1, [1, 1, 1, 1]] call CBA_fnc_notify;
