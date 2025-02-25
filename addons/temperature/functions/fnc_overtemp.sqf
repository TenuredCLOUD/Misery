#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Over exposure
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_temperature_fnc_overTemp;
 *
 * Public: No
*/

call EFUNC(common,getPlayerVariables) params ["", "", "", "_playerTemperature"];

    if (_playerTemperature >= 33) then {
        _overTemperature = (_playerTemperature / 10) / 10;
        [+_overTemperature, "exposure"] call EFUNC(common,addStatusModifier);

    if (EGVAR(survival,temperatureDeficiency)) then {
        _temperatureDeficiency = (_playerTemperature / 10) / 10;
        [-_temperatureDeficiency, "thirst"] call EFUNC(common,addStatusModifier);
    };
};
