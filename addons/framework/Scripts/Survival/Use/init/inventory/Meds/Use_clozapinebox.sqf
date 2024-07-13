/*
Misery Clozapine box usage
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

if (!hasInterface) exitWith {};

  if (alive player) exitwith {

  titleText ["You remove the Clozapine tablets from the package", "PLAIN DOWN"];

  player removeitem "Misery_Clozapinebox";
  
  playSound3D ["Misery\audio\sounds\inventory\Items\CaffetinBoxOpen.ogg", player, false, getPosASL player, 4, 1, 10];

  player additem "Misery_ClozapinePill";
  player additem "Misery_ClozapinePill";
  player additem "Misery_ClozapinePill";
  player additem "Misery_ClozapinePill";
  player additem "Misery_ClozapinePill";
  player additem "Misery_ClozapinePill";
  player additem "Misery_ClozapinePill";
  player additem "Misery_ClozapinePill";

  };
