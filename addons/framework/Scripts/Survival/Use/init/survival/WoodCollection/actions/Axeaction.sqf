/*
WoodAxe usage
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

 [
	player,
	"Chop wood",
	"\z\misery\addons\framework\scripts\survival\Use\icons\firewood.paa",
	"\z\misery\addons\framework\scripts\survival\Use\icons\firewood.paa",
	"call Misery_fnc_NearTreeAxe",
	"call Misery_fnc_NearTreeAxe",
	{
	//Force holstering if WBKIMS disabled:
	if (MiseryWBKIMS == FALSE) then { 
	if !((currentWeapon player)=="") then {
	player action["SWITCHWEAPON",player,player,-1];
	};
	};

	//soundsource:
	private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position player);
	player setVariable ["_TC_sound", true,true];
	[_soundDummy, ["WoodChop01", 150]] remoteExec ["say3D", 0, _soundDummy];
	[{
    !(player getVariable ["_TC_sound", false])
	},{
    deleteVehicle _this;
	}, _soundDummy] call CBA_fnc_waitUntilAndExecute;
	},
	{
	private _prog = (_this select 4);
	private _progcalc = round (_prog / 24 * 100);
	titleText [format["Chopping progress... %1%2", _progcalc, "%"], "PLAIN DOWN"];
	},
	{
		private ["_rfirewood","_rstick","_todelete","_woodtoground1","_woodtoground2","_woodtoground3"];

		_rfirewood = [1, 2] call BIS_fnc_randomInt;
		_rstick = [1, 5] call BIS_fnc_randomInt;

		_todelete = [];
		
		_woodtoground1 = "GroundWeaponHolder" createVehicle [0,0,0];
		_woodtoground1 addItemCargoGlobal ["Misery_firewood", _rfirewood];
		_woodtoground1 enableCollisionWith player;
		_woodtoground1 setpos (player modelToWorld [1,-.3,.1]);
		_todelete append [_woodtoground1];

		_woodtoground2 = "GroundWeaponHolder" createVehicle [0,0,0];
		_woodtoground2 addItemCargoGlobal ["Misery_woodenlog", 1];
		_woodtoground2 enableCollisionWith player;
		_woodtoground2 setpos (player modelToWorld [2,-.3,.1]);
		_todelete append [_woodtoground2];

		_woodtoground3 = "GroundWeaponHolder" createVehicle [0,0,0];
		_woodtoground3 addItemCargoGlobal ["Misery_woodensticks", _rstick];
		_woodtoground3 enableCollisionWith player;
		_woodtoground3 setpos (player modelToWorld [.5,-.3,.1]);
		_todelete append [_woodtoground3];

	//Simulate tree felling:
	private _nearTrees = nearestTerrainObjects [player, ["TREE", "SMALL TREE"], 2.5, true, true];
 	{_x setdamage 1} foreach _nearTrees;

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
	15,
	nil,
	true,
	false
] call BIS_fnc_holdActionAdd;
