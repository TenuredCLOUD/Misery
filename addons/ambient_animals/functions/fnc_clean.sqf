 #include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Animal cleanup
 * Processes cleaning of animals based on distance of players to animal clusters
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_ambient_animals_fnc_clean;
 *
*/

private _players = call EFUNC(common,listPlayers);

if (count GVAR(registeredEntities) == 0) exitWith {};

{
    private _entity = _x;
    {
        private _distance = _x distance2D _entity;
        if (_distance < GVAR(animalDeleteDistance)) exitWith {continue};

        GVAR(registeredEntities) deleteAt (GVAR(registeredEntities) find _entity);
        deleteVehicle _entity;
    } forEach _players;
} forEach GVAR(registeredEntities);
