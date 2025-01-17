#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Temperature checks
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_temperature_fnc_effectiveTemperature;
 *
 * Public: No
*/

private ["_clothesWarmth","_MPlayertemp","_MExposure","_ailments","_nearfirecalc","_sicknearfirecalc","_insidewarmcalc","_sickinsidewarmcalc","_invehiclecalc","_sickinvehiclecalc"];

player setVariable [QEGVAR(survival,temperature), (call FUNC(environment)) select 0]; //Air temp
GVAR(seaTemperature) = (call FUNC(environment)) select 1; //Sea temp
_clothesWarmth= (player call FUNC(clothing)) select 0;

//Parse values from temperature calculations
_MPlayertemp = player getVariable QEGVAR(survival,temperature);
player setVariable [QEGVAR(survival,temperature), (_MPlayertemp + parseNumber ((_clothesWarmth)toFixed 2))];

_MExposure = player getVariable [QEGVAR(survival,exposure), MACRO_PLAYER_EXPOSURE];

_ailments = player getVariable QCLASS(ailments);

//---------------------------
//Nearby fire check

if ([player] call EFUNC(common,nearFire)) then {

    if ((_MPlayertemp < 20) && (!(_ailments find "PARASITES" != -1 || _ailments find "INFECTION" != -1))) then {

       if (abs(_MExposure) < 0.5) exitWith {
        player setVariable [QEGVAR(survival,exposure), MACRO_PLAYER_EXPOSURE];
        };

        _nearfirecalc = MACRO_TEMPERATURE_FIREORVEHICLE(_MPlayertemp);

        player setVariable [QEGVAR(survival,exposure), (_MExposure + parseNumber ((_nearfirecalc)toFixed 2))];

        if (_MExposure > 0) then {player setVariable [QEGVAR(survival,exposure), MACRO_PLAYER_EXPOSURE];};

    } else {

        _sicknearfirecalc = MACRO_TEMPERATURE_FIREORVEHICLE_SICK(_MPlayertemp);

        player setVariable [QEGVAR(survival,exposure), (_MExposure + parseNumber ((_sicknearfirecalc)toFixed 2))];
    };
};

//---------------------------
//Inside house check (checks if player is "boxed in" and under roof)

if (insideBuilding player == 1) then {

    if ((_MPlayertemp < 20) && (!(_ailments find "PARASITES" != -1 || _ailments find "INFECTION" != -1))) then {

        if (abs(_MExposure) < 0.5) exitWith {
        player setVariable [QEGVAR(survival,exposure), MACRO_PLAYER_EXPOSURE];
        };

        _insidewarmcalc = MACRO_TEMPERATURE_INSIDEBUILDING(_MPlayertemp);

        player setVariable [QEGVAR(survival,exposure), (_MExposure + parseNumber ((_insidewarmcalc)toFixed 2))];

        if (_MExposure > 0) then {player setVariable [QEGVAR(survival,exposure), MACRO_PLAYER_EXPOSURE];}; //If not sick, not hot, then - warm up, but reset at 0

    } else {

        _sickinsidewarmcalc = MACRO_TEMPERATURE_INSIDEBUILDING_SICK(_MPlayertemp);

        player setVariable [QEGVAR(survival,exposure), (_MExposure + parseNumber ((_sickinsidewarmcalc)toFixed 2))];
    };
};

//---------------------------
//In a vehicle Check

if !(isNull objectParent player) then {

    if ((_MPlayertemp < 20) && (!(_ailments find "PARASITES" != -1 || _ailments find "INFECTION" != -1))) then {

        if (abs(_MExposure) < 0.5) exitWith {
        player setVariable [QEGVAR(survival,exposure), MACRO_PLAYER_EXPOSURE];
        };

        _invehiclecalc = MACRO_TEMPERATURE_FIREORVEHICLE(_MPlayertemp);

        player setVariable [QEGVAR(survival,exposure), (_MExposure + parseNumber ((_invehiclecalc)toFixed 2))];

        if (_MExposure > 0) then {player setVariable [QEGVAR(survival,exposure), MACRO_PLAYER_EXPOSURE];}; //If not sick, not hot, then - warm up, but reset at 0

    } else {

        _sickinvehiclecalc = MACRO_TEMPERATURE_FIREORVEHICLE_SICK(_MPlayertemp);

        player setVariable [QEGVAR(survival,exposure), (_MExposure + parseNumber ((_sickinvehiclecalc)toFixed 2))];
    };
};

_MPlayertemp
