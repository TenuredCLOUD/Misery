//CBRN assemble by TenuredCLOUD v2.0

[
	player,
	"Assemble CBRN gear",
	"Misery\Scripts\Survival\Use\icons\cbrn.paa",
	"Misery\Scripts\Survival\Use\icons\cbrn.paa",
	"call Misery_fnc_NearWorkbench",
	"call Misery_fnc_craftCBRNas",
	{
	player action ["hideWeapon",player,player,101]; //holster weapon on start	
	},
	{
	private _prog = (_this select 4);
	private _progcalc = round (_prog / 24 * 100);
	titleText [format["Crafting progress... %1%2", _progcalc, "%"], "PLAIN DOWN"];
	},
	{
	
	player removeitem "Misery_CBRNparts";

	titleText ["You assembled a CBRN outfit", "PLAIN DOWN"];

	_uniform = selectrandom [
	"U_I_Wetsuit_rvg",
	"U_O_Wetsuit_rvg",
	"U_B_Wetsuit_rvg"
	];

	_todelete = [];

	_crafttoground = "GroundWeaponHolder" createVehicle [0,0,0];
	_crafttoground addItemCargoGlobal [_uniform, 1];
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