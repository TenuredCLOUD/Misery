#include "..\script_component.hpp"
/*
Misery Brewed Coffee usage
Designed specifically for Misery mod (also compatible with Ravage)
by TenuredCLOUD
*/

_MSleepiness = player getVariable ["MiserySleepiness", MACRO_PLAYER_FATIGUE];

if (!hasInterface) exitWith {};

  if (alive player) exitwith {

if !(MiseryMP) then {
  player setVariable ["MiserySleepiness", (_MSleepiness - 10)];
};

};

