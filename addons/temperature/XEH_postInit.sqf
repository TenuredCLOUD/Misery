#include "script_component.hpp"

GVAR(exposureModifiers) = 0;
GVAR(thermalIndexModifiers) = 0;
GVAR(wetnessModifiers) = 0;
GVAR(thermalBagActive) = false;
GVAR(thermalPackHeatActive) = false;
GVAR(thermalPackColdActive) = false;

if (GVAR(breathFogAllowed)) then {
    [] call FUNC(breathFog);
};

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
