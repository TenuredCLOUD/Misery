#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Swaps ACE's pain killers for Misery's
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_medical_fnc_swapPainKillers;
 *
*/

if ([[QCLASSACE(PainKillers)]] call EFUNC(common,hasItem)) then {
    [[QCLASSACE(PainKillers)], [QCLASS(painkillers)]] call EFUNC(common,switchMagazine);
};
