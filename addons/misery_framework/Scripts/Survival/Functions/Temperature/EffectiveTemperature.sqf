/*
Temperature warming checks 
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

#include "\z\misery\addons\misery_framework\Scripts\Misery_PreParser.hpp"

private ["_clothesWarmth","_MPlayertemp","_MExposure","_MDebuffs","_nearfirecalc","_sicknearfirecalc","_insidewarmcalc","_sickinsidewarmcalc","_invehiclecalc","_sickinvehiclecalc"];

player setVariable ["MiseryPlayerTemp", (call Misery_fnc_Temperature) select 0]; //Air temp
MiserySeaTemp = (call Misery_fnc_Temperature) select 1; //Sea temp 
_clothesWarmth= (player call Misery_fnc_ClothingWarmth) select 0;

//Parse values from temperature calculations
_MPlayertemp = player getVariable "MiseryPlayerTemp"; 
player setVariable ["MiseryPlayerTemp", (_MPlayertemp + parseNumber ((_clothesWarmth)toFixed 2))];

_MExposure = player getVariable ["MiseryExposure", MIS_EXPOSURE];

_MDebuffs = player getVariable "MiseryDebuffs";

//---------------------------
//Nearby fire check

if ([player] call Misery_fnc_NearFire) then { 

    if ((_MPlayertemp < 20) && (!(_MDebuffs find "PARASITES" != -1 || _MDebuffs find "INFECTION" != -1))) then {

       if (abs(_MExposure) < 0.5) exitWith {
        player setVariable ["MiseryExposure", MIS_EXPOSURE];
        };

        _nearfirecalc = MISERY_FIREORVEH(_MPlayertemp);  

        player setVariable ["MiseryExposure", (_MExposure + parseNumber ((_nearfirecalc)toFixed 2))];

        if (_MExposure > 0) then {player setVariable ["MiseryExposure", MIS_EXPOSURE];};

    } else {
        
        _sicknearfirecalc = MISERY_FIREORVEH_SICK(_MPlayertemp);  

        player setVariable ["MiseryExposure", (_MExposure + parseNumber ((_sicknearfirecalc)toFixed 2))];
    };
};

//---------------------------  
//Inside house check (checks if player is "boxed in" and under roof)

if ((([player] call Misery_fnc_Isinside) select 0) && (([player] call Misery_fnc_Isinside) select 1)) then { 

    if ((_MPlayertemp < 20) && (!(_MDebuffs find "PARASITES" != -1 || _MDebuffs find "INFECTION" != -1))) then {

        if (abs(_MExposure) < 0.5) exitWith {
        player setVariable ["MiseryExposure", MIS_EXPOSURE];
        };

        _insidewarmcalc = MISERY_TEMPISINBUILDING(_MPlayertemp);  

        player setVariable ["MiseryExposure", (_MExposure + parseNumber ((_insidewarmcalc)toFixed 2))];

        if (_MExposure > 0) then {player setVariable ["MiseryExposure", MIS_EXPOSURE];}; //If not sick, not hot, then - warm up, but reset at 0

    } else {
        
        _sickinsidewarmcalc = MISERY_TEMPISINBUILDING_SICK(_MPlayertemp);  

        player setVariable ["MiseryExposure", (_MExposure + parseNumber ((_sickinsidewarmcalc)toFixed 2))];
    };
};
 
//---------------------------
//In a vehicle Check

if !(isNull objectParent player) then {

    if ((_MPlayertemp < 20) && (!(_MDebuffs find "PARASITES" != -1 || _MDebuffs find "INFECTION" != -1))) then {

        if (abs(_MExposure) < 0.5) exitWith {
        player setVariable ["MiseryExposure", MIS_EXPOSURE];
        };

        _invehiclecalc = MISERY_FIREORVEH(_MPlayertemp);  

        player setVariable ["MiseryExposure", (_MExposure + parseNumber ((_invehiclecalc)toFixed 2))];
    
        if (_MExposure > 0) then {player setVariable ["MiseryExposure", MIS_EXPOSURE];}; //If not sick, not hot, then - warm up, but reset at 0

    } else {

        _sickinvehiclecalc = MISERY_FIREORVEH_SICK(_MPlayertemp);   

        player setVariable ["MiseryExposure", (_MExposure + parseNumber ((_sickinvehiclecalc)toFixed 2))];
    };
};

_MPlayertemp