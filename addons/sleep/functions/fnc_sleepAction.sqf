#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * show Sleep interaction (asset model based)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_sleep_fnc_sleepAction;
 *
*/

if (isMultiplayer) exitWith {};

[
    player,
    "Sleep",
    QPATHTOEF(icons,data\sleepy_ca.paa),
    QPATHTOEF(icons,data\sleepy_ca.paa),
    QUOTE(call FUNC(sleepCondition)),
    QUOTE(call FUNC(sleepCondition)),
    {},
    {},
    {
        params ["_target", "_caller", "_actionID", "_args"];
        createDialog QCLASS(sleepMenu_ui);
        [player, _actionID] call BIS_fnc_holdActionRemove;
    },
    {},
    [],
    0,
    nil,
    true,
    false
] call BIS_fnc_holdActionAdd;
