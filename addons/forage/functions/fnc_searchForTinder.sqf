//Searching for tinder by: TenuredCLOUD v2.0

#include "\z\misery\addons\main\script_macros.hpp"

if (call EFUNC(common,Canforage)) then {

player playActionNow "Crouch";
sleep 0.5;
player playActionNow "Gear"; //Use Gear instead of medical actions - Med actions without rifle can cause frame lag spike 
sleep 3;

private _random = [1, 10] call BIS_fnc_randomInt;

if (_random > 4) then {
titleText ["You found some tinder...", "PLAIN DOWN"];
player additem "Misery_tinder";
}else{
titleText ["You didn't find anything...", "PLAIN DOWN"];
	};
};