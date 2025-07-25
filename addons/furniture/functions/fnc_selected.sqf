#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Store selected object into array for player & update image for object
 *
 * Arguments:
 * 0: Control <CONTROL>
 * 1: Index <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_furniture_fnc_selected
 */

params ["_control", "_index"];

private _className = _control lbData _index;
private _displayName = getText (configFile >> "CfgVehicles" >> _className >> "displayName");
private _furnitureCfg = missionConfigFile >> "CfgMisery_Furniture" >> _className;
private _itemMass = getNumber (_furnitureCfg >> "mass");

private _display = findDisplay 982389;
if (isNull _display) then {
    _display = findDisplay 982390;
};

// Only update noteBox for player furniture ui and not vehicle cargo ui
private _noteBox = findDisplay 982389 displayCtrl 1001;
if (GVAR(maxCarryMass) isNotEqualTo -1) then {
    _noteBox ctrlSetText format ["%1 - weight: %2Kg ~ %3Lb(s)", _displayName, _itemMass, round (_itemMass * 2.205)];
} else {
    _noteBox ctrlSetText _displayName;
};

[_display, _className] call FUNC(updateImage);

// Store selected className for placement
player setVariable [QGVAR(selectedFurniture), _className];
