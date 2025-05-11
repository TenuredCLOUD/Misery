#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Forces player to walking state if encumbered by too many furniture objects
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_furniture_fnc_encumbered
 *
*/

[{
    params ["_args", "_handle"];

    private _currentMass = player getVariable [QGVAR(furnitureLoad), MACRO_PLAYER_DEFAULTS_LOW];

    if ((_currentMass / GVAR(maxCarryMass)) < 0.75) exitWith {
        if (isForcedWalk player) then {
            player forceWalk false;
        };
    };
    // If player is overloaded from furniture objects enforce walking
    if ((_currentMass / GVAR(maxCarryMass)) >= 0.75) then {
        if !(isForcedWalk player) then {
            player forceWalk true;
        };
    };
}, 1, []] call CBA_fnc_addPerFrameHandler;
