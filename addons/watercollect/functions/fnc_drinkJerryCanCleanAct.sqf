#include "..\script_component.hpp"
/*
    Misery drink from clean Jerrycan
    Designed specifically for Misery mod
    by TenuredCLOUD
*/

private _MThirst = player getVariable ["MiseryThirst", MIS_THIRST];



if (goggles player in antirad_goggles || headgear player in antirad_headgears) exitWith {
    titleText ["You cannot eat or drink while wearing a mask...", "PLAIN DOWN"]
};

if (alive player) then {

playSound3D ["STALKERsounds\sounds\character\drink_flask.ogg", player, false, getPosASL player, 4, 1, 10];

private _random = [1, 10] call BIS_fnc_randomInt;

////---------------------------------------------------Keep water
  if (_random > 5) exitwith {

 player setVariable ["MiseryThirst", (_MThirst + 30)];

  player setVariable ["radiation", (player getvariable ["radiation",0]) + random 50, true];

  titleText ["You drink from the Jerrycan and have water to spare...", "PLAIN DOWN"];

};

//---------------------------------------------------dumped jerrycan
if (_random == 5) exitwith {

titleText ["You drink what you have left after spilling the Jerrycan...", "PLAIN DOWN"];

player setVariable ["MiseryThirst", (_MThirst + 15)];

player setVariable ["radiation", (player getvariable ["radiation",0]) + random 50, true];

player removeitem 'Misery_WaterJerryF';
sleep 0.5;
player additem 'Misery_WaterJerryE';

};

////---------------------------------------------------Keep water
if (_random < 5) exitwith {

player setVariable ["MiseryThirst", (_MThirst + 30)];

player setVariable ["radiation", (player getvariable ["radiation",0]) + random 50, true];

titleText ["You drink from the Jerrycan and have water to spare...", "PLAIN DOWN"];

};
    };
