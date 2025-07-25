#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD, MikeMF
 * Keybind toggle for Geiger
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_geiger_fnc_keybind
 *
*/

if ([[QCLASS(geiger_Off)]] call EFUNC(common,hasItem)) then {
    //[player, [QCLASS(geiger_On), QCLASS(geiger_Off)], true] call EFUNC(common,switchPowerState);
    playSound QEGVAR(audio,sound_geigerOn);
    [[QCLASS(geiger_Off)], [QCLASS(geiger_On)]] call EFUNC(common,switchMagazine);
    call FUNC(readings);
};

if ([[QCLASS(geiger_On)]] call EFUNC(common,hasItem)) then {
    //[player, [QCLASS(geiger_On), QCLASS(geiger_Off)], false] call EFUNC(common,switchPowerState);
    playSound QEGVAR(audio,sound_geigerOff);
    [[QCLASS(geiger_On)], [QCLASS(geiger_Off)]] call EFUNC(common,switchMagazine);
};
