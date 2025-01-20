#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Heatpack usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_temperature_fnc_heatPack;
 *
 * Public: No
*/

private _MExposure = player getVariable [QEGVAR(survival,exposure), MACRO_PLAYER_DEFAULTS_LOW];

if (!hasInterface) exitWith {};

    if (alive player) exitWith {

    titleText ["You use a heat pack...", "PLAIN DOWN"];

    player removeItem QCLASS(heatpack);

sleep 60;

if (_MExposure < 0) then {

    player setVariable [QEGVAR(survival,exposure), MACRO_PLAYER_DEFAULTS_LOW];

} else {

if (_MExposure > 0) then {

    player setVariable [QEGVAR(survival,exposure), (_MExposure + 5)];

        };
    };
};
