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

["AllVehicles", "Init", {
    params ["_vehicle"];

    private _requestRefuelAction = [
        QGVAR(refuel_menu),
        localize ECSTRING(common,ReqRefuel),
        QPATHTOEF(markers,data\fuel_ca.paa),
        {
            createDialog QCLASS(refuelShop_ui);
        },
        {
            GVAR(areas) findIf {player inArea _x} isNotEqualTo -1
        }
    ] call ACEFUNC(interact_menu,createAction);

    [_vehicle, 0, [QUOTE(ACE_MainActions)], _requestRefuelAction] call ACEFUNC(interact_menu,addActionToObject);
}, true, ["Man", "StaticWeapon"], true] call CBA_fnc_addClassEventHandler;
