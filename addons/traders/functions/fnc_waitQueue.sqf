#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Trader Shop Wait Queue UI
 * Updates player on their position in the trader queue
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_traders_fnc_waitQueue;
 *
 * Public: No
*/

[{!isNull findDisplay 270586}, {
    [{
        params ["_args", "_handle"];
        if (isNull findDisplay 270586 || !alive player) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            private _trader = player getVariable [QGVAR(currentTrader), objNull];
            if (!isNull _trader) then {
                private _queue = _trader getVariable [QGVAR(tradingQue), []];
                private _index = _queue find (getPlayerUID player);
                if (_index isNotEqualTo -1) then {
                    _queue deleteAt _index;
                    _trader setVariable [QGVAR(tradingQue), _queue, true];
                };
            };
        };

        private _trader = player getVariable [QGVAR(currentTrader), objNull];
        if (isNull _trader) exitWith {
            (findDisplay 270586) closeDisplay 1;
        };

        private _shop = _trader getVariable [QGVAR(shop), []];
        if (_shop isEqualTo []) exitWith {
            (findDisplay 270586) closeDisplay 1;
        };

        private _shopName = _shop select 1;
        private _queue = _trader getVariable [QGVAR(tradingQue), []];
        private _index = _queue find (getPlayerUID player);

        if (_index isNotEqualTo -1) then {
            ctrlSetText [1000, format ["%1 is busy trading with %2, your spot in queue: %3", _shopName, _trader getVariable [QGVAR(tradingWith), "someone"], _index + 1]];
        };

        if (_index isEqualTo 0) then {
            (findDisplay 270586) closeDisplay 1;
            createDialog QCLASS(traderShop_ui);
        };
    }, 0.01, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;


