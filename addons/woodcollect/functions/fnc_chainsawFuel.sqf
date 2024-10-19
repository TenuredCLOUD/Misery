#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Chainsaw fuel usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_woodcollect_fnc_chainsawFuel;
 *
*/

if (!hasInterface) exitWith {};

if !([["Misery_Chainsawempty"]] call EFUNC(common,hasItem)) exitWith {titleText ["You have no chainsaw that needs fuel...", "PLAIN DOWN"];};

  if ([["Misery_Chainsawempty"]] call EFUNC(common,hasItem)) exitWith {

  titleText ["You start to refuel your chainsaw...", "PLAIN DOWN"];

  player removeItem "Misery_sawfuel";
  player removeItem "Misery_Chainsawempty";

  private _random = [1, 10] call BIS_fnc_randomInt;

  if (_random < 5) then {
    titleText ["You refueled your chainsaw, and have fuel to spare", "PLAIN DOWN"];
  player addItem "Misery_sawfuel";
  player addItem "Misery_Chainsaw";
  };

  if (_random > 5) then {
  titleText ["You refueled your chainsaw, but used the last of your fuel can...", "PLAIN DOWN"];
  player addItem "Misery_Chainsaw"; // <<-- Add Refueled saw, no removal of Fuel can since it's already done
  };

};
