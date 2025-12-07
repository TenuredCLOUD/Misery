 #include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Creatures class finder
 * Processes automatic class grabber for more randomized creature groups
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Type <STRING> or <NUMBER>
 *
 * Example:
 * [] call misery_compat_wzc_fnc_findClass;
 *
*/

if (GVAR(nightOnly)) then {
    private _isNight = sunOrMoon < 0.3;

    if (!_isNight) exitWith {
        selectRandom [1, 2, 3];
    };

    if ([GVAR(spawnChanceGoliath)] call EFUNC(common,rollChance)) exitWith {"GOLIATH"};
    if ([GVAR(spawnChanceSpecial)] call EFUNC(common,rollChance)) exitWith {"SPECIAL"};

    selectRandom [1,2,3,4,5,6];
} else {
    if ([GVAR(spawnChanceGoliath)] call EFUNC(common,rollChance)) exitWith {"GOLIATH"};
    if ([GVAR(spawnChanceSpecial)] call EFUNC(common,rollChance)) exitWith {"SPECIAL"};

    selectRandom [1,2,3,4,5,6];
};
