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

private _gameMasterAction = [
    QGVAR(playDevilsLuck),
    "Play Devil's Luck",
    QPATHTOEF(icons,data\dices_ca.paa),
    {
        params ["_target", "_player"];

        if (_target getVariable [QGVAR(isActive), false]) exitWith {
            [QEGVAR(common,tileText), "Dealer is busy, try again later..."] call CBA_fnc_localEvent;
        };

        _player setVariable [QGVAR(currentDealer), _target];
        createDialog QCLASS(devils_luck_ui);
    },
    {true},
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ace_interact_menu_fnc_createAction;

[_object, 0, ["ACE_MainActions"], _gameMasterAction] call ace_interact_menu_fnc_addActionToObject;

GVAR(activeDealers) pushBackUnique _object;
publicVariable QGVAR(activeDealers);

