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

private ["_sick","_MPlayertemp","_MExposure","_MThirst","_MDebuffs","_sickcalc1","_Miserytempsickcalc1","_sickcalc2","_Miserytempsickcalc2"];

_sick = false;
_MPlayertemp = player getVariable "MiseryPlayerTemp";
_MExposure = player getVariable ["MiseryExposure", MACRO_PLAYER_EXPOSURE];
_MThirst = player getVariable ["MiseryThirst", MACRO_PLAYER_THIRST];
_MDebuffs = player getVariable "MiseryDebuffs";

    switch (true) do {

    case ((_MDebuffs find "PARASITES" != -1 || _MDebuffs find "INFECTION" != -1) && _MPlayertemp > 20): {

        _sickcalc1 = MACRO_TEMPERATURE_SICKEXPOSURE(_MPlayertemp); //- this value scales

        player setVariable ["MiseryExposure", (_MExposure + parseNumber ((_sickcalc1)toFixed 2))];

        _sick = true;

    //Temperature deficiency - Calculates a drop in hunger / thirst depending on Temperature:
    if (MiseryTemperaturedeficiency == 1) then {

    _Miserytempsickcalc1 = MACRO_TEMPERATURE_SICKEXPOSURE(_MPlayertemp);

    player setVariable ["MiseryThirst", (_MThirst - parseNumber ((_Miserytempsickcalc1)toFixed 2))];

    };
};

    case ((_MDebuffs find "PARASITES" != -1 || _MDebuffs find "INFECTION" != -1) && _MPlayertemp < 20): {

        _sickcalc2 = MACRO_TEMPERATURE_COLDEXPOSURE(_MPlayertemp); //- this value scales

        player setVariable ["MiseryExposure", (_MExposure + parseNumber ((_sickcalc2)toFixed 2))];

        _sick = true;

    //Temperature deficiency - Calculates a drop in hunger / thirst depending on Temperature:
    if (MiseryTemperaturedeficiency == 1) then {

    _Miserytempsickcalc2 = MACRO_TEMPERATURE_COLDEXPOSURE(_MPlayertemp);

    player setVariable ["MiseryThirst", (_MThirst - parseNumber ((_Miserytempsickcalc2)toFixed 2))];

    };
};

 case ((_MDebuffs find "PARASITES" != -1 || _MDebuffs find "INFECTION" != -1) && _MPlayertemp == 20): {

        _sickcalc3 = MACRO_TEMPERATURE_SICKEXPOSURE(_MPlayertemp); //- this value scales

        player setVariable ["MiseryExposure", (_MExposure + parseNumber ((_sickcalc3)toFixed 2))];

        _sick = true;

    //Temperature deficiency - Calculates a drop in hunger / thirst depending on Temperature:
    if (MiseryTemperaturedeficiency == 1) then {

    _Miserytempsickcalc3 = MACRO_TEMPERATURE_SICKEXPOSURE(_MPlayertemp);

    player setVariable ["MiseryThirst", (_MThirst - parseNumber ((_Miserytempsickcalc3)toFixed 2))];

        };
    };
};

    _sick
