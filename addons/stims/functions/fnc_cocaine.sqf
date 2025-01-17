#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Cocaine usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_stims_fnc_cocaine;
 *
*/

private _MSleepiness = player getVariable [QCLASS(energyDeficit), MACRO_PLAYER_DEFAULTS_LOW];



if (!hasInterface) exitWith {};

   if ((call EFUNC(protection,totalProtection) select 0) > 0 || (call EFUNC(protection,totalProtection) select 1) > 0) exitWith {
    titleText ["You cannot take narcotics with a mask on...", "PLAIN DOWN"];
};

  if (alive player) then {
    titleText ["You use the cocaine...", "PLAIN DOWN"];

    playSound3D [QPATHTOEF(audio,sounds\inventory\Items\Sniff01.ogg), player, false, getPosASL player, 4, 1, 5];

  player removeItem QCLASS(cocaine);
  _time = time + 15;

// if ((MiseryNORVG=="ENABLED") && !(EGVAR(common,checkMultiplayer))) then {
if !(EGVAR(common,checkMultiplayer)) then {
  player setVariable [QCLASS(energyDeficit), (_MSleepiness - 25)];
};

  waitUntil {
      (!alive player) or (time > _time)
  };
  if (!(alive player)) exitWith {};

    [] spawn {
      veffect = true;
      _ppInfected = ppEffectCreate ["ChromAberration", 10000]; // 1000
      _ppInfected ppEffectEnable true;
      _ppInfected ppEffectAdjust [0.3, 0.3, false];
      _ppInfected ppEffectCommit 15;
      sleep 15;
      _ppInfected ppEffectAdjust [0, 0, false];
      _ppInfected ppEffectCommit 2;
      sleep 15;
      _ppInfected ppEffectAdjust [0, 0, false];
      _ppInfected ppEffectCommit 2;
      sleep 15; //2
      ppEffectDestroy _ppInfected;
      veffect = false;
    };

if (EGVAR(common,ace)) then {
[player, QCLASS(cocaine), 0, 1800, 25, 0, 25] call ace_medical_status_fnc_addMedicationAdjustment;
};

player enableFatigue false;
  _time = time + 1200;

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
