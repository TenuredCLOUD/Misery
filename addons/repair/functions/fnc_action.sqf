#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
 * Checks if players are inside a repair zone.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_repair_fnc_action
*/

// If repair area check fails, system will not function.
if !(call FUNC(checkAreas)) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), "Marker check system failed, system disabled."] call EFUNC(common,debugMessage);
};

[
    "repair_menu",
    localize "STR_MISERY_REQREPAIRS",
    {GVAR(areas) findIf {player inArea _x} isNotEqualTo -1},
    {
        [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
        createDialog QCLASS(repairShop_ui);
    },
    "",
    "",
    ""
] call EFUNC(actions,addAction);
