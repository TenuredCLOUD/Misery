#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Bank UI
 *
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_bank_fnc_refresh;
 *
*/

[{!isNull findDisplay 483729},
{
    [{
        params ["_args", "_handle"];
        if ( isNull findDisplay 483729 || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
        };

ctrlSetText [1000, format ["%1", Misery_BankName]];

private _playerFunds = player getVariable QCLASS(currency);
ctrlSetText [1001, format ["%3: %1 %2", EGVAR(money,symbol), [_playerFunds, 1, 2, true] call CBA_fnc_formatNumber, profileName]];

private _playerBank = player getVariable QCLASS(bankedCurrency);
ctrlSetText [1002, format ["%3: %1 %2", EGVAR(money,symbol), [_playerBank, 1, 2, true] call CBA_fnc_formatNumber, "Bank Account"]];

if (!isNil "MiseryCurrency_PhoenixAccount") then {
ctrlSetText [1003, format ["%3: %1 %2", EGVAR(money,symbol), [MiseryCurrency_PhoenixAccount, 1, 2, true] call CBA_fnc_formatNumber, "Phoenix Account"]];
};

ctrlSetText [1004, format ["%1", EGVAR(money,symbol)]];

private _lastWithdrawalTime = player getVariable [QCLASS(lastBankLoan), 0];
private _claimSupportButton = findDisplay 483729 displayCtrl 1603;
if (time > _lastWithdrawalTime + 4 * 60 * 60) then {
    _claimSupportButton ctrlEnable true;
} else {
    _claimSupportButton ctrlEnable false;
};

}, 0.01, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
