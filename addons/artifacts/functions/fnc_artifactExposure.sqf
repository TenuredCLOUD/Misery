#include "..\script_component.hpp"
/*
Misery artifact radiation exposure
Designed specifically for Misery mod
by TenuredCLOUD
*/

[{[MIS_Artifact,(items player)] call EFUNC(common,inArray)},
{

[{
        params ["_args","_handle"];

        if (!([MIS_Artifact,(items player)] call EFUNC(common,inArray)) || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if(MiseryDebug)then{systemChat "Misery Artifact exposure cycle terminated..."};
            [] execVM "\z\misery\addons\artifacts\functions\fnc_Artifactexposure.sqf";
            if(MiseryDebug)then{systemChat "Misery Artifact exposure cycle checks re-initiated..."};
        };

If ([MIS_Artifact,(items player)] call EFUNC(common,inArray)) then {
  player setVariable ["MiseryRadiation", (player getvariable ["MiseryRadiation",0]) + 50, true];
};

if(MiseryDebug)then{systemChat "Misery Artifact exposure cycle..."};

}, 10, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;


