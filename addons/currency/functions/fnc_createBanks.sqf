#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Creates a bank on a list of objects, executed via Global event JIP.
 *
 * Arguments:
 * 0: Bank Objects <ARRAY> (default: [])
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_currency_fnc_createBanks;
 *
*/

params [["_objects", []]];

// Only players require this.
if (!hasInterface) exitWith {};

{
    [
        _object,
        format ["Open %1", GVAR(bankName)],
        "\a3\Ui_F_Oldman\Data\IGUI\Cfg\HoldActions\holdAction_market_ca.paa",
        "\a3\Ui_F_Oldman\Data\IGUI\Cfg\HoldActions\holdAction_market_ca.paa",
        "_this distance _target < 3",
        "_caller distance _target < 3",
        {},
        {},
        {
            createDialog QCLASS(banking_ui);
        },
        {},
        [],
        0.1,
        nil,
        false,
        false
    ] call BIS_fnc_holdActionAdd;
} forEach _objects;
