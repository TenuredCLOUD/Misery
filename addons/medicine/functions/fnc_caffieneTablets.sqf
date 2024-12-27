#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Caffeine usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_caffieneTablets;
 *
*/

private _MSleepiness = player getVariable [QCLASS(energyDeficit), MACRO_PLAYER_FATIGUE];

if (!hasInterface) exitWith {};

 if (goggles player in antirad_goggles || headgear player in antirad_headgears) exitWith {
    titleText ["You cannot take medicine while wearing a mask...", "PLAIN DOWN"];
};

  if (alive player) then {

    playSound3D [QPATHTOEF(audio,sounds\inventory\Items\CrinklingPlastic.ogg), player, false, getPosASL player, 4, 1, 10];

  player removeItem "Misery_caffeine";
  titleText ["You take some Caffeine tablets...", "PLAIN DOWN"];

  _time = time + 60;

  waitUntil {
      (!alive player) or (time > _time)
  };
  if (!(alive player)) exitWith {};

  if !(EGVAR(common,checkMultiplayer)) then {
  player setVariable [QCLASS(energyDeficit), (_MSleepiness - 15)];
};

    [] spawn {
      veffect = true;
      _ppeffect = ppEffectCreate ["ChromAberration", 1000];
      _ppeffect ppEffectEnable true;
      _ppeffect ppEffectAdjust [0.3, 0.3, false];
      _ppeffect ppEffectCommit 3;
      sleep 3;
      _ppeffect ppEffectAdjust [0, 0, false];
      _ppeffect ppEffectCommit 2;
      sleep 3;
      _ppeffect ppEffectAdjust [0, 0, false];
      _ppeffect ppEffectCommit 2;
      sleep 2;
      ppEffectDestroy _ppeffect;
      veffect = false;
    };

  player enableFatigue false;
  _time = time + 600;

  [_time] spawn {
      private ["_TimeA"];
      _TimeA=_this select 0;
      waitUntil {
          (!alive player) or (time > _TimeA)
      };
      player enableFatigue true;
      player setFatigue 0;
  };
};
