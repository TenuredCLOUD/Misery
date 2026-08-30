#include "script_component.hpp"

if !(hasInterface) exitWith {};

if (GVAR(enabled)) then {
    [] call FUNC(infect);
};

["CAManBase", "hit", {_this call FUNC(infect)}, true, [], true] call CBA_fnc_addClassEventHandler;

if (GVAR(specimensEnabled)) then {

    private _zedSkinAction = [
        QGVAR(zed_skin_menu),
        "Collect specimen (skin)",
        QPATHTOEF(icons,data\slice_ca.paa),
        {
            params ["_target", "_player"];
            [_target] call FUNC(skinCorpse);
        },
        {
            params ["_target", "_player"];
            !alive _target && [[MACRO_KNIVES]] call EFUNC(common,hasItem);
        },
        {},
        ["_target", "_player"],
        [0, 0, 0],
        3
    ] call ACEFUNC(interact_menu,createAction);

    {
        [_x, 0, [QUOTE(ACE_MainActions)], _zedSkinAction] call ACEFUNC(interact_menu,addActionToClass);
    } forEach GVAR(zombieTypes);

    private _zedSawAction = [
        QGVAR(zed_saw_menu),
        "Collect specimen (saw)",
        QPATHTOEF(icons,data\slice_ca.paa),
        {
            params ["_target", "_player"];
            [_target] call FUNC(sawCorpse);
        },
        {
            params ["_target", "_player"];
            !alive _target && [[QCLASS(boneSaw)]] call EFUNC(common,hasItem);
        },
        {},
        ["_target", "_player"],
        [0, 0, 0],
        3
    ] call ACEFUNC(interact_menu,createAction);

    {
        [_x, 0, [QUOTE(ACE_MainActions)], _zedSawAction] call ACEFUNC(interact_menu,addActionToClass);
    } forEach GVAR(zombieTypes);
};
