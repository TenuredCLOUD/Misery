#include "script_component.hpp"

private _fireAction = [
    QGVAR(fire_menu),
    localize ECSTRING(common,UseFire),
    QPATHTOEF(icons,data\nearfire_ca.paa),
    {
        params ["_target", "_player"];
    },
    {call EFUNC(common,nearFire) params ["_nearestFire"]; _nearestFire isNotEqualTo []},
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

{
    [_x, 0, [QUOTE(ACE_MainActions)], _fireAction] call ACEFUNC(interact_menu,addActionToClass);
} forEach [MACRO_FIRETYPES];

private _fireCheckAction = [
    QGVAR(fireStatus_menu),
    "Check fire",
    QPATHTOEF(icons,data\nearfire_ca.paa),
    {
        params ["_target", "_player"];
        call FUNC(addData);
        createDialog QCLASS(fireCrafting_ui);
    },
    {true},
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ACEFUNC(interact_menu,createAction);

{
    [_x, 0, [QUOTE(ACE_MainActions), QGVAR(fire_menu)], _fireCheckAction] call ACEFUNC(interact_menu,addActionToClass);
} forEach [MACRO_FIRETYPES];

if (isServer) then {

    GVAR(activeFires) = [];
    publicVariable QGVAR(activeFires);

    call FUNC(manage);
};
