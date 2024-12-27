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

[{!isNil QEGVAR(client,initialized) && alive player},
{
    [{
        params ["_args", "_handle"];

        if (!alive player) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if(EGVAR(common,debug))then{systemChat "[Misery survival] loop cycle terminated..."};
            [] call FUNC(loop);
            if(EGVAR(common,debug))then{systemChat "[Misery survival] loop cycle checks re-initiated..."};
        };

    private ["_rads","_MHunger","_MThirst","_MInfection","_MPoison","_MSleepiness","_MExposure","_MPlayertemp","_ailments","_MSleeppillstaken","_MIsSleeping","_randomnutrient","_randomnutrientweight","_bagweightload","_Playerweight","_Miseryweightdefcalculated","_randomsleepweight","_random"];

    _rads = player getVariable [QCLASS(radiation), 0];
    _MHunger = player getVariable [QCLASS(hunger), MACRO_PLAYER_HUNGER];
    _MThirst = player getVariable [QCLASS(thirst), MACRO_PLAYER_THIRST];
    _MInfection = player getVariable [QCLASS(infection), MACRO_PLAYER_INFECTION];
    _MPoison = player getVariable [QCLASS(toxicity), MACRO_PLAYER_TOXICITY];
    _MSleepiness = player getVariable [QCLASS(energyDeficit), MACRO_PLAYER_FATIGUE];
    _MExposure = player getVariable [QCLASS(exposure), MACRO_PLAYER_EXPOSURE];
    _MPlayertemp = player getVariable [QCLASS(thermalIndex), 0];
    _ailments = player getVariable QCLASS(ailments);

    //Sleep system
    _MSleeppillstaken = player getVariable ["MiserySleeppillstaken", 0];
    _MIsSleeping = player getVariable [QCLASS(isSleeping), false];

    _randomnutrient = [1, 2] call BIS_fnc_randomInt; //random nutrient deficiency hunger or thirst

    if (_randomnutrient == 1) then {
    player setVariable [QCLASS(thirst), (_MThirst - ((GVAR(thirstIncrement))))]; //player setVariable [QCLASS(thirst), (_MThirst -  ((GVAR(thirstIncrement))toFixed 2))];
    }else{
    player setVariable [QCLASS(hunger), (_MHunger - ((GVAR(hungerIncrement))))]; //player setVariable [QCLASS(hunger), (_MHunger -  ((GVAR(hungerIncrement))toFixed 2))];
    };

    //Weight deficiency - Calculates a drop in hunger / thirst depending on weight:
    if (GVAR(weightDeficiency)) then {

    _randomnutrientweight = [1, 2] call BIS_fnc_randomInt; //random nutrient deficiency hunger or thirst

    _bagweightload = loadAbs player / getNumber (configFile >> "CfgInventoryGlobalVariable" >> "maxSoldierLoad");
    _Playerweight = round(_bagweightload * 100);
    _Miseryweightdefcalculated = MACRO_WEIGHTCALC(_Playerweight);

    if (_randomnutrientweight == 1) then {
    player setVariable [QCLASS(thirst), (_MThirst - (_Miseryweightdefcalculated))]; //player setVariable [QCLASS(thirst), (_MThirst -  ((_Miseryweightdefcalculated)))]; //player setVariable [QCLASS(thirst), (_MThirst -  ((_Miseryweightdefcalculated)toFixed 2))];
    }else{
    player setVariable [QCLASS(hunger), (_MHunger - (_Miseryweightdefcalculated))]; //player setVariable [QCLASS(hunger), (_MHunger -  ((_Miseryweightdefcalculated)))]; //player setVariable [QCLASS(hunger), (_MHunger -  ((_Miseryweightdefcalculated)toFixed 2))];
    };

    if !(EGVAR(common,checkMultiplayer)) then { //If SP - and Weight deficiency then start increasing sleepiness var
    _randomsleepweight = [1, 2] call BIS_fnc_randomInt; //random sleep decrease
    if (_randomsleepweight == 1) then {
    _MSleepiness = player getVariable [QCLASS(energyDeficit), MACRO_PLAYER_FATIGUE];
    player setVariable [QCLASS(energyDeficit), (_MSleepiness + (_Miseryweightdefcalculated))]; //player setVariable [QCLASS(energyDeficit), (_MSleepiness +  ((_Miseryweightdefcalculated)))]; //player setVariable [QCLASS(energyDeficit), (_MSleepiness +  ((_Miseryweightdefcalculated)toFixed 2))];
        };
    };
};

    if (EGVAR(common,checkMultiplayer)) then {player setVariable [QCLASS(energyDeficit), MACRO_PLAYER_FATIGUE];
    }else{

        _MSleepiness = player getVariable [QCLASS(energyDeficit), MACRO_PLAYER_FATIGUE];

        player setVariable [QCLASS(energyDeficit), (_MSleepiness + (GVAR(energyDeficitIncrement)))]; //player setVariable [QCLASS(energyDeficit), (_MSleepiness +  ((GVAR(energyDeficitIncrement))))]; //player setVariable [QCLASS(energyDeficit), (_MSleepiness +  ((GVAR(energyDeficitIncrement))toFixed 2))];

        if ((_MSleepiness) >= 35) then {_ailments pushBackUnique "TIRED"; player setVariable [QCLASS(ailments), _ailments];};
        if ((_MSleepiness) < 35) then {_ailments deleteAt (_ailments find "TIRED"); player setVariable [QCLASS(ailments), _ailments];};
        if ((_MSleepiness) >= 35) then {player setVariable [QCLASS(energyDeficit), 35]};
        if ((_MSleepiness) <= 0) then {player setVariable [QCLASS(energyDeficit), 0]};

        //Detect how many sleeping pills player has taken (If 3 or more in short amount of time terminate player):
        if (!isNil {player getVariable ["MiserySleeppillstaken", 0]} && {_MSleeppillstaken >= 3}) then {player setDamage 1};
    };

    //MP "Tired" Debuff removal:
    if (EGVAR(common,checkMultiplayer) && _ailments find "TIRED" != -1) then {_ailments deleteAt (_ailments find "TIRED"); player setVariable [QCLASS(ailments), _ailments];};

    //Blackout due to extreme fatigue:
    _blackout = true;

    if ((_ailments find "TIRED" != -1) && (!_MIsSleeping)) then {

        if ((random 100) >  (GVAR(blackoutChance))) then {_blackout = false};

        if (_blackout) then {
        [player,(1+(random 3))] call EFUNC(common,stun); //Spawn function for new scheduled environment
        };
    };

    if (GVAR(ailments)) then {

    _MHunger = player getVariable [QCLASS(hunger), MACRO_PLAYER_HUNGER];

    if ((_ailments find "PARASITES" != -1)) then {player setVariable [QCLASS(hunger), (_MHunger - ((GVAR(hungerIncrement))))]};     //if ((_ailments find "PARASITES" != -1)) then {player setVariable [QCLASS(hunger), (_MHunger -  ((GVAR(hungerIncrement))toFixed 2))]};
};

//--------------------------------------------------------------------------------------------------------------

    //Radiation:

        if (_rads > 1) then {

        _rads = player getVariable [QCLASS(radiation), 0];

        player setVariable [QCLASS(radiation), (_rads) - EGVAR(radiation,healingVal)];
        };

            _rads = player getVariable [QCLASS(radiation), 0];

            _random = [1, 10] call BIS_fnc_randomInt; //random event for parasite removal

            if (_random == 5 && _rads > 1000 && GVAR(ailments)) then {

            if (_ailments find "PARASITES" != -1) then {_ailments deleteAt (_ailments find "PARASITES"); player setVariable [QCLASS(ailments), _ailments];};
        };

    //Poison:
    _MPoison = player getVariable [QCLASS(toxicity), MACRO_PLAYER_TOXICITY];

    if (_MPoison > 0 && GVAR(ailments)) then {

        _MPoison = player getVariable [QCLASS(toxicity), MACRO_PLAYER_TOXICITY];

        _ailments pushBackUnique "POISON"; player setVariable [QCLASS(ailments), _ailments];

        if (_MPoison > 15) then {[player,(_MPoison / 100)] call EFUNC(common,specialDamage)};

        player setVariable [QCLASS(toxicity), (_MPoison - ((GVAR(toxicityHealing))))]; //player setVariable [QCLASS(toxicity), (_MPoison -  ((GVAR(toxicityHealing))toFixed 2))];
};

    if (_MPoison <= 0) then {_ailments deleteAt (_ailments find "POISON"); player setVariable [QCLASS(ailments), _ailments];};

    //Infection:
    _MInfection = player getVariable [QCLASS(infection), MACRO_PLAYER_INFECTION];

    if(_MInfection > 0 && GVAR(ailments))then{

        _MInfection = player getVariable [QCLASS(infection), MACRO_PLAYER_INFECTION];

        _ailments pushBackUnique "INFECTION"; player setVariable [QCLASS(ailments), _ailments];

        if (_MInfection > 15) then {[player,(_MInfection / 100)] call EFUNC(common,specialDamage)};

        player setVariable [QCLASS(infection), (_MInfection - ((GVAR(infectionHealing))))]; //player setVariable [QCLASS(infection), (_MInfection -  ((GVAR(infectionHealing))toFixed 2))];
    };

    if(_MInfection <= 0) then {_ailments deleteAt (_ailments find "INFECTION"); player setVariable [QCLASS(ailments), _ailments];};

            _MHunger = player getVariable [QCLASS(hunger), MACRO_PLAYER_HUNGER];
            _MThirst = player getVariable [QCLASS(thirst), MACRO_PLAYER_THIRST];

            if(_MHunger > 100) then {player setVariable [QCLASS(hunger), MACRO_PLAYER_HUNGER]};

             if(_MHunger <= 0)then{[player,100] call EFUNC(common,specialDamage)}; //Kill the player on "0" hunger

            if(_MThirst > 100) then {player setVariable [QCLASS(thirst), MACRO_PLAYER_THIRST]};

             if(_MThirst <= 0)then{[player,100] call EFUNC(common,specialDamage)}; //Kill the player on "0" thirst

    //--------------------------------------------------------------------------------------------------------------

    // Start temperature simulation (if enabled):

    if (EGVAR(temperature,enable)) then {

    _MExposure = player getVariable [QCLASS(exposure), MACRO_PLAYER_EXPOSURE];

    [player] call EFUNC(temperature,warmup);
    [player] call EFUNC(temperature,overtemp);
    [player] call EFUNC(temperature,sick);
    [player] call EFUNC(temperature,cold);
    [player] call EFUNC(temperature,water);
    [player] call EFUNC(temperature,effectiveTemperature);

    if (MiseryBreathFogAllowed) then {
    if (isNil{player getVariable QCLASS(breathCondensationEffect)}) then {
    [] call EFUNC(temperature,breathFog);
    };
};

    if (_MExposure <= -25) then {player setVariable [QCLASS(exposure), -25];};
    if (_MExposure >= 25) then {player setVariable [QCLASS(exposure), 25];};


        if ((_MExposure <= -25 || _MExposure >= 25) || (_MPlayertemp <= -30 || _MPlayertemp >= 55)) then {

            if((random 100)>90)then{

                [player,100] call EFUNC(common,specialDamage); //Kills player
            };
        }; //Over exposure death / -30C or 55+C
    };

    if (EGVAR(common,debug)) then {systemChat "[Misery survival] loop cycle..."};

}, GVAR(cycle), []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
