#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Cocaine usage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_stims_fnc_cocaine;
 *
*/

if !(isMultiplayer) then {
    [-0.25, "energy"] call EFUNC(common,addStatusModifier);
};

if (QCLASSACE(medical) call EFUNC(common,isModLoaded)) then {
    [player, QCLASS(cocaine), 0, 1800, 25, 0, 25, 1] call ACEFUNC(medical_status,addMedicationAdjustment);
};

[3, 2] call EFUNC(common,chromaticEffect);

player enableFatigue false;

[{
    player enableFatigue true;
    player setFatigue 0;
}, [], 1200] call CBA_fnc_waitAndExecute;
