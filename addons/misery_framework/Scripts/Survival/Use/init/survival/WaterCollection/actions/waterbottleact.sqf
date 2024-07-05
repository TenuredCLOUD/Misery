//collect water bottle act by TenuredCLOUD v2.5

[
	player,
	"Collect water in Bottle",
	"Misery\Scripts\Survival\Use\icons\well.paa",
	"Misery\Scripts\Survival\Use\icons\well.paa",
	"call Misery_fnc_NearWell",
	"call Misery_fnc_emptybottlefill",
	{
	//start action:
	player playAction "Crouch";
	},
	{
	titleText ["Collecting water...", "PLAIN DOWN"];
	},
	{

_Check_magazines = magazines player;

if ("rvg_plasticBottleEmpty" in _Check_magazines) exitwith {

titleText ["You fill your bottle with water, the water smells foul, and looks dirty.", "PLAIN DOWN"];

player removeMagazine "rvg_plasticBottleEmpty";
sleep 0.5;
player addMagazine "rvg_plasticBottle";

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