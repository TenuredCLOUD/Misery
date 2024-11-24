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

    _players = call EFUNC(common,listPlayers);

    {
        private _animal = _x;
        private _remove = true;

        {
            if ((_x distance _animal) < GVAR(animalDeleteDistance)) then {
                _remove = false;
            };
        } forEach _players;

        if (_remove) then {
            GVAR(registeredEntities) = GVAR(registeredEntities) - [_animal];
            _animal removeAllMPEventHandlers "MPKilled";
            deleteVehicle _animal;
        };
    } forEach GVAR(registeredEntities);
