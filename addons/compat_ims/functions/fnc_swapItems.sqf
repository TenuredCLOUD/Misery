#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * WBKIMS Item swapping
 * Swaps Misery items to IMS weapons if enabled
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_compat_ims_fnc_swapItems
 *
*/

// Pickaxes (only run if IMS2 is loaded)
if (isClass (configFile >> "CfgWeapons" >> "WBK_Pickaxe")) then {
    if ([[QCLASS(pickaxe)]] call EFUNC(common,hasItem)) then {
        [ACE_player, QCLASS(pickaxe)] call CBA_fnc_removeItem;
        [ACE_player, QUOTE(WBK_Pickaxe), true] call CBA_fnc_addItem;
    };
};

// Knives & Axes
{
    _x params ["_oldToolItem", "_newToolItem"];

    if ([[_oldToolItem]] call EFUNC(common,hasItem)) then {
        [ACE_player, _oldToolItem] call CBA_fnc_removeItem;
        [ACE_player, _newToolItem, true] call CBA_fnc_addItem;
    };
} forEach MACRO_IMS_COMPAT;
