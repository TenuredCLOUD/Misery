/* -----------------------------------
Misery Dirty Water
Chances parasites
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

private _module=(entities"Misery_Survival")select 0;
//MiseryNORVG=_module getvariable "Misery_SurvivalFramework"; //Misery survival framework 
Miseryturbidwaterchance=_module getvariable "Misery_Waterturbidchance"; //Dirty water causes disease chance

if (alive player) then {

 // if (MiseryNORVG == "ENABLED") exitwith {

  if((random 100) > Miseryturbidwaterchance) exitWith {
  titleText ["You gulp down water that reeked of stagnation. The foul odor was a clear sign of impurity, but your thirst overpowered your judgment. \n As the stale taste lingers, you feel a slight discomfort in your stomach...", "PLAIN DOWN"];
  };

  titleText ["You gulp down water that reeked of stagnation. The foul odor was a clear sign of impurity, but your thirst overpowered your judgment. \n As the stale taste lingers, you feel a slight discomfort in your stomach...", "PLAIN DOWN"];

  player setVariable ["Turbidwaterlogged", true];

  _time = time + 180;
    [_time] spawn {
    	private ["_TimeA"];
    	_TimeA=_this select 0;
    	waitUntil {(!alive player) or (time > _TimeA)};
      player setVariable ["Turbidwaterlogged", nil];
      private _MDebuffs = player getVariable "MiseryDebuffs";
    	if (alive player) then {_MDebuffs pushBackUnique "PARASITES"; player setVariable ["MiseryDebuffs", _MDebuffs];}; //<< sick from bad water
    };

//};
	};