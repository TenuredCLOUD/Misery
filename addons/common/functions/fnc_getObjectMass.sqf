#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Spawns vehicle and grabs mass value
 * Workaround for CfgVehicles "mass" config value, always returning 0
 *
 * Arguments:
 * 0: Classname <STRING>
 *
 * Return Value:
 * 0: Mass <NUMBER>
 *
 * Example:
 * [] call misery_common_fnc_getObjectMass
 *
 */

params ["_classname"];

private _mass = 0;

private _config = [_classname] call CBA_fnc_getObjectConfig;

_mass = getNumber (_config >> "mass");

if (_mass <= 0) then {
    private _spawnPos = getPosATL player;
    _spawnPos set [2, -50000]; // Generate object under player, deep underground so it isn't visible

    private _tempVehicle = createVehicleLocal [_classname, _spawnPos, [], 0, "NONE"];

    _mass = getMass _tempVehicle;
    deleteVehicle _tempVehicle;
};

_mass
