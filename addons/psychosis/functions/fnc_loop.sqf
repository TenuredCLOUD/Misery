#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Psychosis loop
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_psychosis_fnc_loop
 *
*/

private _psychosis = player getVariable [QGVAR(state), MACRO_PLAYER_DEFAULTS_LOW];

// Handle exterior modifiers, resets itself.
if (GVAR(modifiers) isNotEqualTo 0) then {
    _psychosis = _psychosis + GVAR(modifiers);
    GVAR(modifiers) = 0;
};

private _night = call FUNC(night);
private _phantoms = call FUNC(phantoms);
private _spooks = call FUNC(spook);
private _zombies = call FUNC(zombies);
private _webZC = call FUNC(webZC);

// Value cannot be negative.
private _finalPsychosis = ((_psychosis + _night + _phantoms + _spooks + _zombies + _webZC) min 1) max 0;

player setVariable [QGVAR(state), _finalPsychosis];

if (_finalPsychosis > 0) then {
    [QGVAR(update), _finalPsychosis] call CBA_fnc_localEvent;
};

[{
    call FUNC(loop);
}, [], GVAR(cycleTimer)] call CBA_fnc_waitAndExecute;
