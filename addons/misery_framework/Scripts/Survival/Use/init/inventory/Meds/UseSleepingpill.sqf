/* -----------------------------------
Misery Sleep pill usage
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

#include "\Misery\Scripts\Misery_PreParser.hpp"

_MSleepiness = player getVariable ["MiserySleepiness", MIS_SLEEP];
_MSleeppillstaken = player getVariable ["MiserySleeppillstaken", 0];
_MIsSleeping = player getVariable "Misery_IsSleeping";
_MFearSleep = player getVariable "Misery_FearSleep";

MiseryACE=FALSE;
if(isClass(configFile>>"cfgPatches">>"ace_main"))then{MiseryACE=TRUE};

//Sleep system enabled pre-check:
if (MiseryMP) exitWith {titleText ["...", "PLAIN DOWN"]};

if (!hasInterface) exitWith {};

   if (goggles player in antirad_goggles || headgear player in antirad_headgears) exitWith {
	titleText ["You cannot take medicine while wearing a mask...", "PLAIN DOWN"];
};

	if (alive player) exitwith {

	titleText ["You take a sleeping pill...", "PLAIN DOWN"];

    player removeitem "Misery_sleeppill";

	if (MiseryACE) then {
    [player, "Misery_sleeppill", 10, 60, -10, 0, -10] call ace_medical_status_fnc_addMedicationAdjustment;
	};

player setVariable ["MiserySleeppillstaken", (_MSleeppillstaken + 1)];
player setVariable ["Misery_FearSleep", true];

sleep 60;

_Sleepingpilleffectdone = false;

while {alive player && !(_Sleepingpilleffectdone)} do {
    player setVariable ["MiserySleepiness", (_MSleepiness + 0.1)];
    _MSleepiness = player getVariable ["MiserySleepiness", MIS_SLEEP];
    _MIsSleeping = player getVariable "Misery_IsSleeping";
    if (_MSleepiness >= 35 || (_MIsSleeping == true)) then {
        _Sleepingpilleffectdone = true;
    };
    sleep 1;
};

player setVariable ["MiserySleeppillstaken", (_MSleeppillstaken - 1)];
if ((_MSleeppillstaken) <= 0) then {player setVariable ["MiserySleeppillstaken", 0];};

if (_MFearSleep) then {
player setVariable ["Misery_FearSleep", false];
};

};