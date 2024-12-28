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

[{(([[QCLASS(rfHighRange_On)]] call EFUNC(common,hasItem)) && !(player getVariable [QCLASS(rfdetectorStatus), false])) && (alive player)},
{
    [{
        params ["_args", "_handle"];

        if (((player getVariable [QCLASS(rfdetectorStatus), false])) || !([[QCLASS(rfHighRange_On)]] call EFUNC(common,hasItem)) || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if(EGVAR(common,debug))then{systemChat "Misery RFdetec resync cycle terminated..."};
            [] call FUNC(syncLoop);
            if(EGVAR(common,debug))then{systemChat "Misery RFdetec resync cycle checks reinitiated..."};
        };

    if (([[QCLASS(rfHighRange_On)]] call EFUNC(common,hasItem)) && !(player getVariable [QCLASS(rfdetectorStatus), false])) then {
        player setVariable [QCLASS(rfdetectorStatus), true,true]; //reactivate detector audio samples
        [] call FUNC(loop);
        [] call FUNC(detection);
        if(EGVAR(common,debug))then{systemChat "RF detector resynced properly..."};
        };
    }, 5, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
