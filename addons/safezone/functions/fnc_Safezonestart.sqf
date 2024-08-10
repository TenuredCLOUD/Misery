#include "\z\misery\addons\main\script_macros.hpp"

/*
Misery Safezone (Client loop)
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

fnc_Miserysafezoneexit = {

params ["_index", "_text"];

if (!hasInterface || {!alive player}) exitWith {};
if !(MiseryinSafezonearea) exitwith {
titleText [_text, "PLAIN DOWN"];
player removeEventHandler ["Fired", _index]; //Remove Fired EH
if (MiseryACE) then {
player setVariable ["ace_medical_allowDamage",true,true];
}else{
player allowDamage true;
	};
};

[{_this call fnc_Miserysafezoneexit;},[_index,_text]] call CBA_fnc_waitAndExecute;
};

if (!hasInterface || {!alive player}) exitWith {};

titleText ["Entering Safezone...", "PLAIN DOWN"];

private _index = player addEventHandler ["Fired", {_projectile = _this select 6; deleteVehicle _projectile;}]; //Delete projectile immediately when fired

//Stop ALL types of damage to players: 
if (MiseryACE) then {
player setVariable ["ace_medical_allowDamage",false,true];
}else{
player allowDamage false;
};

[{_this call fnc_Miserysafezoneexit;},[_index, "Leaving Safezone..."]] call CBA_fnc_waitAndExecute;
