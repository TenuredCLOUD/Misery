#include "..\script_component.hpp"
/*
Misery Cocaine usage
Designed specifically for Misery mod (also compatible with Ravage)
by TenuredCLOUD
*/

private _MSleepiness = player getVariable ["MiserySleepiness", MIS_SLEEP];

MiseryACE=false;
if(isClass(configFile>>"cfgPatches">>"ace_main"))then{MiseryACE=true};

if (!hasInterface) exitWith {};

   if (goggles player in antirad_goggles || headgear player in antirad_headgears) exitWith {
    titleText ["You cannot take narcotics with a mask on...", "PLAIN DOWN"];
};

  if (alive player) then {
    titleText ["You use the cocaine...", "PLAIN DOWN"];

    playSound3D ["\z\misery\addons\audio\sounds\inventory\Items\Sniff01.ogg", player, false, getPosASL player, 4, 1, 5];

  player removeItem "Misery_cocaine";
  _time = time + 15;

// if ((MiseryNORVG=="ENABLED") && !(MiseryMP)) then {
if !(MiseryMP) then {
  player setVariable ["MiserySleepiness", (_MSleepiness - 25)];
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

if (MiseryACE) then {
[player, "Misery_cocaine", 0, 1800, 25, 0, 25] call ace_medical_status_fnc_addMedicationAdjustment;
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
