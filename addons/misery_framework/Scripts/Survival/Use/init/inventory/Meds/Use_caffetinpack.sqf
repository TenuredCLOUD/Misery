/* -----------------------------------
Misery Caffetinpack usage
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

if (!hasInterface) exitWith {};

  if (alive player) exitwith {

  titleText ["You remove the Caffetin tablets from the package", "PLAIN DOWN"];

  player removeitem "Misery_caffetin";
  
  playSound3D ["Misery\audio\sounds\inventory\Items\CaffetinBoxOpen.ogg", player, false, getPosASL player, 4, 1, 10];

  player additem "Misery_caffetincaps";
  player additem "Misery_caffetincaps";
  player additem "Misery_caffetincaps";
  player additem "Misery_caffetincaps";

  };
