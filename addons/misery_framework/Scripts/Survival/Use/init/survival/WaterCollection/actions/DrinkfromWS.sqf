/* -----------------------------------
Misery Drink directly from Water sources
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

#include "\z\misery\addons\misery_framework\Scripts\Misery_PreParser.hpp"

private _module=(entities"Misery_Survival")select 0;
MiseryNORVG=_module getvariable "Misery_SurvivalFramework"; //Misery survival framework 
Miseryturbidwaterchance=_module getvariable "Misery_Waterturbidchance"; //Dirty water causes disease chance

private _MThirst = player getVariable ["MiseryThirst", MIS_THIRST];

if (goggles player in antirad_goggles || headgear player in antirad_headgears) exitWith {
	titleText ["You cannot eat or drink while wearing a mask...", "PLAIN DOWN"]
};
  
if (alive player) then {

titleText ["You drink from the water source...", "PLAIN DOWN"];

player playAction "Crouch";

sleep 1;

playSound3D ["STALKERsounds\sounds\character\drinkwater_gulp.ogg", player, false, getPosASL player, 4, 1, 10];

sleep 5;

if (MiseryNORVG=="ENABLED") exitwith {

if((random 100) > Miseryturbidwaterchance) exitWith {

player setVariable ["MiseryThirst", (_MThirst + 10)];
titleText ["You just swallowed water that smelled foul and tasted dirty. Despite the repugnant taste, it did quench your thirst. \n However, the lingering aftertaste and a growing unease in your stomach suggest that it might not have been the best idea... ", "PLAIN DOWN"];

 player setVariable ["radiation", (player getvariable ["radiation",0]) + random 150, true];
};

player setVariable ["MiseryThirst", (_MThirst + 10)];
titleText ["You just swallowed water that smelled foul and tasted dirty. Despite the repugnant taste, it did quench your thirst. \n However, the lingering aftertaste and a growing unease in your stomach suggest that it might not have been the best idea... ", "PLAIN DOWN"];

player setVariable ["radiation", (player getvariable ["radiation",0]) + random 150, true];

player setVariable ["Turbidwaterlogged", true];

_time = time + 180;
[_time] spawn {
	private ["_TimeA"];
	_TimeA=_this select 0;
	waitUntil {(!alive player) or (time > _TimeA)};
	if (alive player) then {
		player setVariable ["Turbidwaterlogged", nil];

		private _MDebuffs = player getVariable "MiseryDebuffs";
    	_MDebuffs pushBackUnique "PARASITES"; player setVariable ["MiseryDebuffs", _MDebuffs]; //<< sick from bad water
		};
	};
};

if ((count(entities"Ravage_survival")) > 0) exitwith {

if((random 100) > Miseryturbidwaterchance) exitWith {

player setVariable ["thirst", (player getvariable ["thirst",0]) + 10, true];

player setVariable ["radiation", (player getvariable ["radiation",0]) + random 150, true];

//correction if thirst goes over 100:
private _Newwaterval = player getVariable "thirst";
if (_Newwaterval > 100) then {
	player setVariable ["thirst", 100];
};

titleText ["You just swallowed water that smelled foul and tasted dirty. Despite the repugnant taste, it did quench your thirst. \n However, the lingering aftertaste and a growing unease in your stomach suggest that it might not have been the best idea... ", "PLAIN DOWN"];
};

player setVariable ["thirst", (player getvariable ["thirst",0]) + 10, true];

player setVariable ["radiation", (player getvariable ["radiation",0]) + random 150, true];

//correction if thirst goes over 100:
private _Newwaterval = player getVariable "thirst";
if (_Newwaterval > 100) then {
	player setVariable ["thirst", 100];
};

titleText ["You just swallowed water that smelled foul and tasted dirty. Despite the repugnant taste, it did quench your thirst. \n However, the lingering aftertaste and a growing unease in your stomach suggest that it might not have been the best idea... ", "PLAIN DOWN"];

player setVariable ["Turbidwaterlogged", true];

_time = time + 180;
[_time] spawn {
	private ["_TimeA"];
	_TimeA=_this select 0;
	waitUntil {(!alive player) or (time > _TimeA)};
	if (alive player) then {
		player setVariable ["Turbidwaterlogged", nil];
		private _MDebuffs = player getVariable "MiseryDebuffs";
    	_MDebuffs pushBackUnique "PARASITES"; player setVariable ["MiseryDebuffs", _MDebuffs];
			};
		};	
	};
};