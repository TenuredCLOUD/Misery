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

_object getVariable [QGVAR(dealerFunds), 50000];
_object setVariable [QGVAR(isActive), false, true];

[
    _object,
    localize ECSTRING(common,PlayDevilsLuck),
    QPATHTOEF(icons,data\dices_ca.paa),
    QPATHTOEF(icons,data\dices_ca.paa),
    QUOTE(_this distance _target < 3 && !(_target getVariable [ARR_2(QUOTE(QGVAR(isActive)),false)])),
    QUOTE(_caller distance _target < 3 && !(_target getVariable [ARR_2(QUOTE(QGVAR(isActive)),false)])),
    {},
    {},
    {
        params ["_target", "_caller", "_actionId", "_arguments"];
        _caller setVariable [QGVAR(currentDealer), _target];
        createDialog QCLASS(devils_luck_ui);
    },
    {},
    [],
    1,
    nil,
    false,
    false
] call BIS_fnc_holdActionAdd;

GVAR(activeDealers) pushBackUnique _object;
publicVariable QGVAR(activeDealers);

