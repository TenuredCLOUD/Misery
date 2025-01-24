#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Hunger immersion
 * Waits till client gets hungry then will play stomach growls, etc...
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_survival_fnc_hungry;
 *
 * Public: No
*/

call EFUNC(common,getPlayerVariables) params ["_hunger", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""];

if (_hunger < 0.75) then {
    player say3D [QEGVAR(audio,sound_stomachGrowl), 10, 1, 2, 0];
};

[{
    [] call FUNC(hungry);
}, [], 300] call CBA_fnc_waitAndExecute;
