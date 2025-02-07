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

call EFUNC(common,getPlayerVariables) params ["_hunger", "", "", "_playerTemperature", "_exposure", "", "_infection", "_parasites"];

if ([player] call EFUNC(common,nearFire) || insideBuilding player isEqualTo 1 || !(isNull objectParent player)) exitWith {};

if (_playerTemperature < 20) then {
    if (!(_parasites > 0 || _infection > 0)) then {
    _coldExposure = ((20 - _playerTemperature) / 10) / 100;
    [-_coldExposure, "exposure"] call EFUNC(common,addModifier);
};

if (GVAR(deficiency)) then {
    [-_coldExposure, "hunger"] call EFUNC(common,addModifier);
    };
};
