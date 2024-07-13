/*
Misery Guitar usage
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

[
	player,
	"Play Guitar",
	"\assets\data\guitar.paa",
	"\assets\data\guitar.paa",
	"true",
	"private _isnotmoving = TRUE;
  if (vectorMagnitude velocity player > 1) then {
    _isnotmoving = FALSE;
  };
  _isnotmoving",
	{
	//start action:
	player action ["sitDown",player]; 
  //soundsource:
_guitarsong = selectRandom [
"guitar_1",
"guitar_2",
"guitar_3",
"guitar_4",
"guitar_5",
"guitar_6",
"guitar_7",
"guitar_8",
"guitar_9",
"guitar_10",
"guitar_11",
"guitar_12",
"guitar_13",
"guitar_14",
"guitar_15",
"guitar_16",
"guitar_17",
"guitar_18",
"guitar_19",
"guitar_20",
"guitar_21",
"guitar_22",
"guitar_23",
"guitar_24",
"guitar_25",
"guitar_26",
"guitar_27",
"guitar_28"
  ];
	private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position player);
	player setVariable ["_TC_sound", true];
	[_soundDummy, [_guitarsong, 50]] remoteExec ["say3D", 0, _soundDummy];
	[{
    !(player getVariable ["_TC_sound", false])
	},{
    deleteVehicle _this;
	}, _soundDummy] call CBA_fnc_waitUntilAndExecute;
	},
	{
	titleText ["...", "PLAIN DOWN"];
	},
	{
	private _actionID = (_this select 2);
	[player,_actionID] call BIS_fnc_holdActionRemove;
	},
	{
  titleText ["You stop playing the guitar...", "PLAIN DOWN"];
  player setVariable ["_TC_sound", false];
	private _actionID = (_this select 2);
	[player,_actionID] call BIS_fnc_holdActionRemove;
	},
	[],
  60,
	nil,
	true,
	false
]  call BIS_fnc_holdActionAdd;