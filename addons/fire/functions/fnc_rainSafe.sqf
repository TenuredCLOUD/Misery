#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Checks for Roof over fire, this aids with rain resistance
 *
 * Arguments:
 * 0: OBJECT <STRING>
 *
 * Return Value:
 * 0: BOOL
 *
 * Example:
 * [] call misery_fire_fnc_rainSafe
 *
*/

params ["_fireObject"];

private _firePos = getPosWorld _fireObject;
private _fireDir = [0, 0, 1];
private _maxDistance = 15;
private _endPos = _firePos vectorAdd (_fireDir vectorMultiply _maxDistance);
private _int = lineIntersectsSurfaces [_firePos, _endPos, _fireObject, objNull, true, 1, "GEOM", "NONE"];
private _roof = _int select 0 select 3;
private _isUnderRoof = false;

if ((count _int) < 1) exitWith {false};

if (_roof isKindOf "House" || _roof isKindOf "Building") then {
    _isUnderRoof = true;
};

_isUnderRoof
