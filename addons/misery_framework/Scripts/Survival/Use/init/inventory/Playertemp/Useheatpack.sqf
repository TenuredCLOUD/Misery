/* -----------------------------------
Misery Heatpack usage
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

#include "\z\misery\addons\misery_framework\Scripts\Misery_PreParser.hpp"

private _MExposure = player getVariable ["MiseryExposure", MIS_EXPOSURE];

if (!hasInterface) exitWith {};

	if (alive player) exitwith {

	titleText ["You use a heat pack...", "PLAIN DOWN"];

    player removeitem "Misery_Heatpack";

sleep 60;

if (_MExposure < 0) then { 
	
	player setVariable ["MiseryExposure", MIS_EXPOSURE];

}else{

if (_MExposure > 0) then {

	player setVariable ["MiseryExposure", (_MExposure + 5)];

		};
	};
};
