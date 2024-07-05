 /* -----------------------------------
Water
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

#include "\z\misery\addons\misery_framework\Scripts\Misery_PreParser.hpp"

private ["_water","_MExposure","_MDebuffs","_MWetsuit","_coldwater"];

_water = FALSE;
_MExposure = player getVariable ["MiseryExposure", MIS_EXPOSURE];
_MDebuffs = player getVariable "MiseryDebuffs";
_MWetsuit = FALSE; //No wetsuit 

if(((toLower(uniform player))find"wetsuit")>-1) then {_MWetsuit = TRUE}; //Check for wetsuit 

if (((getPosASLW player select 2) < 0) || (underwater player)) then {

    if (_MDebuffs find "PARASITES" != -1 || _MDebuffs find "INFECTION" != -1) then {
        
        player setVariable ["MiseryExposure", 0]; //If sick, and in cold water, remove fever, but reset exposure level 
    };
        
    if (!_MWetsuit && MiserySeaTemp < 20) then { //If player isn't wearing a wetsuit drop temp by 2.5 if water is cold enough 

        _coldwater = MISERY_COLDWATER(MiserySeaTemp); //- this  value scales with temperature decrease...  
        
        player setVariable ["MiseryExposure", (_MExposure - parseNumber ((_coldwater)toFixed 2))];

        _water = TRUE;

    }; //Start cold water simulation if sea temp is < 20C
};

_water