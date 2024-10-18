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

[{!(isNil {player getVariable "MiseryExposure"}) && ((player getVariable ["MiseryExposure", MACRO_PLAYER_EXPOSURE]) > 10)},
{

    [{
        params ["_args", "_handle"];

        if ((player getVariable ["MiseryExposure", MACRO_PLAYER_EXPOSURE]) < 10 || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if(MiseryDebug)then{systemChat "Misery Fever immersion cycle terminated..."};
            [] call EFUNC(Immersion,feverimmersion);
            if(MiseryDebug)then{systemChat "Misery Fever immersion cycle checks re-initiated..."};
        };

    private ["_MDebuffs"];

    _MDebuffs = player getVariable "MiseryDebuffs";

    if (((player getVariable ["MiseryExposure", MACRO_PLAYER_EXPOSURE]) > 10) || (_MDebuffs find "PARASITES" != -1 || _MDebuffs find "INFECTION" != -1) && !(goggles player in antirad_goggles || vest player in antirad_vests)) then {
         player say3D ["Coughing",10,1,2,0];


    }else{

    _MDebuffs = player getVariable "MiseryDebuffs";

        if (((player getVariable ["MiseryExposure", MACRO_PLAYER_EXPOSURE]) > 10) || (_MDebuffs find "PARASITES" != -1 || _MDebuffs find "INFECTION" != -1) && (goggles player in antirad_goggles || vest player in antirad_vests)) then {
            player say3D ["MaskCough01",10,1,2,0];

    };
    };

    if(MiseryDebug)then{systemChat "Misery Fever immersion cycle..."};

}, 300, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
