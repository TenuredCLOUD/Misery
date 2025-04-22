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

call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "_bankedFunds"];

private _amount = parseNumber (ctrlText ((findDisplay 483729) displayCtrl 1400));

if (_amount > _bankedFunds) exitWith {};

[_amount] call FUNC(modifyMoney);
[-_amount, true] call FUNC(modifyMoney);
