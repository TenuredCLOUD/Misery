#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Main survival loop
 * Client survival loop runs after Client settings are defined
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_survival_fnc_loop;
 *
 * Public: No
*/

//Enforce client only loop:
if !(hasInterface) exitWith {};

[{!isNil "MiseryClientReady" && alive player},
{
    [{
        params ["_args", "_handle"];

        if (!alive player) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if(MiseryDebug)then{systemChat "Misery survival loop cycle terminated..."};
            [] call FUNC(loop);
            if(MiseryDebug)then{systemChat "Misery survival loop cycle checks re-initiated..."};
        };

    private ["_rads","_MHunger","_MThirst","_MInfection","_MPoison","_MSleepiness","_MExposure","_MPlayertemp","_Rhunger","_MDebuffs","_MSleeppillstaken","_MIsSleeping","_randomnutrient","_randomnutrientweight","_bagweightload","_Playerweight","_Miseryweightdefcalculated","_randomsleepweight","_random"];

    _rads = player getVariable ["MiseryRadiation", 0];
    _MHunger = player getVariable ["MiseryHunger", MACRO_PLAYER_HUNGER];
    _MThirst = player getVariable ["MiseryThirst", MACRO_PLAYER_THIRST];
    _MInfection = player getVariable ["MiseryInfection", MACRO_PLAYER_INFECTION];
    _MPoison = player getVariable ["MiseryPoison", MACRO_PLAYER_TOXICITY];
    _MSleepiness = player getVariable ["MiserySleepiness", MACRO_PLAYER_FATIGUE];
    _MExposure = player getVariable ["MiseryExposure", MACRO_PLAYER_EXPOSURE];
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
    _Miseryweightdefcalculated = MACRO_WEIGHTCALC(_Playerweight);

    if (_randomnutrientweight == 1) then {
    player setVariable ["MiseryThirst", (_MThirst - (_Miseryweightdefcalculated))]; //player setVariable ["MiseryThirst", (_MThirst -  ((_Miseryweightdefcalculated)))]; //player setVariable ["MiseryThirst", (_MThirst -  ((_Miseryweightdefcalculated)toFixed 2))];
    }else{
    player setVariable ["MiseryHunger", (_MHunger - (_Miseryweightdefcalculated))]; //player setVariable ["MiseryHunger", (_MHunger -  ((_Miseryweightdefcalculated)))]; //player setVariable ["MiseryHunger", (_MHunger -  ((_Miseryweightdefcalculated)toFixed 2))];
    };

    if !(MiseryMP) then { //If SP - and Weight deficiency then start increasing sleepiness var
    _randomsleepweight = [1, 2] call BIS_fnc_randomInt; //random sleep decrease
    if (_randomsleepweight == 1) then {
    _MSleepiness = player getVariable ["MiserySleepiness", MACRO_PLAYER_FATIGUE];
    player setVariable ["MiserySleepiness", (_MSleepiness + (_Miseryweightdefcalculated))]; //player setVariable ["MiserySleepiness", (_MSleepiness +  ((_Miseryweightdefcalculated)))]; //player setVariable ["MiserySleepiness", (_MSleepiness +  ((_Miseryweightdefcalculated)toFixed 2))];
        };
    };
};

    if (MiseryMP) then {player setVariable ["MiserySleepiness", MACRO_PLAYER_FATIGUE];
    }else{

        //if (MiseryNORVG==1) then { //Only calculate Misery sleep system if using Misery framework

        _MSleepiness = player getVariable ["MiserySleepiness", MACRO_PLAYER_FATIGUE];

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

    //if ((MiseryNORVG==1) && (_MDebuffs find "TIRED" != -1) && (!_MIsSleeping)) then {
    if ((_MDebuffs find "TIRED" != -1) && (!_MIsSleeping)) then {

        if ((random 100) >  (MiseryBlackoutChance)) then {_blackout = false};

        if (_blackout) then {
        [player,(1+(random 3))] call EFUNC(common,stun); //Spawn function for new scheduled environment
        };
    };

    if (MiseryAilments == 1) then {

    _MHunger = player getVariable ["MiseryHunger", MACRO_PLAYER_HUNGER];

    if ((_MDebuffs find "PARASITES" != -1)) then {player setVariable ["MiseryHunger", (_MHunger - ((MiseryHungerIncrement)))]};     //if ((_MDebuffs find "PARASITES" != -1)) then {player setVariable ["MiseryHunger", (_MHunger -  ((MiseryHungerIncrement)toFixed 2))]};
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
    _MPoison = player getVariable ["MiseryPoison", MACRO_PLAYER_TOXICITY];

    if (_MPoison > 0 && MiseryAilments == 1) then {

        _MPoison = player getVariable ["MiseryPoison", MACRO_PLAYER_TOXICITY];

        _MDebuffs pushBackUnique "POISON"; player setVariable ["MiseryDebuffs", _MDebuffs];

        if (_MPoison > 15) then {[player,(_MPoison / 100)] call EFUNC(common,specialDamage)};

        player setVariable ["MiseryPoison", (_MPoison - ((MiseryPoisonHealing)))]; //player setVariable ["MiseryPoison", (_MPoison -  ((MiseryPoisonHealing)toFixed 2))];
};

    if (_MPoison <= 0) then {_MDebuffs deleteAt (_MDebuffs find "POISON"); player setVariable ["MiseryDebuffs", _MDebuffs];};

    //Infection:
    _MInfection = player getVariable ["MiseryInfection", MACRO_PLAYER_INFECTION];

    if(_MInfection > 0 && MiseryAilments == 1)then{

        _MInfection = player getVariable ["MiseryInfection", MACRO_PLAYER_INFECTION];

        _MDebuffs pushBackUnique "INFECTION"; player setVariable ["MiseryDebuffs", _MDebuffs];

        if (_MInfection > 15) then {[player,(_MInfection / 100)] call EFUNC(common,specialDamage)};

        player setVariable ["MiseryInfection", (_MInfection - ((MiseryInfectionHealing)))]; //player setVariable ["MiseryInfection", (_MInfection -  ((MiseryInfectionHealing)toFixed 2))];
    };

    if(_MInfection <= 0) then {_MDebuffs deleteAt (_MDebuffs find "INFECTION"); player setVariable ["MiseryDebuffs", _MDebuffs];};

            _MHunger = player getVariable ["MiseryHunger", MACRO_PLAYER_HUNGER];
            _MThirst = player getVariable ["MiseryThirst", MACRO_PLAYER_THIRST];

            if(_MHunger > 100) then {player setVariable ["MiseryHunger", MACRO_PLAYER_HUNGER]};

             if(_MHunger <= 0)then{[player,100] call EFUNC(common,specialDamage)}; //Kill the player on "0" hunger

            if(_MThirst > 100) then {player setVariable ["MiseryThirst", MACRO_PLAYER_THIRST]};

             if(_MThirst <= 0)then{[player,100] call EFUNC(common,specialDamage)}; //Kill the player on "0" thirst

    //--------------------------------------------------------------------------------------------------------------

    // Start temperature simulation (if enabled):

    if (MiseryTemperature == 1) then {

    _MExposure = player getVariable ["MiseryExposure", MACRO_PLAYER_EXPOSURE];

    [player] call EFUNC(temperature,warmup);
    [player] call EFUNC(temperature,overtemp);
    [player] call EFUNC(temperature,sick);
    [player] call EFUNC(temperature,cold);
    [player] call EFUNC(temperature,water);
    [player] call EFUNC(temperature,effectiveTemperature);

    if (MiseryBreathFogAllowed) then {
    if (isNil{player getVariable "MiseryBreathFogSim"}) then {
    [] call "\z\misery\addons\temperature\functions\fnc_BreathFog.sqf";
    };
};

    if (_MExposure <= -25) then {player setVariable ["MiseryExposure", -25];};
    if (_MExposure >= 25) then {player setVariable ["MiseryExposure", 25];};


        if ((_MExposure <= -25 || _MExposure >= 25) || (_MPlayertemp <= -30 || _MPlayertemp >= 55)) then {

            if((random 100)>90)then{

                [player,100] call EFUNC(common,specialDamage); //Kills player
            };
        }; //Over exposure death / -30C or 55+C
    };

    if(MiseryDebug)then{systemChat "Misery survival loop cycle..."};

}, MiserysurvivalCycle, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
