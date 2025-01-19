#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Bank UI
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

// ToDo

[{!isNull findDisplay 483729}, {
    [{
        params ["_args", "_handle"];
        if (isNull findDisplay 483729 || (!alive player)) exitWith {
            _handle call CBA_fnc_removePerFrameHandler;
        };

        ctrlSetText [1000, format ["%1", Misery_BankName]];

        private _playerFunds = player getVariable [QGVAR(currency), MACRO_PLAYER_DEFAULTS_LOW];
        private _playerFundsText = format ["%3: %1 %2", EGVAR(money,symbol), [_playerFunds, 1, 2, true] call CBA_fnc_formatNumber, profileName];
        ctrlSetText [1001, _playerFundsText];

        private _playerBank = player getVariable [QGVAR(bankedCurrency), MACRO_PLAYER_DEFAULTS_LOW];
        private _playerBankText = format ["%3: %1 %2", EGVAR(money,symbol), [_playerBank, 1, 2, true] call CBA_fnc_formatNumber, "Bank Account"]
        ctrlSetText [1002, _playerBankText];

        ctrlSetText [1004, format ["%1", EGVAR(money,symbol)]];

        /*
        if (!isNil "MiseryCurrency_PhoenixAccount") then {
            ctrlSetText [1003, format ["%3: %1 %2", EGVAR(money,symbol), [MiseryCurrency_PhoenixAccount, 1, 2, true] call CBA_fnc_formatNumber, "Phoenix Account"]];
        };

        private _lastWithdrawalTime = player getVariable [QGVAR(lastBankLoan), MACRO_PLAYER_DEFAULTS_LOW];
        private _claimSupportButton = findDisplay 483729 displayCtrl 1603;

        if (time > _lastWithdrawalTime + 4 * 60 * 60) then {
            _claimSupportButton ctrlEnable true;
        } else {
            _claimSupportButton ctrlEnable false;
        };
        */
    }, 1, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
