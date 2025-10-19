#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Vehicle Generator
 * Spawns a vehicle at player's position
 *
 * Arguments:
 * 0: Class of vehicle to spawn <STRING>
 * 1: Player object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_traders_fnc_generateVehicle;
 *
*/

params ["_vehicleClassname", "_player"];

private _spawnPos = _player modelToWorld [0, 2, 0]; // Spawn 2m in front of player
private _vehicle = _vehicleClassname createVehicle _spawnPos;

private _varName = format ["%1_%2", _vehicleClassname, round(diag_tickTime)];
_vehicle setVehicleVarName _varName;

clearItemCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;

missionNamespace setVariable [_varName, _vehicle, true];

publicVariable _varName;
