#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * RF resync
 * Runs checks to resync detector if player
 * picks up / starts with an RF detector that's on
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_rfdetector_fnc_syncLoop;
 *
*/

[{(("Misery_RFHighrangeON" in items player) && !(player getVariable ["Misery_RFEMFDet", false])) && (alive player)},
{
    [{
        params ["_args", "_handle"];

        if (((player getVariable ["Misery_RFEMFDet", false])) || !("Misery_RFHighrangeON" in items player) || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if(MiseryDebug)then{systemChat "Misery RFdetec resync cycle terminated..."};
            [] execVM "\z\misery\addons\rfdetector\functions\fnc_RFsyncLoop.sqf";
            if(MiseryDebug)then{systemChat "Misery RFdetec resync cycle checks reinitiated..."};
        };

    if (("Misery_RFHighrangeON" in items player) && !(player getVariable ["Misery_RFEMFDet", false])) then {
        player setVariable ["Misery_RFEMFDet", true,true]; //reactivate detector audio samples
        [] execVM "\z\misery\addons\rfdetector\functions\fnc_loop.sqf";
        [] execVM "\z\misery\addons\rfdetector\functions\fnc_detection.sqf";
        if(MiseryDebug)then{systemChat "RF detector resynced properly..."};
        };
    }, 5, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
