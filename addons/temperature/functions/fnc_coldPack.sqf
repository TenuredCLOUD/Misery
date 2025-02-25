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

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "_exposure"];

if (!alive player) exitWith {};

titleText ["You use a cold pack...", "PLAIN DOWN"];
player removeItem QCLASS(coldpack);

[{
    params ["_exposure"];
    if (_exposure > 0) then {
        player setVariable [QGVAR(exposure), MACRO_PLAYER_DEFAULTS_LOW];
    } else {
        [-5, "exposure"] call EFUNC(common,addStatusModifier);
    };
}, [_exposure], 60] call CBA_fnc_waitAndExecute;
