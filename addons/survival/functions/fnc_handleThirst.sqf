#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Handles thirst related things for survival loop.
 *
 * Arguments:
 * 0: Decrement Value <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_survival_fnc_handleThirst;
 *
 * Public: No
*/

params ["_decrementValue"];

if (acex_field_rations_enabled) exitWith {};

call EFUNC(common,getPlayerVariables) params ["", "_thirst", "", "", "", "", "", "", "_parasites"];

// If player is bleeding, add slight fluid loss from wounds
private _fluidLoss = (ACE_player call ACEFUNC(medical,getBloodLoss)) / 20;

if (_fluidLoss > 0) then {
    [-_fluidLoss, "thirst"] call EFUNC(common,addStatusModifier);
};

if (_parasites > 0) then {
    [-_decrementValue, "thirst"] call EFUNC(common,addStatusModifier);
};

private _finalThirst = ((_thirst + GVAR(thirstModifiers)) min 1) max 0;
GVAR(thirstModifiers) = 0;
ACE_player setVariable [QGVAR(thirst), _finalThirst];

