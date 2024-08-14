#include "..\script_component.hpp"
/*
Misery Traders Tracking
Processing Algorithm to Track players positioning to Traders and adjusts economic status of traders stock, as well as thier overall funds
Calculations for purchasing prcessing will vary but should not go below or above the maximum and minimum price set points due to the way the calculation processes pricing, this ensures true dynamic markets...
Designed specifically for Misery mod
by TenuredCLOUD
*/

waitUntil {sleep 1; ((count MiseryActiveTraders) > 0)};

while {true} do {
    private _players = call Misery_fnc_ListPlayers;
    _players = _players - (entities "HeadlessClient_F");
    {
        private _player = _x;
        {
            private _trader = _x;

            if (!isNull _trader) then {
                private _pos = getPos _trader;
                private _distance = _player distance _pos;

                if (_distance > Misery_MarketShift_Dist) then {
                    private _shop = _trader getVariable "shop";
                    private _items = _shop select (_shop findIf {_x select 0 == "Items"}) select 1;
                    private _shopFunds = _shop select (_shop findIf {_x select 0 == "ShopFunds"}) select 1;

                    if (MiseryDebug) then {
                        systemChat format ["Processing trader %1, initial funds: %2", _trader, [_shopFunds] call Misery_fnc_formatNumber];
                    };

                    {
                        private _itemData = _x;
                        private _index = _items find _itemData;
                        private _itemName = _itemData select 0;
                        private _stock = _itemData select 2;
                        private _Minprice = _itemData select 3;
                        private _Defaultprice = _itemData select 4;
                        private _Maxprice = _itemData select 5;

                        private _price = _Defaultprice;

                        if (_stock <= 25) then {
                            _markup = 1 + ((25 - _stock) / 100);
                            _price = _Maxprice * _markup;
                        };
                        if (_stock > 25 && _stock <= 50) then {
                            _markup = 1.01;
                            _price = _Defaultprice * _markup;
                        };
                        if (_stock > 50) then {
                            _price = _Minprice;
                        };

                        if (random 1 < 0.5) then {
                            if (_stock > 0) then {
                                _stock = _stock - 1;
                                _shopFunds = _shopFunds + (_price);
                            };
                        } else {
                            _stock = _stock + 1;
                            _shopFunds = _shopFunds - (_price);
                        };

                        _itemData set [2, _stock];
                        _items set [_index, _itemData];
                    } forEach _items;

                    _shop set [(_shop findIf {_x select 0 == "ShopFunds"}), ["ShopFunds", _shopFunds]];
                    _trader setVariable ['shop', _shop, true];

                    if (MiseryDebug) then {
                        systemChat format ["Finished processing trader %1, final funds: %2", _trader, [_shopFunds] call Misery_fnc_formatNumber];
                    };
                };
            };
        } forEach MiseryActiveTraders;
    } forEach _players;
    sleep Misery_MarketShift_Cycle;
};






