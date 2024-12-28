#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Digging for worms
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_forage_fnc_digForWorms
 *
*/

if (call FUNC(canForage)) then {
    player playActionNow "Crouch";
    sleep 0.5;
    player playActionNow "Gear"; //Use Gear instead of medical actions - Med actions without rifle can cause frame lag spike
    sleep 3;
    private _random = [1, 10] call BIS_fnc_randomInt;

    if (_random > 7) then {
        titleText ["You found some worms...", "PLAIN DOWN"];
        player addItem QCLASS(worms);
    }else{
        titleText ["You didn't find anything...", "PLAIN DOWN"];
    };
};
