/*
Misery Sleep system (Singleplayer only)
Code concepts from Haleks Ravage mod (with permission)
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

rvg_beds = ["sofa_01_f.p3d", "postel_panelak2.p3d","woodenbed_01_f.p3d","bed_big_a.p3d","bed_husbands.p3d","vojenska_palanda.p3d","postel_manz_kov.p3d","postel_panelak1.p3d","sleeping_bag_blue_f.p3d","sleeping_bag_brown_f.p3d","tenta_f.p3d","tentdome_f.p3d"];

_ShowMiserySleepMenu = [
	player,
	"Sleep",
	"Misery\Scripts\Survival\data\tired.paa",
	"Misery\Scripts\Survival\data\tired.paa",
	"!isnil 'rvg_bedTarget'",
	"!isnil 'rvg_bedTarget'",
	{},
	{},
	{
		nul = [] spawn {
			_bedroll = rvg_bedTarget select 0;
			[[],[],[],[_bedroll]] execVM "Misery\Scripts\Survival\Sleep\sleep_menu.sqf";
		};
	},
	{},
	[],
	0.1,
	0,
	false,
	false
];

player setVariable ["rvg_bedAction", _ShowMiserySleepMenu call BIS_fnc_holdActionAdd];
player addEventHandler ["Respawn", {
	_player = _this select 0;
	_player setVariable ["rvg_bedAction", _ShowMiserySleepMenu call BIS_fnc_holdActionAdd];
}];

["rvgBedScanEH", "onEachFrame", {
	rvg_bedTarget = nil;
	if !(player isEqualTo (vehicle player)) exitWith {};
	_objs = lineIntersectsObjs [ATLToASL positionCameraToWorld [0,0,0], ATLToASL positionCameraToWorld[0,0,2+(positionCameraToWorld [0,0,0] distance player)], player, objNull, true, 32];
	if !(count _objs isEqualTo 0) then {
		_obj = _objs select ((count _objs) - 1);
		_objValidStr = [_obj, rvg_beds] call rvg_fnc_findString;
		if !(_objValidStr isEqualTo "") then {
			rvg_bedTarget =  [_obj, _objValidStr];
		};
	};
}] call BIS_fnc_addStackedEventHandler;


// if (isServer) then { 
     
//     private _axis = worldSize / 2;    
//     private _center = [_axis, _axis , 0];    
//     private _radius = sqrt 2 * _axis;   
 
//     private _allObjects = nearestTerrainObjects [_center, [], _radius * 2]; 
 
//     private _bedObjects = _allObjects select {(toLower (typeOf _x) find "bed" > -1) || (toLower (typeOf _x) find "sofa" > -1)}; 
 
//     { 
// _ShowMiserySleepMenu = [ 
//  player, 
//  "Sleep", 
//  "Misery\Scripts\Survival\data\tired.paa", 
//  "Misery\Scripts\Survival\data\tired.paa", 
//  "!isnil 'rvg_bedTarget'", 
//  "!isnil 'rvg_bedTarget'", 
//  {}, 
//  {}, 
//  { 
//   nul = [] spawn { 
//    _bedroll = rvg_bedTarget select 0; 
//    [[],[],[],[_bedroll]] execVM "Misery\Scripts\Survival\Sleep\sleep_menu.sqf"; 
//   }; 
//  }, 
//  {}, 
//  [], 
//  0.1, 
//  0, 
//  false, 
//  false 
// ];
         
//     } forEach _bedObjects; 
// };