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

private ["_cold","_MPlayertemp","_MExposure","_MHunger","_MDebuffs","_coldexposure","_Miserytempdefcoldcalc"];

_cold = false;
_MPlayertemp = player getVariable "MiseryPlayerTemp";
_MExposure = player getVariable ["MiseryExposure", MACRO_PLAYER_EXPOSURE];
_MHunger = player getVariable ["MiseryHunger", MACRO_PLAYER_HUNGER];
_MDebuffs = player getVariable "MiseryDebuffs";

//Player effective temperature pre-check:
if ([player] call EFUNC(common,nearFire)) exitWith {};
if (insideBuilding player == 1) exitWith {};
if !(isNull objectParent player) exitWith {};

if (_MPlayertemp < 20) then {

    if (!(_MDebuffs find "PARASITES" != -1 || _MDebuffs find "INFECTION" != -1)) then {

        _coldexposure = MACRO_TEMPERATURE_COLDEXPOSURE(_MPlayertemp); //- this value scales with player temperature decrease...

        player setVariable ["MiseryExposure", (_MExposure - parseNumber ((_coldexposure)toFixed 2))];

        _cold = true;
    };

    //Temperature deficiency - Calculates a drop in hunger / thirst depending on Temperature:
    if (MiseryTemperaturedeficiency == 1) then {

        _Miserytempdefcoldcalc = MACRO_TEMPERATURE_COLDEXPOSURE(_MPlayertemp);

        player setVariable ["MiseryHunger", (_MHunger - parseNumber ((_Miserytempdefcoldcalc)toFixed 2))];

    };
}; //Start cold simulation if < 20C (scaled)

_cold
