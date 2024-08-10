#include "\z\misery\addons\main\script_macros.hpp"

/*
Warmup
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private ["_warmup","_MPlayertemp","_MExposure","_MDebuffs","_cooldown"];

_warmup = FALSE;
_MPlayertemp = player getVariable "MiseryPlayerTemp";
_MExposure = player getVariable ["MiseryExposure", MIS_EXPOSURE];
_MDebuffs = player getVariable "MiseryDebuffs";

//Player effective temperature pre-check:
if ([player] call Misery_fnc_NearFire) exitWith {}; 
if ((([player] call Misery_fnc_Isinside) select 0) && (([player] call Misery_fnc_Isinside) select 1)) exitWith {}; 
if !(isNull objectParent player) exitWith {};

if (_MPlayertemp >= 20 && _MPlayertemp < 33) then {  

    if (!(_MDebuffs find "PARASITES" != -1 || _MDebuffs find "INFECTION" != -1)) then {

        if (_MExposure < 0) then {

            private _warmUp = MISERY_WARMUP(_MPlayertemp);
             
            player setVariable ["MiseryExposure", (_MExposure + parseNumber ((_warmUp)toFixed 2))];

            _warmup = TRUE;
            
            if (_MExposure >= 0) then {player setVariable ["MiseryExposure", MIS_EXPOSURE];};
            
        }; //Warmup if neutral temp & cold

        if (_MExposure > 0) then {

            private _cooldown = MISERY_COOLDOWN(_MPlayertemp);
            
            player setVariable ["MiseryExposure", (_MExposure - parseNumber ((_cooldown)toFixed 2))];

            _warmup = TRUE; 
            
            if (_MExposure <= 0) then {player setVariable ["MiseryExposure", MIS_EXPOSURE];};
            
        }; //Cooldown if neutral temp & hot
    };
};

_warmup