//collect water Jerry act by TenuredCLOUD v2.5

[
	player,
	"Collect water in Jerrycan",
	"Misery\Scripts\Survival\Use\icons\well.paa",
	"Misery\Scripts\Survival\Use\icons\well.paa",
	"call Misery_fnc_NearWell",
	"call Misery_fnc_emptyjerrycanfill",
	{
	//start action:
	player playAction "Crouch";
	},
	{
	titleText ["Collecting water...", "PLAIN DOWN"];
	},
	{

_Check_items = items player;

if ("Misery_WaterJerryE" in _Check_items) exitwith {

titleText ["You fill your Jerrycan with water, the water smells foul, and looks dirty.", "PLAIN DOWN"];

player removeItem "Misery_WaterJerryE";
sleep 0.5;

_todelete = [];

				_jerrycantoground = "GroundWeaponHolder" createVehicle [0,0,0];
				_jerrycantoground addItemCargoGlobal ["Misery_WaterJerryFD", 1];
				_jerrycantoground enableCollisionWith player;
				_jerrycantoground setpos (player modelToWorld [.3,-.3,0]);
				_todelete append [_jerrycantoground];
};
	private _actionID = (_this select 2);
	[player,_actionID] call BIS_fnc_holdActionRemove;
	},
	{
	private _actionID = (_this select 2);
	[player,_actionID] call BIS_fnc_holdActionRemove;
	},
	[],
	10,
	nil,
	true,
	false
] call BIS_fnc_holdActionAdd;
