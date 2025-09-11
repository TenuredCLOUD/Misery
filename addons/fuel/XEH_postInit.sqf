#include "script_component.hpp"

if !(GVAR(enabled)) exitWith {};

[
    "jetFuelAct_menu",
    localize "STR_MISERY_USEJETFUELPUMP",
    {[[QCLASS(jetFuel_Russian)], 5.5] call EFUNC(common,nearCraftingStation)},
    {
    [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
    call FUNC(storeArtifact);
    },
    "",
    "",
    ""
] call EFUNC(actions,addAction);

if ([[QCLASS(jetFuel_Russian)], 5.5] call EFUNC(common,nearCraftingStation)) then {
    _out pushBack [localize "STR_MISERY_USEJETFUELPUMP",localize "STR_MISERY_USEJETFUELPUMP"];
    _out pushBack [localize "STR_MISERY_JETFUELPUMPREQ",localize "STR_MISERY_JETFUELPUMPREQ"];
};
if ([[MACRO_FUELSTATIONS], 1.5] call EFUNC(common,nearCraftingStation)) then {
    _out pushBack [localize "STR_MISERY_USEFUELPUMP",localize "STR_MISERY_USEFUELPUMP"];
    _out pushBack [localize "STR_MISERY_FUELPUMPREQ",localize "STR_MISERY_FUELPUMPREQ"];
};

//Jet fuel collection:
if (_action isEqualTo localize "STR_MISERY_JETFUELPUMPREQ") exitWith {
    [QEGVAR(common,tileText), localize "STR_MISERY_JETFUELPUMPREQTIP"] call CBA_fnc_localEvent;
};

//Fuel collection:
if (_action isEqualTo localize "STR_MISERY_FUELPUMPREQ") exitWith {
    [QEGVAR(common,tileText), localize "STR_MISERY_FUELPUMPREQTIP"] call CBA_fnc_localEvent;
};

//Fuel dumping Jerrycans:
if (_action isEqualTo localize "STR_MISERY_DUMPOUTFUELJET") exitWith {
    if !([[QCLASS(jetFuel)]] call EFUNC(common,hasItem)) then {
        [QEGVAR(common,tileText), localize "STR_MISERY_DUMPOUTFUELJETNOCANNOTI"] call CBA_fnc_localEvent;
    } else {
        [QEGVAR(common,tileText), localize "STR_MISERY_DUMPOUTFUELJETSUCCESS"] call CBA_fnc_localEvent;
        player removeItem QCLASS(jetFuel);
        player addItem QCLASS(jetFuelJerryCan_Empty);
    };
};

if (_action isEqualTo localize "STR_MISERY_DUMPOUTFUELDIESEL") exitWith {
    if !([[QCLASS(diesel)]] call EFUNC(common,hasItem)) then {
        [QEGVAR(common,tileText), localize "STR_MISERY_DUMPOUTFUELDIESELNOCANNOTI"] call CBA_fnc_localEvent;
    } else {
        [QEGVAR(common,tileText), localize "STR_MISERY_DUMPOUTFUELDIESELSUCCESS"] call CBA_fnc_localEvent;
        player removeItem QCLASS(diesel);
        player addItem QCLASS(dieselJerryCan_Empty);
    };
};

if (_action isEqualTo localize "STR_MISERY_DUMPOUTFUELPETROL") exitWith {
    if !([[QCLASS(petrol)]] call EFUNC(common,hasItem)) then {
        [QEGVAR(common,tileText), localize "STR_MISERY_DUMPOUTFUELPETROLNOCANNOTI"] call CBA_fnc_localEvent;
    } else {
        [QEGVAR(common,tileText), localize "STR_MISERY_DUMPOUTFUELPETROLSUCCESS"] call CBA_fnc_localEvent;
        player removeItem QCLASS(petrol);
        player addItem QCLASS(petrolJerryCan_Empty);
    };
};
