#include "\z\misery\addons\main\script_macros.hpp"

/*
Misery WBKIMS Dash Compat
Enforces a stamina / fatigue depletion when player uses IMS sprint movesets
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

[{(animationState player in IMSSPRINT)},
{

	[{
		params ["_args", "_handle"];

		if (!(animationState player in IMSSPRINT) || (!alive player) || (getFatigue player >= 0.99)) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			if(MiseryDebug)then{systemChat "Misery WBKIMS Dash Compat cycle terminated..."};
			if (animationState player == "am_kulak_sprintf") then {
		//	player switchMove "am_kulak_idle"; // Forcefully stop the animation
			player playMoveNow "am_kulak_idle"; //Force anim delay
			};
			{
    		if ((animationState player == _x) && _x != "am_kulak_sprintf") then {
        //	player switchMove "melee_armed_idle"; // Forcefully stop the animation
			player playMoveNow "melee_armed_idle"; //Force anim delay
    		};
			} forEach IMSSPRINT;
			[] execVM "\z\misery\addons\ims\functions\fnc_IMSDash.sqf";
			if(MiseryDebug)then{systemChat "Misery WBKIMS Dash Compat cycle checks re-initiated..."};
		};

	if (animationState player in IMSSPRINT) then {
		player setFatigue (getFatigue player + 0.01);
	};

	if(MiseryDebug)then{systemChat "Misery WBKIMS Dash Compat cycle..."};

}, 0.1, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;

