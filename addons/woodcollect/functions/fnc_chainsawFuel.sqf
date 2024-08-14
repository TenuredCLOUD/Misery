#include "..\script_component.hpp"
/*
    Misery Chainsaw fuel usage
    Designed specifically for Misery mod
    by TenuredCLOUD
*/

if (!hasInterface) exitWith {};

if !("Misery_Chainsawempty" in items player) exitWith {titleText ["You have no chainsaw that needs fuel...", "PLAIN DOWN"];};

  if ("Misery_Chainsawempty" in items player) exitwith {

  titleText ["You start to refuel your chainsaw...", "PLAIN DOWN"];

  player removeitem "Misery_sawfuel";
  player removeitem "Misery_Chainsawempty";

  private _random = [1, 10] call BIS_fnc_randomInt;

  if (_random < 5) then {
    titleText ["You refueled your chainsaw, and have fuel to spare", "PLAIN DOWN"];
  player additem "Misery_sawfuel";
  player additem "Misery_Chainsaw";
  };

  if (_random > 5) then {
  titleText ["You refueled your chainsaw, but used the last of your fuel can...", "PLAIN DOWN"];
  player additem "Misery_Chainsaw"; // <<-- Add Refueled saw, no removal of Fuel can since it's already done
  };

};
