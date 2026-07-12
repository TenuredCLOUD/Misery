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

[{
    params ["_args", "_handle"];

    if (GVAR(registeredEntities) isEqualTo []) exitWith {};

    {
        private _entity = _x;

        if (isNull _entity) then {
            GVAR(registeredEntities) deleteAt _forEachIndex;
            continue;
        };

        private _playerNearby = [getPosWorld _entity, GVAR(animalDeleteDistance)] call CBA_fnc_nearPlayer;

        if (!_playerNearby) then {
            GVAR(registeredEntities) deleteAt _forEachIndex;
            deleteVehicle _entity;
        };
    } forEachReversed GVAR(registeredEntities);
}, GVAR(animalCycleLength)] call CBA_fnc_addPerFrameHandler;
