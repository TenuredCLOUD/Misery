#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Generator icon updater
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_generator_fnc_icon
 *
*/

[player] call FUNC(nearGenerator) params ["", "", "_generatorType"];

disableSerialization;

[{!isNull findDisplay 573849}, {
    params ["_args"];
    _args params ["_generatorType"];

    private _dialog = findDisplay 573849;
    private _iconCtrl = _dialog displayCtrl 1200;
    private _iconName = _dialog displayCtrl 1002;

    private _vehicleName = getText (configFile >> "CfgVehicles" >> _generatorType >> "displayName");

    if (!isNil "_vehicleName") then {
        _cfg = configFile >> "CfgVehicles" >> _generatorType;
        if (isClass _cfg) exitWith {
            _iconName ctrlSetText _vehicleName;
        };
    };
}, [_generatorType]] call CBA_fnc_waitUntilAndExecute;
