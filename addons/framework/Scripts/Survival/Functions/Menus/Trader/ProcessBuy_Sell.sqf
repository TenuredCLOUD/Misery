/*
Misery Trader Shop Sell / Buy Processor
Processes Buying or Selling 
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private _dialog = findDisplay 982390;

if (currentAction == "buy") then {
[] execVM "\z\misery\addons\framework\scripts\survival\functions\menus\Trader\ProcessPurchase.sqf";
} else {
[] execVM "\z\misery\addons\framework\scripts\survival\functions\menus\Trader\ProcessSell.sqf";    
};