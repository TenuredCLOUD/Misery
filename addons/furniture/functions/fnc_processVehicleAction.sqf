#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: TenuredCLOUD
 * Processes vehicle furniture actions (load/unload) with progress bar
 *
 * Arguments:
 * 0: Classname <STRING>
 * 1: Vehicle <OBJECT>
 * 2: Action type <STRING> (default: "unload")
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_furniture_fnc_processVehicleAction
 *
*/

params ["_className", "_vehicle", ["_actionType", "unload"], "_caller", "_target", "_actionId"];

private _dialog = findDisplay 982390;
private _displayName = getText (configFile >> "CfgVehicles" >> _className >> "displayName");
private _vehicleName = getText (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
private _progressBar = _dialog displayCtrl 1800;

player setVariable [QGVAR(processVehicleAction), true];

private _interrupt = _dialog displayAddEventHandler ["KeyDown", {
    params ["_displayOrControl", "_key"];
    if (_key isEqualTo DIK_ESCAPE) then {
        player setVariable [QGVAR(processVehicleAction), false];
        [parseText "<t font='PuristaMedium' size='1'>Action interrupted...</t>", true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
    };
}];

private _actionText = ["Loading", "Unloading"] select (_actionType isEqualTo "unload");
private _progressText = format ["%1 %2...", _actionText, _displayName];

[982390, [1600, 1602], false] call EFUNC(common,displayShowControls);

[_progressText,
5,
{
    player getVariable [QGVAR(processVehicleAction), false]
},
{
    params ["_args"];
    _args params ["_className", "_vehicle", "_actionType", "_caller", "_target", "_actionId", "_dialog", "_interrupt", "_vehicleName", "_displayName", "_progressBar"];

    if (_actionType isEqualTo "unload") then {
        private _inventory = _vehicle getVariable [QGVAR(furnitureCargoInventory), []];
        private _index = _inventory find _className;
        if (_index isNotEqualTo -1) then {
            _inventory deleteAt _index;
            _vehicle setVariable [QGVAR(furnitureCargoInventory), _inventory, true];
            private _furnitureCfg = missionConfigFile >> "CfgMisery_Furniture" >> _className;
            private _itemMass = getNumber (_furnitureCfg >> "mass");
            private _currentCargoMass = _vehicle getVariable [QGVAR(furnitureCargoMass), 0];
            _vehicle setVariable [QGVAR(furnitureCargoMass), _currentCargoMass - _itemMass max 0, true];
            [_className] call FUNC(addToInventory);
            private _listBox = _dialog displayCtrl 1500;
            _listBox lbDelete _index;
            _progressBar progressSetPosition ((_currentCargoMass - _itemMass) / (getNumber (missionConfigFile >> "CfgMisery_VehicleData" >> (typeOf _vehicle) >> "maxCargoMass") max 0.01));
        };
    } else {
        [_className, _vehicle, _caller, _target, _actionId] call FUNC(addToVehicleInventory);
        private _currentCargoMass = _vehicle getVariable [QGVAR(furnitureCargoMass), 0];
        _progressBar progressSetPosition (_currentCargoMass / (getNumber (missionConfigFile >> "CfgMisery_VehicleData" >> (typeOf _vehicle) >> "maxCargoMass") max 0.01));
    };

    player setVariable [QGVAR(processVehicleAction), nil];
    _dialog displayRemoveEventHandler ["KeyDown", _interrupt];
    [982390, [1600, 1602], true] call EFUNC(common,displayShowControls);
},
{
    params ["_args"];
    _args params ["_className", "_vehicle", "_actionType", "_caller", "_target", "_actionId", "_dialog", "_interrupt", "_vehicleName", "_displayName", "_progressBar"];

    if (_actionType isEqualTo "unload") then {
        _dialog displayRemoveEventHandler ["KeyDown", _interrupt];
        [982390, [1600, 1602], true] call EFUNC(common,displayShowControls);
    } else {
        private _cancelledLoadingTip = format ["Cancelled loading %1...", _displayName];
        [_cancelledLoadingTip, 1, [1, 1, 1, 1]] call CBA_fnc_notify;
    };
    player setVariable [QGVAR(processVehicleAction), nil];
},
[_className, _vehicle, _actionType, _caller, _target, _actionId, _dialog, _interrupt, _vehicleName, _displayName, _progressBar]] call CBA_fnc_progressBar;
