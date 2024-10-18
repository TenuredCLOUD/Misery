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

private _MExposure = player getVariable ["MiseryExposure", MACRO_PLAYER_EXPOSURE];

if (!hasInterface) exitWith {};

    if (alive player) exitWith {

    titleText ["You use a heat pack...", "PLAIN DOWN"];

    player removeItem "Misery_Heatpack";

sleep 60;

if (_MExposure < 0) then {

    player setVariable ["MiseryExposure", MACRO_PLAYER_EXPOSURE];

}else{

if (_MExposure > 0) then {

    player setVariable ["MiseryExposure", (_MExposure + 5)];

        };
    };
};
