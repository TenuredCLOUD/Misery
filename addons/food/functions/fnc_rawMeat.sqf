#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Chances parasites
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_food_fnc_rawMeat
 *
*/

if (alive player) exitWith {

  if ((random 100) > Miseryrawmeatchance) exitWith {
  titleText ["You consumed some raw meat, your stomach churns ominously. \n You feel a wave of unease wash over you...", "PLAIN DOWN"]; //Needs localization
  };

  titleText ["You consumed some raw meat, your stomach churns ominously. \n You feel a wave of unease wash over you...", "PLAIN DOWN"];

  player setVariable [QCLASS(rawMeatLogged), true];

  _time = time + 180;
    [_time] spawn {
        private ["_TimeA"];
        _TimeA=_this select 0;
        waitUntil {(!alive player) or (time > _TimeA)};
      player setVariable [QCLASS(rawMeatLogged), nil];
      private _ailments = player getVariable QCLASS(ailments);
        if (alive player) then {_ailments pushBackUnique "PARASITES"; player setVariable [QCLASS(ailments), _ailments];}; //<< sick from raw meat
    };
};
