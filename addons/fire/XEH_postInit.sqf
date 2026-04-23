#include "script_component.hpp"

// [
//     "fire_menu",
//     localize ECSTRING(common,UseFire),
//     {call EFUNC(common,nearFire) params ["_nearestFire"]; _nearestFire isNotEqualTo []},
//     {
//         player setVariable [QEGVAR(actions,currentParentID), "fire_menu"];
//         call EFUNC(actions,displayActions);
//         call FUNC(addData);
//     },
//     "",
//     QPATHTOEF(icons,data\nearfire_ca.paa),
//     ""
// ] call EFUNC(actions,addAction);

// [
//     "fireStatus_menu",
//     "Check fire",
//     {player getVariable [QEGVAR(actions,currentParentID), ""] isEqualTo "fire_menu"},
//     {
//         [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
//         createDialog QCLASS(fireCrafting_ui);
//         player setVariable [QEGVAR(actions,currentParentID), ""];
//         call EFUNC(actions,displayActions);
//     },
//     "fire_menu",
//     QPATHTOEF(icons,data\nearfire_ca.paa),
//     ""
// ] call EFUNC(actions,addAction);

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
] call ace_interact_menu_fnc_createAction;

{
    [_x, 0, ["ACE_MainActions"], _fireAction] call ace_interact_menu_fnc_addActionToClass;
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
] call ace_interact_menu_fnc_createAction;

{
    [_x, 0, ["ACE_MainActions", QGVAR(fire_menu)], _fireCheckAction] call ace_interact_menu_fnc_addActionToClass;
} forEach [MACRO_FIRETYPES];

if (isServer) then {

    GVAR(activeFires) = [];
    publicVariable QGVAR(activeFires);

    call FUNC(manage);
};
