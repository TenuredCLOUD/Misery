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

if (alive player) exitwith {

  if((random 100) > Miseryrawmeatchance) exitWith {
  titleText ["You consumed some raw meat, your stomach churns ominously. \n You feel a wave of unease wash over you...", "PLAIN DOWN"]; //Needs localization
  };

  titleText ["You consumed some raw meat, your stomach churns ominously. \n You feel a wave of unease wash over you...", "PLAIN DOWN"];

  player setVariable ["Rawmeatlogged", true];

  _time = time + 180;
    [_time] spawn {
        private ["_TimeA"];
        _TimeA=_this select 0;
        waitUntil {(!alive player) or (time > _TimeA)};
      player setVariable ["Rawmeatlogged", nil];
      private _MDebuffs = player getVariable "MiseryDebuffs";
        if (alive player) then {_MDebuffs pushBackUnique "PARASITES"; player setVariable ["MiseryDebuffs", _MDebuffs];}; //<< sick from raw meat
    };
};
