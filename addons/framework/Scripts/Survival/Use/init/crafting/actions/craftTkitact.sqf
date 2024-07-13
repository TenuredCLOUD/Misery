//Toolkit craft by TenuredCLOUD v2.0

[
	player,
	"Craft toolkit",
	"Misery\Scripts\Survival\Use\icons\toolkit.paa",
	"Misery\Scripts\Survival\Use\icons\toolkit.paa",
	"call Misery_fnc_NearWorkbench",
	"call Misery_fnc_craftTkit",
	{
	player action ["hideWeapon",player,player,101]; //holster weapon on start
	},
	{
	private _prog = (_this select 4);
	private _progcalc = round (_prog / 24 * 100);
	titleText [format["Crafting progress... %1%2", _progcalc, "%"], "PLAIN DOWN"];
	},
	{
	player removeItem "Misery_craftinghammer";
	player removeitem "Misery_wrench";
	player removeitem "Misery_pliers";
	player removeitem "Misery_Pscrewdriver";
	player removeitem "Misery_Fscrewdriver";
	player removeitem "Misery_Ducttape";

titleText ["You assembled a toolkit", "PLAIN DOWN"];


_todelete = [];

				_crafttoground = "GroundWeaponHolder" createVehicle [0,0,0];
				_crafttoground addItemCargoGlobal ["rvg_toolkit", 1];
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