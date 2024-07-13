/*
Misery Cenestin bottle usage
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

if (!hasInterface) exitWith {};

  if (alive player) then {
  titleText ["You take a cenestin pill out of the bottle", "PLAIN DOWN"];
  playSound3D ["\z\misery\addons\framework\audio\sounds\inventory\Items\PillBottleOpen.ogg", player, false, getPosASL player, 4, 1, 10];
  private _random = [1, 10] call BIS_fnc_randomInt;
  
  if (_random > 5) exitwith {
  player additem "Misery_Cenestin";
  };

  if (_random == 5) exitwith {
  titleText ["You empty the Cenestin bottle with the last tablet...", "PLAIN DOWN"];
  player additem "Misery_Cenestin";
  player removeitem "Misery_Cenestinbottle";
  };

   if (_random < 5) exitwith {
  player additem "Misery_Cenestin";
  };

};
