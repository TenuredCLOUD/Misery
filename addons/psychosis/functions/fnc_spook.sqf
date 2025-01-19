#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Handles psychosis near DSA Spooks
 *
 * Arguments:
 * None
 *
 * Return Value:
 * 0: Psychosis alteration <NUMBER>
 *
 * Example:
 * [] call misery_psychosis_fnc_spook
 *
*/

if (!GVAR(dsa)) exitWith {0};

if ([["DSA_SpookBase", "DSA_SpookBase2", "DSA_AnomalyBase"], 25] call EFUNC(common,nearEntities)) exitWith {
    GVAR(unnaturalIncrease)
};
