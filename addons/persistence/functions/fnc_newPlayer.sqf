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

player setUnitLoadout EGVAR(common,defaultLoadout);

private _temperature = call EFUNC(temperature,temperature);

// Set defaults for blank save.
player setVariable [QGVAR(cooking_recipes), MACRO_PLAYER_COOKING_RECIPES];
player setVariable [QGVAR(crafting_recipes), MACRO_PLAYER_CRAFTING_RECIPES];
player setVariable [QGVAR(debuffs), MACRO_PLAYER_DEBUFFS];
player setVariable [QGVAR(exposure), MACRO_PLAYER_EXPOSURE];
player setVariable [QGVAR(fatigue), MACRO_PLAYER_FATIGUE];
player setVariable [QGVAR(psycosis), MACRO_PLAYER_FEAR];
player setVariable [QGVAR(hunger), MACRO_PLAYER_HUNGER];
player setVariable [QGVAR(infection), MACRO_PLAYER_INFECTION];
player setVariable [QGVAR(radiation), MACRO_PLAYER_RADIATION];
player setVariable [QGVAR(sea_temperature), _temperature select 1];
player setVariable [QGVAR(temperature), _temperature select 0];
player setVariable [QGVAR(thirst), MACRO_PLAYER_THIRST];
player setVariable [QGVAR(toxicity), MACRO_PLAYER_TOXICITY];
player setVariable [QGVAR(water_collect_recipes), MACRO_PLAYER_WATERCOLLECT_RECIPES];

if (_newSave) then {
    player setVariable [QGVAR(currency), MACRO_PLAYER_CURRENCY];
    player setVariable [QGVAR(currency_banked), MACRO_PLAYER_CURRENCY_BANKED];
};
