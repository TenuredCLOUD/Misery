#include "..\script_component.hpp"
/*
    Radio resync
    Runs checks to resync radio if player
    picks up / starts with an Radio that's on
    Designed specifically for Misery mod
    by TenuredCLOUD
*/

/*
[{((!isNil "MiseryRadioBroadcastsystem") && (QCLASS(PortableradioON" in items player) && (!player getVariable [QCLASS(HHRadio", false])) && (alive player)},
{
    [{
        params ["_args", "_handle"];

        if (((player getVariable [QCLASS(HHRadio", false])) || !(QCLASS(PortableradioON" in items player) || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if(EGVAR(common,debug))then{systemChat "Misery Radio resync cycle terminated..."};
            [] call Radio\RadiosyncLoop);
            if(EGVAR(common,debug))then{systemChat "Misery Radio resync cycle checks reinitiated..."};
        };

    if ((QCLASS(PortableradioON" in items player) && !(player getVariable [QCLASS(HHRadio", false])) then {
        player setVariable [QCLASS(HHRadio", true,true]; //reactivate detector audio samples
        [] call Radio\RadioLoop);
        [] call Radio\RadioStatic);
        if(EGVAR(common,debug))then{systemChat "Radio resynced properly..."};
        };
    }, 5, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
*/
