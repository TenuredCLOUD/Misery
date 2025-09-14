#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Pickaxe degrade simulation
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_mining_fnc_degradePick;
 *
*/

[{
    params ["_args", "_handle"];

    if (isNil {player getVariable QGVAR(miningOre)}) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
    };

    [QCLASS(pickaxe), QCLASS(pickaxe_Broken)] call EFUNC(common,itemDecrement);

}, 5] call CBA_fnc_addPerFrameHandler;
