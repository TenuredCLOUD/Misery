#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Bank UI Withdraw Processor
 *
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_bank_fnc_withdraw;
 *
*/

private _amount = parseNumber (ctrlText ((findDisplay 483729) displayCtrl 1400));
private _playerBank = player getVariable "MiseryCurrency_Banked";
    if (_amount <= _playerBank) then {
        player setVariable ["MiseryCurrency_Banked", _playerBank - _amount];
        player setVariable ["MiseryCurrency", (player getVariable "MiseryCurrency") + _amount];
    };

