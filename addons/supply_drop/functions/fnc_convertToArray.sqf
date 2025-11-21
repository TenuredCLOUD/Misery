#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD
 * Ensures the arrays for supply drop vehicles, crates, and gear are array format
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_supply_drop_fnc_convertToArray
*/

// Marker postions
if (GVAR(dropMarkers) isNotEqualTo []) then {
    GVAR(dropMarkers) = parseSimpleArray GVAR(dropMarkers);

    {
        GVAR(dropZones) pushBack (getMarkerPos _x);
    } forEach GVAR(dropMarkers);
};

// Vehicles and crates
GVAR(heliTypes) = parseSimpleArray GVAR(heliTypes);
GVAR(crateTypes) = parseSimpleArray GVAR(crateTypes);

// Gear / Loot
GVAR(weapons) = parseSimpleArray GVAR(weapons);
GVAR(items) = parseSimpleArray GVAR(items);
GVAR(uniform) = parseSimpleArray GVAR(uniform);
GVAR(vest) = parseSimpleArray GVAR(vest);
GVAR(backpack) = parseSimpleArray GVAR(backpack);
