#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Power manager for geiger
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_geiger_fnc_managePower
 *
*/

[{[[QCLASS(geiger_On)]] call EFUNC(common,hasItem)}, {
    [{
        params ["_args", "_handle"];

        if !([[QCLASS(geiger_On)]] call EFUNC(common,hasItem)) exitWith {
            _handle call CBA_fnc_removePerFrameHandler;
            call FUNC(managePower)
        };

        [QCLASS(geiger_On), QCLASS(geiger_NoBattery)] call EFUNC(common,itemDecrement);
    }, 60, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
