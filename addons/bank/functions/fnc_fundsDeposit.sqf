#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Bank UI Deposit Processor
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_bank_fnc_fundsDeposit;
 *
*/

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "_currency", "_bankedCurrency"];

private _amount = parseNumber (ctrlText ((findDisplay 483729) displayCtrl 1400));

if (_amount > _currency) exitWith {};

player setVariable [QGVAR(currency), _currency - _amount];
player setVariable [QGVAR(bankedCurrency), _bankedCurrency + _amount];
