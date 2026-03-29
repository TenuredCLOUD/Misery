 #include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * AI cleanup
 * Processes cleaning of ai based on distance of players to ai groups
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_compat_wzc_fnc_clean;
 *
*/

private _players = call EFUNC(common,listPlayers);

if (GVAR(registeredEntities) isEqualTo []) exitWith {};

{
    private _group = _x;
    private _leader = leader _group;
    {
        private _distance = position _x distance position _leader;
        if (_distance < GVAR(deletionDistance)) exitWith {continue};

        GVAR(registeredEntities) deleteAt _forEachIndex;
        {deleteVehicle _x} forEach (units _group);
    } forEach _players;
} forEachReversed GVAR(registeredEntities);
