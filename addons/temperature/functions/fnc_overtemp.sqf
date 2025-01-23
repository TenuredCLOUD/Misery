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

_playerTemperature = player getVariable [QGVAR(thermalIndex), MACRO_PLAYER_DEFAULTS_TEMP];
_exposure = player getVariable [QGVAR(exposure), MACRO_PLAYER_DEFAULTS_LOW];
_thirst = player getVariable [QEGVAR(survival,thirst), MACRO_PLAYER_DEFAULTS_HIGH];

    if (_playerTemperature >= 33) then {
        _overTemperature = (_playerTemperature / 10) / 10;
        [+_overTemperature, "exposure"] call EFUNC(common,addModifier);

    if (EGVAR(survival,temperatureDeficiency)) then {
    _temperatureDeficiency = (_playerTemperature / 10) / 10;
    [-_temperatureDeficiency, "thirst"] call EFUNC(common,addModifier);
    };
};
