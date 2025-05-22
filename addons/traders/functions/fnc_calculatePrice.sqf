#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Price calculator
 * Calculates buy / sell prices for items in trader shops
 *
 * Arguments:
 * 0: Base Price <NUMBER>
 * 1: Current Stock <NUMBER>
 * 2: Min Cost Factor <NUMBER>
 * 3: Max Cost Factor <NUMBER>
 * 4: Is Buying <BOOL>
 *
 * Return Value:
 * Calculated price <NUMBER>
 *
 * Example:
 * [] call misery_traders_fnc_calculatePrice;
 *
*/

params [
    ["_basePrice", 0, [0]],
    ["_currentStock", 0, [0]],
    ["_minCostFactor", 0, [0]],
    ["_maxCostFactor", 0, [0]],
    ["_isBuying", true, [true]]
];

// Soft cap stock at 100 to limit price drop, but allow higher stocks
private _effectiveStock = _currentStock min 100;

// Stock ratio centered at 25 (equilibrium)
private _stockRatio = if (_effectiveStock > 0) then { _effectiveStock / 25 } else { 0.04 }; // Minimum ratio to avoid zero price

// Price factor: high at low stock, low at high stock
private _priceFactor = if (_stockRatio <= 1) then {
    // Low stock: increase price toward maxCostFactor
    _minCostFactor + (_maxCostFactor - _minCostFactor) * (1 - (_stockRatio ^ 2))
} else {
    // High stock: decrease price toward minCostFactor
    _minCostFactor / _stockRatio
};
private _price = _basePrice * _priceFactor;

if (_isBuying) then {
    _price = _price * GVAR(markup);
} else {
    _price = _price * GVAR(markdown);
};

_price = round _price;

[QUOTE(COMPONENT_BEAUTIFIED), format ["Calculated price: %1, basePrice: %2, currentStock: %3, effectiveStock: %4, stockRatio: %5, priceFactor: %6, isBuying: %7", _price, _basePrice, _currentStock, _effectiveStock, _stockRatio, _priceFactor, _isBuying]] call EFUNC(common,debugMessage);

_price
