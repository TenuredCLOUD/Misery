#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Cache UI
 *
 * Arguments:
 * 0: Cache Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_currency_fnc_cacheRefresh;
 *
*/

params ["_cache"];

[{
    params ["_args", "_handle"];
    _args params ["_cache"];

    if (isNull findDisplay 483730) exitWith {
        _handle call CBA_fnc_removePerFrameHandler;
    };

    call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "_funds"];

    private _playerFundsFormatted = [_funds, 1, 2, true] call CBA_fnc_formatNumber;
    private _playerFundsText = format ["%3: %1 %2", GVAR(symbol), _playerFundsFormatted, profileName];

    private _cacheFunds = _cache getVariable [QGVAR(cacheFunds), 0];

    private _cacheFormatted = [_cacheFunds, 1, 2, true] call CBA_fnc_formatNumber;
    private _cacheText = format ["%3: %1 %2", GVAR(symbol), _cacheFormatted, localize LSTRING(Cache)];

    ctrlSetText [1001, _playerFundsText];
    ctrlSetText [1002, _cacheText];
    ctrlSetText [1004, format ["%1", GVAR(symbol)]];
}, 1, [_cache]] call CBA_fnc_addPerFrameHandler;
