#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Vodka usage
 * Simple function that changes fear values from alcohol consumption, and increases fatigue (tiredness)
 *
 * Arguments:
 * 0: NONE
 *
 * Return Value:
 * 0: NONE
 *
 * Example:
 * [] call misery_alcohol_fnc_vodka
*/

private _MSleepiness = player getVariable ["MiserySleepiness", MACRO_PLAYER_FATIGUE];
private _MFear = player getVariable ["MiseryFear", MACRO_PLAYER_FEAR];

if (!hasInterface) exitWith {};

  if (alive player) exitwith {

  if (MiseryFearenabled) then {
    player setVariable ["MiseryFear", (_MFear - 5)];
    if (_MFear <= 0) then {player setVariable ["MiseryFear", 0]};
  };

if !(MiseryMP) then {
  player setVariable ["MiserySleepiness", (_MSleepiness + 15)];
};

//Need to add radiation reduction here 
};




