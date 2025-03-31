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
    private _jetFuelPumpReqStr = format ["<t font='PuristaMedium' size='0.7'>%1</t>", localize "STR_MISERY_JETFUELPUMPREQTIP"];
    [QEGVAR(common,tileText), _jetFuelPumpReqStr] call CBA_fnc_localEvent;
};

//Fuel collection:
if (_action isEqualTo localize "STR_MISERY_FUELPUMPREQ") exitWith {
    private _fuelPumpReqStr = format ["<t font='PuristaMedium' size='0.7'>%1</t>", localize "STR_MISERY_FUELPUMPREQTIP"];
    [QEGVAR(common,tileText), _fuelPumpReqStr] call CBA_fnc_localEvent;
};

//Fuel dumping Jerrycans:
if (_action isEqualTo localize "STR_MISERY_DUMPOUTFUELJET") exitWith {
    if !([[QCLASS(jetFuel)]] call EFUNC(common,hasItem)) then {
        private _noJetJerryCanStr = format ["<t font='PuristaMedium' size='0.7'>%1</t>", localize "STR_MISERY_DUMPOUTFUELJETNOCANNOTI"];
        [QEGVAR(common,tileText), _noJetJerryCanStr] call CBA_fnc_localEvent;
    } else {
        private _jetJerryCanDumpSuccessStr = format ["<t font='PuristaMedium' size='0.7'>%1</t>", localize "STR_MISERY_DUMPOUTFUELJETSUCCESS"];
        [QEGVAR(common,tileText), _jetJerryCanDumpSuccessStr] call CBA_fnc_localEvent;
        player removeItem QCLASS(jetFuel);
        player addItem QCLASS(jetFuelJerryCan_Empty);
    };
};

if (_action isEqualTo localize "STR_MISERY_DUMPOUTFUELDIESEL") exitWith {
    if !([[QCLASS(diesel)]] call EFUNC(common,hasItem)) then {
        private _noDieselJerryCanStr = format ["<t font='PuristaMedium' size='0.7'>%1</t>", localize "STR_MISERY_DUMPOUTFUELDIESELNOCANNOTI"];
        [QEGVAR(common,tileText), _noDieselJerryCanStr] call CBA_fnc_localEvent;
    } else {
        private _dieselJerryCanDumpSuccessStr = format ["<t font='PuristaMedium' size='0.7'>%1</t>", localize "STR_MISERY_DUMPOUTFUELDIESELSUCCESS"];
        [QEGVAR(common,tileText), _dieselJerryCanDumpSuccessStr] call CBA_fnc_localEvent;
        player removeItem QCLASS(diesel);
        player addItem QCLASS(dieselJerryCan_Empty);
    };
};

if (_action isEqualTo localize "STR_MISERY_DUMPOUTFUELPETROL") exitWith {
    if !([[QCLASS(petrol)]] call EFUNC(common,hasItem)) then {
        private _noPetrolJerryCanStr = format ["<t font='PuristaMedium' size='0.7'>%1</t>", localize "STR_MISERY_DUMPOUTFUELPETROLNOCANNOTI"];
        [QEGVAR(common,tileText), _noPetrolJerryCanStr] call CBA_fnc_localEvent;
    } else {
        private _petrolJerryCanDumpSuccessStr = format ["<t font='PuristaMedium' size='0.7'>%1</t>", localize "STR_MISERY_DUMPOUTFUELPETROLSUCCESS"];
        [QEGVAR(common,tileText), _petrolJerryCanDumpSuccessStr] call CBA_fnc_localEvent;
        player removeItem QCLASS(petrol);
        player addItem QCLASS(petrolJerryCan_Empty);
    };
};
