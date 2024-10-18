#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * woodnail box
 * Action removing nails from boxes action result varies on mod compatibility
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_useitem_fnc_nailBox;
 *
 * Public: No
*/

if (MiseryUsingiBuild) exitwith {

titleText ["You take the nails out of the box...", "PLAIN DOWN"];
player removeitem "Misery_boxnails";
for "_i" from 1 to 15 do {[player, "NMIB_WoodNails_Itm", true] call CBA_fnc_addItem;};
};

if !(MiseryUsingiBuild) exitwith {

titleText ["You take the nails out of the box...", "PLAIN DOWN"];
player removeitem "Misery_boxnails"; 
for "_i" from 1 to 15 do {[player, "Misery_woodnail", true] call CBA_fnc_addItem;};
};
