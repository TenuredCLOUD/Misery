#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Populates furniture inventory
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_furniture_fnc_openInventory
 *
*/

createDialog QCLASS(furniture_ui);

private _display = findDisplay 982389;
private _list = _display displayCtrl 1500;
private _noteBox = _display displayCtrl 1001;
private _encumbrance = _display displayCtrl 1005;
private _encumbranceBar = _display displayCtrl 1800;

private _currentMass = player getVariable [QGVAR(furnitureLoad), MACRO_PLAYER_DEFAULTS_LOW];

lbClear _list;
_noteBox ctrlSetText "";
player setVariable [QGVAR(selectedFurniture), ""];

private _inventory = player getVariable [QGVAR(furnitureInventory), []];

{
    private _displayName = getText (configFile >> "CfgVehicles" >> _x >> "displayName");
    private _index = _list lbAdd _displayName;
    _list lbSetData [_index, _x];
} forEach _inventory;

// Handle encumberance showing in GUI
if (GVAR(maxCarryMass) isNotEqualTo -1) then {
    _encumbrance ctrlSetText format ["Encumbrance: %1Kg ~ %2Lb(s)", _currentMass, round (_currentMass * 2.205)];
    _encumbranceBar progressSetPosition (_currentMass / GVAR(maxCarryMass));
} else {
    [982389, [1005, 1800], false] call EFUNC(common,displayShowControls);
};
