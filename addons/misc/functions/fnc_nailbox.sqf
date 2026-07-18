#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Action removing nails from boxes
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * [] call misery_misc_fnc_nailBox;
 *
 * Public: No
*/

ACE_player removeItem QCLASS(boxNails);

for "_i" from 1 to 15 do {
    [ACE_player, QCLASS(woodnail), true] call CBA_fnc_addItem;
};
