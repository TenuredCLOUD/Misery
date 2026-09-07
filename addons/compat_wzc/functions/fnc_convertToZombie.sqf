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

if (!(ACE_player getVariable ["WBK_AI_ISZombie", false]) && _infection >= 1) then {
    [QGVAR(convertToZed), [ACE_player, ["WBK_Runner_Angry_Idle", 0, 0.2, false]]] call CBA_fnc_globalEvent;
    ACE_player setVariable ["WBK_SynthHP", WBK_Zombies_CorruptedHP, true];
    ACE_player setVariable ["WBK_AI_ISZombie", true, true];
    ACE_player setVariable ["WBK_AI_ZombieMoveSet", "WBK_Runner_Angry_Idle", true];
};

if (ACE_player getVariable ["WBK_AI_ISZombie", false]) then {
    QGVAR(display) cutRsc [QCLASS(bloodshot_ui), "PLAIN", 1, false];
    [ACE_player, "head", ["Contusion", 5, 2, 1]] call ACEFUNC(medical,addWound);
    [ACE_player] call EFUNC(medical,handleHeadTrauma);
    // Make player friendly to other zombies but also an enemy
    [ACE_player] joinSilent createGroup [independent, true];
    // Push player back to zombie animations if somehow left animation state
    if !(animationState ACE_player in ["wbk_runner_angry_idle", "wbk_runner_angry_run", "wbk_runner_angry_sprint"]) then {
        [QGVAR(convertToZed), [ACE_player, ["WBK_Runner_Angry_Idle", 0, 0.2, false]]] call CBA_fnc_globalEvent;
    };
};

// Force close inventory when opened if zombie
ACE_player addEventHandler ["InventoryOpened", {
    if (ACE_player getVariable ["WBK_AI_ISZombie", false]) then {
        [{!isNull findDisplay 602}, {
            (findDisplay 602) closeDisplay 2;
        }, []] call CBA_fnc_waitUntilAndExecute;
    };
}];
