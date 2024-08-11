/*
Misery Advanced refueling - by : TenuredCLOUD with great help from Drongo for easy module defines
Array input for refueling amount per Jerrycan
Designed specifically for Misery mod
 */

private _Jerrycanused= _this; // item classname
private _Fueltype= 0; // 0=Diesel // 1=Petrol // 2=JetFuel
private _curFuel = (fuel MiseryTarget_Veh);
private _Fueltoadd = 1; //0.1 = 1;
private _ArrayDistcheck = 6; //Array setting for distance from veh
private _newFuelVal=0; //Pre-defined additional fuel
private _Found=false; //Found in array
private _Array = [];

private _Vehiclename = getText (configFile >> "CfgVehicles" >> MiseryTarget_VehName >> "displayName");

{
    if ((_x select 0) == MiseryTarget_VehName) then {
        _Array=_x;
        _Found = true;
    };
} forEach Misery_Veh_Type;

if !(_Found) exitwith {};

if (_Found && ((_Array select 1) == 0)) exitwith {titleText [format["%1 Requires Diesel...", _Vehiclename], "PLAIN DOWN"];};
if (_Found && ((_Array select 1) == 2)) exitwith {titleText [format["%1 Requires Jetfuel...", _Vehiclename], "PLAIN DOWN"];};

if (((_Array select 1) == 1)) exitwith {
if (_Found) then {
    _ArrayDistcheck = (_Array select 2);
    _Fueltoadd = (_Array select 3);
    if ((player distance MiseryTarget_Veh) < _ArrayDistcheck) then {

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
            titleText ["Refueling Vehicle...", "PLAIN DOWN"];
            sleep 5;
            _newFuelVal = fuel MiseryTarget_Veh; //get fuel
            _newFuelVal = (_curFuel + _Fueltoadd); // _capacity; //Fuel add calc
            if (_newFuelVal > 1) then {_newFuelVal=1;}; //If fuel goes over "1" reset to "1"
            MiseryTarget_Veh setFuel _newFuelVal; //Add fuel
            player addItem "Misery_EmptyPetrol"; //Add empty canister
            //private _Fuelincpercentage = round (_newFuelVal * 100);
            titleText [format["%1 Fuel level increased to %2%3...", _Vehiclename,(fuel MiseryTarget_Veh) * 100,"%"], "PLAIN DOWN"];
        };
    };
};

