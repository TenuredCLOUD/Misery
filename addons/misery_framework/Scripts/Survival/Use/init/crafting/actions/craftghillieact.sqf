//craft ghillie by TenuredCLOUD v2.0

 [
	player,
	"Craft ghillie suit",
	"Misery\Scripts\Survival\Use\icons\ghillieicon.paa",
	"Misery\Scripts\Survival\Use\icons\ghillieicon.paa",
	"call Misery_fnc_NearWorkbench",
	"call Misery_fnc_craftghillie",
	{
	player action ["hideWeapon",player,player,101]; //holster weapon on start
	},
	{private _prog = (_this select 4);
	private _progcalc = round (_prog / 24 * 100);
	titleText [format["Crafting progress... %1%2", _progcalc, "%"], "PLAIN DOWN"];
	},
	{
			player removeItem "Misery_camonet";
			player removeitem "Misery_camonet";
			player removeitem "Misery_camonet";
			player removeitem "Misery_camonet";
			player removeItem "Misery_Rope";
			player removeItem "Misery_Rope";
			player removeitem "Misery_Needlethread";


titleText ["You crafted a Ghillie", "PLAIN DOWN"];
_type = selectrandom ["U_I_GhillieSuit",
"U_B_GhillieSuit"];

_todelete = [];

				_crafttoground = "GroundWeaponHolder" createVehicle [0,0,0];
				_crafttoground addItemCargoGlobal [_type, 1];
				_crafttoground enableCollisionWith player;
				_crafttoground setpos (player modelToWorld [.3,-.3,0]);
				_todelete append [_crafttoground];
	
	private _actionID = (_this select 2);
	[player,_actionID] call BIS_fnc_holdActionRemove;
	
	},
	{ 
	private _actionID = (_this select 2);
	[player,_actionID] call BIS_fnc_holdActionRemove;
	},
	[],
	30,
	nil,
	true,
	false
] call BIS_fnc_holdActionAdd;