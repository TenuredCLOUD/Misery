#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Cold
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_temperature_fnc_cold;
 *
 * Public: No
*/
private _playerTemperature = player getVariable [QGVAR(thermalIndex), MACRO_PLAYER_DEFAULTS_TEMP];
private _exposure = player getVariable [QGVAR(exposure), MACRO_PLAYER_DEFAULTS_LOW];
private _hunger = player getVariable [QEGVAR(survival,hunger), MACRO_PLAYER_DEFAULTS_HIGH];
private _parasites = player getVariable [QEGVAR(survival,parasites), MACRO_PLAYER_DEFAULTS_LOW];
private _infection = player getVariable [QEGVAR(survival,infection), MACRO_PLAYER_DEFAULTS_LOW];

if ([player] call EFUNC(common,nearFire) || insideBuilding player isEqualTo 1 || !(isNull objectParent player)) exitWith {};

if (_playerTemperature < 20) then {
    if (!(_parasites > 0 || _infection > 0)) then {
    _coldExposure = ((20 - _playerTemperature) / 10) / 100;
    [-_coldExposure, "exposure"] call EFUNC(common,addModifier);
};

if (EGVAR(survival,temperatureDeficiency)) then {
    [-_coldExposure, "hunger"] call EFUNC(common,addModifier);
    };
};
