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
 * [] call misery_ambient_ai_fnc_clean;
 *
*/

private _players = call EFUNC(common,listPlayers);

if (count GVAR(registeredEntities) == 0) exitWith {};

{
    private _group = _x;
    private _leader = leader _group; 
    {
        private _distance = _x distance2D _leader; 
        if (_distance < GVAR(deleteDistance)) exitWith {continue};

        GVAR(registeredEntities) deleteAt _forEachIndex;
        {deleteVehicle _x} forEach (units _group); 
    } forEach _players;
} forEachReversed GVAR(registeredEntities);

