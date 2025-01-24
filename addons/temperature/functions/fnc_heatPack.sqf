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

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "_exposure", "", "", "", "", "", "", "", "", "", "", "", ""];

if (alive player) exitWith {
    titleText ["You use a heat pack...", "PLAIN DOWN"];
    player removeItem QCLASS(heatpack);

[{
if (_this > 0) then {
    player setVariable [QGVAR(exposure), MACRO_PLAYER_DEFAULTS_LOW];
    } else {
    if (_this < 0) then {
    [+5, "exposure"] call EFUNC(common,addModifier);
        };
    };
}, [_exposure], 60] call CBA_fnc_waitAndExecute;
};
