#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * cold immersion
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_temperature_fnc_coldImmersion;
 *
 * Public: No
*/

[{!(isNil {player getVariable QCLASS(exposure)}) && ((player getVariable [QCLASS(exposure), MACRO_PLAYER_DEFAULTS_LOW]) < -10)},
{

    [{
        params ["_args", "_handle"];

        if ((player getVariable [QCLASS(exposure), MACRO_PLAYER_DEFAULTS_LOW]) > -10 || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if(EGVAR(common,debug))then{systemChat "Misery Cold immersion cycle terminated..."};
            [] call FUNC(coldimmersion);
            if(EGVAR(common,debug))then{systemChat "Misery Cold immersion cycle checks re-initiated..."};
        };

    if (((player getVariable [QCLASS(exposure), MACRO_PLAYER_DEFAULTS_LOW]) < -10) && (call EFUNC(protection,totalProtection) select 0) < 1 && (call EFUNC(protection,totalProtection) select 1) < 1) then {
            player say3D [QEGVAR(audio,sound_sneeze),10,1,2,0];

    }else{

        if (((player getVariable [QCLASS(exposure), MACRO_PLAYER_DEFAULTS_LOW]) < -10) && (call EFUNC(protection,totalProtection) select 0) > 0 || (call EFUNC(protection,totalProtection) select 1) > 0) then {
            player say3D [QEGVAR(audio,sound_coughMask1),10,1,2,0];

    };
    };

    if(EGVAR(common,debug))then{systemChat "Misery Cold immersion cycle..."};

}, 300, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;

