/*
Misery under roof check for Fire objects
Checks for Roof over fire, this aids with rain resistance
Designed specifically for Misery mod 
By TenuredCLOUD
*/

private ["_firePos","_fireDir","_maxDistance","_endPos","_int","_roof","_isUnderRoof"];  

_firePos = getPosWorld _this; 
_fireDir = [0, 0, 1]; 
_maxDistance = 15; 
_endPos = _firePos vectorAdd (_fireDir vectorMultiply _maxDistance); 
_int = lineIntersectsSurfaces [_firePos,_endPos,_this,objNull,true,1,"GEOM","NONE"]; 
_roof = _int select 0 select 3; 
_isUnderRoof = FALSE;

if ((count _int) < 1) exitWith {FALSE};

if (_roof isKindOf "House" || _roof isKindOf "Building") then {
    _isUnderRoof = TRUE;
}; 

_isUnderRoof
