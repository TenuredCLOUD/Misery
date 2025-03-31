#include "script_component.hpp"

if !(GVAR(clothingCheckAction)) exitWith {};

[
    "insulation_check_menu",
    localize "STR_MISERY_CheckClothing",
    {true},
    {
    call FUNC(insulation);
    },
    "",
    "",
    ""
] call EFUNC(actions,addAction);
