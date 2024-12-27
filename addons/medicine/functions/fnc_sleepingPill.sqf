#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * sleep pill usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medicine_fnc_sleepingPill;
 *
*/

_MSleepiness = player getVariable [QCLASS(energyDeficit), MACRO_PLAYER_FATIGUE];
_MSleeppillstaken = player getVariable ["MiserySleeppillstaken", 0];
_MIsSleeping = player getVariable "Misery_IsSleeping";
_MFearSleep = player getVariable "Misery_FearSleep";

EGVAR(common,ace)=false;
if (isClass(configFile>>"cfgPatches">>"ace_main")) then {
    EGVAR(common,ace)=true
};

// sleep system enabled pre-check:
if (EGVAR(common,checkMultiplayer)) exitWith {
    titleText ["...", "PLAIN DOWN"]
};

if (!hasInterface) exitWith {};

if (goggles player in antirad_goggles || headgear player in antirad_headgears) exitWith {
    titleText ["You cannot take medicine while wearing a mask...", "PLAIN DOWN"];
};

if (alive player) exitWith {
    titleText ["You take a sleeping pill...", "PLAIN DOWN"];

    player removeItem "Misery_sleeppill";

    if (EGVAR(common,ace)) then {
        [player, "Misery_sleeppill", 10, 60, -10, 0, -10] call ace_medical_status_fnc_addMedicationAdjustment;
    };

    player setVariable ["MiserySleeppillstaken", (_MSleeppillstaken + 1)];
    player setVariable ["Misery_FearSleep", true];

    sleep 60;

    _Sleepingpilleffectdone = false;

    while { alive player && !(_Sleepingpilleffectdone) } do {
        player setVariable [QCLASS(energyDeficit), (_MSleepiness + 0.1)];
        _MSleepiness = player getVariable [QCLASS(energyDeficit), MACRO_PLAYER_FATIGUE];
        _MIsSleeping = player getVariable "Misery_IsSleeping";
        if (_MSleepiness >= 35 || (_MIsSleeping)) then {
            _Sleepingpilleffectdone = true;
        };
        sleep 1;
    };

    player setVariable ["MiserySleeppillstaken", (_MSleeppillstaken - 1)];
    if ((_MSleeppillstaken) <= 0) then {
        player setVariable ["MiserySleeppillstaken", 0];
    };

    if (_MFearSleep) then {
        player setVariable ["Misery_FearSleep", false];
    };
};
