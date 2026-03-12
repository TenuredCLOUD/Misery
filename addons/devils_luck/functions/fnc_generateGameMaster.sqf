#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Generates a devils luck mini-game action on an object
 *
 * Arguments:
 * 0: Game Master Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_devils_luck_fnc_generateGameMaster;
 *
*/

params ["_object"];

[
    _object,
    "Play Devil's Luck",
    QPATHTOEF(icons,data\dices_ca.paa),
    QPATHTOEF(icons,data\dices_ca.paa),
    QUOTE(_this distance _target < 3),
    QUOTE(_caller distance _target < 3),
    {},
    {},
    {
        createDialog QCLASS(devils_luck_ui);
    },
    {},
    [],
    1,
    nil,
    false,
    false
] call BIS_fnc_holdActionAdd;

