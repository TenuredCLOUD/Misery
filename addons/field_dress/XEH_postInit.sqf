#include "script_component.hpp"

if !(hasInterface) exitWith {};

if (GVAR(enabled)) then {
    [
        "field_dress_menu",
        "Field dress animal",
        {[[MACRO_KNIVES]] call EFUNC(common,hasItem) && ([player, [MACRO_FIELDDRESS_ANIMALTYPES], 2] call EFUNC(common,nearCorpse)) select 0},
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            call FUNC(skin);
        },
        "",
        "a3\modules_f_curator\data\portraitanimals_ca.paa",
        ""
    ] call EFUNC(actions,addAction);
};

