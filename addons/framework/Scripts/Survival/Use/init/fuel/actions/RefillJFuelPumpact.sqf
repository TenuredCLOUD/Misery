/*
Pump fuel from Jetfuel pump
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

[
	player,
	"Pump Fuel",
	"\z\misery\addons\framework\scripts\survival\Use\icons\pumpnozzle.paa",
	"\z\misery\addons\framework\scripts\survival\Use\icons\pumpnozzle.paa",
	"call Misery_fnc_NearJetFuel",
	"call Misery_fnc_RefuelatJetpump",
	{
	//Starting variable:
	MiseryCanrefuelatpump = true;

	//Force holstering
	if !((currentWeapon player)=="") then {
	player action["SWITCHWEAPON",player,player,-1];
	};

	//ambient action:
	player playAction "Gear";

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

	if (call Misery_fnc_RefuelatJetpump && MiseryCanrefuelatpump == true) then {
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