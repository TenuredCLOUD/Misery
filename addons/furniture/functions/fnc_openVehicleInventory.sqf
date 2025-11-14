#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Opens vehicle furniture inventory GUI
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_furniture_fnc_openVehicleInventory
 *
*/

params ["_vehicle"];

createDialog QCLASS(vehicleFurniture_ui);

private _dialog = findDisplay 982390;
private _listBox = _dialog displayCtrl 1500;
private _unloadButton = _dialog displayCtrl 1600;
private _vehicleInfo = _dialog displayCtrl 1001;

private _inventory = _vehicle getVariable [QGVAR(furnitureCargoInventory), []];

[_vehicle] call EFUNC(common,getObjectData) params ["_displayName"];

lbClear _listBox;
{
    [_x] call EFUNC(common,getObjectData) params ["_displayName"];
    //private _displayName = getText (configFile >> "CfgVehicles" >> _x >> "displayName");
    private _furnitureCfg = missionConfigFile >> "CfgMisery_Furniture" >> _x;
    private _itemMass = [[_x] call EFUNC(common,getObjectMass), getNumber (_furnitureCfg >> "mass")] select (isNumber (_furnitureCfg >> "mass"));
    private _index = _listBox lbAdd format ["%1 (%2 kg)", _displayName, _itemMass];
    _listBox lbSetData [_index, _x];
} forEach _inventory;

_unloadButton ctrlAddEventHandler ["ButtonClick", {
    params ["_control"];
    private _dialog = findDisplay 982390;
    private _listBox = _dialog displayCtrl 1500;
    private _vehicle = player getVariable [QGVAR(targetVehicle), objNull];
    private _selectedIndex = lbCurSel _listBox;
    if (_selectedIndex isEqualTo -1) exitWith {
        ctrlSetText [1001, "Select an item to unload..."];
    };
    private _className = _listBox lbData _selectedIndex;
    [_className, _vehicle, "unload"] call FUNC(processVehicleAction);

}];

_vehicleInfo ctrlSetText format ["%1", _displayName];
player setVariable [QGVAR(targetVehicle), _vehicle];

[{
    params ["_args", "_handle"];
    _args params ["_dialog", "_vehicle"];

    private _massInfo = _dialog displayCtrl 1005;
    private _progressBar = _dialog displayCtrl 1800;
    private _currentCargoMass = _vehicle getVariable [QGVAR(furnitureCargoMass), 0];
    private _vehicleCfg = missionConfigFile >> "CfgMisery_VehicleData" >> (typeOf _vehicle);
    private _maxCargoMass = [maxLoad _vehicle, getNumber (_vehicleCfg >> "maxCargoMass")] select (isNumber (_vehicleCfg >> "maxCargoMass"));

    if (isNull _dialog) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    _massInfo ctrlSetText format ["Cargo Mass: %1Kg ~ %2Lb(s) / %3Kg ~ %4Lb(s)", _currentCargoMass, round (_currentCargoMass * 2.205), _maxCargoMass, round (_maxCargoMass * 2.205)];
    _progressBar progressSetPosition (_currentCargoMass / _maxCargoMass max 0.01);
}, 1, [_dialog, _vehicle]] call CBA_fnc_addPerFrameHandler;
