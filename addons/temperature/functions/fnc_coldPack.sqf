#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Coldpack usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_temperature_fnc_coldPack;
 *
 * Public: No
*/

private _MExposure = player getVariable [QCLASS(exposure), MACRO_PLAYER_EXPOSURE];

if (!hasInterface) exitWith {};

if (alive player) exitWith {
    titleText ["You use a cold pack...", "PLAIN DOWN"];

    player removeItem QCLASS(coldpack);

    sleep 60;

    if (_MExposure > 0) then {
        player setVariable [QCLASS(exposure), MACRO_PLAYER_EXPOSURE];// reset exposure to 0; from overheat
    } else {
        if (_MExposure < 0) then {
            player setVariable [QCLASS(exposure), (_MExposure - 5)];
        };
    };
};
