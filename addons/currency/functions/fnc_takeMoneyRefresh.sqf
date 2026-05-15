#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Take money menu UI
 *
 * Arguments:
 * 0: Corpse <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_currency_fnc_takeMoneyRefresh;
 *
*/

params ["_corpse"];

[{!isNull findDisplay 358492}, {
    params ["_corpse"];
    [{
        params ["_args", "_handle"];
        _args params ["_corpse"];

        if (isNull findDisplay 358492) exitWith {
            _handle call CBA_fnc_removePerFrameHandler;
        };

        call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "_funds"];

        private _corpseFunds = _corpse getVariable [QGVAR(funds), MACRO_PLAYER_DEFAULTS_LOW];

        private _corpseFundsParsed = _corpseFunds call BIS_fnc_parseNumber;
        private _corpseFundsFormatted = [_corpseFundsParsed, 1, 2, true] call CBA_fnc_formatNumber;
        private _corpseFundsText = format ["%3: %1 %2", GVAR(symbol), _corpseFundsFormatted, "Corpse"];

        ctrlSetText [1001, _corpseFundsText];
    }, 0.1, [_corpse]] call CBA_fnc_addPerFrameHandler;
}, [_corpse]] call CBA_fnc_waitUntilAndExecute;
