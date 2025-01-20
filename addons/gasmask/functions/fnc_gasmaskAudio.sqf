#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Gasmask audio loop
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_gasmask_fnc_gasmaskAudio
 *
*/

[{(call EFUNC(protection,totalProtection) select 1) > 0},
{

    [{
        params ["_args", "_handle"];

        if ((call EFUNC(protection,totalProtection) select 1) < 1 || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if (EGVAR(common,debug)) then {systemChat "Misery Gasmask audio cycle terminated..."};
            [] call FUNC(gasmaskAudio);
            if (EGVAR(common,debug)) then {systemChat "Misery Gasmask audio cycle checks re-initiated..."};
        };

        if (cameraView isNotEqualTo "EXTERNAL") then {

            player say3D [QEGVAR(audio,sound_gasmaskBreathing), 10, 0.8 + random 0.1 + getFatigue player];
        };

        ((getFatigue player)*2);
        player setSpeaker speaker player;

if(EGVAR(common,debug))then{systemChat "Misery Gasmask audio cycle..."};

}, 10, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
