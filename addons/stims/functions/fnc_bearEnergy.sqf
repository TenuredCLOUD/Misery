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

_MSleepiness = player getVariable [QEGVAR(survival,energyDeficit), MACRO_PLAYER_FATIGUE];

if (!hasInterface) exitWith {};

  if (alive player) exitWith {

if !(EGVAR(common,checkMultiplayer)) then {
  player setVariable [QEGVAR(survival,energyDeficit), (_MSleepiness - 10)];
};

};

