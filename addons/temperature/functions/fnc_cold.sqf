#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Cold
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_temperature_fnc_cold;
 *
 * Public: No
*/

private ["_cold","_MPlayertemp","_MExposure","_MHunger","_ailments","_coldexposure","_Miserytempdefcoldcalc"];

_cold = false;
_MPlayertemp = player getVariable QEGVAR(survival,temperature);
_MExposure = player getVariable [QEGVAR(survival,exposure), MACRO_PLAYER_EXPOSURE];
_MHunger = player getVariable [QEGVAR(survival,hunger), MACRO_PLAYER_HUNGER];
_ailments = player getVariable QCLASS(ailments);

//Player effective temperature pre-check:
if ([player] call EFUNC(common,nearFire)) exitWith {};
if (insideBuilding player == 1) exitWith {};
if !(isNull objectParent player) exitWith {};

if (_MPlayertemp < 20) then {

    if (!(_ailments find "PARASITES" != -1 || _ailments find "INFECTION" != -1)) then {

        _coldexposure = MACRO_TEMPERATURE_COLDEXPOSURE(_MPlayertemp); //- this value scales with player temperature decrease...

        player setVariable [QEGVAR(survival,exposure), (_MExposure - parseNumber ((_coldexposure)toFixed 2))];

        _cold = true;
    };

    //Temperature deficiency - Calculates a drop in hunger / thirst depending on Temperature:
    if (EGVAR(survival,temperatureDeficiency)) then {

        _Miserytempdefcoldcalc = MACRO_TEMPERATURE_COLDEXPOSURE(_MPlayertemp);

        player setVariable [QEGVAR(survival,hunger), (_MHunger - parseNumber ((_Miserytempdefcoldcalc)toFixed 2))];

    };
}; //Start cold simulation if < 20C (scaled)

_cold
