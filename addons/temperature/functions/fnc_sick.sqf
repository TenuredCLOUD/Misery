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

private ["_sick","_MPlayertemp","_MExposure","_MThirst","_ailments","_sickcalc1","_Miserytempsickcalc1","_sickcalc2","_Miserytempsickcalc2"];

_sick = false;
_MPlayertemp = player getVariable [QEGVAR(survival,temperature), MACRO_PLAYER_DEFAULTS_TEMP];
_MExposure = player getVariable [QEGVAR(survival,exposure), MACRO_PLAYER_DEFAULTS_LOW];
_MThirst = player getVariable [QEGVAR(survival,thirst), MACRO_PLAYER_DEFAULTS_HIGH];
_ailments = player getVariable QCLASS(ailments);

    switch (true) do {

    case ((_ailments find "PARASITES" != -1 || _ailments find "INFECTION" != -1) && _MPlayertemp > 20): {

        _sickcalc1 = MACRO_TEMPERATURE_SICKEXPOSURE(_MPlayertemp); //- this value scales

        player setVariable [QEGVAR(survival,exposure), (_MExposure + parseNumber ((_sickcalc1)toFixed 2))];

        _sick = true;

    //Temperature deficiency - Calculates a drop in hunger / thirst depending on Temperature:
    if (EGVAR(survival,temperatureDeficiency)) then {

    _Miserytempsickcalc1 = MACRO_TEMPERATURE_SICKEXPOSURE(_MPlayertemp);

    player setVariable [QEGVAR(survival,thirst), (_MThirst - parseNumber ((_Miserytempsickcalc1)toFixed 2))];

    };
};

    case ((_ailments find "PARASITES" != -1 || _ailments find "INFECTION" != -1) && _MPlayertemp < 20): {

        _sickcalc2 = MACRO_TEMPERATURE_COLDEXPOSURE(_MPlayertemp); //- this value scales

        player setVariable [QEGVAR(survival,exposure), (_MExposure + parseNumber ((_sickcalc2)toFixed 2))];

        _sick = true;

    //Temperature deficiency - Calculates a drop in hunger / thirst depending on Temperature:
    if (EGVAR(survival,temperatureDeficiency)) then {

    _Miserytempsickcalc2 = MACRO_TEMPERATURE_COLDEXPOSURE(_MPlayertemp);

    player setVariable [QEGVAR(survival,thirst), (_MThirst - parseNumber ((_Miserytempsickcalc2)toFixed 2))];

    };
};

 case ((_ailments find "PARASITES" != -1 || _ailments find "INFECTION" != -1) && _MPlayertemp == 20): {

        _sickcalc3 = MACRO_TEMPERATURE_SICKEXPOSURE(_MPlayertemp); //- this value scales

        player setVariable [QEGVAR(survival,exposure), (_MExposure + parseNumber ((_sickcalc3)toFixed 2))];

        _sick = true;

    //Temperature deficiency - Calculates a drop in hunger / thirst depending on Temperature:
    if (EGVAR(survival,temperatureDeficiency)) then {

    _Miserytempsickcalc3 = MACRO_TEMPERATURE_SICKEXPOSURE(_MPlayertemp);

    player setVariable [QEGVAR(survival,thirst), (_MThirst - parseNumber ((_Miserytempsickcalc3)toFixed 2))];

        };
    };
};

    _sick
