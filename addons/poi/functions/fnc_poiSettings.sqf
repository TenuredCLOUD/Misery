#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * POI Master settings module initialization
 * Defines performance properties for each POI module
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_poi_fnc_poiSettings;
 *
 * Public: No
*/

private["_module","_units","_activated"];
_module=_this select 0;
_units = _this select 1;
_activated=_this select 2;
waitUntil{sleep 1; !isNil "MiseryReady"};

if (_activated && isServer) then {
[
(_module getVariable "MiseryPOISpawnCheckDistance"),
(_module getVariable "MiseryPOIDeleteCheckDistance"),
(_module getVariable "MiseryPOISpawnTimer"),
(_module getVariable "MiseryPOIDeleteTimer"),
(_module getVariable "MiseryPOISpawnLimit")
] call FUNC(settings);
};
true
