#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * refuel Vehicle Icon & name updater
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fuel_fnc_vehicleIcon
 *
*/

disableSerialization;

waitUntil {!isNull findDisplay 982385};

private _dialog = findDisplay 982385;
private _IconCtrl = _dialog displayCtrl 1602;
private _IconName = _dialog displayCtrl 1603;
private _IconCtrl_2 = _dialog displayCtrl 1604;
private _Vehiclename = getText (configFile >> "CfgVehicles" >> EGVAR(common,targetVehicleType) >> "displayName");

if (!isNil "_Vehiclename") then {
    _cfg = configFile >> "CfgVehicles" >> EGVAR(common,targetVehicleType);
    if (isClass _cfg) exitWith {
        _picPath = getText (_cfg >> "picture");
        _IconCtrl ctrlSetText _picPath;
        _IconName ctrlSetText _Vehiclename;

    _cfg_2 = configFile >> "CfgMagazines" >> _this select 0;
    if (isClass _cfg_2) exitWith {
        _picPath_2 = getText (_cfg_2 >> "picture");
        _IconCtrl_2 ctrlSetText _picPath_2;
        };
    };
};
