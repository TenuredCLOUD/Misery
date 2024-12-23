#include "..\script_component.hpp"
/*
    Radio resync
    Runs checks to resync radio if player
    picks up / starts with an Radio that's on
    Designed specifically for Misery mod
    by TenuredCLOUD
*/

/*
[{((!isNil "MiseryRadioBroadcastsystem") && ("Misery_PortableradioON" in items player) && (!player getVariable ["Misery_HHRadio", false])) && (alive player)},
{
    [{
        params ["_args", "_handle"];

        if (((player getVariable ["Misery_HHRadio", false])) || !("Misery_PortableradioON" in items player) || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if(MiseryDebug)then{systemChat "Misery Radio resync cycle terminated..."};
            [] call Radio\RadiosyncLoop);
            if(MiseryDebug)then{systemChat "Misery Radio resync cycle checks reinitiated..."};
        };

    if (("Misery_PortableradioON" in items player) && !(player getVariable ["Misery_HHRadio", false])) then {
        player setVariable ["Misery_HHRadio", true,true]; //reactivate detector audio samples
        [] call Radio\RadioLoop);
        [] call Radio\RadioStatic);
        if(MiseryDebug)then{systemChat "Radio resynced properly..."};
        };
    }, 5, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
*/
