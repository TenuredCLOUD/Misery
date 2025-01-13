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

player playAction "Gear";

createDialog QCLASS(moneyTake_ui);
