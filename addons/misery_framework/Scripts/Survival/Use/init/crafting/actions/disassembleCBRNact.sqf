//Disassemble CBRN by TenuredCLOUD v2.0

[
	player,
	"Disassemble CBRN gear",
	"Misery\Scripts\Survival\Use\icons\cbrn.paa",
	"Misery\Scripts\Survival\Use\icons\cbrn.paa",
	"call Misery_fnc_NearWorkbench",
	"call Misery_fnc_craftCBRNdis",
	{
	player action ["hideWeapon",player,player,101]; //holster weapon on start
	0 = [player, 25] call rvg_fnc_alertNearby;
	},
	{
	private _prog = (_this select 4);
	private _progcalc = round (_prog / 24 * 100);
	titleText [format["Crafting progress... %1%2", _progcalc, "%"], "PLAIN DOWN"];
	},
	{
	
	player removeitem "U_I_Wetsuit_rvg";
	player removeitem "U_O_Wetsuit_rvg";
	player removeitem "U_B_Wetsuit_rvg";
	player removeitem "U_B_CBRN_Suit_01_MTP_F";
	player removeitem "U_B_CBRN_Suit_01_Tropic_F";
	player removeitem "U_B_CBRN_Suit_01_Wdl_F";
	player removeitem "U_I_CBRN_Suit_01_AAF_F";
	player removeitem "U_I_E_CBRN_Suit_01_EAF_F";
	player removeitem "U_C_CBRN_Suit_01_Blue_F";
	player removeitem "U_C_CBRN_Suit_01_White_F";

titleText ["You disassembled a CBRN outfit", "PLAIN DOWN"];

_todelete = [];

				_crafttoground = "GroundWeaponHolder" createVehicle [0,0,0];
				_crafttoground addItemCargoGlobal ["Misery_CBRNparts", 1];
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