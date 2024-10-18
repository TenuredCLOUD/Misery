#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Vehicle Generater
 * Takes input data and generates a fully functional vehicle of defined class
 * Also generates a varname TAG to the generated vehicle for reference
 *
 * Arguments:
 * 0: Class of vehicle to spawn <STRING>
 * 1: Spawn position <OBJECT>
 *
 * Return Value:
 * None
 *
 * ["B_Quadbike_01_F", spawnmarker_1] call misery_traders_fnc_generateVehicle;
 *
 * Public: No
*/

params ["_vehicleClassname", "_spawnMarker"];

_spawnPos = getPosATL _spawnMarker;

_vehicle = _vehicleClassname createVehicle _spawnPos;

_varName = format ["%1_%2", _vehicleClassname, round(diag_tickTime)]; //Generate random varname

_vehicle setVehicleVarName _varName; //TAG generated vehicle with new varname

clearItemCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;

missionNamespace setVariable [_varName, _vehicle, true];

//Enforce Broadcast
publicVariable _varName;
