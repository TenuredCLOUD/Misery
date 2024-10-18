#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Zombie skinning
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_research_fnc_skin;
 *
*/

private _soundDummy = "Land_HelipadEmpty_F" createVehicle (position player);
player setVariable ["_TC_sound", true, true];

if (call Misery_fnc_IsdeadZed) then {

private _randomskin = selectRandom
["Skinning_1",
"Skinning_2",
"Skinning_3"];

["You start to skin the corpse...",
15,
{true},
{
deleteVehicle cursorTarget; // delete corpse
private _zombieskinned = selectRandom [
"Misery_Zombieskin",
"Misery_Zombieeye"
];
player addItem _zombieskinned;
titleText ["You collect your specimen, but the rest of the corpse is too rotten for any more specimens...", "PLAIN DOWN"];
},
{titleText ["You stop skinning the corpse...", "PLAIN DOWN"];
player setVariable ["_TC_sound", false, true];
},
[],
true,
true,
true
] call CBA_fnc_progressBar;

[_soundDummy, [_randomskin, 50]] remoteExec ["say3D", 0, _soundDummy];

    [{
    !(player getVariable ["_TC_sound", false])
    },{
    deleteVehicle _this;
    }, _soundDummy] call CBA_fnc_waitUntilAndExecute

};

