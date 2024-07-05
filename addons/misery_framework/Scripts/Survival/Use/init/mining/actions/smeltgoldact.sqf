//smelt gold ore by TenuredCLOUD v2.0

 [
	player,
	"Smelt gold",
	"Misery\Scripts\Survival\Use\icons\forge.paa",
	"Misery\Scripts\Survival\Use\icons\forge.paa",
	"call Misery_fnc_NearForge",
	"call Misery_fnc_smeltgold",
	{//start action:
	player action ["hideWeapon",player,player,101]; //holster weapon on start
	0 = [player, 50] call rvg_fnc_alertNearby;
	//soundsource:
	private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position player);
	player setVariable ["_TC_sound", true,true];
	[_soundDummy, ["MetalSmelt", 50]] remoteExec ["say3D", 0, _soundDummy];
	[{
    !(player getVariable ["_TC_sound", false])
	},{
    deleteVehicle _this;
	}, _soundDummy] call CBA_fnc_waitUntilAndExecute;},
	{private _prog = (_this select 4);
	private _progcalc = round (_prog / 24 * 100);
	titleText [format["Smelting progress... %1%2", _progcalc, "%"], "PLAIN DOWN"];
	},
	{
	player removeItem "Misery_Coalore";
  	player removeItem "Misery_Coalore";
  	player removeItem "Misery_Goldore";
  	player removeItem "Misery_Goldore";  
  	player additem "Misery_Goldingot";
	 
	titleText ["You smelted a gold ingot...", "PLAIN DOWN"]; //completion text

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
