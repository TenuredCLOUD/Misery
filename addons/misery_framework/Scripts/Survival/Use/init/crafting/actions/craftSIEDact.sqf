//Small IED craft by TenuredCLOUD v2.0

[
	player,
	"Craft small IED",
	"Misery\Scripts\Survival\Use\icons\ied.paa",
	"Misery\Scripts\Survival\Use\icons\ied.paa",
	"call Misery_fnc_NearWorkbench",
	"call Misery_fnc_craftsIED",
	{
	player action ["hideWeapon",player,player,101]; //holster weapon on start
	0 = [player, 25] call rvg_fnc_alertNearby;
	},
	{private _prog = (_this select 4);
	private _progcalc = round (_prog / 24 * 100);
	titleText [format["Crafting progress... %1%2", _progcalc, "%"], "PLAIN DOWN"];
	},
	{
	player removeItem "Misery_CoppWire";
	player removeitem "Misery_CoppWire";
	player removeitem "Misery_9vbat";
	player removeitem "Misery_lithiumbattery";
	player removeitem "rvg_plasticBottleEmpty";
	player removeitem "Misery_Phone";


titleText ["You crafted a Small IED", "PLAIN DOWN"];

_todelete = [];

				_crafttoground = "GroundWeaponHolder" createVehicle [0,0,0];
				_crafttoground addItemCargoGlobal ["IEDLandSmall_Remote_Mag", 1];
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