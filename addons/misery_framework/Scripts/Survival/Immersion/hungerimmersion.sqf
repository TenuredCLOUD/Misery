/*
Misery hunger immersion
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

#include "\z\misery\addons\misery_framework\Scripts\Misery_PreParser.hpp"

[{!(isNil {player getVariable "MiseryHunger"}) && ((player getVariable ["MiseryHunger", MIS_HUNGER]) < 75)},
{

	[{
		params ["_args", "_handle"];

		if ((player getVariable ["MiseryHunger", MIS_HUNGER]) > 75 || (!alive player)) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			if(MiseryDebug)then{systemChat "Misery hunger immersion cycle terminated..."};
			[] execVM MIS_FILESYS(Survival\Immersion\hungerimmersion);
			if(MiseryDebug)then{systemChat "Misery hunger immersion cycle checks re-initiated..."};
		};

	if ((player getVariable ["MiseryHunger", MIS_HUNGER]) < 75) then {
		player say3D ["StomachGrowl",10,1,2,0];
	};

	if(MiseryDebug)then{systemChat "Misery hunger immersion cycle..."};

}, 300, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;

