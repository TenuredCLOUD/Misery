#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Brewed Coffee usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_stims_fnc_coffee;
 *
*/

_MSleepiness = player getVariable ["MiserySleepiness", MACRO_PLAYER_FATIGUE];

if (!hasInterface) exitWith {};

  if (alive player) exitWith {

if !(MiseryMP) then {
  player setVariable ["MiserySleepiness", (_MSleepiness - 10)];
};

};

