#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Water temperature exposure
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_temperature_fnc_water;
 *
 * Public: No
*/

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "_exposure", "", "_infection", "_parasites", "", "", "", "", "", "", "", "", ""];
private _wetSuit = false;

if (((toLower(uniform player))find "wetsuit") > -1) then {_wetSuit = true};

if (((getPosASLW player select 2) < 0) || (underwater player)) then {
    if (_parasites > 0 || _infection > 0) then {
        player setVariable [QGVAR(exposure), MACRO_PLAYER_DEFAULTS_LOW];
    };

    if (!_wetSuit && GVAR(seaTemperature) < 20) then {
        _coldWater = ((20 - GVAR(seaTemperature)) / 2) / 2;
        [-_coldWater, "exposure"] call EFUNC(common,addModifier);
    };
};

