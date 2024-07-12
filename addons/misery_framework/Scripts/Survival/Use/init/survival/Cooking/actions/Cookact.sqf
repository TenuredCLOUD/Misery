//Cooking / using fires by: TenuredCLOUD v2.0

[
	player,
	"Cook raw meat",
	"Misery\Scripts\Survival\Use\icons\cookedmeat.paa",
	"Misery\Scripts\Survival\Use\icons\cookedmeat.paa",
	"call Misery_fnc_NearFire",
	"call Misery_fnc_Cancookmeat",
	{
	//Force holstering
	if !((currentWeapon player)=="") then {
	player action["SWITCHWEAPON",player,player,-1];
	};

	//ambient action:
	player playAction "Gear";
	
	
	//soundsource:
	private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position player);
	player setVariable ["_TC_sound", true,true];
	[_soundDummy, ["MeatRoasted", 50]] remoteExec ["say3D", 0, _soundDummy];
	[{
    !(player getVariable ["_TC_sound", false])
	},{
    deleteVehicle _this;
	}, _soundDummy] call CBA_fnc_waitUntilAndExecute;
	},
	{
	private _prog = (_this select 4);
	private _progcalc = round (_prog / 24 * 100);
	titleText [format["Cooking progress... %1%2", _progcalc, "%"], "PLAIN DOWN"];
	},
	{
_check_mags = magazines player;
_Check_items = items player;
	
if ("rvg_Rabbit_Meat" in _check_mags) exitwith {

  player removeMagazine "rvg_Rabbit_Meat";
  sleep 0.5;
  player addMagazine "rvg_Rabbit_Meat_Cooked";

  titleText ["You cooked some meat...", "PLAIN DOWN"];

};

if ("rvg_Chicken_Meat" in _check_mags) exitwith {

  player removeMagazine "rvg_Chicken_Meat";
  sleep 0.5;
  player addMagazine "rvg_Chicken_Meat_Cooked";

  titleText ["You cooked some meat...", "PLAIN DOWN"];

};

if ("rvg_Sheep_Meat" in _check_mags) exitwith {

  player removeMagazine "rvg_Sheep_Meat";
  sleep 0.5;
  player addMagazine "rvg_Sheep_Meat_Cooked";

  titleText ["You cooked some meat...", "PLAIN DOWN"];

};

if ("rvg_Boar_Meat" in _check_mags) exitwith {

  player removeMagazine "rvg_Boar_Meat";
  sleep 0.5;
  player addMagazine "rvg_Boar_Meat_Cooked";

  titleText ["You cooked some meat...", "PLAIN DOWN"];

};

if ("rvg_Buffalo_Meat" in _check_mags) exitwith {

  player removeMagazine "rvg_Buffalo_Meat";
  sleep 0.5;
  player addMagazine "rvg_Buffalo_Meat_Cooked";

  titleText ["You cooked some meat...", "PLAIN DOWN"];

};

if ("Misery_rawfish_1" in _Check_items) exitwith {

  player removeitem "Misery_rawfish_1";
  sleep 0.5;
  player additem "Misery_cookedfish";

  titleText ["You cooked some meat...", "PLAIN DOWN"];

};
	private _actionID = (_this select 2);
	[player,_actionID] call BIS_fnc_holdActionRemove;
	player setVariable ["_TC_sound", false,true];
	},
	{
	private _actionID = (_this select 2);
	[player,_actionID] call BIS_fnc_holdActionRemove;
	player setVariable ["_TC_sound", false,true];
	},
	[],
	26,
	nil,
	true,
	false
] call BIS_fnc_holdActionAdd;