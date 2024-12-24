#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Caffetin tablets usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_caffetinTablets;
 *
*/

private _MInfection = player getVariable ["MiseryInfection", MACRO_PLAYER_INFECTION];
private _MExposure = player getVariable ["MiseryExposure", MACRO_PLAYER_EXPOSURE];
private _MDebuffs = player getVariable "MiseryDebuffs";

EGVAR(common,ace)=false;
if(isClass(configFile>>"cfgPatches">>"ace_main"))then{EGVAR(common,ace)=true};

if (!hasInterface) exitWith {};

 if (goggles player in antirad_goggles || headgear player in antirad_headgears) exitWith {
    titleText ["You cannot take medicine while wearing a mask...", "PLAIN DOWN"];
};

if ((_MInfection > 1) || (_MDebuffs find "PARASITES" != -1)) then {

    titleText ["You take some Caffetin tablets...", "PLAIN DOWN"];
    playSound3D ["\z\misery\addons\audio\sounds\inventory\Items\CrinklingPlastic.ogg", player, false, getPosASL player, 4, 1, 10];

    player removeItem "Misery_caffetincaps";

     if (EGVAR(common,ace)) then {
    [player, "Misery_caffetincaps", 120, 300, 1, 0, 1] call ace_medical_status_fnc_addMedicationAdjustment;
    };

  sleep 60;

  player setVariable ["MiseryExposure", (_MExposure - 25)];

    if (_MExposure > 0) then {player setVariable ["MiseryExposure", MACRO_PLAYER_EXPOSURE]};

}else{
//Nothing
};
