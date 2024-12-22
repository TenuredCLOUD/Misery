#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * WBKIMS Dash Compat
 * Enforces a stamina / fatigue depletion when player uses IMS sprint movesets
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_ims_fnc_dash
 *
*/

[{(animationState player in [MACRO_ANIMATION_IMS_SPRINT])},
{

    [{
        params ["_args", "_handle"];

        if (!(animationState player in [MACRO_ANIMATION_IMS_SPRINT]) || (!alive player) || (getFatigue player >= 0.99)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if(MiseryDebug)then{systemChat "Misery WBKIMS Dash Compat cycle terminated..."};
            if (animationState player == "am_kulak_sprintf") then {
        //    player switchMove "am_kulak_idle"; // Forcefully stop the animation
            player playMoveNow "am_kulak_idle"; //Force anim delay
            };
            {
            if ((animationState player == _x) && _x != "am_kulak_sprintf") then {
        //    player switchMove "melee_armed_idle"; // Forcefully stop the animation
            player playMoveNow "melee_armed_idle"; //Force anim delay
            };
            } forEach [MACRO_ANIMATION_IMS_SPRINT];
            [] call FUNC(dash);
            if(MiseryDebug)then{systemChat "Misery WBKIMS Dash Compat cycle checks re-initiated..."};
        };

    if (animationState player in [MACRO_ANIMATION_IMS_SPRINT]) then {
        player setFatigue (getFatigue player + 0.01);
    };

    if(MiseryDebug)then{systemChat "Misery WBKIMS Dash Compat cycle..."};

}, 0.1, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;

