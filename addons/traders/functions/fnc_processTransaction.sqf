/*
Misery Trader Shop Sell / Buy Processor
Processes Buying or Selling 
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private _dialog = findDisplay 982390;

if (currentAction == "buy") then {
[] execVM "\z\misery\addons\traders\functions\fnc_ProcessPurchase.sqf";
} else {
[] execVM "\z\misery\addons\traders\functions\fnc_ProcessSell.sqf";    
};