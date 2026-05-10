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
] call ACEFUNC(interact_menu,createAction);

{
    [_x, 0, [QUOTE(ACE_MainActions)], _generatorAction] call ACEFUNC(interact_menu,addActionToClass);
} forEach GVAR(generators);
