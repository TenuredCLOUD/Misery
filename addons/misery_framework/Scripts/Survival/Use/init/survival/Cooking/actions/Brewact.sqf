
 [
	player,
	"Make coffee",
	"Misery\Scripts\Survival\Use\icons\coffee.paa",
	"Misery\Scripts\Survival\Use\icons\coffee.paa",
	"call Misery_fnc_NearFire",
	"call Misery_fnc_Canbrewcoffee",
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
	titleText [format["Brewing progress... %1%2", _progcalc, "%"], "PLAIN DOWN"];
	},
	{

_check_mags = magazines player;
_Check_items = items player;

	if ("Misery_WaterJerryF" in _Check_items && "Misery_castironpot" in _Check_items && "Misery_coffeemug" in _Check_items && "Misery_coffeegrounds" in _Check_items) exitwith {

	player removeitem "Misery_coffeemug";
  	player removeitem "Misery_coffeegrounds";
	sleep 0.5;
	player additem "Misery_coffeebrewed";

	private _random = floor random 10;

	if (_random == 2) exitwith {

	player removeitem "Misery_WaterJerryF";
	sleep 0.5;

	player additem "Misery_WaterJerryE";

	titleText ["You brewed some coffee...", "PLAIN DOWN"]; //completion text

	};

	titleText ["You brewed some coffee...", "PLAIN DOWN"]; //completion text

	};

	if ("rvg_canteenPurified" in _check_mags && "Misery_castironpot" in _Check_items && "Misery_coffeemug" in _Check_items && "Misery_coffeegrounds" in _Check_items) exitwith {

	player removeitem "Misery_coffeemug";
  	player removeitem "Misery_coffeegrounds";
	player removeMagazine "rvg_canteenPurified";
	sleep 0.5;
	player additem "Misery_coffeebrewed";
	player addMagazine "rvg_canteenEmpty";

	titleText ["You brewed some coffee...", "PLAIN DOWN"]; //completion text

	};

	if ("rvg_plasticBottlePurified" in _check_mags && "Misery_castironpot" in _Check_items && "Misery_coffeemug" in _Check_items && "Misery_coffeegrounds" in _Check_items) exitwith {

	player removeitem "Misery_coffeemug";
  	player removeitem "Misery_coffeegrounds";
	player removeMagazine "rvg_plasticBottlePurified";
	sleep 0.5;
	player additem "Misery_coffeebrewed";
	player addMagazine "rvg_plasticBottleEmpty";

	titleText ["You brewed some coffee...", "PLAIN DOWN"]; //completion text

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

