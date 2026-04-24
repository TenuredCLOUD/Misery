#include "script_component.hpp"

if !(hasInterface) exitWith {};

if (GVAR(enabled)) then {

        private _fieldDressAction = [
        QGVAR(field_dress_menu),
        "Field dress animal",
        QPATHTOEF(icons,data\paw_print_ca.paa),
        {
            params ["_target", "_player"];
            [_target] call FUNC(skin);
        },
        {
            params ["_target", "_player"];
            !alive _target && [[MACRO_KNIVES]] call EFUNC(common,hasItem);
        },
        {},
        ["_target", "_player"],
        [0, 0, 0],
        3
    ] call ace_interact_menu_fnc_createAction;

    {
        [_x, 0, ["ACE_MainActions"], _fieldDressAction] call ace_interact_menu_fnc_addActionToClass;
    } forEach [MACRO_FIELDDRESS_ANIMALTYPES];
};

if (GVAR(dispatchEnabled)) then {
    private _dispatchAction = [
        QGVAR(dispatch_menu),
        "Snap neck",
        QPATHTOEF(icons,data\paw_print_ca.paa),
        {
            params ["_target", "_player"];
            playSound selectRandom ["ACE_fracture_1", "ACE_fracture_2", "ACE_fracture_3", "ACE_fracture_4"];
            _target setDamage 1;
        },
        {
            params ["_target", "_player"];
            alive _target;
        },
        {},
        ["_target", "_player"],
        [0, 0, 0],
        3
    ] call ace_interact_menu_fnc_createAction;

    {
        [_x, 0, ["ACE_MainActions"], _dispatchAction] call ace_interact_menu_fnc_addActionToClass;
    } forEach [MACRO_FIELDDRESS_SMALLANIMALTYPES];
};
