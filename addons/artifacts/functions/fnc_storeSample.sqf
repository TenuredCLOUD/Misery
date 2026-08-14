#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, MikeMF
 * Fallout glass containment / storage
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_artifacts_fnc_storeSample;
 *
*/

if ([[QCLASS(leadContainer_Closed)]] call EFUNC(common,hasItem)) exitWith {
    [ACE_player, QCLASS(fallout_glass)] call CBA_fnc_removeItem;
    [QCLASS(leadContainer_Closed)] call EFUNC(common,itemIncrement) params ["_incremented"];

    // If sample not added to container, re-add it to inventory or drop it to ground
    if !(_incremented) exitWith {
        [ACE_player, QCLASS(fallout_glass), true] call CBA_fnc_addItem;
        [QEGVAR(common,tileText), localize LSTRING(LeadContainerFull)] call CBA_fnc_localEvent;
    };
    [QEGVAR(common,tileText), localize LSTRING(SampleStored)] call CBA_fnc_localEvent;
};

if ([[QCLASS(leadContainer_Open)]] call EFUNC(common,hasItem)) exitWith {
    [ACE_player, QCLASS(fallout_glass)] call CBA_fnc_removeItem;
    [ACE_player, QCLASS(leadContainer_Open)] call CBA_fnc_removeItem;

    [ACE_player, QCLASS(leadContainer_Closed), 1, true] call CBA_fnc_addMagazine;
    [QEGVAR(common,tileText), localize LSTRING(SampleStored)] call CBA_fnc_localEvent;
};
