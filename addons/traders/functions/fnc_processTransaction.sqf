#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Trader Shop Sell / Buy Processor
 * Processes Buying or Selling via button STRING value
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_traders_fnc_processTransaction;
 *
 * Public: No
*/

private _dialog = findDisplay 982390;

if (currentAction == "buy") then {
[] call FUNC(processPurchase);
} else {
[] call FUNC(processSell);
};
