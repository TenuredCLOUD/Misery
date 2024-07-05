 /* -----------------------------------
Misery Sleep system (Singleplayer only)
Code concepts from Haleks Ravage mod (with permission)
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

_obj = (_this select 3) select 0;
_nearFire = false;
_underRoof = false;

if ([player] call Misery_fnc_NearFire) then {
	_nearFire = true;
};

if (typeOf _obj isEqualTo "Camping_Tent") then {
	_underRoof = true;
} else {
	//_underRoof = lineIntersects [getposASL player, [(getPosASL player) select 0,(getPosASL player) select 1,((getPosASL player) select 2) + 30], player, player];//use 'player' only to avoid issues with proxies in bldgs
	if (([player] call Misery_fnc_Isinside) select 0) then {
		_underRoof = true;
	};
};

if (_nearFire || _underRoof) then {
	createDialog "MiserySleepMenuGUI"; //[] execVM "Misery\Scripts\Survival\Sleep\sleepoptions.sqf";

} else {
	titleText ["You need to find shelter or build a fire nearby...", "PLAIN DOWN"];
};
