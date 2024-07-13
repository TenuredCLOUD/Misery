#include "\z\misery\addons\framework\scripts\Misery_PreParser.hpp"

/*
RF resync
Runs checks to resync detector if player 
picks up / starts with an RF detector that's on
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

[{(("Misery_RFHighrangeON" in items player) && (player getVariable ["Misery_RFEMFDet", false]) == false) && (alive player)},
{
	[{
		params ["_args", "_handle"];

		if (((player getVariable ["Misery_RFEMFDet", false]) == true) || !("Misery_RFHighrangeON" in items player) || (!alive player)) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			if(MiseryDebug)then{systemChat "Misery RFdetec resync cycle terminated..."};
			[] execVM MIS_FILESYS(survival\RFdetector\RFsyncLoop);
			if(MiseryDebug)then{systemChat "Misery RFdetec resync cycle checks reinitiated..."};
		};

	if (("Misery_RFHighrangeON" in items player) && (player getVariable ["Misery_RFEMFDet", false]) == false) then {
		player setVariable ["Misery_RFEMFDet", true,true]; //reactivate detector audio samples 
		[] execVM MIS_FILESYS(survival\RFdetector\RFLoop);
		[] execVM MIS_FILESYS(survival\RFdetector\RFdetectionLoop);
		if(MiseryDebug)then{systemChat "RF detector resynced properly..."};
		};
	}, 5, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
