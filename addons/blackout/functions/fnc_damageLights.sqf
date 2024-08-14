#include "..\script_component.hpp"
/*
 * Author: MikeMF
 * Hides objects with lights that cannot be damaged or used with switchLight
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fnc_blackout_damageLights
*/

params ["_object"];

private _hitpoints = getAllHitPointsDamage _object select 0;
{
    if ("light" in (toLower _x)) then {
        _object setHitPointDamage [_x, 1];
    };
} forEach _hitpoints;
