// //Fuel collection by: TenuredCLOUD v2.0

[
	player,
	"Collect Fuel",
	"Misery\Scripts\Survival\Use\icons\jerrycan.paa",
	"Misery\Scripts\Survival\Use\icons\jerrycan.paa",
	"call Misery_fnc_NearFuel",
	"call Misery_fnc_Refillgear",
	{
	//start action:
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
	titleText ["Pumping fuel...", "PLAIN DOWN"];
	},
	{
	
	private _random = [1, 10] call BIS_fnc_randomInt;	

	_Check_items = items player;

////---------------------------------------------------Keep Battery

if (_random > 5) then {

	if ("Misery_EmptyDiesel" in _Check_items) then {
				player removeitem "Misery_EmptyDiesel";
				_todelete = [];

				_canistertoground = "GroundWeaponHolder" createVehicle [0,0,0];
				_canistertoground addItemCargoGlobal ["Misery_DieselF", 1];
				_canistertoground enableCollisionWith player;
				_canistertoground setpos (player modelToWorld [.3,-.3,0]);
				_todelete append [_canistertoground];

 	}else{

	if ("Misery_EmptyPetrol" in _Check_items) then {
				player removeitem "Misery_EmptyPetrol";
				_todelete = [];

				_canistertoground = "GroundWeaponHolder" createVehicle [0,0,0];
				_canistertoground addItemCargoGlobal ["Misery_PetrolF", 1];
				_canistertoground enableCollisionWith player;
				_canistertoground setpos (player modelToWorld [.3,-.3,0]);
				_todelete append [_canistertoground];
		};
	};
};

//---------------------------------------------------Remove Battery, but still get Fuel can

if (_random == 5) then {

if ("Misery_EmptyDiesel" in _Check_items) then {
				player removeitem "Misery_EmptyDiesel";
				_todelete = [];

				_canistertoground = "GroundWeaponHolder" createVehicle [0,0,0];
				_canistertoground addItemCargoGlobal ["Misery_DieselF", 1];
				_canistertoground enableCollisionWith player;
				_canistertoground setpos (player modelToWorld [.3,-.3,0]);
				_todelete append [_canistertoground];
				
				titleText ["You filled your Jerrycan, but you used the rest of your battery...", "PLAIN DOWN"];
				player removeItem "Misery_AutoBatt";
	}else{

if ("Misery_EmptyPetrol" in _Check_items) then {
			
				player removeitem "Misery_EmptyPetrol";
				_todelete = [];

				_canistertoground = "GroundWeaponHolder" createVehicle [0,0,0];
				_canistertoground addItemCargoGlobal ["Misery_PetrolF", 1];
				_canistertoground enableCollisionWith player;
				_canistertoground setpos (player modelToWorld [.3,-.3,0]);
				_todelete append [_canistertoground];

				titleText ["You filled your Jerrycan, but you used the rest of your battery...", "PLAIN DOWN"];
				player removeItem "Misery_AutoBatt";

		};
	};
};

////---------------------------------------------------Keep Battery

if (_random < 5) then {

				if ("Misery_EmptyDiesel" in _Check_items) then {
				player removeitem "Misery_EmptyDiesel";
				_todelete = [];

				_canistertoground = "GroundWeaponHolder" createVehicle [0,0,0];
				_canistertoground addItemCargoGlobal ["Misery_DieselF", 1];
				_canistertoground enableCollisionWith player;
				_canistertoground setpos (player modelToWorld [.3,-.3,0]);
				_todelete append [_canistertoground];
}else{

				if ("Misery_EmptyPetrol" in _Check_items) then {
				player removeitem "Misery_EmptyPetrol";
				_todelete = [];

				_canistertoground = "GroundWeaponHolder" createVehicle [0,0,0];
				_canistertoground addItemCargoGlobal ["Misery_PetrolF", 1];
				_canistertoground enableCollisionWith player;
				_canistertoground setpos (player modelToWorld [.3,-.3,0]);
				_todelete append [_canistertoground];

		};
	};
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