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

_MSleepiness = player getVariable [QCLASS(energyDeficit), MACRO_PLAYER_DEFAULTS_LOW];

if (!hasInterface) exitWith {};

  if (alive player) exitWith {

if !(EGVAR(common,checkMultiplayer)) then {
  player setVariable [QCLASS(energyDeficit), (_MSleepiness - 10)];
};

};

