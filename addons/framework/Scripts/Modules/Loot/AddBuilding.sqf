/*
	Building add / parser for Loot spawning
	Designed specifically for Misery mod
	SourceCode by Drongo edited by TenuredCLOUD
*/

private["_b", "_pos", "_marker", "_bText", "_positions"];
_b=_this;
_pos=[];
_positions=[];
_marker="";
_bText="";
_crates=0;

// count buildings available positions:
if ((count(_b call Misery_fnc_BuildingPositionsInside))<1) exitWith {};

// Check if buildings Blacklisted:
if (typeOf _b in MiseryLootBldgBlacklist) exitWith {};

// Buildings that have already spawned loot:
if (_b in MiseryAllBuildings) exitWith {};

// if new loot spawn, push building to restrict respawn loot array:
MiseryAllBuildings pushBack _b;

// if too much damage to building no loot:
if ((Damage _b)>0.7) exitWith {};

_marker="";

// Debug markers:
if (MiseryDebug) then {
	_marker=createMarkerLocal[format["%1", _b], (getPos _b)];
	_marker setMarkerTypeLocal "mil_dot";_marker setMarkerColorLocal "ColorBlue"
};
_bText=toLower(getText(configfile>>"CfgVehicles">>(typeOf _b)>>"editorSubcategory"));

// Military building
if ((_bText find "military")>-1) exitWith {
	if (MiseryDebug) then {
		_marker setMarkerTypeLocal "mil_box";
		_marker setMarkerColorLocal "ColorGREEN"
	};
	if ((random 100) < MiseryLootChanceHouseM) then {
		_positions=[_b]call BIS_fnc_buildingPositions;
		{
			if!(_x call Misery_fnc_IsInsideloot)then{
				_positions=_positions-[_x]
			}
		}forEach _positions;
		if ((count _positions)<1) then {
			_positions=[_b]call BIS_fnc_buildingPositions
		};
		if ((count _positions)<1) exitWith {};
		_pos=selectRandom _positions;
		_crates=round((count _positions)/3);
		[_pos, true]spawn Misery_fnc_GenerateStash;
		_positions=_positions-[_pos];
		_crates=_crates-1;
		while { true } do {
			if ((count _positions)<1) exitWith {};
			if (_crates<1) exitWith {};
			if ((random 100)>75) then {
				_pos=selectRandom _positions;
				_positions=_positions-[_pos];
				[_pos, true]spawn Misery_fnc_GenerateStash;
			};
			_crates=_crates-1;
		};
	} else {
		if (MiseryDebug) then {
			_marker setMarkerColorLocal "ColorYellow"
		}
	};
};

// civilian building
if ((random 100) < MiseryLootChanceHouse) then {
	_positions=[_b]call BIS_fnc_buildingPositions;
	{
		if!(_x call Misery_fnc_IsInsideloot)then{
			_positions=_positions-[_x]
		}
	}forEach _positions;
	if ((count _positions)<1) then {
		_positions=[_b]call BIS_fnc_buildingPositions
	};
	if ((count _positions)<1) exitWith {};
	_pos=selectRandom _positions;
	_crates=round((count _positions)/3);
	[_pos, false]spawn Misery_fnc_GenerateStash;
	_positions=_positions-[_pos];
	_crates=_crates-1;
	while { true } do {
		if ((count _positions)<1) exitWith {};
		if (_crates<1) exitWith {};
		if ((random 100)>75) then {
			_pos=selectRandom _positions;
			_positions=_positions-[_pos];
			[_pos, false]spawn Misery_fnc_GenerateStash;
		};
		_crates=_crates-1;
	};
} else {
	if (MiseryDebug) then {
		_marker setMarkerColorLocal "ColorYellow"
	}
};