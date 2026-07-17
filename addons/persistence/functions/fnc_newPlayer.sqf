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

ACE_player setUnitLoadout EGVAR(common,defaultLoadout);

ACE_player setVariable [QEGVAR(survival,hunger), MACRO_PLAYER_DEFAULTS_HIGH];
ACE_player setVariable [QEGVAR(survival,thirst), MACRO_PLAYER_DEFAULTS_HIGH];
ACE_player setVariable [QEGVAR(survival,energyDeficit), MACRO_PLAYER_DEFAULTS_LOW];
ACE_player setVariable [QEGVAR(temperature,thermalIndex), MACRO_PLAYER_DEFAULTS_TEMP];
ACE_player setVariable [QEGVAR(temperature,exposure), MACRO_PLAYER_DEFAULTS_LOW];
ACE_player setVariable [QEGVAR(temperature,wetness), MACRO_PLAYER_DEFAULTS_LOW];
ACE_player setVariable [QEGVAR(survival,radiation), MACRO_PLAYER_DEFAULTS_LOW];
ACE_player setVariable [QEGVAR(survival,infection), MACRO_PLAYER_DEFAULTS_LOW];
ACE_player setVariable [QEGVAR(survival,parasites), MACRO_PLAYER_DEFAULTS_LOW];
ACE_player setVariable [QEGVAR(survival,toxicity), MACRO_PLAYER_DEFAULTS_LOW];
ACE_player setVariable [QEGVAR(psychosis,state), MACRO_PLAYER_DEFAULTS_LOW];
ACE_player setVariable [QEGVAR(gasmask,cartridgeEfficiency), MACRO_PLAYER_DEFAULTS_HIGH];
ACE_player setVariable [QEGVAR(chemical,detectorPower), MACRO_PLAYER_DEFAULTS_HIGH];
ACE_player setVariable [QEGVAR(spectrum,detectorPower), MACRO_PLAYER_DEFAULTS_HIGH];
ACE_player setVariable [QEGVAR(vitals,buffs), []];
ACE_player setVariable [QEGVAR(vitals,ailments), []];
ACE_player setVariable [QEGVAR(currency,funds), MACRO_PLAYER_DEFAULTS_LOW];

// Banking data is not reset unless fresh player
if (_newSave) then {
    private _cachedBank = profileNamespace getVariable [QGVAR(cachedBank), nil];

    if (!isNil "_cachedBank") then {
        ACE_player setVariable [QEGVAR(currency,bankedFunds), _cachedBank];

        profileNamespace setVariable [QGVAR(cachedBank), nil];
    } else {
        ACE_player setVariable [QEGVAR(currency,bankedFunds), MACRO_PLAYER_DEFAULTS_LOW];
    };
};
