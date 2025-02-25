#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Handles hunger related things for survival loop.
 *
 * Arguments:
 * 0: Decrement Value <NUMBER>
 * 1: Parasites <NUMBER>
 * 2: Hunger <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_survival_fnc_handleHunger;
 *
 * Public: No
*/

params ["_decrementValue", "_parasites", "_hunger"];

if (_parasites > 0) then {
    [-_decrementValue, "hunger"] call EFUNC(common,addStatusModifier);
};

private _finalHunger = ((_hunger + GVAR(hungerModifiers)) min 1) max 0;
GVAR(hungerModifiers) = 0;
player setVariable [QGVAR(hunger), _finalHunger];

if (_finalHunger == 0) then {
    [player, 100] call EFUNC(common,specialDamage);
};

if (_finalHunger < 0.75) then {
    player say3D [QEGVAR(audio,sound_stomachGrowl), 10, 1, 2, 0];
};
