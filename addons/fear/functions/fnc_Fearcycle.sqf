/*
Misery Fear cycle
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

#include "\z\misery\addons\main\script_macros.hpp"

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
	_MFear = player getVariable ["MiseryFear", MIS_FEAR];

if (!(isNil {player getVariable "MiseryFear"})) then {

	if (MiseryFearNight == 1) then {
	if (daytime >= 5 && daytime < 18) then {
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
		_fearzedadd = MISERY_FEARRAVAGE(_randomzedval); //- random calc for fear add 

		player setVariable ["MiseryFear", (_MFear + ((_fearzedadd)))]; //player setVariable ["MiseryFear", (_MFear + ((_fearzedadd)toFixed 2))];

		if (_MFear >= 25) then {player setVariable ["MiseryFear", 25]}; //Stop from going over 25
	 };
	};

	  if (MiseryFearRem == 1) then {	
	  if (call FUNC(NearPhantom)) then {
		
		_randomphantomval = floor random RemnantFear;
		_fearphantomadd = MISERY_FEARPHANTOM(_randomphantomval); 

		player setVariable ["MiseryFear", (_MFear + ((_fearphantomadd)))]; //player setVariable ["MiseryFear", (_MFear + ((_fearphantomadd)toFixed 2))]; 

		if (_MFear >= 25) then {player setVariable ["MiseryFear", 25]}; 
	 };
	  };

	  if (MiseryFearDSA == 1) then {
	  if (call FUNC(NearSpook)) then {
		
		_randomspookval = floor random DSAFear;
		_fearspookadd = MISERY_FEARDSASPOOK(_randomspookval);  

		player setVariable ["MiseryFear", (_MFear + ((_fearspookadd)))]; //player setVariable ["MiseryFear", (_MFear + ((_fearspookadd)toFixed 2))];

		if (_MFear >= 25) then {player setVariable ["MiseryFear", 25]}; 
	 };
	  };

	if (MiseryFearNight == 1) then {
	if (daytime >= 18 || daytime < 5) then {
		_randomnightval = floor random NightFear;
		_fearnightadd = MISERY_FEARNIGHT(_randomnightval); 

		//Reduce sanity (outside in darkness)
		player setVariable ["MiseryFear", (_MFear + ((_fearnightadd)))]; //player setVariable ["MiseryFear", (_MFear + ((_fearnightadd)toFixed 2))];
		if (MiseryFear >= 25) then {player setVariable ["MiseryFear", 25]}; 

		if ((([player] call EFUNC(common,Isinside)) select 0) && (([player] call EFUNC(common,Isinside)) select 1) || ([player] call EFUNC(common,NearFire))) then { 
		_randomnightnofear = (((NightFear) + NightFear) * 2); 
		_fearnightnofear = MISERY_FEARNIGHT(_randomnightnofear);
		//Gain back sanity (inside or near fire)
		player setVariable ["MiseryFear", (_MFear - ((_fearnightnofear)))]; //player setVariable ["MiseryFear", (_MFear - ((_fearnightnofear)toFixed 2))];
		if (_MFear <= 0) then {player setVariable ["MiseryFear", 0]};
	};
	};

	 };

	 if (MiseryFearPsy == 1) then {
	if (MiseryinPsyfield) then {

		_randompsyval = floor random PsyFear;
		_fearpsyadd = MISERY_FEARPSYFIELD(_randompsyval); 

		//MiseryFear = ((MiseryFear + _fearpsyadd) toFixed 2);
		player setVariable ["MiseryFear", (_MFear + ((_fearpsyadd)))]; //player setVariable ["MiseryFear", (_MFear + ((_fearpsyadd)toFixed 2))];

		if (_MFear >= 25) then {player setVariable ["MiseryFear", 25]}; 
			};
	 	};
	};

if(MiseryDebug)then{systemChat "Misery Fear cycle..."};

}, MiserysurvivalCycle, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;