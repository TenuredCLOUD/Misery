/* -----------------------------------
Misery Trader Shop Sell / Buy Processor
Processes Buying or Selling 
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

private _dialog = findDisplay 982390;

if (currentAction == "buy") then {
[] execVM "Misery\Scripts\Survival\Functions\Menus\Trader\ProcessPurchase.sqf";
} else {
[] execVM "Misery\Scripts\Survival\Functions\Menus\Trader\ProcessSell.sqf";    
};