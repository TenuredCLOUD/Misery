/* -----------------------------------
Misery No nightvision when in TPP (Third person)
Enforces player to disable NVG's when in third person, as it should be...
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

#include "\z\misery\addons\misery_framework\Scripts\Misery_PreParser.hpp"

[{(cameraView == "EXTERNAL" && (currentVisionMode player == 1 || currentVisionMode player == 2))},
{

	[{
		params ["_args", "_handle"];

		if (!(MiseryNoNVG_TPP_ENABLED) || (cameraView == "INTERNAL") || (cameraView == "GUNNER") || (currentVisionMode player == 0) || (!alive player)) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			if(MiseryDebug)then{systemChat "Misery TPP NVG's cycle terminated..."};
			//Only re-execute if MiseryNoNVG_TPP_ENABLED is true:
			if (MiseryNoNVG_TPP_ENABLED) then {
			[] execVM MIS_FILESYS(Survival\Immersion\TPPNONVG);
			if(MiseryDebug)then{systemChat "Misery TPP NVG's cycle checks re-initiated..."};
			};
		};

	if ((currentVisionMode player == 1) || (currentVisionMode player == 2)) then {
		player action ["nvGogglesOff", player]; //If player is actively using NODs disable them
	};

	if(MiseryDebug)then{systemChat "Misery TPP NVG's cycle..."};

}, 0.1, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;

