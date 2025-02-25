#include "..\script_component.hpp"
/*
 * Author: MikeMF, TenuredCLOUD
 * Checks if players are inside a refuel zone.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_refuel_fnc_action
*/

// If refuel area check fails, system will not function.
if !(call FUNC(checkAreas)) exitWith {
    [QUOTE(COMPONENT_BEAUTIFIED), "Marker check system failed, system disabled."] call EFUNC(common,debugMessage);
};

[
    "refuel_menu",
    localize "STR_MISERY_REQREFUEL",
    {GVAR(areas) findIf {player inArea _x} isNotEqualTo -1},
    {
    [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
    createDialog QCLASS(refuelShop_ui);
    },
    "",
    "",
    ""
] call EFUNC(actions,addAction);
