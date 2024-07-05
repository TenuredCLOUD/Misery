/* -----------------------------------
Misery Debug actions
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

nul = player addAction ["-> Kill me","Debug\KillMe.sqf"];

nul = player addAction ["-> Refuel target","Debug\refuel.sqf"];

nul = player addAction ["-> Repair target","Debug\repair.sqf"];

if (isNil "HALs_store_sellFactor") then { HALs_store_sellFactor = 0;};
if (HALs_store_sellFactor != 0) then {
nul = player addAction ["-> +5k to wallet","Debug\money.sqf"];
}; // If HALs store is loaded up, add money action 

nul = player addAction ["-> Godmode Enable","Debug\godmodeT.sqf"];

nul = player addAction ["-> Godmode Disable","Debug\godmodeF.sqf"];
