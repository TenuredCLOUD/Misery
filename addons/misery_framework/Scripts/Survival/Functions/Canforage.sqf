
private ["_canforage"];

_canforage = FALSE;

private _pos=(positionCameraToWorld[0,0,0]);
private _pos2=(_pos vectorAdd(getCameraViewDirection player vectorMultiply 4));
private _intersects = terrainIntersect [_pos, _pos2];

if (_intersects && !((([player] call Misery_fnc_Isinside) select 0) && (([player] call Misery_fnc_Isinside) select 1)) && (isNull objectParent player) && !(((getPosASLW player select 2) < 0) || (underwater player)) )  then {

	if (count (nearestTerrainObjects [player, ["BUSH"], 2.5, true, true]) > 0) then {  
	
	_canforage = TRUE;

	if (_canforage)exitwith{};
	
	};
};

_canforage 
