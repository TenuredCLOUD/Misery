/* -----------------------------------
Misery Zombie sawing 
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position player);
player setVariable ["_TC_sound", true, true];

if (call Misery_fnc_IsdeadZed) then {

private _randomsaw = selectRandom
["Cut1",
"Cut2",
"Cut3",
"BoneSaw"];

["You start to saw the corpse...",
15,
{true},
{
deleteVehicle cursortarget; // delete corpse 
private _zombiesawed = selectRandom [
"Misery_zombiehead",
"Misery_zombiehand",
"Misery_Zombiefoot",
"Misery_Zombiebrain",
"Misery_zombiehead",
"Misery_zombiehand",
"Misery_Zombiefoot",
"Misery_Zombiebrain",
"Misery_zombiehead",
"Misery_zombiehand",
"Misery_Zombiefoot",
"Misery_Zombiebrain"
];
player addItem _zombiesawed;
titleText ["You collect your specimen, but the rest of the corpse is too rotten for any more specimens...", "PLAIN DOWN"];
},
{
titleText ["You stop sawing the corpse...", "PLAIN DOWN"];
player setVariable ["_TC_sound", false, true];
},
[],
true,
true,
true
] call CBA_fnc_progressBar;

[_soundDummy, [_randomsaw, 50]] remoteExec ["say3D", 0, _soundDummy];

	[{
    !(player getVariable ["_TC_sound", false])
	},{
    deleteVehicle _this;
	}, _soundDummy] call CBA_fnc_waitUntilAndExecute

};

