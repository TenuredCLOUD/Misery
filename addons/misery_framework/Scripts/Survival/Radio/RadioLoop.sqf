/* -----------------------------------
Radio loop
Runs broadcast loop while waiting on Global sound timer
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

#include "\z\misery\addons\misery_framework\Scripts\Misery_PreParser.hpp"

[{(player getVariable ["Misery_HHRadio", false]) == true},
{
	[{
		params ["_args", "_handle"];

		if (((player getVariable ["Misery_HHRadio", false]) == false) || (!alive player)) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			if(MiseryDebug)then{systemChat "Misery Radio Broadcast check Terminated..."};
		};

	if (MiseryRadioBroadcast != "") then { //Double check broadcast has a sound class 
	MiseryRadioLoopBroadcast = "Land_HelipadEmpty_F" createVehicle (position player);
	MiseryRadioLoopBroadcast attachTo [player, [0, 0, 0], "Pelvis"];
	[MiseryRadioLoopBroadcast, [MiseryRadioBroadcast, 50]] remoteExec ["say3D", 0, MiseryRadioLoopBroadcast];

	if(MiseryDebug)then{systemChat "Misery Radio Broadcast check detected broadcast, playing audio..."};
	
	[{
	!(player getVariable ["Misery_HHRadio", false])
	},{deleteVehicle _this;
	}, MiseryRadioLoopBroadcast] call CBA_fnc_waitUntilAndExecute; //Sound handle will still play after PFH handle is terminated since it's nested <<--//
	};

}, 1, []] call CBA_fnc_addPerFrameHandler; // Wait 10 seconds after broadcast, or radio is off - then remove handle
}, []] call CBA_fnc_waitUntilAndExecute;
