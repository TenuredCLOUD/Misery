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

_MSleepiness = player getVariable [QEGVAR(survival,energyDeficit), MACRO_PLAYER_DEFAULTS_LOW];
_MSleeppillstaken = player getVariable ["MiserySleeppillstaken", 0];
_MIsSleeping = player getVariable EGVAR(survival,isSleeping);
_MFearSleep = player getVariable QCLASS(fearSleep);

EGVAR(common,ace)=false;
if (isClass(configFile>>"cfgPatches">>"ace_main")) then {
    EGVAR(common,ace)=true
};

// sleep system enabled pre-check:
if (EGVAR(common,checkMultiplayer)) exitWith {
    titleText ["...", "PLAIN DOWN"]
};

if (!hasInterface) exitWith {};

if ((call EFUNC(protection,totalProtection) select 0) > 0 || (call EFUNC(protection,totalProtection) select 1) > 0) exitWith {
    titleText ["You cannot take medicine while wearing a mask...", "PLAIN DOWN"];
};

if (alive player) exitWith {
    titleText ["You take a sleeping pill...", "PLAIN DOWN"];

    player removeItem QCLASS(sleepingPills);

    if (EGVAR(common,ace)) then {
        [player, QCLASS(sleepingPills), 10, 60, -10, 0, -10] call ace_medical_status_fnc_addMedicationAdjustment;
    };

    player setVariable ["MiserySleeppillstaken", (_MSleeppillstaken + 1)];
    player setVariable [QCLASS(fearSleep), true];

    sleep 60;

    _Sleepingpilleffectdone = false;

    while { alive player && !(_Sleepingpilleffectdone) } do {
        player setVariable [QEGVAR(survival,energyDeficit), (_MSleepiness + 0.1)];
        _MSleepiness = player getVariable [QEGVAR(survival,energyDeficit), MACRO_PLAYER_DEFAULTS_LOW];
        _MIsSleeping = player getVariable EGVAR(survival,isSleeping);
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
        player setVariable [QCLASS(fearSleep), false];
    };
};
