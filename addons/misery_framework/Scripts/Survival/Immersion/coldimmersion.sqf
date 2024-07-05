/* -----------------------------------
Misery cold immersion
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

#include "\z\misery\addons\misery_framework\Scripts\Misery_PreParser.hpp"

[{!(isNil {player getVariable "MiseryExposure"}) && ((player getVariable ["MiseryExposure", MIS_EXPOSURE]) < -10)},
{

	[{
		params ["_args", "_handle"];

		if ((player getVariable ["MiseryExposure", MIS_EXPOSURE]) > -10 || (!alive player)) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			if(MiseryDebug)then{systemChat "Misery Cold immersion cycle terminated..."};
			[] execVM MIS_FILESYS(Survival\Immersion\coldimmersion);
			if(MiseryDebug)then{systemChat "Misery Cold immersion cycle checks re-initiated..."};
		};

	if (((player getVariable ["MiseryExposure", MIS_EXPOSURE]) < -10) && !(Goggles player in antirad_goggles || vest player in antirad_vests)) then {
			player say3D ["Sneeze",10,1,2,0];

	}else{

		if (((player getVariable ["MiseryExposure", MIS_EXPOSURE]) < -10) && (Goggles player in antirad_goggles || vest player in antirad_vests)) then {
			player say3D ["coughMask1",10,1,2,0];
			
	};
	};

	if(MiseryDebug)then{systemChat "Misery Cold immersion cycle..."};

}, 300, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;

