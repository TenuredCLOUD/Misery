#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Handles psychosis at night.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Psychosis alteration <NUMBER>
 *
 * Example:
 * [] call misery_psychosis_fnc_night
 *
*/

if (!GVAR(night)) exitWith {};

private _nightAlteration = 0;

private _daytime = daytime;
if (_daytime >= 5 && _daytime < 18) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), "Psychosis reduction because of daytime."] call EFUNC(common,debugMessage);
    _nightAlteration + (_psychosisLevel - GVAR(decrease))
};

// Exit if near fire.
if (player call EFUNC(common,nearFire)) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), "No psychosis increase at night due to being near fire."] call EFUNC(common,debugMessage);
    _nightAlteration
};

if (insideBuilding player > 0.5) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), "No psychosis increase at night due to being in building."] call EFUNC(common,debugMessage);
    _nightAlteration
};

GVAR(nightIncrease)
