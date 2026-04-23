#include "script_component.hpp"

if !(hasInterface) exitWith {};

if (GVAR(enabled)) then {

        private _fieldDressAction = [
        "field_dress_menu",
        "Field dress animal",
        QPATHTOEF(icons,data\paw_print_ca.paa),
        {
            call FUNC(skin);
        },
        {
            [[MACRO_KNIVES]] call EFUNC(common,hasItem) && ([player, [MACRO_FIELDDRESS_ANIMALTYPES], 2] call EFUNC(common,nearCorpse)) select 0
        }
    ] call ace_interact_menu_fnc_createAction;

    {
        [_x, 0, ["ACE_MainActions"], _fieldDressAction] call ace_interact_menu_fnc_addActionToClass;
    } forEach [MACRO_FIELDDRESS_ANIMALTYPES];
};

