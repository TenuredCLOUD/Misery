#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Initiates the fishing UI if conditions are met
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_fishing_fnc_action
 *
*/

if !([] call FUNC(canFish)) exitWith {
    ctrlSetText [1001, "You need to be near water or on a watercraft to fish!"];
};

if !([] call FUNC(hasGear)) exitWith {
    ctrlSetText [1001, "You need a fishing pole, spool, hook, and bait to fish!"];
};

// Force holstering
if (currentWeapon player isNotEqualTo "") then {
    player action ["SWITCHWEAPON", player, player, -1];
};

createDialog QCLASS(fishing_ui);

// Hide progress bars and interactive buttons:
[982387, [1010, 1011, 1012, 1013], false] call EFUNC(common,displayShowControls);
