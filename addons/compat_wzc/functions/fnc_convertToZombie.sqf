#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Converts player to zombie once infection level is high enough
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_compat_wzc_fnc_convertToZombie;
 *
*/

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "_infection"];

if (!(player getVariable ["WBK_AI_ISZombie", false]) && _infection >= 1) then {
    [player, ["WBK_Runner_Angry_Idle", 0, 0.2, false]] remoteExec ["switchMove", 0];
    player setVariable ["WBK_SynthHP", WBK_Zombies_CorruptedHP, true];
    player setVariable ["WBK_AI_ISZombie", true, true];
    player setVariable ["WBK_AI_ZombieMoveSet", "WBK_Runner_Angry_Idle", true];
};

if (player getVariable ["WBK_AI_ISZombie", false]) then {
    [player, 1 / 8, "head"] call EFUNC(survival,ailmentDamage);
};
