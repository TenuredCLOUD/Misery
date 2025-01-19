#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Adds a status modifier to be added in next loop cycle.
 *
 * Arguments:
 * 0: Modifier <NUMBER>
 * 1: Status <STRING> (default: "notFound")
 *
 * Return Value:
 * None
 *
 * Example:
 * [-1, "Psychosis"] call misery_common_fnc_addModifier
 *
*/

params ["_modifier", ["_status", "notFound"]];

// ensure it's a match.
_status = toLower _status;

switch (_status) do {
    case "energy": {
        EGVAR(survival,modifiers) = EGVAR(survival,modifiers) + _modifier;
    };
    case "exposure": {
        EGVAR(temperature,modifiers) = EGVAR(temperature,modifiers) + _modifier;
    };
    case "hunger": {
        EGVAR(survival,modifiers) = EGVAR(survival,modifiers) + _modifier;
    };
    case "infection": {
        EGVAR(survival,modifiers) = EGVAR(survival,modifiers) + _modifier;
    };
    case "psychosis": {
        EGVAR(psychosis,modifiers) = EGVAR(psychosis,modifiers) + _modifier;
    };
    case "radiation": {
        EGVAR(survival,modifiers) = EGVAR(survival,modifiers) + _modifier;
    };
    case "temperature": {
        EGVAR(temperature,modifiers) = EGVAR(temperature,modifiers) + _modifier;
    };
    case "thirst": {
        EGVAR(survival,modifiers) = EGVAR(survival,modifiers) + _modifier;
    };
    case "toxicity": {
        EGVAR(survival,modifiers) = EGVAR(survival,modifiers) + _modifier;
    };
    default {
        [QUOTE(COMPONENT_BEAUTIFIED), format ["Status modifier: %1 did not match any case or was not provided.", _status]] call FUNC(debugMessage);
    };
};
