/*
Misery Main Survival loop 
Client survival loop runs after Client settings are defined
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

//Enforce client only loop:
if !(hasInterface) exitWith {};

#include "\z\misery\addons\misery_framework\Scripts\Misery_PreParser.hpp"

[{!isNil "MiseryClientReady" && alive player},
{
	[{
		params ["_args", "_handle"];

		if (!alive player) exitWith {
			[_handle] call CBA_fnc_removePerFrameHandler;
			//Ravage geiger var: (kill geiger on death)
			player setVariable ["GeigerON", nil];
			if(MiseryDebug)then{systemChat "Misery Survival loop cycle terminated..."};
			[] execVM MIS_FILESYS(Survival\Survival_loop);
			if(MiseryDebug)then{systemChat "Misery Survival loop cycle checks re-initiated..."};
		};

	private ["_rads","_MHunger","_MThirst","_MInfection","_MPoison","_MSleepiness","_MExposure","_MPlayertemp","_Rhunger","_MDebuffs","_MSleeppillstaken","_MIsSleeping","_randomnutrient","_randomnutrientweight","_bagweightload","_Playerweight","_Miseryweightdefcalculated","_randomsleepweight","_random"];

	_rads = player getVariable ["MiseryRadiation", 0]; 
	_MHunger = player getVariable ["MiseryHunger", MIS_HUNGER];
	_MThirst = player getVariable ["MiseryThirst", MIS_THIRST];
	_MInfection = player getVariable ["MiseryInfection", MIS_INFECTION];
	_MPoison = player getVariable ["MiseryPoison", MIS_POISON];
	_MSleepiness = player getVariable ["MiserySleepiness", MIS_SLEEP];
	_MExposure = player getVariable ["MiseryExposure", MIS_EXPOSURE];
	_MPlayertemp = player getVariable ["MiseryPlayerTemp", 0];
	_Rhunger = player getVariable ["hunger", 100];
	_MDebuffs = player getVariable "MiseryDebuffs";
	
	//Sleep system
	_MSleeppillstaken = player getVariable ["MiserySleeppillstaken", 0];
	_MIsSleeping = player getVariable ["Misery_IsSleeping", false];

	_randomnutrient = [1, 2] call BIS_fnc_randomInt; //random nutrient deficiency hunger or thirst

	// if (MiseryNORVG==1) then { 

	if (_randomnutrient == 1) then {	
	player setVariable ["MiseryThirst", (_MThirst - ((MiseryThirstIncrement)))]; //player setVariable ["MiseryThirst", (_MThirst -  ((MiseryThirstIncrement)toFixed 2))];
	}else{
	player setVariable ["MiseryHunger", (_MHunger - ((MiseryHungerIncrement)))]; //player setVariable ["MiseryHunger", (_MHunger -  ((MiseryHungerIncrement)toFixed 2))];
	};

	//}; //If scenario designer doesn't change hunger / thirst rates for misery thirst / hunger then they will not calc if Rvg is being used 

	//Weight deficiency - Calculates a drop in hunger / thirst depending on weight:
	if (MiseryWeightdeficiency == 1) then {

	_randomnutrientweight = [1, 2] call BIS_fnc_randomInt; //random nutrient deficiency hunger or thirst
	
	_bagweightload = loadAbs player / getNumber (configFile >> "CfgInventoryGlobalVariable" >> "maxSoldierLoad");
	_Playerweight = round(_bagweightload * 100);
	_Miseryweightdefcalculated = MISERY_WEIGHTCALC(_Playerweight);

	if (_randomnutrientweight == 1) then {	
	player setVariable ["MiseryThirst", (_MThirst - (_Miseryweightdefcalculated))]; //player setVariable ["MiseryThirst", (_MThirst -  ((_Miseryweightdefcalculated)))]; //player setVariable ["MiseryThirst", (_MThirst -  ((_Miseryweightdefcalculated)toFixed 2))];
	}else{
	player setVariable ["MiseryHunger", (_MHunger - (_Miseryweightdefcalculated))]; //player setVariable ["MiseryHunger", (_MHunger -  ((_Miseryweightdefcalculated)))]; //player setVariable ["MiseryHunger", (_MHunger -  ((_Miseryweightdefcalculated)toFixed 2))];
	};

	if !(MiseryMP) then { //If SP - and Weight deficiency then start increasing sleepiness var
	_randomsleepweight = [1, 2] call BIS_fnc_randomInt; //random sleep decrease
	if (_randomsleepweight == 1) then {
	_MSleepiness = player getVariable ["MiserySleepiness", MIS_SLEEP];
	player setVariable ["MiserySleepiness", (_MSleepiness + (_Miseryweightdefcalculated))]; //player setVariable ["MiserySleepiness", (_MSleepiness +  ((_Miseryweightdefcalculated)))]; //player setVariable ["MiserySleepiness", (_MSleepiness +  ((_Miseryweightdefcalculated)toFixed 2))];
		};
	};
};

	if (MiseryMP) then {player setVariable ["MiserySleepiness", MIS_SLEEP];
	}else{

		//if (MiseryNORVG==1) then { //Only calculate Misery sleep system if using Misery framework 

		_MSleepiness = player getVariable ["MiserySleepiness", MIS_SLEEP];

		player setVariable ["MiserySleepiness", (_MSleepiness + (MiserySleepinessIncrement))]; //player setVariable ["MiserySleepiness", (_MSleepiness +  ((MiserySleepinessIncrement)))]; //player setVariable ["MiserySleepiness", (_MSleepiness +  ((MiserySleepinessIncrement)toFixed 2))];

		if ((_MSleepiness) >= 35) then {_MDebuffs pushBackUnique "TIRED"; player setVariable ["MiseryDebuffs", _MDebuffs];};
		if ((_MSleepiness) < 35) then {_MDebuffs deleteAt (_MDebuffs find "TIRED"); player setVariable ["MiseryDebuffs", _MDebuffs];};
		if ((_MSleepiness) >= 35) then {player setVariable ["MiserySleepiness", 35]};
		if ((_MSleepiness) <= 0) then {player setVariable ["MiserySleepiness", 0]};

		//Detect how many sleeping pills player has taken (If 3 or more in short amount of time terminate player):
		if (!isNil {player getVariable ["MiserySleeppillstaken", 0]} && {_MSleeppillstaken >= 3}) then {player setDamage 1};
		//};
	};

	//MP "Tired" Debuff removal:
	if (MiseryMP && _MDebuffs find "TIRED" != -1) then {_MDebuffs deleteAt (_MDebuffs find "TIRED"); player setVariable ["MiseryDebuffs", _MDebuffs];};

	//Blackout due to extreme fatigue:
	_blackout = true;

	//if ((MiseryNORVG==1) && (_MDebuffs find "TIRED" != -1) && (_MIsSleeping == false)) then {
	if ((_MDebuffs find "TIRED" != -1) && (_MIsSleeping == false)) then {

		if ((random 100) >  (MiseryBlackoutChance)) then {_blackout = false};

		if (_blackout == true) then {
		[player,(1+(random 3))] spawn Misery_fnc_Stun; //Spawn function for new scheduled environment
		};
	};

	if (MiseryAilments == 1) then {

	_MHunger = player getVariable ["MiseryHunger", MIS_HUNGER];

	if ((_MDebuffs find "PARASITES" != -1)) then {player setVariable ["MiseryHunger", (_MHunger - ((MiseryHungerIncrement)))]};	 //if ((_MDebuffs find "PARASITES" != -1)) then {player setVariable ["MiseryHunger", (_MHunger -  ((MiseryHungerIncrement)toFixed 2))]};	
};

//--------------------------------------------------------------------------------------------------------------

	//Radiation:

		if (_rads > 1) then {

		_rads = player getVariable ["MiseryRadiation", 0];

		player setVariable ["MiseryRadiation", (_rads) - MiseryRadiationHealing]; 
		};

			_rads = player getVariable ["MiseryRadiation", 0];

			_random = [1, 10] call BIS_fnc_randomInt; //random event for parasite removal 

			if (_random == 5 && _rads > 1000 && MiseryAilments == 1) then {

			if (_MDebuffs find "PARASITES" != -1) then {_MDebuffs deleteAt (_MDebuffs find "PARASITES"); player setVariable ["MiseryDebuffs", _MDebuffs];};
		};

	//Poison:
	_MPoison = player getVariable ["MiseryPoison", MIS_POISON];

	if (_MPoison > 0 && MiseryAilments == 1) then {
		
		_MPoison = player getVariable ["MiseryPoison", MIS_POISON];
		
		_MDebuffs pushBackUnique "POISON"; player setVariable ["MiseryDebuffs", _MDebuffs];
		
		if (_MPoison > 15) then {[player,(_MPoison / 100)]call Misery_fnc_SpecialDamage};

		player setVariable ["MiseryPoison", (_MPoison - ((MiseryPoisonHealing)))]; //player setVariable ["MiseryPoison", (_MPoison -  ((MiseryPoisonHealing)toFixed 2))];
};

	if (_MPoison <= 0) then {_MDebuffs deleteAt (_MDebuffs find "POISON"); player setVariable ["MiseryDebuffs", _MDebuffs];};

	//Infection:
	_MInfection = player getVariable ["MiseryInfection", MIS_INFECTION];

	if(_MInfection > 0 && MiseryAilments == 1)then{
		
		_MInfection = player getVariable ["MiseryInfection", MIS_INFECTION];
		
		_MDebuffs pushBackUnique "INFECTION"; player setVariable ["MiseryDebuffs", _MDebuffs];
		
		if (_MInfection > 15) then {[player,(_MInfection / 100)]call Misery_fnc_SpecialDamage};
		
		player setVariable ["MiseryInfection", (_MInfection - ((MiseryInfectionHealing)))]; //player setVariable ["MiseryInfection", (_MInfection -  ((MiseryInfectionHealing)toFixed 2))];
	};

	if(_MInfection <= 0) then {_MDebuffs deleteAt (_MDebuffs find "INFECTION"); player setVariable ["MiseryDebuffs", _MDebuffs];};

			_MHunger = player getVariable ["MiseryHunger", MIS_HUNGER];
			_MThirst = player getVariable ["MiseryThirst", MIS_THIRST];

			if(_MHunger > 100) then {player setVariable ["MiseryHunger", MIS_HUNGER]};

	 		if(_MHunger <= 0)then{[player,100]call Misery_fnc_SpecialDamage}; //Kill the player on "0" hunger

			if(_MThirst > 100) then {player setVariable ["MiseryThirst", MIS_THIRST]};

	 		if(_MThirst <= 0)then{[player,100]call Misery_fnc_SpecialDamage}; //Kill the player on "0" thirst

	//--------------------------------------------------------------------------------------------------------------

	// Start temperature simulation (if enabled):

	if (MiseryTemperature == 1) then { 

	_MExposure = player getVariable ["MiseryExposure", MIS_EXPOSURE];
	
	[player] call Misery_fnc_Warmup;
	[player] call Misery_fnc_Overtemp;
	[player] call Misery_fnc_Sick;
	[player] call Misery_fnc_Cold;
	[player] call Misery_fnc_Water;
	[player] call Misery_fnc_EffectiveTemperature;

	if (MiseryBreathFogAllowed == true) then {
	if (isNil{player getVariable "MiseryBreathFogSim"}) then {
    [] execVM MIS_FILESYS(Survival\Functions\Temperature\BreathFog);
	};
};

	if (_MExposure <= -25) then {player setVariable ["MiseryExposure", -25];};
	if (_MExposure >= 25) then {player setVariable ["MiseryExposure", 25];};


		if ((_MExposure <= -25 || _MExposure >= 25) || (_MPlayertemp <= -30 || _MPlayertemp >= 55)) then { 

			if((random 100)>90)then{

				[player,100]call Misery_fnc_SpecialDamage; //Kills player
			};
		}; //Over exposure death / -30C or 55+C  
	};

	if(MiseryDebug)then{systemChat "Misery Survival loop cycle..."};

}, MiserySurvivalCycle, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
