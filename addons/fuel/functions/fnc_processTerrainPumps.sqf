#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Terrain fuel pump initializer / replacer to prep for ACE refuel & AE3 power
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fuel_fnc_processTerrainPumps
*/

if (!isServer) exitWith {};

private _terrainObjects = call EFUNC(blackout,nearObjects);

private _landPumps = [MACRO_FUELSTATIONS_LAND];
private _airPumps  = [MACRO_FUELSTATIONS_AIR];
private _allPumpClasses = _landPumps + _airPumps;

private _replacementPumps = [];

{
    private _object = _x;
    private _pumpClass = typeOf _object;

    if (_pumpClass in _allPumpClasses) then {

        _object hideObjectGlobal true;

        private _position = getPosATL _object;
        private _direction = getDir _object;
        private _vectorUp = vectorUp _object;

        private _pumpSource = createVehicle [_pumpClass, _position, [], 0, "CAN_COLLIDE"];
        _pumpSource setDir _direction;
        _pumpSource setVectorUp _vectorUp;

        _replacementPumps pushBack _pumpSource;
    };
} forEach _terrainObjects;

if (isClass (missionConfigFile >> "CfgGradPersistence")) then {
    {
        [_x] call GRADFUNC(persistence,blacklistObjects);
    } forEach _replacementPumps;
};
