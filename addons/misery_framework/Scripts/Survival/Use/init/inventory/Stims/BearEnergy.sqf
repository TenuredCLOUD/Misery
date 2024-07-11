/* -----------------------------------
Misery BearEnergy usage
Designed specifically for Misery mod (also compatible with Ravage)
by TenuredCLOUD 
*/

#include "\z\misery\addons\misery_framework\Scripts\Misery_PreParser.hpp"

_MSleepiness = player getVariable ["MiserySleepiness", MIS_SLEEP];

if (!hasInterface) exitWith {};

  if (alive player) exitwith {

if !(MiseryMP) then {
  player setVariable ["MiserySleepiness", (_MSleepiness - 10)];
};

};

