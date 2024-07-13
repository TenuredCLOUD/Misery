/*
Misery Sleeping pill pack usage
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

if (!hasInterface) exitWith {};

  if (alive player) exitwith {
    
  titleText ["You remove the sleeping pills from the package", "PLAIN DOWN"];

  player removeitem "Misery_sleeppack";
    
  playSound3D ["\z\misery\addons\framework\audio\sounds\inventory\Items\CaffetinBoxOpen.ogg", player, false, getPosASL player, 4, 1, 10];
  
  player additem "Misery_sleeppill";
  player additem "Misery_sleeppill";
  player additem "Misery_sleeppill";
  player additem "Misery_sleeppill";
  player additem "Misery_sleeppill";
  player additem "Misery_sleeppill";
  player additem "Misery_sleeppill";
  player additem "Misery_sleeppill";

  };
