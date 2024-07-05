// //JetFuel by: TenuredCLOUD v2.0

[
	player,
	"Collect Jet Fuel",
	"Misery\Scripts\Survival\Use\icons\jerrycan.paa",
	"Misery\Scripts\Survival\Use\icons\jerrycan.paa",
	"call Misery_fnc_NearJetFuel",
	"call Misery_fnc_RefillgearJ",
	{
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
	[_soundDummy, ["GasPump", 50]] remoteExec ["say3D", 0, _soundDummy];
	[{
    !(player getVariable ["_TC_sound", false])
	},{
    deleteVehicle _this;
	}, _soundDummy] call CBA_fnc_waitUntilAndExecute;
	},
	{
	titleText ["Pumping Fuel...", "PLAIN DOWN"];
	0 = [player, 50] call rvg_fnc_alertNearby;
	},
	{
	
	private _random = [1, 10] call BIS_fnc_randomInt;	

	_Check_items = items player;

////---------------------------------------------------Keep Battery

 if (_random > 5) then {

	player removeitem "Misery_EmptyJet";
				_todelete = [];

				_canistertoground = "GroundWeaponHolder" createVehicle [0,0,0];
				_canistertoground addItemCargoGlobal ["Misery_JetFuelF", 1];
				_canistertoground enableCollisionWith player;
				_canistertoground setpos (player modelToWorld [.3,-.3,0]);
				_todelete append [_canistertoground];

 	};

//---------------------------------------------------Remove Battery, but still get Fuel can

if (_random == 5) then {

	player removeitem "Misery_EmptyJet";
	_todelete = [];

				_canistertoground = "GroundWeaponHolder" createVehicle [0,0,0];
				_canistertoground addItemCargoGlobal ["Misery_JetFuelF", 1];
				_canistertoground enableCollisionWith player;
				_canistertoground setpos (player modelToWorld [.3,-.3,0]);
				_todelete append [_canistertoground];
				
				titleText ["You filled your Jerrycan, but you used the rest of your battery...", "PLAIN DOWN"];
				player removeItem "Misery_AutoBatt";
	};

////---------------------------------------------------Keep Battery

if (_random < 5) then {
				
				player removeitem "Misery_EmptyJet";
				_todelete = [];

				_canistertoground = "GroundWeaponHolder" createVehicle [0,0,0];
				_canistertoground addItemCargoGlobal ["Misery_JetFuelF", 1];
				_canistertoground enableCollisionWith player;
				_canistertoground setpos (player modelToWorld [.3,-.3,0]);
				_todelete append [_canistertoground];
};
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