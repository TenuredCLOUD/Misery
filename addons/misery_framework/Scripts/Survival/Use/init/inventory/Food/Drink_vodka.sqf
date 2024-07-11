/* -----------------------------------
Misery Vodka usage
Designed specifically for Misery mod (also compatible with Ravage)
by TenuredCLOUD 
*/

#include "\z\misery\addons\misery_framework\Scripts\Misery_PreParser.hpp"

private _MSleepiness = player getVariable ["MiserySleepiness", MIS_SLEEP];
private _MFear = player getVariable ["MiseryFear", MIS_FEAR];

if (!hasInterface) exitWith {};

  if (alive player) exitwith {

  if ((count(entities"Misery_FearFramework")) > 0) then {
	player setVariable ["MiseryFear", (_MFear - 5)];
	if (_MFear <= 0) then {player setVariable ["MiseryFear", 0]};
  };

// if ((MiseryNORVG=="ENABLED") && !(MiseryMP)) then {
if !(MiseryMP) then {
  player setVariable ["MiserySleepiness", (_MSleepiness + 15)];
};

  //This snippet is an altered version from Anti rad pills usage from Ravage mod, permission was requested before use:
_compteur = 0;
player setVariable ["_antirad", true];
if (isNil {player getVariable "radMonitorON"}) then {
	0 = [] spawn rvg_fnc_radMonitor;
};
while {_compteur < 500} do {
	enableCamShake true;
	addCamShake [2, 15, 2];
	_effectSpeed = 1 + random 5;
	player setVariable ["_radToRemove", ((player getVariable ["_radToRemove", 0]) + _effectSpeed)];
	_compteur = _compteur + _effectSpeed;
	sleep 1;
};
player setVariable ["_antirad", nil];

};




