#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Random pharm usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_randomPharm;
 *
*/

private _MHunger = player getVariable [QEGVAR(survival,hunger), MACRO_PLAYER_HUNGER];
private _MThirst = player getVariable [QEGVAR(survival,thirst), MACRO_PLAYER_THIRST];
private _MPoison = player getVariable [QEGVAR(survival,toxicity), MACRO_PLAYER_TOXICITY];



if (!hasInterface) exitWith {};

  if ((call EFUNC(protection,totalProtection) select 0) > 0 || (call EFUNC(protection,totalProtection) select 1) > 0) exitWith {
    titleText ["You cannot take medicine while wearing a mask...", "PLAIN DOWN"];
};

  if (alive player) exitWith {

    titleText ["You take some random medication...", "PLAIN DOWN"];

    playSound3D [QPATHTOEF(audio,sounds\inventory\Items\CrinklingPlastic.ogg), player, false, getPosASL player, 4, 1, 10];

  player removeItem QCLASS(randomMedication);

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

          if (EGVAR(common,ace)) then {
          [player, QCLASS(randomMedication), 0, 300, -40, 0, -40] call ace_medical_status_fnc_addMedicationAdjustment;
          };

          player setVariable [QEGVAR(survival,thirst), (_MThirst - 50)];
            player setVariable [QEGVAR(survival,hunger), (_MHunger - 50)];

          if (EGVAR(survival,ailments) == "ENABLED") then {
          player setVariable [QEGVAR(survival,toxicity), (_MPoison + (random 20))]; //random poison amount
          };

          // if ((count(entities "Ravage_survival")) > 0) then {
          // player setVariable ["hunger", (player getVariable ["hunger",0]) - 50, true];
          // player setVariable ["thirst", (player getVariable ["thirst",0]) - 50, true];
          // };

          sleep 10;

          if (alive player) then  {

            if (EGVAR(common,ace)) then {
              [player, true, 10, true] call ace_medical_fnc_setUnconscious;
            }else{
            [player] call EFUNC(common,stun);
            };

          }else {
              [] spawn {sleep 15; player setUnconscious false;};
          };
};
