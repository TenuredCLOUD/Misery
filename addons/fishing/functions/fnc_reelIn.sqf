#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Reels in the fishing line, affecting line out and tension
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fishing_fnc_reelIn
 *
*/

private _display = findDisplay 982387;

if (isNull _display) exitWith {};

GVAR(lineOut) = (GVAR(lineOut) - 0.05) max 0;
GVAR(lineTension) = (GVAR(lineTension) + 0.1) min 1;

if (GVAR(lineOut) <= 0 && GVAR(fishOn)) then {
    private _fishCaughtStr = format ["<t font='PuristaMedium' size='0.7'>You caught a fish!</t>"];
    [QEGVAR(common,tileText), _fishCaughtStr] call CBA_fnc_localEvent;
    private _fishHolder = "GroundWeaponHolder" createVehicle [0,0,0];
    _fishHolder addItemCargoGlobal [QCLASS(rawFish), 1];
    _fishHolder enableCollisionWith player;
    _fishHolder setPos (player modelToWorld [0.3, -0.3, 0]);

    // Random bait loss from fish digesting it
    private _random = [1, 2] call BIS_fnc_randomInt;
    if (_random isEqualTo 1) then {
        [player, QCLASS(worms)] call CBA_fnc_removeItem;
    };
    [] call FUNC(exit);
} else {
    if (GVAR(lineOut) <= 0) then {
        private _lineReeledInStr = format ["<t font='PuristaMedium' size='0.7'>Line fully reeled in.</t>"];
        [QEGVAR(common,tileText), _lineReeledInStr] call CBA_fnc_localEvent;
        [] call FUNC(exit);
    };
};
