/* -----------------------------------
Misery Gasmask audio loop
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

#include "\z\misery\addons\misery_framework\Scripts\Misery_PreParser.hpp"

[{((goggles player in antirad_goggles) || (vest player in antirad_vests) || (backpack player in antirad_packs))},
{
	
	[{
		params ["_args", "_handle"];

		if ((!(goggles player in antirad_goggles) && !(vest player in antirad_vests || backpack player in antirad_packs)) || (!alive player)) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			if(MiseryDebug)then{systemChat "Misery Gasmask audio cycle terminated..."};
			[] execVM MIS_FILESYS(Survival\Immersion\Gasmaskaudio);
			if(MiseryDebug)then{systemChat "Misery Gasmask audio cycle checks re-initiated..."};
		};
  
	if ((goggles player in antirad_goggles) || (vest player in antirad_vests) || (backpack player in antirad_packs)) then {

		private _gmsounds = selectRandom ["gasmask1","gasmask2","gasmask3","gasmask4"];

		if (cameraView != "EXTERNAL") then {
			
			player say3D [_gmsounds, 10, 0.8 + random 0.1 + getFatigue player];
		};

		((getFatigue player)*2);
		player setSpeaker speaker player;
	};

if(MiseryDebug)then{systemChat "Misery Gasmask audio cycle..."};
	
}, 10, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
