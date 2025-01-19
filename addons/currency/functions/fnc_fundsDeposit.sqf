#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Bank UI Deposit Processor
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_currency_fnc_fundsDeposit;
 *
*/

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "_funds"];

private _amount = parseNumber (ctrlText ((findDisplay 483729) displayCtrl 1400));

if (_amount > _funds) exitWith {};

[-_amount] call FUNC(modifyMoney);
[_amount, true] call FUNC(modifyMoney);
