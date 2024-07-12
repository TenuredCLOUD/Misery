/*
Misery repair pickaxe
Has compat for iBuild if it's in use
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

if (MiseryUsingiBuild) exitwith {

[
	player,
	"Repair pickaxe",
	"Misery\Scripts\Survival\Use\icons\anvil.paa",
	"Misery\Scripts\Survival\Use\icons\anvil.paa",
	"call Misery_fnc_NearAnvil",
	"call Misery_fnc_Repairpick",
	{//start action:
	player action ["hideWeapon",player,player,101]; //holster weapon on start
	
	//soundsource:
	private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position player);
	player setVariable ["_TC_sound", true,true];
	[_soundDummy, ["AnvilHammer", 50]] remoteExec ["say3D", 0, _soundDummy];
	[{
    !(player getVariable ["_TC_sound", false])
	},{
    deleteVehicle _this;
	}, _soundDummy] call CBA_fnc_waitUntilAndExecute;},
	{private _prog = (_this select 4);
	private _progcalc = round (_prog / 24 * 100);
	titleText [format["Smithing progress... %1%2", _progcalc, "%"], "PLAIN DOWN"];
	},
	{
  player removeItem "Misery_Pickaxebroken";
  player removeItem "NMIB_WoodNails_Itm"; 
  player removeItem "Misery_Ironingot"; 
_todelete = [];

				_smithtoground = "GroundWeaponHolder" createVehicle [0,0,0];
				_smithtoground addItemCargoGlobal ["Misery_Pickaxe", 1];
				_smithtoground enableCollisionWith player;
				_smithtoground setpos (player modelToWorld [.3,-.3,0]);
				_todelete append [_smithtoground];

				titleText ["You repaired a pickaxe...", "PLAIN DOWN"]; //completion text

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

};

if !(MiseryUsingiBuild) exitwith {

[
	player,
	"Repair pickaxe",
	"Misery\Scripts\Survival\Use\icons\anvil.paa",
	"Misery\Scripts\Survival\Use\icons\anvil.paa",
	"call Misery_fnc_NearAnvil",
	"call Misery_fnc_Repairpick",
	{//start action:
	player action ["hideWeapon",player,player,101]; //holster weapon on start
	
	//soundsource:
	private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position player);
	player setVariable ["_TC_sound", true,true];
	[_soundDummy, ["AnvilHammer", 50]] remoteExec ["say3D", 0, _soundDummy];
	[{
    !(player getVariable ["_TC_sound", false])
	},{
    deleteVehicle _this;
	}, _soundDummy] call CBA_fnc_waitUntilAndExecute;},
	{private _prog = (_this select 4);
	private _progcalc = round (_prog / 24 * 100);
	titleText [format["Smithing progress... %1%2", _progcalc, "%"], "PLAIN DOWN"];
	},
	{
  player removeItem "Misery_Pickaxebroken";
  player removeItem "Misery_woodnail"; 
  player removeItem "Misery_Ironingot"; 
_todelete = [];

				_smithtoground = "GroundWeaponHolder" createVehicle [0,0,0];
				_smithtoground addItemCargoGlobal ["Misery_Pickaxe", 1];
				_smithtoground enableCollisionWith player;
				_smithtoground setpos (player modelToWorld [.3,-.3,0]);
				_todelete append [_smithtoground];

				titleText ["You repaired a pickaxe...", "PLAIN DOWN"]; //completion text

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

};