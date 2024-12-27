#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Ambient AI Master settings module initialization
 * Defines performance properties for each Ambient AI module
 *
 * Arguments:
 * 0: Module the spawner is assigned to <OBJECT>
 * 1: Safe spawn distance AI can spawn once a player is this close to module object <NUMBER>
 * 2: Safe Deletion distance the AI group will be removed at once a player gets this far away <NUMBER>
 * 3: Spawn check timedown (how often to check players postions to module object for safe spawn) <NUMBER>
 * 4: Deletion check timedown (how often to check players postions to module object for safe deletion) <NUMBER>
 * 5: Max GLOBAL AI Groups allowed to be spawned at once <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [
 * _module,
 * (_module getVariable QCLASS(AI_SpawnCheckDistance)),
 * (_module getVariable QCLASS(AI_DeleteCheckDistance)),
 * (_module getVariable QCLASS(AI_SpawnTimer)),
 * (_module getVariable QCLASS(AI_DeleteTimer)),
 * (_module getVariable QCLASS(AI_SpawnLimit))
 * ] call misery_ambient_ai_zone_fnc_moduleSettings;
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
(_module getVariable QCLASS(AI_SpawnCheckDistance)),
(_module getVariable QCLASS(AI_DeleteCheckDistance)),
(_module getVariable QCLASS(AI_SpawnTimer)),
(_module getVariable QCLASS(AI_DeleteTimer)),
(_module getVariable QCLASS(AI_SpawnLimit))
] call FUNC(settings);
};
true
