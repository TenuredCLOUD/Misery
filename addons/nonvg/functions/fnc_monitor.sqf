#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * No nightvision when in TPP (Third person)
 * Enforces player to disable NVG's when in third person
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_nonvg_fnc_monitor;
 *
*/

[{(cameraView isEqualTo "EXTERNAL" && (currentVisionMode player isEqualTo 1 || currentVisionMode player isEqualTo 2))},
{
    [{
        params ["_args", "_handle"];

        if ((cameraView isEqualTo "INTERNAL") || (cameraView isEqualTo "GUNNER") || (currentVisionMode player isEqualTo 0) || (!alive player)) exitWith {
            _handle call CBA_fnc_removePerFrameHandler;
            call FUNC(monitor);
        };

        if ((currentVisionMode player isEqualTo 1) || (currentVisionMode player isEqualTo 2)) then {
            player action ["nvGogglesOff", player];
        };
    }, 0.1, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;

