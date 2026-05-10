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
    ] call ACEFUNC(interact_menu,createAction);

    {
        [_x, 0, [QUOTE(ACE_MainActions)], _fieldDressAction] call ACEFUNC(interact_menu,addActionToClass);
    } forEach [MACRO_FIELDDRESS_ANIMALTYPES];
};

if (GVAR(dispatchEnabled)) then {
    private _dispatchAction = [
        QGVAR(dispatch_menu),
        "Snap neck",
        QPATHTOEF(icons,data\paw_print_ca.paa),
        {
            params ["_target", "_player"];
            playSound selectRandom [QCLASSACE(fracture_1), QCLASSACE(fracture_2), QCLASSACE(fracture_3), QCLASSACE(fracture_4)];
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
    ] call ACEFUNC(interact_menu,createAction);

    {
        [_x, 0, [QUOTE(ACE_MainActions)], _dispatchAction] call ACEFUNC(interact_menu,addActionToClass);
    } forEach [MACRO_FIELDDRESS_SMALLANIMALTYPES];
};
