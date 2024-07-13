//craft cast iron pot by TenuredCLOUD v2.0
[
	player,
	"Craft castiron pot",
	"Misery\Scripts\Survival\Use\icons\anvil.paa",
	"Misery\Scripts\Survival\Use\icons\anvil.paa",
	"call Misery_fnc_NearAnvil",
	"call Misery_fnc_Castpotcraft",
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
	player removeItem "Misery_Ironingot"; 
    player removeItem "Misery_Ironingot";
    player additem "Misery_castironpot";

				titleText ["You crafted a castiron pot...", "PLAIN DOWN"]; //completion text
  
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