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
    playSound QEGVAR(audio,sound_geigerOn);
    [player, [QCLASS(geiger_On), QCLASS(geiger_Off)], true] call EFUNC(common,switchPowerState);
    // Chance to decrement battery by one tick on power cycle
    if ([40] call EFUNC(common,rollChance)) then {
        [QCLASS(geiger_On), QCLASS(geiger_NoBattery)] call EFUNC(common,itemDecrement);
    };
    call FUNC(readings);
};

if ([[QCLASS(geiger_On)]] call EFUNC(common,hasItem)) then {
    playSound QEGVAR(audio,sound_geigerOff);
    [player, [QCLASS(geiger_On), QCLASS(geiger_Off)], false] call EFUNC(common,switchPowerState);
};
