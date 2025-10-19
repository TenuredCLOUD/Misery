#include "script_component.hpp"

if ("ace_refuel" call EFUNC(common,isModLoaded)) exitWith {};

if (isServer) then {
    [
        "refuel_pump_menu",
        "Refuel at pump",
        {[[MACRO_FUELSTATIONS_LAND], 2.5] call EFUNC(common,nearCraftingStation) || [[MACRO_FUELSTATIONS_AIR], 10] call EFUNC(common,nearCraftingStation)},
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            createDialog QCLASS(refuelVehicle_ui);
        },
        "",
        QPATHTOEF(markers,data\fuel.paa),
        ""
    ] call EFUNC(actions,addAction);

    [
        "refuel_fuelCan_pump_menu",
        "Refill fuel can at pump",
        {[[MACRO_FUELSTATIONS_LAND], 2.5] call EFUNC(common,nearCraftingStation) || [[MACRO_FUELSTATIONS_AIR], 5] call EFUNC(common,nearCraftingStation)},
        {
            [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
            createDialog QCLASS(refuelfuelCan_ui);
        },
        "",
        QPATHTOEF(markers,data\fuel.paa),
        ""
    ] call EFUNC(actions,addAction);
};
