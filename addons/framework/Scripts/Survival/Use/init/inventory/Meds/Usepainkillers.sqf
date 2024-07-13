/*
Misery Pain killer pack usage
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

if (!hasInterface) exitWith {};

if (alive player) then {

    titleText ["You open the box of painkillers...", "PLAIN DOWN"];

    playSound3D ["Misery\audio\sounds\inventory\Items\CaffetinBoxOpen.ogg", player, false, getPosASL player, 4, 1, 10];

    player removeitem "Misery_pain";

    player additem "Misery_painpill";
    player additem "Misery_painpill";
    player additem "Misery_painpill";
    player additem "Misery_painpill";
    player additem "Misery_painpill";
    player additem "Misery_painpill";
    player additem "Misery_painpill";
    player additem "Misery_painpill";

};
