#include "..\script_component.hpp"
//Digging for worms by: TenuredCLOUD v2.0

if (call EFUNC(common,Canforage)) then {

player playActionNow "Crouch";
sleep 0.5;
player playActionNow "Gear"; //Use Gear instead of medical actions - Med actions without rifle can cause frame lag spike

sleep 3;

private _random = [1, 10] call BIS_fnc_randomInt;

if (_random > 7) then {
titleText ["You found some worms...", "PLAIN DOWN"];
player additem "Misery_worms";
}else{
    titleText ["You didn't find anything...", "PLAIN DOWN"];
    };
};
