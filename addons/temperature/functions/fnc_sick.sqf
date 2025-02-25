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

private _sickCalculation = (_playerTemperature / 10) / 10;

if (_parasites > 0 || _infection > 0) then {
    switch (true) do {
        case (_playerTemperature > 20): {
            [+_sickCalculation, "exposure"] call EFUNC(common,addStatusModifier);

            if (GVAR(deficiency)) then {
                [-_sickCalculation, "thirst"] call EFUNC(common,addStatusModifier);
            };
        };

        case (_playerTemperature < 20): {
            private _sickCalculationAlt = ((20 - _playerTemperature) / 10) / 10;
            [+_sickCalculationAlt, "exposure"] call EFUNC(common,addStatusModifier);

            if (GVAR(deficiency)) then {
                [-_sickCalculationAlt, "thirst"] call EFUNC(common,addStatusModifier);
            };
        };

        case (_playerTemperature isEqualTo 20): {
            [+_sickCalculation, "exposure"] call EFUNC(common,addStatusModifier);

            if (GVAR(deficiency)) then {
                [-_sickCalculation, "thirst"] call EFUNC(common,addStatusModifier);
            };
        };
    };
};
