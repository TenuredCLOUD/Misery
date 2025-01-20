#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * artifact radiation exposure
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_artifacts_fnc_exposure;
 *
*/


[{call EFUNC(radiation,hasArtifact)},
{

[{
        params ["_args","_handle"];

        if (!(call EFUNC(radiation,hasArtifact)) || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            [QUOTE(COMPONENT_BEAUTIFIED), "Artifact exposure cycle terminated"] call EFUNC(common,debugMessage);
            [] call FUNC(exposure);
        };

player setVariable [QEGVAR(survival,radiation), (player getVariable [QEGVAR(survival,radiation),0]) + 50, true];

[QUOTE(COMPONENT_BEAUTIFIED), "Artifact exposure cycle"] call EFUNC(common,debugMessage);

}, 10, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
