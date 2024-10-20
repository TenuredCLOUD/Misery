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

[{!(isNil {player getVariable "MiseryFear"}) && alive player},
{

[{
        params ["_args","_handle"];

        if (!alive player) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if(MiseryDebug)then{systemChat "Misery Fear cycle terminated..."};
            [] call FUNC(Fearcycle);
            if(MiseryDebug)then{systemChat "Misery Fear cycle checks re-initiated..."};
        };

    private ["_MFear","_randomzedval","_fearzedadd","_randomphantomval","_fearphantomadd","_randomspookval","_fearspookadd","_randomnightval","_fearnightadd","_randomnightnofear","_fearnightnofear","_randompsyval","_fearpsyadd"];

    //Fear var
    _MFear = player getVariable ["MiseryFear", MACRO_PLAYER_FEAR];

if (!(isNil {player getVariable "MiseryFear"})) then {

    if (MiseryFearNight == 1) then {
    if (dayTime >= 5 && dayTime < 18) then {
    player setVariable ["MiseryFear", (_MFear - ((MiseryFearHealing)))]; //player setVariable ["MiseryFear", (_MFear - ((MiseryFearHealing)toFixed 2))];
    if (_MFear <= 0) then {player setVariable ["MiseryFear", 0]};
    };
    }else{
    player setVariable ["MiseryFear", (_MFear - ((MiseryFearHealing)))]; //player setVariable ["MiseryFear", (_MFear - ((MiseryFearHealing)toFixed 2))];
    if (_MFear <= 0) then {player setVariable ["MiseryFear", 0]};
    };

    if (MiseryFearRvg == 1) then {
     if (call FUNC(NearZed)) then {

        _randomzedval = floor random RavageFear;
        _fearzedadd = MACRO_FEAR_CALC_RAVAGE(_randomzedval); //- random calc for fear add

        player setVariable ["MiseryFear", (_MFear + ((_fearzedadd)))]; //player setVariable ["MiseryFear", (_MFear + ((_fearzedadd)toFixed 2))];

        if (_MFear >= 25) then {player setVariable ["MiseryFear", 25]}; //Stop from going over 25
     };
    };

      if (MiseryFearRem == 1) then {
      if (call FUNC(NearPhantom)) then {

        _randomphantomval = floor random RemnantFear;
        _fearphantomadd = MACRO_FEAR_CALC_PHANTOM(_randomphantomval);

        player setVariable ["MiseryFear", (_MFear + ((_fearphantomadd)))]; //player setVariable ["MiseryFear", (_MFear + ((_fearphantomadd)toFixed 2))];

        if (_MFear >= 25) then {player setVariable ["MiseryFear", 25]};
     };
      };

      if (MiseryFearDSA == 1) then {
      if (call FUNC(NearSpook)) then {

        _randomspookval = floor random DSAFear;
        _fearspookadd = MACRO_FEAR_CALC_DSASPOOK(_randomspookval);

        player setVariable ["MiseryFear", (_MFear + ((_fearspookadd)))]; //player setVariable ["MiseryFear", (_MFear + ((_fearspookadd)toFixed 2))];

        if (_MFear >= 25) then {player setVariable ["MiseryFear", 25]};
     };
      };

    if (MiseryFearNight == 1) then {
    if (dayTime >= 18 || dayTime < 5) then {
        _randomnightval = floor random NightFear;
        _fearnightadd = MACRO_FEAR_CALC_NIGHT(_randomnightval);

        //Reduce sanity (outside in darkness)
        player setVariable ["MiseryFear", (_MFear + ((_fearnightadd)))]; //player setVariable ["MiseryFear", (_MFear + ((_fearnightadd)toFixed 2))];
        if (MiseryFear >= 25) then {player setVariable ["MiseryFear", 25]};

        if ((insideBuilding player == 1) || ([player] call EFUNC(common,NearFire))) then {
        _randomnightnofear = (((NightFear) + NightFear) * 2);
        _fearnightnofear = MACRO_FEAR_CALC_NIGHT(_randomnightnofear);
        //Gain back sanity (inside or near fire)
        player setVariable ["MiseryFear", (_MFear - ((_fearnightnofear)))]; //player setVariable ["MiseryFear", (_MFear - ((_fearnightnofear)toFixed 2))];
        if (_MFear <= 0) then {player setVariable ["MiseryFear", 0]};
    };
    };

     };

     if (MiseryFearPsy == 1) then {
    if (MiseryinPsyfield) then {

        _randompsyval = floor random PsyFear;
        _fearpsyadd = MACRO_FEAR_CALC_PSYFIELD(_randompsyval);

        //MiseryFear = ((MiseryFear + _fearpsyadd) toFixed 2);
        player setVariable ["MiseryFear", (_MFear + ((_fearpsyadd)))]; //player setVariable ["MiseryFear", (_MFear + ((_fearpsyadd)toFixed 2))];

        if (_MFear >= 25) then {player setVariable ["MiseryFear", 25]};
            };
         };
    };

if(MiseryDebug)then{systemChat "Misery Fear cycle..."};

}, MiserysurvivalCycle, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
