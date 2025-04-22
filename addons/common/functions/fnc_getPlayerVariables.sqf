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
 *     3: Thermal Index <NUMBER>
 *     4: Exposure <NUMBER>
 *     5: Wetness <NUMBER>
 *     6: Radiation <NUMBER>
 *     7: Infection <NUMBER>
 *     8: Parasites <NUMBER>
 *     9: Toxicity <NUMBER>
 *     10: Psychosis <NUMBER>
 *     11: Buffs <ARRAY>
 *     12: Ailments <ARRAY>
 *     13: Currency <NUMBER>
 *     14: Banked Currency <NUMBER>
 *     18: Cartridge Efficiency <NUMBER>
 *
 * Example:
 * [] call misery_common_fnc_getPlayerVariables
*/

// Energy
private _hunger = player getVariable [QEGVAR(survival,hunger), MACRO_PLAYER_DEFAULTS_HIGH];
private _thirst = player getVariable [QEGVAR(survival,thirst), MACRO_PLAYER_DEFAULTS_HIGH];
private _energyDeficit = player getVariable [QEGVAR(survival,energyDeficit), MACRO_PLAYER_DEFAULTS_LOW];

// Temperature
private _thermalIndex = player getVariable [QEGVAR(temperature,thermalIndex), MACRO_PLAYER_DEFAULTS_TEMP];
private _exposure = player getVariable [QEGVAR(temperature,exposure), MACRO_PLAYER_DEFAULTS_LOW];
private _wetness = player getVariable [QEGVAR(temperature,wetness), MACRO_PLAYER_DEFAULTS_LOW];

// Sickness
private _radiation = player getVariable [QEGVAR(survival,radiation), MACRO_PLAYER_DEFAULTS_LOW];
private _infection = player getVariable [QEGVAR(survival,infection), MACRO_PLAYER_DEFAULTS_LOW];
private _parasites = player getVariable [QEGVAR(survival,parasites), MACRO_PLAYER_DEFAULTS_LOW];
private _toxicity = player getVariable [QEGVAR(survival,toxicity), MACRO_PLAYER_DEFAULTS_LOW];

// Psychosis
private _psychosis = player getVariable [QEGVAR(psychosis,state), MACRO_PLAYER_DEFAULTS_LOW];

// Vitals
private _buffs = player getVariable [QEGVAR(vitals,buffs), []];
private _ailments = player getVariable [QEGVAR(vitals,ailments), []];

// Banking
private _funds = player getVariable [QEGVAR(currency,funds), MACRO_PLAYER_DEFAULTS_LOW];
private _bankedFunds = player getVariable [QEGVAR(currency,bankedFunds), MACRO_PLAYER_DEFAULTS_LOW];

// Gas Mask
private _cartridgeEfficiency = player getVariable [QEGVAR(gasmask,cartridgeEfficiency), MACRO_PLAYER_DEFAULTS_HIGH];

[_hunger, _thirst, _energyDeficit, _thermalIndex, _exposure, _wetness, _radiation, _infection, _parasites, _toxicity, _psychosis, _buffs, _ailments, _funds, _bankedFunds, _cartridgeEfficiency]
