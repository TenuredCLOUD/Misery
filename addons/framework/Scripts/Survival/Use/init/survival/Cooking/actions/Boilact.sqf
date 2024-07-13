
[
	player,
	"Boil water",
	"\z\misery\addons\framework\scripts\survival\Use\icons\boilwater.paa",
	"\z\misery\addons\framework\scripts\survival\Use\icons\boilwater.paa",
	"call Misery_fnc_NearFire",
	"call Misery_fnc_Canboilwater",
	{
	//Force holstering
	if !((currentWeapon player)=="") then {
	player action["SWITCHWEAPON",player,player,-1];
	};

	//ambient action:
	player playAction "Gear";
	
	
	//soundsource:
	private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position player);
	player setVariable ["_TC_sound", true, true];
	[_soundDummy, ["WaterBoiling", 50]] remoteExec ["say3D", 0, _soundDummy];
	[{
    !(player getVariable ["_TC_sound", false])
	},{
    deleteVehicle _this;
	}, _soundDummy] call CBA_fnc_waitUntilAndExecute;
	},
	{
	private _prog = (_this select 4);
	private _progcalc = round (_prog / 24 * 100);
	titleText [format["Boiling progress... %1%2", _progcalc, "%"], "PLAIN DOWN"];
	},
	{
_check_mags = magazines player;
_Check_items = items player;
	
if ("rvg_plasticBottle" in _check_mags && "Misery_castironpot" in _Check_items) exitwith {

  player removeitem "rvg_plasticBottle";
  sleep 0.5;
  player additem "rvg_plasticBottlePurified";

  titleText ["You boiled some water...", "PLAIN DOWN"]; //completion text
};

if ("rvg_canteen" in _check_mags && "Misery_castironpot" in _Check_items) exitwith {

  player removeitem "rvg_canteen";
  sleep 0.5;
  player additem "rvg_canteenPurified";

  titleText ["You boiled some water...", "PLAIN DOWN"]; //completion text

};

if ("Misery_WaterJerryFD" in _Check_items && "Misery_castironpot" in _Check_items) exitwith {

  player removeitem "Misery_WaterJerryFD";

  sleep 0.5;

  _todelete = [];

				_JCtoground = "GroundWeaponHolder" createVehicle [0,0,0];
				_JCtoground addItemCargoGlobal ["Misery_WaterJerryF", 1];
				_JCtoground enableCollisionWith player;
				_JCtoground setpos (player modelToWorld [.3,-.3,0]);
				_todelete append [_JCtoground];

	titleText ["You boiled some water...", "PLAIN DOWN"]; //completion text
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
	30,
	nil,
	true,
	false
] call BIS_fnc_holdActionAdd;