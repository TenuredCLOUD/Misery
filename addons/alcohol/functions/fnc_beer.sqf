#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Beer usage
 * Simple function that changes fear values from alcohol consumption, and increases fatigue (tiredness)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_alcohol_fnc_beer
*/

private _MSleepiness = player getVariable ["MiserySleepiness", MACRO_PLAYER_FATIGUE];
private _MFear = player getVariable ["MiseryFear", MACRO_PLAYER_FEAR];

if (!hasInterface) exitWith {};

  if (alive player) exitWith {

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

