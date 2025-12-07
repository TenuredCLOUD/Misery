#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Checks if player is damaged, ACE compatible
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Damaged <BOOL>
 *
 * Example:
 * [] call misery_common_fnc_playerDamaged;
 *
*/

private _damaged = false;

if ("ace_medical" call EFUNC(common,isModLoaded)) then {
    _damaged = player call ace_medical_fnc_isInjured;
} else {
    _damaged = (damage player) > 0.25;
};

_damaged
