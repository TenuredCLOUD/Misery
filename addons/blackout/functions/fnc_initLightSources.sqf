#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Initializes dynamic light sources that can be placeable with other systems
 * Removes ACE interactions for light cycling (on/off) to prep sources for generator component
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_blackout_fnc_initLightSources;
 *
 * Public: No
*/

["Land_PortableLight_single_F", "Init", {
    params ["_lightSource"];

    _lightSource switchLight "OFF";

    [_lightSource, _lightSource] call ACEFUNC(common,claim);
}, true, [], true] call CBA_fnc_addClassEventHandler;

["Land_PortableLight_double_F", "Init", {
    params ["_lightSource"];

    _lightSource switchLight "OFF";

    [_lightSource, _lightSource] call ACEFUNC(common,claim);
}, true, [], true] call CBA_fnc_addClassEventHandler;
