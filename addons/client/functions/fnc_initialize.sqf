#include "..\script_component.hpp"

 /*
 * Author: TenuredCLOUD
 * Client Variables Initialization
 * Pre-Processes Client Variables
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public:
 * No
 *
 * Example:
 * [] call misery_client_fnc_initialize;
 *
*/

player setVariable [QEGVAR(survival,thirst), MACRO_PLAYER_THIRST];
player setVariable [QEGVAR(survival,hunger), MACRO_PLAYER_HUNGER];
player setVariable [QEGVAR(survival,energyDeficit), MACRO_PLAYER_FATIGUE];
private _ailments = [];
private _craftingKnowledge = [];
private _cookingKnowledge = [];
private _hydrologyKnowledge = []
player setVariable [QCLASS(ailments), _ailments];
player setVariable [QCLASS(craftingKnowledge), _craftingKnowledge];
player setVariable [QCLASS(cookingKnowledge), _cookingKnowledge];
player setVariable [QCLASS(hydrologyKnowledge), _hydrologyKnowledge];
player setVariable [QCLASS(currency), 0];
player setVariable [QCLASS(bankedCurrency), 0];
player setVariable [QCLASS(lastBankLoan), 0];
player setVariable [QCLASS(radiation), 0];
player setVariable [QCLASS(toxicity), MACRO_PLAYER_TOXICITY];
player setVariable [QCLASS(infection), MACRO_PLAYER_INFECTION];
player setVariable [QCLASS(psycosis), MACRO_PLAYER_PSYCHOSIS];
player setVariable [QCLASS(exposure), MACRO_PLAYER_EXPOSURE];
player setVariable [QCLASS(thermalIndex), (call EFUNC(temperature,environment)) select 0];
player setVariable [QCLASS(breathCondensationEffect), nil];
player setVariable [QCLASS(breathCondensation), false];

GVAR(initialized) = true;
