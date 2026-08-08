#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Handles new players or respawning players.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_persistence_fnc_newPlayer
*/

if !(hasInterface) exitWith {};

[] call ACEFUNC(common,player) params ["_player"];

_player setUnitLoadout EGVAR(common,defaultLoadout);

_player setVariable [QEGVAR(survival,hunger), MACRO_PLAYER_DEFAULTS_HIGH];
_player setVariable [QEGVAR(survival,thirst), MACRO_PLAYER_DEFAULTS_HIGH];
_player setVariable [QEGVAR(survival,energyDeficit), MACRO_PLAYER_DEFAULTS_LOW];
_player setVariable [QEGVAR(temperature,thermalIndex), MACRO_PLAYER_DEFAULTS_TEMP];
_player setVariable [QEGVAR(temperature,exposure), MACRO_PLAYER_DEFAULTS_LOW];
_player setVariable [QEGVAR(temperature,wetness), MACRO_PLAYER_DEFAULTS_LOW];
_player setVariable [QEGVAR(survival,radiation), MACRO_PLAYER_DEFAULTS_LOW];
_player setVariable [QEGVAR(survival,infection), MACRO_PLAYER_DEFAULTS_LOW];
_player setVariable [QEGVAR(survival,parasites), MACRO_PLAYER_DEFAULTS_LOW];
_player setVariable [QEGVAR(survival,toxicity), MACRO_PLAYER_DEFAULTS_LOW];
_player setVariable [QEGVAR(psychosis,state), MACRO_PLAYER_DEFAULTS_LOW];
_player setVariable [QEGVAR(chemical,detectorPower), MACRO_PLAYER_DEFAULTS_HIGH];
_player setVariable [QEGVAR(spectrum,detectorPower), MACRO_PLAYER_DEFAULTS_HIGH];
_player setVariable [QEGVAR(vitals,buffs), []];
_player setVariable [QEGVAR(vitals,ailments), []];
_player setVariable [QEGVAR(currency,funds), MACRO_PLAYER_DEFAULTS_LOW];

