/*
Fishing system
Designed specifically for Misery mod 
Fishing pole orientation to player help from SlayNoMore
by TenuredCLOUD 
*/

[
	player,
	"Fish",
	"Misery\Scripts\Survival\Use\icons\fish.paa",
	"Misery\Scripts\Survival\Use\icons\fish.paa",
	"call Misery_fnc_Canfish",
	"call Misery_fnc_Fishinggear",
	{
	//Starting variable:
	MiseryCanFish = true;

	//Force holstering
	if !((currentWeapon player)=="") then {
	player action["SWITCHWEAPON",player,player,-1];
	};

	Misery_Isfishing = "GroundWeaponHolder_Scripted" createVehicle(getPos player);
	Misery_Isfishing addItemCargoGlobal ["Misery_fishingpole", 1];
	Misery_Isfishing setDir 0;
	Misery_Isfishing attachTo [player,[0,-0.15,-0.75],"rightHandMiddle1",true];
	Misery_Isfishing setVectorDirAndUp [[3,0,0.55],[9.05,0.65,-0.15]];
	},
	{
	private _actionID = (_this select 2);
	private _random = [1, 100] call BIS_fnc_randomInt;

	if (call Misery_fnc_Fishinggear && MiseryCanFish == true) then {
	titleText ["Fishing...", "PLAIN DOWN"];
	};

	if (_random == 25) exitwith {
	titleText ["You caught a fish!", "PLAIN DOWN"];

	_todelete = [];

	_fishtoground = "GroundWeaponHolder" createVehicle [0,0,0];
	_fishtoground addItemCargoGlobal ["Misery_rawfish_1", 1];
	_fishtoground enableCollisionWith player;
	_fishtoground setpos (player modelToWorld [.3,-.3,0]);
	_todelete append [_fishtoground];
	MiseryCanFish = false;
	[player,_actionID] call BIS_fnc_holdActionRemove;
	deleteVehicle Misery_Isfishing;
	};

	if (_random == 50) exitwith {
	titleText ["Something broke, or flew off the line, and you failed to catch anything...", "PLAIN DOWN"];
	_part = selectrandom ["Misery_fishingspool", "Misery_fishhook", "Misery_worms", "Misery_worms", "Misery_worms"];
	player removeitem _part;
	MiseryCanFish = false;
	[player,_actionID] call BIS_fnc_holdActionRemove;
	deleteVehicle Misery_Isfishing;
	};

	if (_random == 75) exitwith {
	titleText ["You lost your bait...", "PLAIN DOWN"];
	_part = selectrandom ["Misery_worms", "Misery_worms"];
	player removeitem _part;
	MiseryCanFish = false;
	[player,_actionID] call BIS_fnc_holdActionRemove;
	deleteVehicle Misery_Isfishing;
	};

	if (_random == 100) exitwith {
	titleText ["Your hook and bait are gone...", "PLAIN DOWN"];
	player removeitem "Misery_fishhook";
	player removeitem "Misery_worms";
	MiseryCanFish = false;
	[player,_actionID] call BIS_fnc_holdActionRemove;
	deleteVehicle Misery_Isfishing;
	};
	},
	{
	titleText ["You didn't catch anything...", "PLAIN DOWN"];
	private _actionID = (_this select 2);
	[player,_actionID] call BIS_fnc_holdActionRemove;
	deleteVehicle Misery_Isfishing;
	},
	{
	private _actionID = (_this select 2);
	[player,_actionID] call BIS_fnc_holdActionRemove;
	deleteVehicle Misery_Isfishing;
	},
	[],
	120,
	nil,
	true,
	false
] call BIS_fnc_holdActionAdd;
