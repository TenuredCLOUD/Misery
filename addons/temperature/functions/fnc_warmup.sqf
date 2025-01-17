#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Warmup
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_temperature_fnc_warmup;
 *
 * Public: No
*/

private ["_warmup","_MPlayertemp","_MExposure","_ailments","_cooldown"];

_warmup = false;
_MPlayertemp = player getVariable QEGVAR(survival,temperature);
_MExposure = player getVariable [QEGVAR(survival,exposure), MACRO_PLAYER_EXPOSURE];
_ailments = player getVariable QCLASS(ailments);

//Player effective temperature pre-check:
if ([player] call EFUNC(common,nearFire)) exitWith {};
if (insideBuilding player == 1) exitWith {};
if !(isNull objectParent player) exitWith {};

if (_MPlayertemp >= 20 && _MPlayertemp < 33) then {

    if (!(_ailments find "PARASITES" != -1 || _ailments find "INFECTION" != -1)) then {

        if (_MExposure < 0) then {

            private _warmUp = MACRO_TEMPERATURE_WARMUP(_MPlayertemp);

            player setVariable [QEGVAR(survival,exposure), (_MExposure + parseNumber ((_warmUp)toFixed 2))];

            _warmup = true;

            if (_MExposure >= 0) then {player setVariable [QEGVAR(survival,exposure), MACRO_PLAYER_EXPOSURE];};

        }; //Warmup if neutral temp & cold

        if (_MExposure > 0) then {

            private _cooldown = MACRO_TEMPERATURE_COOLDOWN(_MPlayertemp);

            player setVariable [QEGVAR(survival,exposure), (_MExposure - parseNumber ((_cooldown)toFixed 2))];

            _warmup = true;

            if (_MExposure <= 0) then {player setVariable [QEGVAR(survival,exposure), MACRO_PLAYER_EXPOSURE];};

        }; //Cooldown if neutral temp & hot
    };
};

_warmup
