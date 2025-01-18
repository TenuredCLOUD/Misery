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

    private _sick = false;
    private _playertemp = player getVariable [QEGVAR(survival,temperature), MACRO_PLAYER_DEFAULTS_TEMP];
    private _exposure = player getVariable [QEGVAR(survival,exposure), MACRO_PLAYER_DEFAULTS_LOW];
    private _thirst = player getVariable [QEGVAR(survival,thirst), MACRO_PLAYER_DEFAULTS_HIGH];
    private _ailments = player getVariable [QEGVAR(vitals,ailments), []];

    switch (true) do {

    case ((_ailments find "PARASITES" != -1 || _ailments find "INFECTION" != -1) && _MPlayertemp > 20): {

        private _sickCalc_1 = MACRO_TEMPERATURE_SICKEXPOSURE(_MPlayertemp); //- this value scales

        player setVariable [QEGVAR(survival,exposure), (_MExposure + parseNumber ((_sickCalc_1)toFixed 2))];

        _sick = true;

    //Temperature deficiency - Calculates a drop in hunger / thirst depending on Temperature:
    if (EGVAR(survival,temperatureDeficiency)) then {

    private _tempSickCalc_1 = MACRO_TEMPERATURE_SICKEXPOSURE(_MPlayertemp);

    player setVariable [QEGVAR(survival,thirst), (_MThirst - parseNumber ((_tempSickCalc_1)toFixed 2))];

    };
};

    case ((_ailments find "PARASITES" != -1 || _ailments find "INFECTION" != -1) && _MPlayertemp < 20): {

        private _sickCalc_2 = MACRO_TEMPERATURE_COLDEXPOSURE(_MPlayertemp); //- this value scales

        player setVariable [QEGVAR(survival,exposure), (_MExposure + parseNumber ((_sickCalc_2)toFixed 2))];

        _sick = true;

    //Temperature deficiency - Calculates a drop in hunger / thirst depending on Temperature:
    if (EGVAR(survival,temperatureDeficiency)) then {

    private _tempSickCalc_2 = MACRO_TEMPERATURE_COLDEXPOSURE(_MPlayertemp);

    player setVariable [QEGVAR(survival,thirst), (_MThirst - parseNumber ((_tempSickCalc_2)toFixed 2))];

    };
};

 case ((_ailments find "PARASITES" != -1 || _ailments find "INFECTION" != -1) && _MPlayertemp == 20): {

        private _sickcalc3 = MACRO_TEMPERATURE_SICKEXPOSURE(_MPlayertemp); //- this value scales

        player setVariable [QEGVAR(survival,exposure), (_MExposure + parseNumber ((_sickcalc3)toFixed 2))];

        _sick = true;

    //Temperature deficiency - Calculates a drop in hunger / thirst depending on Temperature:
    if (EGVAR(survival,temperatureDeficiency)) then {

    private _tempSickCalc_3 = MACRO_TEMPERATURE_SICKEXPOSURE(_MPlayertemp);

    player setVariable [QEGVAR(survival,thirst), (_MThirst - parseNumber ((_Miserytempsickcalc3)toFixed 2))];

        };
    };
};

    _sick
