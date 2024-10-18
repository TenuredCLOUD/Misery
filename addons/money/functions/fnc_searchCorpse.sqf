#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Corpse searching for money
 * Simulates the player searching a corpse for money, also opens Money taking UI
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_money_fnc_searchCorpse;
 *
*/

player playAction "medicstart";

sleep 1;

createDialog "Misery_MoneyTake_UI";

sleep 1;

player playActionNow "medicstop";
