#include "..\script_component.hpp"
/*
Misery Heatpack usage
Designed specifically for Misery mod
by TenuredCLOUD
*/

private _MExposure = player getVariable ["MiseryExposure", MACRO_PLAYER_EXPOSURE];

if (!hasInterface) exitWith {};

    if (alive player) exitwith {

    titleText ["You use a heat pack...", "PLAIN DOWN"];

    player removeitem "Misery_Heatpack";

sleep 60;

if (_MExposure < 0) then {

    player setVariable ["MiseryExposure", MACRO_PLAYER_EXPOSURE];

}else{

if (_MExposure > 0) then {

    player setVariable ["MiseryExposure", (_MExposure + 5)];

        };
    };
};
