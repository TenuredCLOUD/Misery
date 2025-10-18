#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Handles energy related things for survival loop.
 *
 * Arguments:
 * 0: Decrement Value <NUMBER>
 * 1: Energy Deficit <NUMBER>
 * 2: Is Multiplayer <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_survival_fnc_handleEnergy;
 *
 * Public: No
*/

params ["_decrementValue", "_energyDeficit", "_isMultiplayer"];

if (_isMultiplayer) exitWith {};

[+_decrementValue, "energy"] call EFUNC(common,addStatusModifier);
private _finalEnergy = ((_energyDeficit + GVAR(energyModifiers)) min 1) max 0;
GVAR(energyModifiers) = 0;
player setVariable [QGVAR(energyDeficit), _finalEnergy];

private _isSleeping = player getVariable [QEGVAR(sleep,isSleeping), false];

if (_energyDeficit > 0.9 && !(_isSleeping) && [25] call EFUNC(common,rollChance)) then {
    if ("ace_medical" call EFUNC(common,isModLoaded)) then {
        [player, true, 5, true] call ace_medical_fnc_setUnconscious;
    } else {
        [player, random 5] call FUNC(setUnconscious);
    };
};
