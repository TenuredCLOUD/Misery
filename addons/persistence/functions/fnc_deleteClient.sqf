#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD (Adapted from McDiod's GRAD persistence)
 * Wrapper function for GRAD persistence, removes client data
 *
 * Arguments:
 * 0: Client UID <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_persistence_fnc_deleteClient
*/

params ["_uid"];

if !(isServer) exitWith {};

private _missionTag = [] call GRADFUNC(persistence,getMissionTag);

private _playersTag = _missionTag + "_players";

private _playersData = [_playersTag, true, false] call GRADFUNC(persistence,getSaveData);

if (_playersData isEqualTo []) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), format ["No saved data found for UID: %1", _uid]] call EFUNC(common,debugMessage);
};

[_playersData, _uid] call CBA_fnc_hashRem;

[_playersTag, _playersData] call GRADFUNC(persistence,saveToProfileNamespace);

saveProfileNamespace;
