/*
Misery Random pharm usage
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

#include "\z\misery\addons\misery_framework\Scripts\Misery_PreParser.hpp"

private _MHunger = player getVariable ["MiseryHunger", MIS_HUNGER];
private _MThirst = player getVariable ["MiseryThirst", MIS_THIRST];
private _MPoison = player getVariable ["MiseryPoison", MIS_POISON];

MiseryACE=FALSE;
if(isClass(configFile>>"cfgPatches">>"ace_main"))then{MiseryACE=TRUE};

if (!hasInterface) exitWith {};

  if (goggles player in antirad_goggles || headgear player in antirad_headgears) exitWith {
	titleText ["You cannot take medicine while wearing a mask...", "PLAIN DOWN"];
};

  if (alive player) exitwith {

    titleText ["You take some random medication...", "PLAIN DOWN"];

    playSound3D ["Misery\audio\sounds\inventory\Items\CrinklingPlastic.ogg", player, false, getPosASL player, 4, 1, 10];

  player removeItem "Misery_randommedication";

  sleep 15;

    [] spawn {
      veffect = true;
      _ppInfected = ppEffectCreate ["ChromAberration", 10000]; // 1000
      _ppInfected ppEffectEnable true;
      _ppInfected ppEffectAdjust [0.3, 0.3, false];
      _ppInfected ppEffectCommit 15;
      sleep 10;
      _ppInfected ppEffectAdjust [0, 0, false];
      _ppInfected ppEffectCommit 2;
      sleep 10;
      _ppInfected ppEffectAdjust [0, 0, false];
      _ppInfected ppEffectCommit 2;
      sleep 10; //2
      ppEffectDestroy _ppInfected;
      veffect = false;
    }; 

          if (MiseryACE) then { 
          [player, "Misery_randommedication", 0, 300, -40, 0, -40] call ace_medical_status_fnc_addMedicationAdjustment;
          };

          player setVariable ["MiseryThirst", (_MThirst - 50)];
	        player setVariable ["MiseryHunger", (_MHunger - 50)];

          if (MiseryAilments == "ENABLED") then {
          player setVariable ["MiseryPoison", (_MPoison + (random 20))]; //random poison amount  
          }; 

          // if ((count(entities"Ravage_survival")) > 0) then {
          // player setVariable ["hunger", (player getvariable ["hunger",0]) - 50, true];
          // player setVariable ["thirst", (player getvariable ["thirst",0]) - 50, true];  
          // };

          sleep 10;

          if (alive player) then  {

            if (MiseryACE) then {
          	[player, true, 10, true] call ace_medical_fnc_setUnconscious; 
            }else{
            [player] spawn Misery_fnc_Stun;
            };

          }else {
          	[] spawn {sleep 15; player setUnconscious false;};
          };
};
