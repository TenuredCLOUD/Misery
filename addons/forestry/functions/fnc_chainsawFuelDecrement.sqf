#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Chainsaw fuel decrement
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_forestry_fnc_chainsawFuelDecrement;
 *
*/

[{
    params ["_args", "_handle"];

    if (isNil {player getVariable QGVAR(cuttingWood)}) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
    };

    [QCLASS(chainsaw), QCLASS(chainsaw_Empty)] call EFUNC(common,itemDecrement);

}, 15] call CBA_fnc_addPerFrameHandler;
