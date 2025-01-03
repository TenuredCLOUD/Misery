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

private ["_overtemp","_MPlayertemp","_MExposure","_MThirst","_overtempcalc","_Miserytempdefhotcalc"];

_overtemp = false;
_MPlayertemp = player getVariable QCLASS(thermalIndex);
_MExposure = player getVariable [QCLASS(exposure), MACRO_PLAYER_EXPOSURE];
_MThirst = player getVariable [QCLASS(thirst), MACRO_PLAYER_THIRST];

    if (_MPlayertemp >= 33) then {

        _overtempcalc = MACRO_TEMPERATURE_OVEREXPOSURE(_MPlayertemp); //- this value scales with temperature increase...

        player setVariable [QCLASS(exposure), (_MExposure + parseNumber ((_overtempcalc)toFixed 2))];

        _overtemp = true;

    //Temperature deficiency - Calculates a drop in hunger / thirst depending on Temperature:
    if (EGVAR(survival,temperatureDeficiency)) then {

    _Miserytempdefhotcalc = MACRO_TEMPERATURE_OVEREXPOSURE(_MPlayertemp);

    player setVariable [QCLASS(thirst), (_MThirst - parseNumber ((_Miserytempdefhotcalc)toFixed 2))];

    };
}; //Start hot simulation if >= 33C temp (scaled)

        _overtemp
