#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Gets all misery related player variables and returns them as an array.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Array of Variables <ARRAY>
 *     0: Hunger <NUMBER>
 *     1: Thirst <NUMBER>
 *     2: Energy Deficit <NUMBER>
 *     3: Temperature <NUMBER>
 *     4: Exposure <NUMBER>
 *     5: Radiation <NUMBER>
 *     6: Infection <NUMBER>
 *     7: Parasites <NUMBER>
 *     8: Toxicity <NUMBER>
 *     9: Psychosis <NUMBER>
 *     10: Buffs <ARRAY>
 *     11: Debuffs <ARRAY>
 *     12: Currency <NUMBER>
 *     13: Banked Currency <NUMBER>
 *     14: Last Bank Loan <NUMBER (seconds)>
 *     15: Cooking <ARRAY>
 *     16: Crafting <ARRAY>
 *     17: Hydrology <ARRAY>
 *
 * Example:
 * [] call misery_common_fnc_getPlayerVariables
*/

// Survival Variables
private _energyDeficit = player getVariable [QEGVAR(survival,energyDeficit), MACRO_PLAYER_DEFAULTS_LOW];
private _exposure = player getVariable [QEGVAR(survival,exposure), MACRO_PLAYER_DEFAULTS_LOW];
private _hunger = player getVariable [QEGVAR(survival,hunger), MACRO_PLAYER_DEFAULTS_HIGH];
private _infection = player getVariable [QEGVAR(survival,infection), MACRO_PLAYER_DEFAULTS_LOW];
private _parasites = player getVariable [QEGVAR(survival,parasites), MACRO_PLAYER_DEFAULTS_LOW];
private _radiation = player getVariable [QEGVAR(survival,radiation), MACRO_PLAYER_DEFAULTS_LOW];
private _temperature = player getVariable [QEGVAR(survival,temperature), MACRO_PLAYER_DEFAULTS_TEMP];
private _thirst = player getVariable [QEGVAR(survival,thirst), MACRO_PLAYER_DEFAULTS_HIGH];
private _toxicity = player getVariable [QEGVAR(survival,toxicity), MACRO_PLAYER_DEFAULTS_LOW];

// Psychosis
private _psychosis = player getVariable [QEGVAR(psychosis,state), MACRO_PLAYER_DEFAULTS_LOW];

// Banking
private _bankedCurrency = player getVariable [QEGVAR(bank,bankedCurrency), MACRO_PLAYER_DEFAULTS_LOW];
private _currency = player getVariable [QEGVAR(bank,currency), MACRO_PLAYER_DEFAULTS_LOW];
private _lastBankLoan = player getVariable [QEGVAR(bank,lastBankLoan), MACRO_PLAYER_DEFAULTS_LOW];

// Vitals
private _buffs = player getVariable [QEGVAR(vitals,buffs), []];
private _debuffs = player getVariable [QEGVAR(vitals,debuffs), []];

// Crafting
private _cooking = player getVariable [QEGVAR(cooking,knowledge), []];
private _crafting = player getVariable [QEGVAR(crafting,knowledge), []];
private _hydrology = player getVariable [QEGVAR(hydrology,knowledge), []];

[_hunger, _thirst, _energyDeficit, _temperature, _exposure, _radiation, _infection, _parasites, _toxicity, _psychosis, _buffs, _debuffs, _currency, _bankedCurrency, _lastBankLoan, _cooking, _crafting, _hydrology]
