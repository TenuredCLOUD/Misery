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

private _exposure = player getVariable [QGVAR(exposure), MACRO_PLAYER_DEFAULTS_LOW];

if (alive player) exitWith {
    titleText ["You use a cold pack...", "PLAIN DOWN"];
    player removeItem QCLASS(coldpack);

[{
if (_this > 0) then {
    player setVariable [QGVAR(exposure), MACRO_PLAYER_DEFAULTS_LOW];
    } else {
    if (_this < 0) then {
    [-5, "exposure"] call EFUNC(common,addModifier);
        };
    };
}, [_exposure], 60] call CBA_fnc_waitAndExecute;
};
