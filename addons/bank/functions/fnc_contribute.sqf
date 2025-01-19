#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Bank UI Contribute (Phoenix fund) Processor
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_bank_fnc_contribute;
 *
*/

// ToDo

private _amount = parseNumber (ctrlText ((findDisplay 483729) displayCtrl 1400));
private _playerFunds = player getVariable [QGVAR(currency), MACRO_PLAYER_DEFAULTS_LOW];

if (_amount > _playerFunds) exitWith {};

player setVariable [QGVAR(currency), _playerFunds - _amount];
MiseryCurrency_PhoenixAccount = MiseryCurrency_PhoenixAccount + _amount;
publicVariable "MiseryCurrency_PhoenixAccount";
