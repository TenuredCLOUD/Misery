#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Checks if artifact spawned under a roof 
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_artifacts_fnc_safeSpawn;
 *
 * Public: No
*/

private ["_artifactPos","_artifactDir","_maxDistance","_endPos","_int","_roof","_isUnderRoof"];

_artifactPos = getPosWorld _this;
_artifactDir = [0, 0, 1];
_maxDistance = 15;
_endPos = _artifactPos vectorAdd (_artifactDir vectorMultiply _maxDistance);
_int = lineIntersectsSurfaces [_artifactPos,_endPos,_this,objNull,true,1,"GEOM","NONE"];
_roof = _int select 0 select 3;
_isUnderRoof = false;

if ((count _int) < 1) exitWith {false};

if (_roof isKindOf "House" || _roof isKindOf "Building") then {
    _isUnderRoof = true;
};

_isUnderRoof
