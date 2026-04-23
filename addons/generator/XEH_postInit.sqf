#include "script_component.hpp"

private _generatorAction = [
    QGVAR(generator_menu),
    "Use Generator",
    QPATHTOEF(icons,data\cable_ca.paa),
    {
        params ["_target", "_player"];
        createDialog QCLASS(generator_ui);
    },
    {
        [player] call FUNC(nearGenerator) select 0;
    },
    {},
    ["_target", "_player"],
    [0, 0, 0],
    3
] call ace_interact_menu_fnc_createAction;

{
    [_x, 0, ["ACE_MainActions"], _generatorAction] call ace_interact_menu_fnc_addActionToClass;
} forEach GVAR(generators);
