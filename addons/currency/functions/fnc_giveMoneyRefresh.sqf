#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Give money menu UI
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_currency_fnc_giveMoneyRefresh;
 *
*/

[{
    params ["_args", "_handle"];

    if (isNull findDisplay 358493) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
    };

    call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "_funds"];

    [player, 2] call EFUNC(common,nearPlayer) params ["_isNear", "_targetPlayer"];
    private _targetPlayerFunds = _targetPlayer getVariable [QGVAR(funds), MACRO_PLAYER_DEFAULTS_LOW];

    private _playerFundsParsed = _funds call BIS_fnc_parseNumber;
    private _playerFundsFormatted = [_playerFundsParsed, 1, 2, true] call CBA_fnc_formatNumber;
    private _playerFundsText = format ["%3: %1 %2", GVAR(symbol), _playerFundsFormatted, profileName];

    private _targetPlayerFundsParsed = _targetPlayerFunds call BIS_fnc_parseNumber;
    private _targetPlayerFundsFormatted = [_targetPlayerFundsParsed, 1, 2, true] call CBA_fnc_formatNumber;
    private _targetPlayerFundsText = format ["%3: %1 %2", GVAR(symbol), _targetPlayerFundsFormatted, name _targetPlayer];

    ctrlSetText [1001, _targetPlayerFundsText];
    ctrlSetText [1002, _playerFundsText];
}, 0.1] call CBA_fnc_addPerFrameHandler;
