#include "\z\misery\addons\framework\scripts\Misery_PreParser.hpp"

/*
Cold
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private ["_cold","_MPlayertemp","_MExposure","_MHunger","_MDebuffs","_coldexposure","_Miserytempdefcoldcalc"];

_cold = FALSE;
_MPlayertemp = player getVariable "MiseryPlayerTemp";
_MExposure = player getVariable ["MiseryExposure", MIS_EXPOSURE];
_MHunger = player getVariable ["MiseryHunger", MIS_HUNGER];
_MDebuffs = player getVariable "MiseryDebuffs";

//Player effective temperature pre-check:
if ([player] call Misery_fnc_NearFire) exitWith {}; 
if ((([player] call Misery_fnc_Isinside) select 0) && (([player] call Misery_fnc_Isinside) select 1)) exitWith {}; 
if !(isNull objectParent player) exitWith {};

if (_MPlayertemp < 20) then { 

    if (!(_MDebuffs find "PARASITES" != -1 || _MDebuffs find "INFECTION" != -1)) then {

        _coldexposure = MISERY_COLDEXPOSURE(_MPlayertemp); //- this value scales with player temperature decrease... 

        player setVariable ["MiseryExposure", (_MExposure - parseNumber ((_coldexposure)toFixed 2))];

        _cold = TRUE;
    };

    //Temperature deficiency - Calculates a drop in hunger / thirst depending on Temperature:
    if (MiseryTemperaturedeficiency == 1) then {

        _Miserytempdefcoldcalc = MISERY_COLDEXPOSURE(_MPlayertemp);    

        player setVariable ["MiseryHunger", (_MHunger - parseNumber ((_Miserytempdefcoldcalc)toFixed 2))];

    };
}; //Start cold simulation if < 20C (scaled)

_cold