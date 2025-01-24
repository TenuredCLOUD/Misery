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

call EFUNC(common,getPlayerVariables) params ["", "", "", "_playerTemperature", "", "", "_infection", "_parasites"];

private _hasParasites = _parasites > 0;
private _hasInfection = _infection > 0;
private _sickCalculation = (_playerTemperature / 10) / 10;

switch (true) do {
    case ((_hasParasites || _hasInfection) && _playerTemperature > 20): {
        [+_sickCalculation, "exposure"] call EFUNC(common,addModifier);

        if (EGVAR(survival,temperatureDeficiency)) then {
            [-_sickCalculation, "thirst"] call EFUNC(common,addModifier);
        };
    };

    case ((_hasParasites || _hasInfection) && _playerTemperature < 20): {
        private _sickCalculationAlt = ((20 - _playerTemperature) / 10) / 10;
        [+_sickCalculationAlt, "exposure"] call EFUNC(common,addModifier);

        if (EGVAR(survival,temperatureDeficiency)) then {
            [-_sickCalculationAlt, "thirst"] call EFUNC(common,addModifier);
        };
    };

    case ((_hasParasites || _hasInfection) && _playerTemperature isEqualTo 20): {
        [+_sickCalculation, "exposure"] call EFUNC(common,addModifier);

        if (EGVAR(survival,temperatureDeficiency)) then {
            [-_sickCalculation, "thirst"] call EFUNC(common,addModifier);
        };
    };
};
