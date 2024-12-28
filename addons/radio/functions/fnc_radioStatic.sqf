#include "..\script_component.hpp"
/*
Radio Static
Runs static loop while waiting on Global sound timer
Designed specifically for Misery mod
by TenuredCLOUD
*/

/*
[{(player getVariable [QCLASS(HHRadio", false])},
    {
        [{
            params ["_args", "_handle"];

            if ((!(player getVariable [QCLASS(HHRadio", false])) || (!alive player)) exitWith {
                [_handle] call CBA_fnc_removePerFrameHandler;
            };

        if ((player getVariable [QCLASS(HHRadio", false])) then {
        MiseryRadioStaticDummy = "Land_HelipadEmpty_F" createVehicle (position player);
        MiseryRadioStaticDummy attachTo [player, [0, 0, 0], "Pelvis"];
        [MiseryRadioStaticDummy, ["StaticRADIO", 50]] remoteExec ["say3D", 0, MiseryRadioStaticDummy];

        [{
        !(player getVariable [QCLASS(HHRadio", false])
        },{deleteVehicle _this;
        }, MiseryRadioStaticDummy] call CBA_fnc_waitUntilAndExecute;
        };

    }, 59, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
*/
