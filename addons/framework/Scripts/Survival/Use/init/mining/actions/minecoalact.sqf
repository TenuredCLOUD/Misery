/*
Misery Coal mining
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

[
	player,
	"Mine Coal",
	"\z\misery\addons\framework\scripts\survival\Use\icons\pickaxe.paa",
	"\z\misery\addons\framework\scripts\survival\Use\icons\pickaxe.paa",
	"call Misery_fnc_NearCoal",
	"call Misery_fnc_mineactcheck",
	{
	//Starting variable:
	MiseryCanMineCoal = true;
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

	if (call Misery_fnc_mineactcheck && MiseryCanMineCoal == true) then {
	titleText ["Mining ore...", "PLAIN DOWN"];
	};

	if (_random == 50) then {
	MiseryCanMineCoal = false;
	titleText ["You got some Coal ore", "PLAIN DOWN"];
	_orerandom = selectrandom ["Misery_Coalore","Misery_Coalore"];
	player additem _orerandom;
	player additem "Misery_Stonechunk";
	[player,_actionID] call BIS_fnc_holdActionRemove;
	player setVariable ["_TC_sound", false,true];
	};

	if (_random == 100) then {
	MiseryCanMineCoal = false;
	titleText ["Your pickaxe broke...", "PLAIN DOWN"];
	player removeitem "Misery_Pickaxe";//adds pick back to inventory
	player additem "Misery_Pickaxebroken"; //adds broken pick to inventory
	player additem "Misery_Stonechunk";
	[player,_actionID] call BIS_fnc_holdActionRemove;
	player setVariable ["_TC_sound", false,true];
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
