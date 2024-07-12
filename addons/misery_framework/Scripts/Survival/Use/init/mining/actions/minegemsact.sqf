/*
Misery Gem mining
Designed specifically for Misery mod 
by TenuredCLOUD 
*/
#include "\z\misery\addons\misery_framework\Scripts\Misery_PreParser.hpp"

[
	player,
	"Mine gems",
	"Misery\Scripts\Survival\Use\icons\pickaxe.paa",
	"Misery\Scripts\Survival\Use\icons\pickaxe.paa",
	"call Misery_fnc_NearGems",
	"call Misery_fnc_mineactcheck",
	{
	//Starting variable:
	MiseryCanMineGems = true;
	private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position player);
	player setVariable ["_TC_sound", true,true];
	[_soundDummy, ["Pickaxe", 150]] remoteExec ["say3D", 0, _soundDummy];
	[{
    !(player getVariable ["_TC_sound", false])
	},{
    deleteVehicle _this;
	}, _soundDummy] call CBA_fnc_waitUntilAndExecute;},
	{
	private _random = [1, 100] call BIS_fnc_randomInt;
	private _actionID = (_this select 2);
	
	if (call Misery_fnc_mineactcheck && MiseryCanMineGems == true) then {
	titleText ["Mining ore...", "PLAIN DOWN"];
	};

	if (_random == 50) then {
	titleText ["You got a rare gem", "PLAIN DOWN"];
	_orerandom = selectrandom MIS_Gem;
	player additem _orerandom;
	player additem "Misery_Stonechunk";
	[player,_actionID] call BIS_fnc_holdActionRemove;
	player setVariable ["_TC_sound", false,true];
	MiseryCanMineGems = false;
	};

	if (_random == 100) then {
	titleText ["Your pickaxe broke...", "PLAIN DOWN"];
	player removeitem "Misery_Pickaxe";
	player additem "Misery_Pickaxebroken"; 
	player additem "Misery_Stonechunk";
	[player,_actionID] call BIS_fnc_holdActionRemove;
	player setVariable ["_TC_sound", false,true];
	MiseryCanMineGems = false;
	};

	},
	{
	titleText ["Nothing but stone pieces...", "PLAIN DOWN"];
	player additem "Misery_Stonechunk";
	private _actionID = (_this select 2);
	[player,_actionID] call BIS_fnc_holdActionRemove;
	player setVariable ["_TC_sound", false,true];
	},
	{
	player setVariable ["_TC_sound", false,true];
	private _actionID = (_this select 2);
	[player,_actionID] call BIS_fnc_holdActionRemove;
	},
	[],
	30,
	nil,
	true,
	false
] call BIS_fnc_holdActionAdd;
