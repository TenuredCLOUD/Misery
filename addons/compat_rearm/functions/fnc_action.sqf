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

["AllVehicles", "Init", {
    params ["_vehicle"];

    private _requestRearmAction = [
        QGVAR(rearm_menu),
        localize ECSTRING(common,ReqResupply),
        QUOTE(a3\weapons_f\ammoboxes\data\ui\map_ammoveh_f_ca.paa),
        {
            createDialog QCLASS(rearmShop_ui);
        },
        {
            GVAR(areas) findIf {player inArea _x} isNotEqualTo -1
        }
    ] call ACEFUNC(interact_menu,createAction);

    [_vehicle, 0, [QUOTE(ACE_MainActions)], _requestRearmAction] call ACEFUNC(interact_menu,addActionToObject);
}, true, ["Man", "StaticWeapon"], true] call CBA_fnc_addClassEventHandler;
