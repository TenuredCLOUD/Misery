#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Bank UI Withdraw Processor
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_currency_fnc_fundsWithdraw;
 *
*/

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "_currency", "_bankedCurrency"];

private _amount = parseNumber (ctrlText ((findDisplay 483729) displayCtrl 1400));

if (_amount > _bankedCurrency) exitWith {};

player setVariable [QGVAR(currency), _currency + _amount];
player setVariable [QGVAR(bankedCurrency), _bankedCurrency - _amount];
