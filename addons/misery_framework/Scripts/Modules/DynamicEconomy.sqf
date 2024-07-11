/* -----------------------------------
Misery Dynamic economy for HALs store
Designed specifically for Misery mod 
by TenuredCLOUD 

OBSOLETE
*/

// private _module=(entities"Misery_HALs_EconomyFramework")select 0;
// Misery_dyneconomy_1 =_module getvariable "MiseryDynEconomy1";
// Misery_dyneconomy_2 =_module getvariable "MiseryDynEconomy2";
// Misery_dyneconomy_3 =_module getvariable "MiseryDynEconomy3";
// Misery_dyneconomy_4 =_module getvariable "MiseryDynEconomy4";
// Misery_dyneconomy_5 =_module getvariable "MiseryDynEconomy5";
// Misery_dyneconomy_6 =_module getvariable "MiseryDynEconomy6";
// Misery_dyneconomy_cycle =_module getvariable "MiseryDynEconomychange";
// Misery_dyneconomy_symbol =_module getvariable "MiseryCurrencySymbol";


// [{!isNil "HALs_store_sellFactor"},
// {
// 	[{

// //Enforce Server ONLY execution
// if (isServer) then {

// private _random = [0, 5] call BIS_fnc_randomInt;

// if (_random == 0) then {

// HALs_store_sellFactor = Misery_dyneconomy_1; publicVariable "HALs_store_sellFactor"; 

// };

// if (_random == 1) then {

// HALs_store_sellFactor = Misery_dyneconomy_2; publicVariable "HALs_store_sellFactor";

// };

// if (_random == 2) then {

// HALs_store_sellFactor = Misery_dyneconomy_3; publicVariable "HALs_store_sellFactor";

// };

// if (_random == 3) then {

// HALs_store_sellFactor = Misery_dyneconomy_4; publicVariable "HALs_store_sellFactor";

// };

// if (_random == 4) then {

// HALs_store_sellFactor = Misery_dyneconomy_5; publicVariable "HALs_store_sellFactor";

// };

// if (_random == 5) then {

// HALs_store_sellFactor = Misery_dyneconomy_6; publicVariable "HALs_store_sellFactor"; 

// };

// 	if (isNil "Misery_dyneconomy_symbol") then {Misery_dyneconomy_symbol = HALs_store_currencySymbol}; //If no input default to HALs setting "$"
// 	HALs_store_currencySymbol = Misery_dyneconomy_symbol; 
// 	publicVariable "Misery_dyneconomy_symbol"; //push symbol input to clients
// };

// }, Misery_dyneconomy_cycle, []] call CBA_fnc_addPerFrameHandler;

// }, []] call CBA_fnc_waitUntilAndExecute;