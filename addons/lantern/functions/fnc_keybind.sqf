#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD, MikeMF
 * Keybind toggle for lantern
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_lantern_fnc_keybind
 *
*/

if ([[QCLASS(lantern_Off)]] call EFUNC(common,hasItem)) then {
    if (isNil {player getVariable [QGVAR(state), nil]}) then {
        [player, [QCLASS(lantern_On), QCLASS(lantern_Off)], true] call EFUNC(common,switchPowerState);

        private _lantern = "Land_Camping_Light_F" createVehicle position player;

        [_lantern, [player, [-0.17, -0.14, -0.06], "Pelvis", true]] remoteExec ["attachTo", [0, -2] select isDedicated, _lantern];

        player setVariable [QGVAR(state), _lantern, true];
    };
};

if ([[QCLASS(lantern_On)]] call EFUNC(common,hasItem)) then {
    if (!isNil {player getVariable [QGVAR(state), nil]}) then {
        private _lantern = player getVariable [QGVAR(state), nil];

        [_lantern] remoteExec ["deleteVehicle", [0, -2] select isDedicated, _lantern];

        [player, [QCLASS(lantern_On), QCLASS(lantern_Off)], false] call EFUNC(common,switchPowerState);

        player setVariable [QGVAR(state), nil, true];
    } else {
        // Fallback for reloader issues
        [player, [QCLASS(lantern_On), QCLASS(lantern_Off)], false] call EFUNC(common,switchPowerState);
    };
};
