#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Sick
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_temperature_fnc_sick;
 *
 * Public: No
*/

call EFUNC(common,getPlayerVariables) params ["", "", "", "_playerTemperature", "", "", "_infection", "_parasites", "", "", "", "", "", "", "", "", ""];

switch (true) do {
    case ((_parasites > 0 || _infection > 0) && _playerTemperature > 20): {
    private _sickCalculation_1 = (_playerTemperature / 10) / 10;
    [+_sickCalculation_1, "exposure"] call EFUNC(common,addModifier);

    if (EGVAR(survival,temperatureDeficiency)) then {
    private _temperatureDeficiency_1 = (_playerTemperature / 10) / 10;
    [-_temperatureDeficiency_1, "thirst"] call EFUNC(common,addModifier);
    };
};

    case ((_parasites > 0 || _infection > 0) && _playerTemperature < 20): {
    private _sickCalculation_2 = ((20 - _playerTemperature) / 10) / 10;
    [+_sickCalculation_2, "exposure"] call EFUNC(common,addModifier);

    if (EGVAR(survival,temperatureDeficiency)) then {
    private _temperatureDeficiency_2 = ((20 - _playerTemperature) / 10) / 10;
    [-_temperatureDeficiency_2, "thirst"] call EFUNC(common,addModifier);
    };
};

    case ((_parasites > 0 || _infection > 0) && _playerTemperature isEqualTo 20): {
    private _sickCalculation_3 = (_playerTemperature / 10) / 10;
    [+_sickCalculation_3, "exposure"] call EFUNC(common,addModifier);

    if (EGVAR(survival,temperatureDeficiency)) then {
    private _temperatureDeficiency_3 = (_playerTemperature / 10) / 10;
    [-_temperatureDeficiency_3, "thirst"] call EFUNC(common,addModifier);
        };
    };
};
