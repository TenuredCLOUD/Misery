/*
Misery Fear
Designed specifically for Misery mod
by TenuredCLOUD
*/

#include "\z\misery\addons\main\script_macros.hpp"

[{!(isNil {player getVariable "MiseryFear"}) && ((player getVariable ["MiseryFear", MIS_FEAR]) >= 5)},
{
    [{
        params ["_args", "_handle"];

        if (((player getVariable ["MiseryFear", MIS_FEAR]) < 5) || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if(MiseryDebug)then{systemChat "Misery Fear event cycle terminated..."};
            [] call FUNC(Fear);
            if(MiseryDebug)then{systemChat "Misery Fear event cycle checks reinitiated..."};
        };

    private ["_randomhint","_randomaudio","_randomshake","_MFear"];

//random events:
_randomhint = [1, 5] call BIS_fnc_randomInt;
_randomaudio = [1, 5] call BIS_fnc_randomInt;
_randomshake = [1, 5] call BIS_fnc_randomInt;

//Fear var
_MFear = player getVariable ["MiseryFear", MIS_FEAR];

if (_MFear >= 5 && _MFear < 10) then
        {
                if (_randomhint == 3) then {
                titleText [selectrandom ["You feel a lingering presence...","You feel like you're being watched...","You feel uneasy..."], "PLAIN DOWN"];
                };

                if (_randomaudio == 3) then {
                playSound selectRandom [
                "Stage1",
                "Spooky3_6",
                "Spooky3_5",
                "Spooky3_4",
                "Spooky3_3",
                "Spooky3_2",
                "Spooky3_1",
                "Spooky3",
                "Spooky2_Copy",
                "Spooky2_4",
                "Spooky2_3",
                "Spooky2_2",
                "Spooky2_1",
                "Spooky2",
                "Spooky1_Copy",
                "Spooky1_3",
                "Spooky1_2"
                ];
                };

                if (_randomshake == 3) then {
                enableCamShake true;
                addCamShake [1, 60, 2];
                };

                if (daytime >=18 || daytime < 5) then {

                if (_randomhint == 3) then {
                titleText [selectrandom ["The shadows are moving...","They're watching me...","They follow in the darkness..."], "PLAIN DOWN"];
                };

                if (_randomaudio == 3) then {
                playSound selectRandom [
                "Stage1",
                "Spooky3_6",
                "Spooky3_5",
                "Spooky3_4",
                "Spooky3_3",
                "Spooky3_2",
                "Spooky3_1",
                "Spooky3",
                "Spooky2_Copy",
                "Spooky2_4",
                "Spooky2_3",
                "Spooky2_2",
                "Spooky2_1",
                "Spooky2",
                "Spooky1_Copy",
                "Spooky1_3",
                "Spooky1_2"
                ];
                };

                if (_randomshake == 3) then {
                enableCamShake true;
                addCamShake [1, 60, 2];
                };

                };

}; //<< DO NOT REMOVE

if (_MFear >= 10 && _MFear < 15) then
        {
                if (_randomhint == 3) then {
                titleText [selectrandom ["You feel a lingering presence...","You feel like you're being watched...","You feel uneasy..."], "PLAIN DOWN"];
                };

                if (_randomaudio == 3) then {
                playSound selectRandom [
                "Stage1",
                "Spooky3_6",
                "Spooky3_5",
                "Spooky3_4",
                "Spooky3_3",
                "Spooky3_2",
                "Spooky3_1",
                "Spooky3",
                "Spooky2_Copy",
                "Spooky2_4",
                "Spooky2_3",
                "Spooky2_2",
                "Spooky2_1",
                "Spooky2",
                "Spooky1_Copy",
                "Spooky1_3",
                "Spooky1_2"
                ];
                };

                if (_randomshake == 3) then {
                enableCamShake true;
                addCamShake [1, 60, 2];
                };

                if (daytime >=18 || daytime < 5) then {

                if (_randomhint == 3) then {
                titleText [selectrandom ["The shadows are moving...","They're watching me...","They follow in the darkness..."], "PLAIN DOWN"];
                };

                if (_randomaudio == 3) then {
                playSound selectRandom [
                "Stage1",
                "Spooky3_6",
                "Spooky3_5",
                "Spooky3_4",
                "Spooky3_3",
                "Spooky3_2",
                "Spooky3_1",
                "Spooky3",
                "Spooky2_Copy",
                "Spooky2_4",
                "Spooky2_3",
                "Spooky2_2",
                "Spooky2_1",
                "Spooky2",
                "Spooky1_Copy",
                "Spooky1_3",
                "Spooky1_2"
                ];
                };

                if (_randomshake == 3) then {
                enableCamShake true;
                addCamShake [1, 60, 2];
                };

                };

}; //<< DO NOT REMOVE

if (_MFear >= 15 && _MFear < 20) then
        {
                if (_randomhint == 3) then {
                titleText [selectrandom ["You feel a lingering presence...","You feel like you're being watched...","You feel uneasy..."], "PLAIN DOWN"];
                };

                if (_randomaudio == 3) then {
                playSound selectRandom [
                "Stage1",
                "Spooky3_6",
                "Spooky3_5",
                "Spooky3_4",
                "Spooky3_3",
                "Spooky3_2",
                "Spooky3_1",
                "Spooky3",
                "Spooky2_Copy",
                "Spooky2_4",
                "Spooky2_3",
                "Spooky2_2",
                "Spooky2_1",
                "Spooky2",
                "Spooky1_Copy",
                "Spooky1_3",
                "Spooky1_2"
                ];
                };

                if (_randomshake == 3) then {
                enableCamShake true;
                addCamShake [3, 60, 2];
                };

                if (daytime >=18 || daytime < 5) then {

                if (_randomhint == 3) then {
                titleText [selectrandom ["The shadows are moving...","They're watching me...","They follow in the darkness..."], "PLAIN DOWN"];
                };

                if (_randomaudio == 3) then {
                playSound selectRandom [
                "Stage1",
                "Spooky3_6",
                "Spooky3_5",
                "Spooky3_4",
                "Spooky3_3",
                "Spooky3_2",
                "Spooky3_1",
                "Spooky3",
                "Spooky2_Copy",
                "Spooky2_4",
                "Spooky2_3",
                "Spooky2_2",
                "Spooky2_1",
                "Spooky2",
                "Spooky1_Copy",
                "Spooky1_3",
                "Spooky1_2"
                ];
                };

                if (_randomshake == 3) then {
                enableCamShake true;
                addCamShake [3, 60, 2];
                };

                };


}; //<< DO NOT REMOVE

if (_MFear >= 20 && _MFear < 25) then
        {
                if (_randomhint == 3) then {
                titleText [selectrandom ["You feel a lingering presence...","You feel like you're being watched...","You feel uneasy..."], "PLAIN DOWN"];
                };

                if (_randomaudio == 3) then {
                playSound selectRandom [
                "Stage1",
                "Spooky3_6",
                "Spooky3_5",
                "Spooky3_4",
                "Spooky3_3",
                "Spooky3_2",
                "Spooky3_1",
                "Spooky3",
                "Spooky2_Copy",
                "Spooky2_4",
                "Spooky2_3",
                "Spooky2_2",
                "Spooky2_1",
                "Spooky2",
                "Spooky1_Copy",
                "Spooky1_3",
                "Spooky1_2"
                ];
                };

                if (_randomshake == 3) then {
                enableCamShake true;
                addCamShake [3, 120, 2];
                };

                if (daytime >=18 || daytime < 5) then {

                if (_randomhint == 3) then {
                titleText [selectrandom ["The shadows are moving...","They're watching me...","They follow in the darkness..."], "PLAIN DOWN"];
                };

                if (_randomaudio == 3) then {
                playSound selectRandom [
                "Stage1",
                "Spooky3_6",
                "Spooky3_5",
                "Spooky3_4",
                "Spooky3_3",
                "Spooky3_2",
                "Spooky3_1",
                "Spooky3",
                "Spooky2_Copy",
                "Spooky2_4",
                "Spooky2_3",
                "Spooky2_2",
                "Spooky2_1",
                "Spooky2",
                "Spooky1_Copy",
                "Spooky1_3",
                "Spooky1_2"
                ];
                };

                if (_randomshake == 3) then {
                enableCamShake true;
                addCamShake [3, 120, 2];
                };
                };


}; //<< DO NOT REMOVE

if (_MFear >= 25) then  {

      if (MiseryACE) then {
    [player, 0.2, "head", "stab"] call ace_medical_fnc_addDamageToUnit;
    [player, 0.2, "body", "stab"] call ace_medical_fnc_addDamageToUnit;

        }else{
            player setDamage 1; //No ACE damage
        };
};

}, 120, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
