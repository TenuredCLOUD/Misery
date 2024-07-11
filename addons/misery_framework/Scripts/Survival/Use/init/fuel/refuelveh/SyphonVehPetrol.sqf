/*
Misery Advanced refueling (Syphoning) - by : TenuredCLOUD with great help from Drongo for easy module defines 
Array input for refueling amount per Jerrycan
Designed specifically for Misery mod
 */

private _Jerrycanused= _this; // item classname
private _Fueltype= 0; // 0=Diesel // 1=Petrol // 2=JetFuel 
private _curFuel = (fuel MiseryTarget_Veh);
private _Fueltoremove = 1; //0.1 = 1;
private _ArrayDistcheck = 6; //Array setting for distance from veh
private _newFuelVal=0; //Pre-defined additional fuel 
private _Found=false; //Found in array
private _Array = [];
private _Checkmags = magazines player;

private _Vehiclename = getText (configFile >> "CfgVehicles" >> MiseryTarget_VehName >> "displayName");


{
	if ((_x select 0) == MiseryTarget_VehName) then {
		_Array=_x;
		_Found = true;
	};
} forEach Misery_Veh_Type;

if !(_Found) exitwith {};

if (_Found && ((_Array select 1) == 0)) exitwith {titleText [format["%1 Requires Empty Diesel can...", _Vehiclename], "PLAIN DOWN"];};
if (_Found && ((_Array select 1) == 2)) exitwith {titleText [format["%1 Requires Empty Jetfuel can...", _Vehiclename], "PLAIN DOWN"];};

if (((_Array select 1) == 1)) exitwith { 
	if (_Found) then {
	if ("rvg_hose" in _Checkmags) then {
		_ArrayDistcheck = (_Array select 2); 
		_Fueltoremove = (_Array select 3);
		if ((player distance MiseryTarget_Veh) < _ArrayDistcheck) then {
		if ((fuel MiseryTarget_Veh) >= _Fueltoremove) then {
			
			(findDisplay 602) closeDisplay 2; 

			player removeItem _Jerrycanused; //Remove current Jerrycan to prevent action spam 
			//Force holstering
			if !((currentWeapon player)=="") then {
			player action["SWITCHWEAPON",player,player,-1];
			};
			sleep 2;
			player playActionNow "Crouch";
			sleep 0.5;
			player playActionNow "Gear";
			titleText ["Syphoning fuel from Vehicle...", "PLAIN DOWN"];
			sleep 5;
			_newFuelVal = fuel MiseryTarget_Veh; //get fuel
			_newFuelVal = (_curFuel - _Fueltoremove); // _capacity; //Fuel removal calc
			if (_newFuelVal < 0) then {_newFuelVal = 0;}; //If fuel goes under "0" reset to "0"
			MiseryTarget_Veh setFuel _newFuelVal; //remove fuel
			_todelete = [];
			_canistertoground = "GroundWeaponHolder" createVehicle [0,0,0];
			_canistertoground addItemCargoGlobal ["Misery_PetrolF", 1];
			_canistertoground enableCollisionWith player;
			_canistertoground setpos (player modelToWorld [.3,-.3,0]);
			_todelete append [_canistertoground];
			//private _Fueldecpercentage = round (_Fueltoremove * 100);
			titleText [format["%1 Fuel level decreased to %2%3...", _Vehiclename,(fuel MiseryTarget_Veh) * 100,"%"], "PLAIN DOWN"];
			}else{
			titleText [format["%1 Doesn't have enough fuel to syphon...", _Vehiclename], "PLAIN DOWN"];
			};
			};
			}else{
			titleText ["You need a hose to syphon fuel...", "PLAIN DOWN"];
			};
		};
	};

