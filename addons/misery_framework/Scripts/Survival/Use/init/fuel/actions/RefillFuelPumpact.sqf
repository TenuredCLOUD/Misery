 /* -----------------------------------
Pump fuel from fuel pump
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

[
	player,
	"Pump Fuel",
	"Misery\Scripts\Survival\Use\icons\pumpnozzle.paa",
	"Misery\Scripts\Survival\Use\icons\pumpnozzle.paa",
	"call Misery_fnc_NearFuel",
	"call Misery_fnc_Refuelatpump",
	{
	//Starting variable:
	MiseryCanrefuelatpump = true;

	//Force holstering
	if !((currentWeapon player)=="") then {
	player action["SWITCHWEAPON",player,player,-1];
	};

	//ambient action:
	player playAction "Gear";
	
	//alert zeds:
	0 = [player, 50] call rvg_fnc_alertNearby;
	//soundsource:
	private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position player);
	player setVariable ["_TC_sound", true,true];
	[_soundDummy, ["GasPump30", 50]] remoteExec ["say3D", 0, _soundDummy];
	[{
    !(player getVariable ["_TC_sound", false])
	},{
    deleteVehicle _this;
	}, _soundDummy] call CBA_fnc_waitUntilAndExecute;
	},
	{
	private _actionID = (_this select 2);
	private _curFuel = (fuel cursortarget);
	private _randombatt = [1, 100] call BIS_fnc_randomInt;
	private _randomfuel = selectRandom [0.0419,0.0418,0.0417,0.0416];
	private _Vehiclename = getText (configFile >> "CfgVehicles" >> typeOf cursortarget >> "displayName");

	if (_curFuel >= 1) exitwith {
	MiseryCanrefuelatpump == false;
	cursortarget setFuel 1;	
	titleText [format["%1 fuel tank is full...", _Vehiclename], "PLAIN DOWN"];
	[player,_actionID] call BIS_fnc_holdActionRemove;
	player setVariable ["_TC_sound", false,true];
	};

	if (call Misery_fnc_Refuelatpump && MiseryCanrefuelatpump == true) then {
	titleText [format["Pumping Fuel...\n\n %3 Tank level: (%2%1)","%",(fuel cursortarget) * 100,_Vehiclename], "PLAIN DOWN"];
	_newFuelVal = (_curFuel + _randomfuel);
	cursortarget setFuel _newFuelVal;
	};

	if (_randombatt == 50) exitwith {
	MiseryCanrefuelatpump = false;
	titleText ["Your battery ran out...", "PLAIN DOWN"];
	player removeItem "Misery_AutoBatt";
	[player,_actionID] call BIS_fnc_holdActionRemove;
	player setVariable ["_TC_sound", false,true];
	};

	},
	{
	player setVariable ["_TC_sound", false,true];
	private _actionID = (_this select 2);
	[player,_actionID] call BIS_fnc_holdActionRemove;
	},
	{
	player setVariable ["_TC_sound", false,true];
	private _actionID = (_this select 2);
	[player,_actionID] call BIS_fnc_holdActionRemove;
	},
	[],
	32,
	nil,
	true,
	false
] call BIS_fnc_holdActionAdd;