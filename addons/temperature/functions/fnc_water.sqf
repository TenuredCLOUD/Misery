#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Water
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_temperature_fnc_water;
 *
 * Public: No
*/

private ["_water","_MExposure","_ailments","_MWetsuit","_coldwater"];

_water = false;
_MExposure = player getVariable [QCLASS(exposure), MACRO_PLAYER_EXPOSURE];
_ailments = player getVariable QCLASS(ailments);
_MWetsuit = false; //No wetsuit

if(((toLower(uniform player))find "wetsuit")>-1) then {_MWetsuit = true}; //Check for wetsuit

if (((getPosASLW player select 2) < 0) || (underwater player)) then {

    if (_ailments find "PARASITES" != -1 || _ailments find "INFECTION" != -1) then {

        player setVariable [QCLASS(exposure), 0]; //If sick, and in cold water, remove fever, but reset exposure level
    };

    if (!_MWetsuit && GVAR(seaTemperature) < 20) then { //If player isn't wearing a wetsuit drop temp by 2.5 if water is cold enough

        _coldwater = MACRO_TEMPERATURE_COLDWATER(GVAR(seaTemperature)); //- this  value scales with temperature decrease...

        player setVariable [QCLASS(exposure), (_MExposure - parseNumber ((_coldwater)toFixed 2))];

        _water = true;

    }; //Start cold water simulation if sea temp is < 20C
};

_water
