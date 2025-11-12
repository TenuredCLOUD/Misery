#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Initializes radio objects / pushes them into tracking array
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_radio_fnc_initRadios;
 *
*/

["Land_FMradio_F", "Init", {
    params ["_radio"];

    GVAR(allRadios) pushBackUnique _radio;
}, true, [], true] call CBA_fnc_addClassEventHandler;
