/*
Misery Caffetin tablets usage
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

#include "\z\misery\addons\misery_framework\Scripts\Misery_PreParser.hpp"

private _MInfection = player getVariable ["MiseryInfection", MIS_INFECTION];
private _MExposure = player getVariable ["MiseryExposure", MIS_EXPOSURE];
private _MDebuffs = player getVariable "MiseryDebuffs";

MiseryACE=FALSE;
if(isClass(configFile>>"cfgPatches">>"ace_main"))then{MiseryACE=TRUE};

if (!hasInterface) exitWith {};

 if (goggles player in antirad_goggles || headgear player in antirad_headgears) exitWith {
	titleText ["You cannot take medicine while wearing a mask...", "PLAIN DOWN"];
};

if ((_MInfection > 1) || (_MDebuffs find "PARASITES" != -1)) then {

    titleText ["You take some Caffetin tablets...", "PLAIN DOWN"];
    playSound3D ["Misery\audio\sounds\inventory\Items\CrinklingPlastic.ogg", player, false, getPosASL player, 4, 1, 10];

    player removeitem "Misery_caffetincaps";

     if (MiseryACE) then {
    [player, "Misery_caffetincaps", 120, 300, 1, 0, 1] call ace_medical_status_fnc_addMedicationAdjustment;
    };

  sleep 60; 

  player setVariable ["MiseryExposure", (_MExposure - 25)];

	if (_MExposure > 0) then {player setVariable ["MiseryExposure", MIS_EXPOSURE]};

}else{
//Nothing
};