#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Power manager for lanterns
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_lantern_fnc_managePower
 *
*/

[{[[QCLASS(lantern_On)]] call EFUNC(common,hasItem)}, {
    [{
        params ["_args", "_handle"];

        if !([[QCLASS(lantern_On)]] call EFUNC(common,hasItem)) exitWith {
            _handle call CBA_fnc_removePerFrameHandler;
            call FUNC(managePower)
        };

        [QCLASS(lantern_On), QCLASS(lantern_NoBattery)] call EFUNC(common,itemDecrement);
        call FUNC(logicCheck);

    }, 60, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
