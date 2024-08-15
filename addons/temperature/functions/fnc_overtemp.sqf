#include "..\script_component.hpp"
/*
Over exposure
Designed specifically for Misery mod
by TenuredCLOUD
*/

private ["_overtemp","_MPlayertemp","_MExposure","_MThirst","_overtempcalc","_Miserytempdefhotcalc"];

_overtemp = false;
_MPlayertemp = player getVariable "MiseryPlayerTemp";
_MExposure = player getVariable ["MiseryExposure", MACRO_PLAYER_EXPOSURE];
_MThirst = player getVariable ["MiseryThirst", MACRO_PLAYER_THIRST];

    if (_MPlayertemp >= 33) then {

        _overtempcalc = MACRO_TEMPERATURE_OVEREXPOSURE(_MPlayertemp); //- this value scales with temperature increase...

        player setVariable ["MiseryExposure", (_MExposure + parseNumber ((_overtempcalc)toFixed 2))];

        _overtemp = true;

    //Temperature deficiency - Calculates a drop in hunger / thirst depending on Temperature:
    if (MiseryTemperaturedeficiency == 1) then {

    _Miserytempdefhotcalc = MACRO_TEMPERATURE_OVEREXPOSURE(_MPlayertemp);

    player setVariable ["MiseryThirst", (_MThirst - parseNumber ((_Miserytempdefhotcalc)toFixed 2))];

    };
}; //Start hot simulation if >= 33C temp (scaled)

        _overtemp
