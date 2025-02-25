#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
 * Checks if players are inside a rearm zone.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_rearm_fnc_action
*/

// If rearm area check fails, system will not function.
if !(call FUNC(checkAreas)) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), "Marker check system failed, system disabled."] call EFUNC(common,debugMessage);
};

[
    "rearm_menu",
    localize "STR_MISERY_REQRESUPPLY",
    {GVAR(areas) findIf {player inArea _x} isNotEqualTo -1},
    {
    [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
    createDialog QCLASS(rearmShop_ui);
    },
    "",
    "",
    ""
] call EFUNC(actions,addAction);
