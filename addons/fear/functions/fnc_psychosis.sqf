#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Psychosis emulation
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fear_fnc_psychosis
 *
*/

[{!(isNil {player getVariable QCLASS(psycosis)}) && ((player getVariable [QCLASS(psycosis), MACRO_PLAYER_FEAR]) >= 5)},
{
    [{
        params ["_args", "_handle"];

        if (((player getVariable [QCLASS(psycosis), MACRO_PLAYER_FEAR]) < 5) || (!alive player)) exitWith {
            [_handle] call CBA_fnc_removePerFrameHandler;
            if(EGVAR(common,debug))then{systemChat "Misery Fear event cycle terminated..."};
            [] call FUNC(psychosis);
            if(EGVAR(common,debug))then{systemChat "Misery Fear event cycle checks reinitiated..."};
        };

    private ["_randomhint","_randomaudio","_randomshake","_MFear"];

//random events:
_randomhint = [1, 5] call BIS_fnc_randomInt;
_randomaudio = [1, 5] call BIS_fnc_randomInt;
_randomshake = [1, 5] call BIS_fnc_randomInt;

//Fear var
_MFear = player getVariable [QCLASS(psycosis), MACRO_PLAYER_FEAR];

if (_MFear >= 5 && _MFear < 10) then
        {
                if (_randomhint == 3) then {
                titleText [selectRandom ["You feel a lingering presence...","You feel like you're being watched...","You feel uneasy..."], "PLAIN DOWN"];
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

                if (dayTime >=18 || dayTime < 5) then {

                if (_randomhint == 3) then {
                titleText [selectRandom ["The shadows are moving...","They're watching me...","They follow in the darkness..."], "PLAIN DOWN"];
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
                titleText [selectRandom ["You feel a lingering presence...","You feel like you're being watched...","You feel uneasy..."], "PLAIN DOWN"];
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

                if (dayTime >=18 || dayTime < 5) then {

                if (_randomhint == 3) then {
                titleText [selectRandom ["The shadows are moving...","They're watching me...","They follow in the darkness..."], "PLAIN DOWN"];
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
                titleText [selectRandom ["You feel a lingering presence...","You feel like you're being watched...","You feel uneasy..."], "PLAIN DOWN"];
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

                if (dayTime >=18 || dayTime < 5) then {

                if (_randomhint == 3) then {
                titleText [selectRandom ["The shadows are moving...","They're watching me...","They follow in the darkness..."], "PLAIN DOWN"];
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
                titleText [selectRandom ["You feel a lingering presence...","You feel like you're being watched...","You feel uneasy..."], "PLAIN DOWN"];
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

                if (dayTime >=18 || dayTime < 5) then {

                if (_randomhint == 3) then {
                titleText [selectRandom ["The shadows are moving...","They're watching me...","They follow in the darkness..."], "PLAIN DOWN"];
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

      if (EGVAR(common,ace)) then {
    [player, 0.2, "head", "stab"] call ace_medical_fnc_addDamageToUnit;
    [player, 0.2, "body", "stab"] call ace_medical_fnc_addDamageToUnit;

        }else{
            player setDamage 1; //No ACE damage
        };
};

}, 120, []] call CBA_fnc_addPerFrameHandler;
}, []] call CBA_fnc_waitUntilAndExecute;
