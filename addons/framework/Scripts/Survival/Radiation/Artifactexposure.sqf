#include "\z\misery\addons\framework\scripts\Misery_PreParser.hpp"

/*
Misery artifact radiation exposure
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

[{[MIS_Artifact,(items player)] call Misery_fnc_Inarray}, 
{

[{
        params ["_args","_handle"];

        if (!([MIS_Artifact,(items player)] call Misery_fnc_Inarray) || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler; 
            if(MiseryDebug)then{systemChat "Misery Artifact exposure cycle terminated..."};
            [] execVM MIS_FILESYS(survival\Radiation\Artifactexposure); 
            if(MiseryDebug)then{systemChat "Misery Artifact exposure cycle checks re-initiated..."};
        };

If ([MIS_Artifact,(items player)] call Misery_fnc_Inarray) then {
  player setVariable ["MiseryRadiation", (player getvariable ["MiseryRadiation",0]) + 50, true];
};

if(MiseryDebug)then{systemChat "Misery Artifact exposure cycle..."};

}, 10, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;


