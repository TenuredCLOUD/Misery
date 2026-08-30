#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Ravage Item swapping
 * Swaps Ravage items to Misery items if enabled
 * Also adds tents to GRAD fortifications if loaded
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_compat_ravage_zombies_fnc_swapItems
 *
*/

// Tents & sleeping bags
{
    private _oldCampItem = _x select 0;
    private _newCampItem = _x select 1;

    if ([[_oldCampItem]] call EFUNC(common,hasItem) && (isClass (missionConfigFile >> "CfgGradFortifications"))) then {
        [ACE_player, _oldCampItem] call CBA_fnc_removeItem;
        [ACE_player, _newCampItem] call GRADFUNC(fortifications,addFort);
    };
} forEach MACRO_RVG_CAMPING;

// Tool items
{
    private _oldToolItem = _x select 0;
    private _newToolItem = _x select 1;

    if ([[_oldToolItem]] call EFUNC(common,hasItem)) then {
        [ACE_player, _oldToolItem] call CBA_fnc_removeItem;
        [ACE_player, _newToolItem, true] call CBA_fnc_addItem;
    };
} forEach MACRO_RVG_TOOLS;

// Medication items
{
    private _oldMedItem = _x select 0;
    private _newMedItem = _x select 1;

    if ([[_oldMedItem]] call EFUNC(common,hasItem)) then {
        [ACE_player, _oldMedItem] call CBA_fnc_removeItem;
        [ACE_player, _newMedItem, true] call CBA_fnc_addItem;
    };
} forEach MACRO_RVG_MEDS;

// Food & Drink
{
    private _oldFoodItem = _x select 0;
    private _newFoodItem = _x select 1;

    if ([[_oldFoodItem]] call EFUNC(common,hasItem)) then {
        [ACE_player, _oldFoodItem] call CBA_fnc_removeItem;
        [ACE_player, _newFoodItem, true] call CBA_fnc_addItem;
    };
} forEach MACRO_RVG_FOOD;

// Fuel
{
    private _oldFuelItem = _x select 0;
    private _newFuelItem = _x select 1;

    if ([[_oldFuelItem]] call EFUNC(common,hasItem)) then {
        [ACE_player, _oldFuelItem] call CBA_fnc_removeItem;
        [ACE_player, _newFuelItem, true] call CBA_fnc_addItem;
    };
} forEach MACRO_RVG_FUEL;

// Currency
if ([["rvg_money"]] call EFUNC(common,hasItem)) then {
    [ACE_player, "rvg_money"] call CBA_fnc_removeItem;
    [random 500] call EFUNC(currency,modifyMoney);
};
