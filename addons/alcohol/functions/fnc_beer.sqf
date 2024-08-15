#include "..\script_component.hpp"
/*
    Misery Beer usage
    Designed specifically for Misery mod (also compatible with Ravage)
    by TenuredCLOUD
*/

private _MSleepiness = player getVariable ["MiserySleepiness", MACRO_PLAYER_FATIGUE];
private _MFear = player getVariable ["MiseryFear", MACRO_PLAYER_FEAR];

if (!hasInterface) exitWith {};

  if (alive player) exitwith {

  if (MiseryFearenabled) then {
    player setVariable ["MiseryFear", (_MFear - 2)];
    if (_MFear <= 0) then {player setVariable ["MiseryFear", 0]};
  };

//if ((MiseryNORVG=="ENABLED") && !(MiseryMP)) then {
if !(MiseryMP) then {
  player setVariable ["MiserySleepiness", (_MSleepiness + 5)];
};

enableCamShake true;
addCamShake [1, 10, 2];

};

