/*
Misery Generator Power button 
Controls start and stop operation of generators
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

#include "\z\misery\addons\framework\scripts\Misery_PreParser.hpp"

waitUntil {!isNull findDisplay 573849};

_Generator = player getVariable "Misery_Current_Generator";

_GeneratorType = typeOf _Generator; 

_PowerButton = findDisplay 573849 displayCtrl 1600; 

if ((ctrlText 1600) isEqualTo "Start") exitWith {
	[_Generator] execVM "\z\misery\addons\framework\scripts\survival\functions\menus\Generator\Gen_RunningUserAct.sqf";
};

if ((ctrlText 1600) isEqualTo "Stop") exitWith {
	_Generator setVariable ['Misery_Gen_IsRunning', false, true];
};
