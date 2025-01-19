#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Globally executes the list of banks, executed only from the server.
 *
 * Arguments:
 * 0: Bank Objects <ARRAY> (default: [])
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_currency_fnc_registerBanks;
 *
*/

params [["_objects", []]];

if (isMultiplayer && !isServer) exitWith {};

[QGVAR(registerBankGlobal), _objects] call CBA_fnc_globalEventJIP;
