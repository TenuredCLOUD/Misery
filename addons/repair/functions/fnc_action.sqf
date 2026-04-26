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

["AllVehicles", "Init", {
    params ["_vehicle"];

    private _requestRepairsAction = [
        QGVAR(repair_menu),
        localize ECSTRING(common,ReqRepairs),
        QPATHTOEF(markers,data\wrench_ca.paa),
        {
            createDialog QCLASS(repairShop_ui);
        },
        {
            GVAR(areas) findIf {player inArea _x} isNotEqualTo -1
        }
    ] call ACEFUNC(interact_menu,createAction);

    [_vehicle, 0, [QUOTE(ACE_MainActions)], _requestRepairsAction] call ACEFUNC(interact_menu,addActionToObject);
}, true, ["Man", "StaticWeapon"], true] call CBA_fnc_addClassEventHandler;
