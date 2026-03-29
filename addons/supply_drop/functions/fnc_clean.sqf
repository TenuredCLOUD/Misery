 #include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Supply drop cleanup
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_supply_drop_fnc_clean;
 *
*/

if (GVAR(activeDrops) isEqualTo []) exitWith {};

private _players = call EFUNC(common,listPlayers);

{
    private _crate = _x;
    {
        private _distance = _x distance _crate;
        if (_distance < GVAR(deletionDistance)) exitWith {continue};

        {
            if (!isNull _x && {attachedTo _x isEqualTo _crate}) then {
                deleteVehicle _x;
            };
        } forEach attachedObjects _crate;

        deleteVehicle _crate;

        GVAR(activeDrops) deleteAt _forEachIndex;
    } forEach _players;
} forEach GVAR(activeDrops);
