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

[{!(isNil {player getVariable "MiseryHunger"}) && ((player getVariable ["MiseryHunger", MACRO_PLAYER_HUNGER]) < 75)},
{

    [{
        params ["_args", "_handle"];

        if ((player getVariable ["MiseryHunger", MACRO_PLAYER_HUNGER]) > 75 || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if(EGVAR(common,debug))then{systemChat "Misery hunger immersion cycle terminated..."};
            [] call FUNC(hungry);
            if(EGVAR(common,debug))then{systemChat "Misery hunger immersion cycle checks re-initiated..."};
        };

    if ((player getVariable ["MiseryHunger", MACRO_PLAYER_HUNGER]) < 75) then {
        player say3D ["StomachGrowl",10,1,2,0];
    };

    if(EGVAR(common,debug))then{systemChat "Misery hunger immersion cycle..."};

}, 300, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;

