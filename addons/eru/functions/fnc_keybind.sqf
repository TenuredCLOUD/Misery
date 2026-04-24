#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * eru keybind
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_eru_fnc_keybind
 *
*/

if ([[QCLASS(eru_Off)]] call EFUNC(common,hasItem)) then {
    playSound QEGVAR(audio,sound_PowerUpBeep);
    [player, [QCLASS(eru_On), QCLASS(eru_Off)], true] call EFUNC(common,switchPowerState);
    // Chance to decrement battery by one tick on power cycle
    if ([40] call EFUNC(common,rollChance)) then {
        [QCLASS(eru_On), QCLASS(eru_NoBattery)] call EFUNC(common,itemDecrement);
    };
    call FUNC(readings);
};

if ([[QCLASS(eru_On)]] call EFUNC(common,hasItem)) then {
    playSound QEGVAR(audio,sound_PowerDownBeep);
    [player, [QCLASS(eru_On), QCLASS(eru_Off)], false] call EFUNC(common,switchPowerState);
};
