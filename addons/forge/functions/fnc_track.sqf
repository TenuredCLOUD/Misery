#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Forge tracker
 * Stashes existing and created forges during scenario to tracking array
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_forge_fnc_track;
 *
 * Public: No
*/

[QCLASS(forge), "Init", {
    GVAR(tracked) pushBack (_this select 0);
}, true, [], true] call CBA_fnc_addClassEventHandler;
