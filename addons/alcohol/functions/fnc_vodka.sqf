#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Vodka usage
 * Simple function that changes fear values from alcohol consumption, and increases fatigue (tiredness)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_alcohol_fnc_vodka
*/

private _MSleepiness = player getVariable [QCLASS(energyDeficit), MACRO_PLAYER_FATIGUE];
private _MFear = player getVariable [QCLASS(psycosis), MACRO_PLAYER_PSYCHOSIS];

if (!hasInterface) exitWith {};

  if (alive player) exitWith {

  if (EGVAR(fear,enabled)) then {
    player setVariable [QCLASS(psycosis), (_MFear - 5)];
    if (_MFear <= 0) then {player setVariable [QCLASS(psycosis), 0]};
  };

if (!EGVAR(common,checkMultiplayer)) then {
  player setVariable [QCLASS(energyDeficit), (_MSleepiness + 15)];
};

//Need to add radiation reduction here
};




