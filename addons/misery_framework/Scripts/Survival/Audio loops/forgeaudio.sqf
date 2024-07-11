/* -----------------------------------
Misery Forge audio looper
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

[{TRUE},
{

	[{
		params ["_args", "_handle"];

{
private _noise_target = ["Misery_Forge"];
if (typeOf _x in _noise_target ) then {
[_x,["FurnaceFire"]] remoteExec ["say3D"];
};
} forEach allMissionObjects "All";		

}, 41, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;

