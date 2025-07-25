#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Power manager for ERU
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_eru_fnc_managePower
 *
*/

[{[[QCLASS(eru_On)]] call EFUNC(common,hasItem)}, {
    [{
        params ["_args", "_handle"];

        if !([[QCLASS(eru_On)]] call EFUNC(common,hasItem)) exitWith {
            _handle call CBA_fnc_removePerFrameHandler;
            call FUNC(managePower)
        };

        [QCLASS(eru_On), QCLASS(eru_NoBattery)] call EFUNC(common,itemDecrement);
    }, 60, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
