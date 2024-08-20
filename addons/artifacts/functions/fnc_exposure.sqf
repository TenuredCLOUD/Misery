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


[{[[MACRO_ARTIFACTS]] call EFUNC(common,hasItem)},
{

[{
        params ["_args","_handle"];

        if (!([[MACRO_ARTIFACTS]] call EFUNC(common,hasItem)) || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if(MiseryDebug)then{systemChat "Misery Artifact exposure cycle terminated..."};
            [] execVM "\z\misery\addons\artifacts\functions\fnc_exposure.sqf";
            if(MiseryDebug)then{systemChat "Misery Artifact exposure cycle checks re-initiated..."};
        };

If ([[MACRO_ARTIFACTS]] call EFUNC(common,hasItem)) then {
  player setVariable ["MiseryRadiation", (player getvariable ["MiseryRadiation",0]) + 50, true];
};

if(MiseryDebug)then{systemChat "Misery Artifact exposure cycle..."};

}, 10, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
