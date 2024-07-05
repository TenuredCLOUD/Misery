 /* -----------------------------------
Corpse searching for money
Simulates the player searching a corpse for money, also opens Money taking UI
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

player playAction "medicstart";

sleep 1;

createDialog "Misery_MoneyTake_UI";

sleep 1;

player playActionNow "medicstop";