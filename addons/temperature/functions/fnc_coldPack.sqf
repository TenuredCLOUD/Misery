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

private _MExposure = player getVariable ["MiseryExposure", MACRO_PLAYER_EXPOSURE];

if (!hasInterface) exitWith {};

if (alive player) exitWith {
    titleText ["You use a cold pack...", "PLAIN DOWN"];

    player removeitem "Misery_Coldpack";

    sleep 60;

    if (_MExposure > 0) then {
        player setVariable ["MiseryExposure", MACRO_PLAYER_EXPOSURE];// reset exposure to 0; from overheat
    } else {
        if (_MExposure < 0) then {
            player setVariable ["MiseryExposure", (_MExposure - 5)];
        };
    };
};
