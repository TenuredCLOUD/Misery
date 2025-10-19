#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Take money menu UI
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_currency_fnc_takeMoneyRefresh;
 *
*/

[{
    params ["_args", "_handle"];

    if (isNull findDisplay 358492) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
    };

    call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "_funds"];

    [player, ["CAManBase"], 2] call EFUNC(common,nearCorpse) params ["_isNear", "_corpse"];
    private _corpseFunds = _corpse getVariable [QGVAR(funds), MACRO_PLAYER_DEFAULTS_LOW];

    private _playerFundsParsed = _funds call BIS_fnc_parseNumber;
    private _playerFundsFormatted = [_playerFundsParsed, 1, 2, true] call CBA_fnc_formatNumber;
    private _playerFundsText = format ["%3: %1 %2", GVAR(symbol), _playerFundsFormatted, profileName];

    private _corpseFundsParsed = _corpseFunds call BIS_fnc_parseNumber;
    private _corpseFundsFormatted = [_corpseFundsParsed, 1, 2, true] call CBA_fnc_formatNumber;
    private _corpseFundsText = format ["%3: %1 %2", GVAR(symbol), _corpseFundsFormatted, "Corpse"];

    ctrlSetText [1001, _corpseFundsText];
    ctrlSetText [1002, _playerFundsText];
}, 0.1] call CBA_fnc_addPerFrameHandler;
