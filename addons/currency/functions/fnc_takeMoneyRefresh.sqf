#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Take money menu UI
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_currency_fnc_takeMoneyRefresh;
 *
*/

params ["_target"];

[{!isNull findDisplay 358492}, {
    params ["_target"];
    [{
        params ["_args", "_handle"];
        _args params ["_target"];

        if (isNull findDisplay 358492) exitWith {
            _handle call CBA_fnc_removePerFrameHandler;
        };

        private _targetFunds = _target getVariable [QGVAR(funds), MACRO_PLAYER_DEFAULTS_LOW];

        private _targetFundsText = format [localize LSTRING(Funds), [_targetFunds, 1, 2, true] call CBA_fnc_formatNumber, GVAR(symbol)];

        ctrlSetText [1001, _targetFundsText];
    }, 0.1, [_target]] call CBA_fnc_addPerFrameHandler;
}, [_target]] call CBA_fnc_waitUntilAndExecute;
