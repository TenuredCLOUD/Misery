#include "\z\misery\addons\framework\scripts\Misery_PreParser.hpp"

/*
Misery Drink from Jerrycan (dirty)
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private _MThirst = player getVariable ["MiseryThirst", MIS_THIRST];
private _MDebuffs = player getVariable "MiseryDebuffs";


Miseryturbidwaterchance=_module getvariable "Misery_Waterturbidchance"; //Dirty water causes disease chance

if (goggles player in antirad_goggles || headgear player in antirad_headgears) exitWith {
	titleText ["You cannot eat or drink while wearing a mask...", "PLAIN DOWN"]
};

if (alive player) then {

playSound3D ["STALKERsounds\sounds\character\drink_flask.ogg", player, false, getPosASL player, 4, 1, 10];

private _random = [1, 10] call BIS_fnc_randomInt;	

////---------------------------------------------------Keep water
  if (_random > 5 ) exitwith {

  if((random 100) > Miseryturbidwaterchance) exitWith {

  player setVariable ["MiseryThirst", (_MThirst + 30)];

  player setVariable ["radiation", (player getvariable ["radiation",0]) + random 250, true];

  titleText ["The water has a foul stale odor to it, but you drink it anyway and it quenches your thirst...", "PLAIN DOWN"];
  };

  player setVariable ["MiseryThirst", (_MThirst + 30)];

  player setVariable ["radiation", (player getvariable ["radiation",0]) + random 250, true];

  titleText ["The water has a foul stale odor to it, but you drink it anyway and it quenches your thirst...", "PLAIN DOWN"];

  _time = time + 180;
    [_time] spawn {
    	private ["_TimeA"];
    	_TimeA=_this select 0;
    	waitUntil {(!alive player) or (time > _TimeA)};
    	if (alive player) then {_MDebuffs pushBackUnique "PARASITES"; player setVariable ["MiseryDebuffs", _MDebuffs];}; //<< sick from bad water
    };

};

//---------------------------------------------------dumped jerrycan
if (_random == 5) exitwith {

if((random 100) > Miseryturbidwaterchance) exitWith {

titleText ["You drink what you have left after spilling the Jerrycan...", "PLAIN DOWN"];
	
player setVariable ["MiseryThirst", (_MThirst + 15)];

player setVariable ["radiation", (player getvariable ["radiation",0]) + random 250, true];

player removeitem 'Misery_WaterJerryFD'; 
sleep 0.5;
player additem 'Misery_WaterJerryE';

};

titleText ["You drink what you have left after spilling the Jerrycan...", "PLAIN DOWN"];
	
player setVariable ["MiseryThirst", (_MThirst + 15)];

player setVariable ["radiation", (player getvariable ["radiation",0]) + random 250, true];

player removeitem 'Misery_WaterJerryFD'; 
sleep 0.5;
player additem 'Misery_WaterJerryE';

 _time = time + 180;
    [_time] spawn {
    	private ["_TimeA"];
    	_TimeA=_this select 0;
    	waitUntil {(!alive player) or (time > _TimeA)};
    	if (alive player) then {_MDebuffs pushBackUnique "PARASITES"; player setVariable ["MiseryDebuffs", _MDebuffs];}; //<< sick from bad water
    };

};

////---------------------------------------------------Keep water
if (_random < 5) exitwith {

if((random 100) > Miseryturbidwaterchance) exitWith {

player setVariable ["MiseryThirst", (_MThirst + 30)];

player setVariable ["radiation", (player getvariable ["radiation",0]) + random 250, true];

titleText ["The water has a foul stale odor to it, but you drink it anyway and it quenches your thirst...", "PLAIN DOWN"];

};

player setVariable ["MiseryThirst", (_MThirst + 30)];

player setVariable ["radiation", (player getvariable ["radiation",0]) + random 250, true];

titleText ["The water has a foul stale odor to it, but you drink it anyway and it quenches your thirst...", "PLAIN DOWN"];

  _time = time + 180;
    [_time] spawn {
    	private ["_TimeA"];
    	_TimeA=_this select 0;
    	waitUntil {(!alive player) or (time > _TimeA)};
    	if (alive player) then {_MDebuffs pushBackUnique "PARASITES"; player setVariable ["MiseryDebuffs", _MDebuffs];}; //<< sick from bad water
    };
};
	};