/* -----------------------------------
Misery Beer usage
Designed specifically for Misery mod (also compatible with Ravage)
by TenuredCLOUD 
-------------------------------------- */

#include "\z\misery\addons\misery_framework\Scripts\Misery_PreParser.hpp"

private _MSleepiness = player getVariable ["MiserySleepiness", MIS_SLEEP];
private _MFear = player getVariable ["MiseryFear", MIS_FEAR];

if (!hasInterface) exitWith {};

  if (alive player) exitwith {

  if ((count(entities"Misery_FearFramework")) > 0) then {
	player setVariable ["MiseryFear", (_MFear - 2)];
	if (_MFear <= 0) then {player setVariable ["MiseryFear", 0]};
  };

//if ((MiseryNORVG=="ENABLED") && !(MiseryMP)) then {
if !(MiseryMP) then {
  player setVariable ["MiserySleepiness", (_MSleepiness + 5)];
};

enableCamShake true;
addCamShake [1, 10, 2];

};

