//Water collection canteed by: TenuredCLOUD v2.5

[
	player,
	"Collect water in Canteen",
	"\z\misery\addons\framework\scripts\survival\Use\icons\well.paa",
	"\z\misery\addons\framework\scripts\survival\Use\icons\well.paa",
	"call Misery_fnc_NearWell",
	"call Misery_fnc_emptycanteenfill",
	{
	//start action:
	player playAction "Crouch";
	},
	{
	titleText ["Collecting water...", "PLAIN DOWN"];
	},
	{

_Check_magazines = magazines player;

if ("rvg_canteenEmpty" in _Check_magazines) exitwith {

titleText ["You fill your canteen with water, the water smells foul, and looks dirty.", "PLAIN DOWN"];

player removeMagazine "rvg_canteenEmpty";
sleep 0.5;
player addMagazine "rvg_canteen";

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