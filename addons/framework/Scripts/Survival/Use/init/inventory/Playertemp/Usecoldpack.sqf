#include "\z\misery\addons\framework\scripts\Misery_PreParser.hpp"

/*
	Misery Coldpack usage
	Designed specifically for Misery mod
	by TenuredCLOUD
*/

private _MExposure = player getVariable ["MiseryExposure", MIS_EXPOSURE];

if (!hasInterface) exitWith {};

if (alive player) exitWith {
	titleText ["You use a cold pack...", "PLAIN DOWN"];

	player removeitem "Misery_Coldpack";

	sleep 60;

	if (_MExposure > 0) then {
		player setVariable ["MiseryExposure", MIS_EXPOSURE];// reset exposure to 0; from overheat
	} else {
		if (_MExposure < 0) then {
			player setVariable ["MiseryExposure", (_MExposure - 5)];
		};
	};
};