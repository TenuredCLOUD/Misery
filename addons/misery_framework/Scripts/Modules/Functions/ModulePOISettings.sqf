 /* -----------------------------------
Misery POI Master settings module initialization
Defines performance properties for each POI module
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

private["_module","_units","_activated"];
_module=_this select 0;
_units = _this select 1;
_activated=_this select 2;
waitUntil{sleep 1; !isNil "MiseryReady"};

if (_activated && isServer) then {
[
(_module getVariable"MiseryPOISpawnCheckDistance"),
(_module getVariable"MiseryPOIDeleteCheckDistance"),
(_module getVariable"MiseryPOISpawnTimer"),
(_module getVariable"MiseryPOIDeleteTimer"),
(_module getVariable"MiseryPOISpawnLimit")
] execVM"Misery\Scripts\Modules\POI\Settings.sqf";
};
TRUE