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
 * [] call misery_compat_ims_fnc_dash
 *
*/

[{(animationState player in [MACRO_ANIMATION_IMS_SPRINT])},
{
    [{
        params ["_args", "_handle"];

        private _fatigueValue = [getFatigue player, player getVariable ["ace_advanced_fatigue_aimFatigue", 0]] select (!isNil "ace_advanced_fatigue_enabled" && {ace_advanced_fatigue_enabled});

        if (!(animationState player in [MACRO_ANIMATION_IMS_SPRINT]) || (!alive player) || (_fatigueValue >= 0.9)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            [QUOTE(COMPONENT_BEAUTIFIED), "Dash Compat cycle terminated."] call EFUNC(common,debugMessage);
            if (animationState player isEqualTo "am_kulak_sprintf") then {
                player playMoveNow "am_kulak_idle";
            };
            {
                if ((animationState player isEqualTo _x) && _x isNotEqualTo "am_kulak_sprintf") then {
                    player playMoveNow "melee_armed_idle";
                };
            } forEach [MACRO_ANIMATION_IMS_SPRINT];
            [] call FUNC(dash);
            [QUOTE(COMPONENT_BEAUTIFIED), "Dash compat cycle checks reinitialized."] call EFUNC(common,debugMessage);
        };

        if (!isNil "ace_advanced_fatigue_enabled" && {ace_advanced_fatigue_enabled}) then {
            player setVariable ["ace_advanced_fatigue_aimFatigue", _fatigueValue + 0.01];
        } else {
            player setFatigue (_fatigueValue + 0.01);
        };

        [QUOTE(COMPONENT_BEAUTIFIED), "Dash Compat cycle."] call EFUNC(common,debugMessage);
    }, 0.1, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;

