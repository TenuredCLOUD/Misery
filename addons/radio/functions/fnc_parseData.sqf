#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Radio streams data parser
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_radio_fnc_parseData;
 *
*/

GVAR(radioTracks) = [];

{
    private _name = configName _x;
    private _duration = getNumber (_x >> "duration");
    GVAR(radioTracks) pushBack [_name, _duration];
} forEach ("true" configClasses (missionConfigFile >> "CfgMisery_RadioData"));

// Broadcast the radio broadcasting data across all clients
publicVariable QGVAR(radioTracks);
