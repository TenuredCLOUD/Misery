#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Traders Tracking
 * Simulates AI trading by adjusting trader stock
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_traders_fnc_trackTraders;
 *
*/

if (!isServer) exitWith {};

[{count GVAR(activeTraders) > 0}, {
    [{
        params ["_args", "_handle"];
        private _players = call EFUNC(common,listPlayers);
        _players = _players - (entities "HeadlessClient_F");

        {
            private _player = _x;
            {
                private _trader = _x;
                if (isNull _trader) then {
                    [QUOTE(COMPONENT_BEAUTIFIED), "Null trader found in activeTraders"] call EFUNC(common,debugMessage);
                    continue;
                };
                private _distance = _player distance _trader;
                if (_distance > GVAR(marketshiftDistance)) then {
                    private _shop = _trader getVariable QGVAR(shop);
                    if (isNil "_shop") then {
                        [QUOTE(COMPONENT_BEAUTIFIED), format ["Shop data missing for trader %1", _trader]] call EFUNC(common,debugMessage);
                        continue;
                    };
                    private _items = _shop select 2;

                    {
                        private _itemData = _x;
                        private _itemName = _itemData select 0;
                        private _basePrice = _itemData select 1;
                        private _stock = _itemData select 2;
                        private _minCostFactor = _itemData select 3;
                        private _maxCostFactor = _itemData select 4;

                        private _price = [_basePrice, _stock, _stock, _minCostFactor, _maxCostFactor, true] call FUNC(calculatePrice);

                        if ([50] call EFUNC(common,rollChance)) then {
                            if (_stock > 0) then {
                                _itemData set [2, _stock - 1];
                            };
                        } else {
                            _itemData set [2, _stock + 1];
                        };
                    } forEach _items;

                    _trader setVariable [QGVAR(shop), _shop, true];
                };
            } forEach GVAR(activeTraders);
        } forEach _players;
    }, GVAR(marketshiftCycle), []] call CBA_fnc_addPerFrameHandler;

    [QUOTE(COMPONENT_BEAUTIFIED), format ["Started trackTraders PFH with %1 traders, cycle: %2s", count GVAR(activeTraders), GVAR(marketshiftCycle)]] call EFUNC(common,debugMessage);
}, []] call CBA_fnc_waitUntilAndExecute;
