#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * cold immersion
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_temperature_fnc_coldImmersion;
 *
 * Public: No
*/

[{!(isNil {player getVariable QCLASS(exposure)}) && ((player getVariable [QCLASS(exposure), MACRO_PLAYER_EXPOSURE]) < -10)},
{

    [{
        params ["_args", "_handle"];

        if ((player getVariable [QCLASS(exposure), MACRO_PLAYER_EXPOSURE]) > -10 || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if(EGVAR(common,debug))then{systemChat "Misery Cold immersion cycle terminated..."};
            [] call FUNC(coldimmersion);
            if(EGVAR(common,debug))then{systemChat "Misery Cold immersion cycle checks re-initiated..."};
        };

    if (((player getVariable [QCLASS(exposure), MACRO_PLAYER_EXPOSURE]) < -10) && !(goggles player in antirad_goggles || EGVAR(common,protectiveGear) findIf {(_x select 0) isEqualTo vest player} > -1)) then {
            player say3D ["Sneeze",10,1,2,0];

    }else{

        if (((player getVariable [QCLASS(exposure), MACRO_PLAYER_EXPOSURE]) < -10) && (goggles player in antirad_goggles || EGVAR(common,protectiveGear) findIf {(_x select 0) isEqualTo vest player} > -1)) then {
            player say3D ["coughMask1",10,1,2,0];

    };
    };

    if(EGVAR(common,debug))then{systemChat "Misery Cold immersion cycle..."};

}, 300, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;

