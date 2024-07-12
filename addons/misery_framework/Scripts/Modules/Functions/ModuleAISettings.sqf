/*
Misery Ambient AI Master settings module initialization
Defines performance properties for each Ambient AI module
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private["_module","_units","_activated"];
_module=_this select 0;
_units = _this select 1;
_activated=_this select 2;
waitUntil{sleep 1; !isNil "MiseryReady"};

if (_activated && isServer) then {
[
(_module getVariable "Misery_AI_SpawnCheckDistance"),
(_module getVariable "Misery_AI_DeleteCheckDistance"),
(_module getVariable "Misery_AI_SpawnTimer"),
(_module getVariable "Misery_AI_DeleteTimer"),
(_module getVariable "Misery_AI_SpawnLimit")
] execVM "Misery\Scripts\Modules\Ambient_AI_Zone\Settings.sqf";
};
TRUE