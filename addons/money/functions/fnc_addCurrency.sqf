#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Funds add / remove function
 * Adds or removes funds to a recipient's wallet
 *
 * Arguments:
 * 0: Recipient <OBJECT>
 * 1: Amount <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 1000000] call misery_money_fnc_addCurrency;
 *
*/

    params ["_recipient", "_amount"];

    private _currentFunds = _recipient getVariable ["MiseryCurrency", 0];

    _recipient setVariable ["MiseryCurrency", _currentFunds + _amount];

