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

private _MSleepiness = player getVariable [QEGVAR(survival,energyDeficit), MACRO_PLAYER_FATIGUE];
private _MFear = player getVariable [QCLASS(psycosis), MACRO_PLAYER_FEAR];

if (!hasInterface) exitWith {};

  if (alive player) exitWith {

  if (EGVAR(fear,enabled)) then {
    player setVariable [QCLASS(psycosis), (_MFear - 2)];
    if (_MFear <= 0) then {player setVariable [QCLASS(psycosis), 0]};
  };

//if ((MiseryNORVG=="ENABLED") && !(EGVAR(common,checkMultiplayer))) then {
if (!EGVAR(common,checkMultiplayer)) then {
  player setVariable [QEGVAR(survival,energyDeficit), (_MSleepiness + 5)];
};

enableCamShake true;
addCamShake [1, 10, 2];

};

