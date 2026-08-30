#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Initializes dynamic light sources that can be placeable with other systems
 * Removes ACE interactions for light cycling (on/off) to prep sources for power component
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_power_fnc_initLightSources;
 *
 * Public: No
*/

["Land_Camping_Light_off_F", "Init", {
    params ["_lightSource"];

    [_lightSource, _lightSource] call ACEFUNC(common,claim);

}, true, [], true] call CBA_fnc_addClassEventHandler;

["Land_Camping_Light_F", "Init", {
    params ["_lightSource"];

    _lightSource switchLight "OFF";

    [_lightSource, _lightSource] call ACEFUNC(common,claim);
}, true, [], true] call CBA_fnc_addClassEventHandler;
