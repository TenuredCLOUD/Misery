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

private _insulationCheckAction = [
    QGVAR(insulation_check_menu),
    localize LSTRING(CheckClothing),
    QPATHTOEF(icons,data\layers_plus_ca.paa),
    {
        call FUNC(insulation);
    },
    {true}
] call ACEFUNC(interact_menu,createAction);

[player, 1, [QUOTE(ACE_SelfActions), QUOTE(ACE_Equipment)], _insulationCheckAction] call ACEFUNC(interact_menu,addActionToObject);
