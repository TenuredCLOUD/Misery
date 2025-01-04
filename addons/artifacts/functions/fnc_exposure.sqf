#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * artifact radiation exposure
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_artifacts_fnc_exposure;
 *
*/


[{call EFUNC(radiation,hasArtifact)},
{

[{
        params ["_args","_handle"];

        if (!(call EFUNC(radiation,hasArtifact)) || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if(EGVAR(common,debug))then{systemChat "Misery Artifact exposure cycle terminated..."};
            [] call FUNC(exposure);
            if(EGVAR(common,debug))then{systemChat "Misery Artifact exposure cycle checks re-initiated..."};
        };

player setVariable [QCLASS(radiation), (player getVariable [QCLASS(radiation),0]) + 50, true];

if(EGVAR(common,debug))then{systemChat "Misery Artifact exposure cycle..."};

}, 10, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
