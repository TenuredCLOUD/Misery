#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Handles new players or respawning players.
 *
 * Arguments:
 * 0: New Save <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_persistence_fnc_newPlayer
*/

params [["_newSave", true]];

[QUOTE(COMPONENT_BEAUTIFIED), format ["New player, Fresh Start: %1", _newSave]] call EFUNC(common,debugMessage);

player setUnitLoadout EGVAR(common,defaultLoadout) select 0;

player setVariable [QEGVAR(survival,hunger), MACRO_PLAYER_DEFAULTS_HIGH];
player setVariable [QEGVAR(survival,thirst), MACRO_PLAYER_DEFAULTS_HIGH];
player setVariable [QEGVAR(survival,energyDeficit), MACRO_PLAYER_DEFAULTS_LOW];
player setVariable [QEGVAR(survival,temperature), MACRO_PLAYER_DEFAULTS_TEMP];
player setVariable [QEGVAR(survival,exposure), MACRO_PLAYER_DEFAULTS_LOW];
player setVariable [QEGVAR(survival,radiation), MACRO_PLAYER_DEFAULTS_LOW];
player setVariable [QEGVAR(survival,infection), MACRO_PLAYER_DEFAULTS_LOW];
player setVariable [QEGVAR(survival,parasites), MACRO_PLAYER_DEFAULTS_LOW];
player setVariable [QEGVAR(survival,toxicity), MACRO_PLAYER_DEFAULTS_LOW];
player setVariable [QEGVAR(psychosis,state), MACRO_PLAYER_DEFAULTS_LOW];
player setVariable [QEGVAR(vitals,buffs), []];
player setVariable [QEGVAR(vitals,debuffs), []];
player setVariable [QEGVAR(cooking,knowledge), []];
player setVariable [QEGVAR(crafting,knowledge), []];
player setVariable [QEGVAR(hydrology,knowledge), []];

// Banking data is not reset unless fresh player.
if (_newSave) then {
    player setVariable [QEGVAR(bank,currency), MACRO_PLAYER_DEFAULTS_LOW];
    player setVariable [QEGVAR(bank,bankedCurrency), MACRO_PLAYER_DEFAULTS_LOW];
    player setVariable [QEGVAR(bank,lastBankLoan), MACRO_PLAYER_DEFAULTS_LOW];
};
