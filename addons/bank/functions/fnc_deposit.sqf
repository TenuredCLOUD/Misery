#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Bank UI Deposit Processor
 *
 * Arguments:
 * 0: NONE
 *
 * Return Value:
 * 0: NONE
 *
 * Example:
 * [] call misery_bank_fnc_deposit;
 *
*/

private _amount = parseNumber (ctrlText ((findDisplay 483729) displayCtrl 1400));
private _playerFunds = player getVariable "MiseryCurrency";
    if (_amount <= _playerFunds) then {
        player setVariable ["MiseryCurrency", _playerFunds - _amount];
        player setVariable ["MiseryCurrency_Banked", (player getVariable "MiseryCurrency_Banked") + _amount];
    };

