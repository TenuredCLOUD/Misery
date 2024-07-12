#include "\z\misery\addons\misery_framework\Scripts\Misery_PreParser.hpp"

/*
Misery advanced radiation exposure
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

//ACE check for dmg:
MiseryACE=FALSE;
if (isClass(configFile>>"cfgPatches">>"ace_main"))then{MiseryACE=TRUE};

[{(player getVariable ["MiseryRadiation", 0]) >= 500},
{
	[{
		params ["_args", "_handle"];

		if (((player getVariable ["MiseryRadiation", 0]) < 500) || (!alive player)) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			if(MiseryDebug)then{systemChat "Misery Rad exposure enh+ cycle terminated..."};
			[] execVM MIS_FILESYS(Survival\Radiation\radiationex);
			if(MiseryDebug)then{systemChat "Misery Rad exposure enh+ cycle checks re-initiated..."};
		};

		private ["_MHunger","_MThirst","_Rhunger","_Rthirst","_radlvl","_scalednutrientloss","_scaledstaminaloss","_damage"];

		_MHunger = player getVariable ["MiseryHunger", MIS_HUNGER];
		_MThirst = player getVariable ["MiseryThirst", MIS_THIRST];
		_radlvl = player getVariable ["MiseryRadiation", 0];

		//calculation for hunger / thirst removal: (scales with radiation exposure)
		_scalednutrientloss = MISERY_SCALEDNUTRLOSS(_radlvl); 

		//calculation for stamina loss: (scales with radiation exposure)
		_scaledstaminaloss = MISERY_SCALEDSTAMLOSS(_radlvl); 

		if (_radlvl >= 500) then {

						_MHunger = player getVariable ["MiseryHunger", MIS_HUNGER];
						_MThirst = player getVariable ["MiseryThirst", MIS_THIRST];

						player setstamina ((getStamina player) - _scaledstaminaloss);

						addCamShake [1, 5, 10];

						player setVariable ["MiseryHunger", (_MHunger - ((MiseryHungerIncrement)))];
						player setVariable ["MiseryHunger", (_MHunger - ((MiseryHungerIncrement)))];
						
						// player setVariable ["MiseryHunger", (_MHunger - ((MiseryHungerIncrement)toFixed 2))];
						// player setVariable ["MiseryHunger", (_MHunger - ((MiseryHungerIncrement)toFixed 2))];
						if !(Goggles player in antirad_goggles || vest player in antirad_vests) then {
						player say3D ["Cough",10,1,2,0];
						}else{
						if (Goggles player in antirad_goggles || vest player in antirad_vests) then {
						player say3D ["CoughMuffled",10,1,2,0];

				};
			};
		};

		if (_radlvl >= 9500) then  {

			if (MiseryACE) then {
			[player, 1, "head", "stab"] call ace_medical_fnc_addDamageToUnit;
			[player, 1, "body", "stab"] call ace_medical_fnc_addDamageToUnit;
			}else{
			_damage = damage player;
			player setDamage (_damage + 1); //No ACE damage 
			};

		}; 

	if(MiseryDebug)then{systemChat "Misery Rad exposure enh+ cycle..."};

	}, 120, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
