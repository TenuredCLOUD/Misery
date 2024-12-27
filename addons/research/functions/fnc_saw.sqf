#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Zombie sawing
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_research_fnc_saw;
 *
*/

private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position player);
player setVariable ["_TC_sound", true, true];

if (call FUNC(corpse)) then {

private _randomsaw = selectRandom
["Cut1",
"Cut2",
"Cut3",
"BoneSaw"];

["You start to saw the corpse...",
15,
{true},
{
deleteVehicle cursorTarget; // delete corpse
private _zombiesawed = selectRandom [
QCLASS(zombie_Head),
QCLASS(zombie_Hand),
QCLASS(zombie_Foot),
QCLASS(zombie_Brain),
QCLASS(zombie_Head),
QCLASS(zombie_Hand),
QCLASS(zombie_Foot),
QCLASS(zombie_Brain),
QCLASS(zombie_Head),
QCLASS(zombie_Hand),
QCLASS(zombie_Foot),
QCLASS(zombie_Brain)
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

