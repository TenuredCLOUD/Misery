#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Handles hunger related things for survival loop.
 *
 * Arguments:
 * 0: Decrement Value <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_survival_fnc_handleHunger;
 *
 * Public: No
*/

params ["_decrementValue"];

call EFUNC(common,getPlayerVariables) params ["_hunger", "", "", "", "", "", "", "", "_parasites"];

if (_parasites > 0) then {
    [-_decrementValue, "hunger"] call EFUNC(common,addStatusModifier);
};

private _finalHunger = ((_hunger + GVAR(hungerModifiers)) min 1) max 0;
GVAR(hungerModifiers) = 0;
player setVariable [QGVAR(hunger), _finalHunger];

