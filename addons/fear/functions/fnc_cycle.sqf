#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Fear cycle
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fear_fnc_cycle
 *
*/

[{!(isNil {player getVariable QCLASS(psycosis)}) && alive player},
{

[{
        params ["_args","_handle"];

        if (!alive player) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if(EGVAR(common,debug))then{systemChat "Misery Fear cycle terminated..."};
            [] call FUNC(cycle);
            if(EGVAR(common,debug))then{systemChat "Misery Fear cycle checks re-initiated..."};
        };

    private ["_MFear","_randomzedval","_fearzedadd","_randomphantomval","_fearphantomadd","_randomspookval","_fearspookadd","_randomnightval","_fearnightadd","_randomnightnofear","_fearnightnofear","_randompsyval","_fearpsyadd"];

    //Fear var
    _MFear = player getVariable [QCLASS(psycosis), MACRO_PLAYER_FEAR];

if (!(isNil {player getVariable QCLASS(psycosis)})) then {

    if (MiseryFearNight == 1) then {
    if (dayTime >= 5 && dayTime < 18) then {
    player setVariable [QCLASS(psycosis), (_MFear - ((MiseryFearHealing)))]; //player setVariable [QCLASS(psycosis), (_MFear - ((MiseryFearHealing)toFixed 2))];
    if (_MFear <= 0) then {player setVariable [QCLASS(psycosis), 0]};
    };
    }else{
    player setVariable [QCLASS(psycosis), (_MFear - ((MiseryFearHealing)))]; //player setVariable [QCLASS(psycosis), (_MFear - ((MiseryFearHealing)toFixed 2))];
    if (_MFear <= 0) then {player setVariable [QCLASS(psycosis), 0]};
    };

    if (MiseryFearRvg == 1) then {
     if (call FUNC(nearZed)) then {

        _randomzedval = floor random RavageFear;
        _fearzedadd = MACRO_FEAR_CALC_RAVAGE(_randomzedval); //- random calc for fear add

        player setVariable [QCLASS(psycosis), (_MFear + ((_fearzedadd)))]; //player setVariable [QCLASS(psycosis), (_MFear + ((_fearzedadd)toFixed 2))];

        if (_MFear >= 25) then {player setVariable [QCLASS(psycosis), 25]}; //Stop from going over 25
     };
    };

      if (MiseryFearRem == 1) then {
      if (call FUNC(nearPhantom)) then {

        _randomphantomval = floor random RemnantFear;
        _fearphantomadd = MACRO_FEAR_CALC_PHANTOM(_randomphantomval);

        player setVariable [QCLASS(psycosis), (_MFear + ((_fearphantomadd)))]; //player setVariable [QCLASS(psycosis), (_MFear + ((_fearphantomadd)toFixed 2))];

        if (_MFear >= 25) then {player setVariable [QCLASS(psycosis), 25]};
     };
      };

      if (MiseryFearDSA == 1) then {
      if (call FUNC(nearSpook)) then {

        _randomspookval = floor random DSAFear;
        _fearspookadd = MACRO_FEAR_CALC_DSASPOOK(_randomspookval);

        player setVariable [QCLASS(psycosis), (_MFear + ((_fearspookadd)))]; //player setVariable [QCLASS(psycosis), (_MFear + ((_fearspookadd)toFixed 2))];

        if (_MFear >= 25) then {player setVariable [QCLASS(psycosis), 25]};
     };
      };

    if (MiseryFearNight == 1) then {
    if (dayTime >= 18 || dayTime < 5) then {
        _randomnightval = floor random NightFear;
        _fearnightadd = MACRO_FEAR_CALC_NIGHT(_randomnightval);

        //Reduce sanity (outside in darkness)
        player setVariable [QCLASS(psycosis), (_MFear + ((_fearnightadd)))]; //player setVariable [QCLASS(psycosis), (_MFear + ((_fearnightadd)toFixed 2))];
        if (MiseryFear >= 25) then {player setVariable [QCLASS(psycosis), 25]};

        if ((insideBuilding player == 1) || ([player] call EFUNC(common,NearFire))) then {
        _randomnightnofear = (((NightFear) + NightFear) * 2);
        _fearnightnofear = MACRO_FEAR_CALC_NIGHT(_randomnightnofear);
        //Gain back sanity (inside or near fire)
        player setVariable [QCLASS(psycosis), (_MFear - ((_fearnightnofear)))]; //player setVariable [QCLASS(psycosis), (_MFear - ((_fearnightnofear)toFixed 2))];
        if (_MFear <= 0) then {player setVariable [QCLASS(psycosis), 0]};
    };
    };

     };

     if (MiseryFearPsy == 1) then {
    if (MiseryinPsyfield) then {

        _randompsyval = floor random PsyFear;
        _fearpsyadd = MACRO_FEAR_CALC_PSYFIELD(_randompsyval);

        //MiseryFear = ((MiseryFear + _fearpsyadd) toFixed 2);
        player setVariable [QCLASS(psycosis), (_MFear + ((_fearpsyadd)))]; //player setVariable [QCLASS(psycosis), (_MFear + ((_fearpsyadd)toFixed 2))];

        if (_MFear >= 25) then {player setVariable [QCLASS(psycosis), 25]};
            };
         };
    };

if(EGVAR(common,debug))then{systemChat "Misery Fear cycle..."};

}, MiserysurvivalCycle, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
