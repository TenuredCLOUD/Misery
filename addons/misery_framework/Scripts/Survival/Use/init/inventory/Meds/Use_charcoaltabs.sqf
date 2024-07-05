/* -----------------------------------
Misery Charcoal tabs usage
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

#include "\Misery\Scripts\Misery_PreParser.hpp"

private _MPoison = player getVariable ["MiseryPoison", MIS_POISON];

if (!hasInterface) exitWith {};

 if (goggles player in antirad_goggles || headgear player in antirad_headgears) exitWith {
	titleText ["You cannot take medicine while wearing a mask...", "PLAIN DOWN"];
};

  if (alive player) then {
    
    playSound3D ["Misery\audio\sounds\inventory\Items\CrinklingPlastic.ogg", player, false, getPosASL player, 4, 1, 10];

  player removeItem "Misery_charcoaltabs";
  titleText ["You take some Charcoal tablets...", "PLAIN DOWN"];

  sleep 60;

if (_MPoison > 0) then { 
	player setVariable ["MiseryPoison", MIS_POISON];
};
 
};
