#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * fever immersion
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_temperature_fnc_feverImmersion;
 *
 * Public: No
*/

[{!(isNil {player getVariable QCLASS(exposure)}) && ((player getVariable [QCLASS(exposure), MACRO_PLAYER_EXPOSURE]) > 10)},
{

    [{
        params ["_args", "_handle"];

        if ((player getVariable [QCLASS(exposure), MACRO_PLAYER_EXPOSURE]) < 10 || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if(EGVAR(common,debug))then{systemChat "Misery Fever immersion cycle terminated..."};
            [] call FUNC(feverimmersion);
            if(EGVAR(common,debug))then{systemChat "Misery Fever immersion cycle checks re-initiated..."};
        };

    private ["_ailments"];

    _ailments = player getVariable QCLASS(ailments);

    if (((player getVariable [QCLASS(exposure), MACRO_PLAYER_EXPOSURE]) > 10) || (_ailments find "PARASITES" != -1 || _ailments find "INFECTION" != -1) && !(goggles player in antirad_goggles || EGVAR(common,protectiveGear) findIf {(_x select 0) isEqualTo vest player} > -1)) then {
         player say3D ["Coughing",10,1,2,0];


    }else{

    _ailments = player getVariable QCLASS(ailments);

        if (((player getVariable [QCLASS(exposure), MACRO_PLAYER_EXPOSURE]) > 10) || (_ailments find "PARASITES" != -1 || _ailments find "INFECTION" != -1) && (goggles player in antirad_goggles || EGVAR(common,protectiveGear) findIf {(_x select 0) isEqualTo vest player} > -1)) then {
            player say3D ["MaskCough01",10,1,2,0];

    };
    };

    if(EGVAR(common,debug))then{systemChat "Misery Fever immersion cycle..."};

}, 300, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
