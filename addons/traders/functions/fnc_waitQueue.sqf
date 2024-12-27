#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Trader Shop Wait Que UI
 * Watches Trader player is in a Que to transaction with and keeps player updated of current waiting parameters...
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_traders_fnc_waitQueue;
 *
 * Public: No
*/

[{!isNull findDisplay 270586},
{
    [{
        params ["_args", "_handle"];

        if (isNull findDisplay 270586 || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;

            _trader = player getVariable "currentTrader";
            _queue = _trader getVariable "Misery_TradingQue";

            _index = _queue find (getPlayerUID player);
            if (_index != -1) then {
                _queue deleteAt _index;
                _trader setVariable ["Misery_TradingQue", _queue, true];
            };
        };

        _trader = player getVariable "currentTrader";

        _shop = _trader getVariable "shop";

        _shopName = _shop select (_shop findIf {_x select 0 == "ShopName"}) select 1;

        _queue = _trader getVariable "Misery_TradingQue";
        _index = _queue find (getPlayerUID player);
        if (_index != -1) then {
            _position = _index;
            ctrlSetText [1000, format ["%1 is currently busy trading with %2, your spot in the wait queue is: %3. Please wait...", _shopName, _trader getVariable "Misery_TradingWith",_position]];
        };

        if (_index == 0) then {
            (findDisplay 46 createDisplay QCLASS(tradingQue_ui))closeDisplay 1;
            createDialog QCLASS(traderShop_ui);
        };

    }, 0.01, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;


