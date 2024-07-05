 /* -----------------------------------
Misery Ore Mining
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

#include "\Misery\Scripts\Misery_PreParser.hpp"

[
	player,
	"Mine Ore",
	"Misery\Scripts\Survival\Use\icons\pickaxe.paa",
	"Misery\Scripts\Survival\Use\icons\pickaxe.paa",
	"call Misery_fnc_NearRockSource",
	"call Misery_fnc_mineactcheck",
	{
	//Starting variable:
	MiseryCanMineOre = true;
	0 = [player, 50] call rvg_fnc_alertNearby;
	private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position player);
	player setVariable ["_TC_sound", true,true];
	[_soundDummy, ["Pickaxe60", 150]] remoteExec ["say3D", 0, _soundDummy];
	[{
    !(player getVariable ["_TC_sound", false])
	},{
    deleteVehicle _this;
	}, _soundDummy] call CBA_fnc_waitUntilAndExecute;},
	{
	private ["_random","_actionID","_orerandom"];
	
	_random = [1, 200] call BIS_fnc_randomInt;
	_actionID = (_this select 2);
	

	if (call Misery_fnc_mineactcheck && MiseryCanMineOre == true) then {
	titleText ["Mining ore...", "PLAIN DOWN"];
	};

	if (_random == 40) then {
	titleText ["You got some iron ore", "PLAIN DOWN"];
	_orerandom = selectrandom ["Misery_Ironore","Misery_Ironpiece"];
	player additem _orerandom;
	player additem "Misery_Stonechunk";
	[player,_actionID] call BIS_fnc_holdActionRemove;
	player setVariable ["_TC_sound", false,true];
	MiseryCanMineOre = false;
	};

	if (_random == 80) then {
	titleText ["You got some coal ore", "PLAIN DOWN"];
	_orerandom = selectrandom ["Misery_Coalore","Misery_Coalore"];
	player additem _orerandom;
	player additem "Misery_Stonechunk";
	[player,_actionID] call BIS_fnc_holdActionRemove;
	player setVariable ["_TC_sound", false,true];
	MiseryCanMineOre = false;
	};

	if (_random == 120) then {
	titleText ["You got some gold ore", "PLAIN DOWN"];
	_orerandom = selectrandom ["Misery_Goldore","Misery_Goldpiece"];
	player additem _orerandom;
	player additem "Misery_Stonechunk";
	[player,_actionID] call BIS_fnc_holdActionRemove;
	player setVariable ["_TC_sound", false,true];
	MiseryCanMineOre = false;
	};

	if (_random == 160) then {
	titleText ["You got a rare gem", "PLAIN DOWN"];
	_orerandom = selectrandom MIS_Gem;
	player additem _orerandom;
	player additem "Misery_Stonechunk";
	[player,_actionID] call BIS_fnc_holdActionRemove;
	player setVariable ["_TC_sound", false,true];
	MiseryCanMineOre = false;
	};

	if (_random == 200) then {
	titleText ["Your pickaxe broke...", "PLAIN DOWN"];
	player removeitem "Misery_Pickaxe"; 
	player additem "Misery_Pickaxebroken"; 
	player additem "Misery_Stonechunk";
	[player,_actionID] call BIS_fnc_holdActionRemove;
	player setVariable ["_TC_sound", false,true];
	MiseryCanMineOre = false;
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
	60,
	nil,
	true,
	false
] call BIS_fnc_holdActionAdd;