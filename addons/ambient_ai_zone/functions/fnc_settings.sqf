#include "..\script_component.hpp"
/*
Misery Ambient AI Master settings module data parser
Defines performance properties for each Ambient AI module
Designed specifically for Misery mod
by TenuredCLOUD
*/

Misery_AmbAI_SpawnCheckDistance = _this select 0;
Misery_AmbAI_DeleteCheckDistance = _this select 1;
Misery_AmbAI_SpawnTimer = _this select 2;
Misery_AmbAI_DeleteTimer = _this select 3;
Misery_AmbAI_MAXAllowed = _this select 4;

Misery_active_AmbAI_Groups = 0;

Misery_AmbAI_GenerationReady = true;

if (isServer) exitWith {
[] execVM "\z\misery\addons\Ambient_AI_Zone\functions\fnc_ModuleCheck.sqf";
};
