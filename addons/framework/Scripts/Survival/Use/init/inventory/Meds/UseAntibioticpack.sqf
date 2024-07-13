/*
Misery Antibiotic pack usage
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

if (!hasInterface) exitWith {};

  if (alive player) exitwith {
    
  titleText ["You remove the antibiotic pills from the package", "PLAIN DOWN"];

  player removeitem "Misery_antibiotic";
    
  playSound3D ["\z\misery\addons\framework\audio\sounds\inventory\Items\CaffetinBoxOpen.ogg", player, false, getPosASL player, 4, 1, 10];
  
  player additem "Misery_antibioticpill";
  player additem "Misery_antibioticpill";
  player additem "Misery_antibioticpill";
  player additem "Misery_antibioticpill";
  player additem "Misery_antibioticpill";
  player additem "Misery_antibioticpill";
  player additem "Misery_antibioticpill";
  player additem "Misery_antibioticpill";

  };
