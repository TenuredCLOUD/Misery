 /* -----------------------------------
Misery woodplank crafting
Has compat for iBuild if it's in use
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

if (MiseryUsingiBuild) exitwith {

[
	player,
	"Craft woodplanks",
	"Misery\Scripts\Survival\Use\icons\sawmill.paa",
	"Misery\Scripts\Survival\Use\icons\sawmill.paa",
	"call Misery_fnc_NearWorkbench",
	"call Misery_fnc_woodplanks",
	{
	//Starting variable:
	MiseryCanSawPlanks = true;

	//Force holstering
	if !((currentWeapon player)=="") then {
	player action["SWITCHWEAPON",player,player,-1];
	};
	//soundsource:
	0 = [player, 250] call rvg_fnc_alertNearby;
	private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position player);
	_soundDummy attachTo [player, [0, 0, 0], "Pelvis"];
	player setVariable ["_TC_sound", true,true];
	[_soundDummy, ["ElectricSaw", 500]] remoteExec ["say3D", 0, _soundDummy];
	[{
    !(player getVariable ["_TC_sound", false])
	},{
    deleteVehicle _this;
	}, _soundDummy] call CBA_fnc_waitUntilAndExecute;},
	{
	private _actionID = (_this select 2);
	private _random = [1, 200] call BIS_fnc_randomInt;
	private _prog = (_this select 4);
	private _progcalc = round (_prog / 24 * 100);

	if (call Misery_fnc_woodplanks && MiseryCanSawPlanks == true) then {
	titleText [format["Sawing progress... %1%2", _progcalc, "%"], "PLAIN DOWN"];
	};

	if (_random == 100) exitwith {
	titleText ["Your saw battery ran out...", "PLAIN DOWN"];
	player removeitem "Misery_electrichandsaw";
	player additem "Misery_electrichandsawnobattery";
	MiseryCanSawPlanks = false;
	[player,_actionID] call BIS_fnc_holdActionRemove;
	};
	},
	{
	player removeitem "Misery_woodenlog";

	player additem "NMIB_WoodPlanks_Itm";
	player additem "NMIB_WoodPlanks_Itm";
	player additem "NMIB_WoodPlanks_Itm";
	player additem "NMIB_WoodPlanks_Itm";
	player additem "NMIB_WoodPlanks_Itm";

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
	45,
	nil,
	true,
	false
] call BIS_fnc_holdActionAdd;

};

if !(MiseryUsingiBuild) exitwith {

[
	player,
	"Craft woodplanks",
	"Misery\Scripts\Survival\Use\icons\sawmill.paa",
	"Misery\Scripts\Survival\Use\icons\sawmill.paa",
	"call Misery_fnc_NearWorkbench",
	"call Misery_fnc_woodplanks",
	{
	//Starting variable:
	MiseryCanSawPlanks = true;

	//Force holstering
	if !((currentWeapon player)=="") then {
	player action["SWITCHWEAPON",player,player,-1];
	};
	//soundsource:
	0 = [player, 250] call rvg_fnc_alertNearby;
	private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position player);
	_soundDummy attachTo [player, [0, 0, 0], "Pelvis"];
	player setVariable ["_TC_sound", true,true];
	[_soundDummy, ["ElectricSaw", 500]] remoteExec ["say3D", 0, _soundDummy];
	[{
    !(player getVariable ["_TC_sound", false])
	},{
    deleteVehicle _this;
	}, _soundDummy] call CBA_fnc_waitUntilAndExecute;},
	{
	private _actionID = (_this select 2);
	private _random = [1, 200] call BIS_fnc_randomInt;
	private _prog = (_this select 4);
	private _progcalc = round (_prog / 24 * 100);

	if (call Misery_fnc_woodplanks && MiseryCanSawPlanks == true) then {
	titleText [format["Sawing progress... %1%2", _progcalc, "%"], "PLAIN DOWN"];
	};

	if (_random == 100) exitwith {
	titleText ["Your saw battery ran out...", "PLAIN DOWN"];
	player removeitem "Misery_electrichandsaw";
	player additem "Misery_electrichandsawnobattery";
	MiseryCanSawPlanks = false;
	[player,_actionID] call BIS_fnc_holdActionRemove;
	};
	},
	{
	player removeitem "Misery_woodenlog";

	player additem "Misery_woodplank";
	player additem "Misery_woodplank";
	player additem "Misery_woodplank";
	player additem "Misery_woodplank";
	player additem "Misery_woodplank";

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
	45,
	nil,
	true,
	false
] call BIS_fnc_holdActionAdd;

};