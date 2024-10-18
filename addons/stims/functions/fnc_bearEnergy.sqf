#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * BearEnergy usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_stims_fnc_bearEnergy;
 *
*/

_MSleepiness = player getVariable ["MiserySleepiness", MACRO_PLAYER_FATIGUE];

if (!hasInterface) exitWith {};

  if (alive player) exitwith {

if !(MiseryMP) then {
  player setVariable ["MiserySleepiness", (_MSleepiness - 10)];
};

};

