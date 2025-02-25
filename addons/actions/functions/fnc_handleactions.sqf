#include "..\script_component.hpp"
/*
 * Author: TenuredCLOUD, Drongo
 * actions (inventory GUI) default actions checks and parser
 * Parses STRING values to inventory GUI when conditions return true
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_actions_fnc_handleactions
*/

private _out = [];
private _near = player nearObjects 5;
private _cursorObject = cursorObject;

private _items = [];
_items = _items + (items player);
_items = _items + (assignedItems player);
_items = _items + (magazines player);
_items = _items + (weapons player);

if ([[QCLASS(jetFuel_Russian)], 5.5] call EFUNC(common,nearCraftingStation)) then {
    _out pushBack [localize "STR_MISERY_USEJETFUELPUMP",localize "STR_MISERY_USEJETFUELPUMP"];
    _out pushBack [localize "STR_MISERY_JETFUELPUMPREQ",localize "STR_MISERY_JETFUELPUMPREQ"];
};
if ([[MACRO_FUELSTATIONS], 1.5] call EFUNC(common,nearCraftingStation)) then {
    _out pushBack [localize "STR_MISERY_USEFUELPUMP",localize "STR_MISERY_USEFUELPUMP"];
    _out pushBack [localize "STR_MISERY_FUELPUMPREQ",localize "STR_MISERY_FUELPUMPREQ"];
};

if (EGVAR(mining,enabled)) then {
    if ([[QCLASS(anvil)], 1.5] call EFUNC(common,nearCraftingStation)) then {
        _out pushBack [localize "STR_MISERY_USEANVIL",localize "STR_MISERY_USEANVIL"];
    };
    if ([[QCLASS(forge)], 1.5] call EFUNC(common,nearCraftingStation)) then {
        _out pushBack [localize "STR_MISERY_USEFORGE",localize "STR_MISERY_USEFORGE"];
    };
    if (call EFUNC(common,nearRockSource)) then {
        _out pushBack [localize "STR_MISERY_MINEORE",localize "STR_MISERY_MINEORE"];
    };
};

if (EGVAR(common,iBuild)) then {
    if (call EFUNC(buildex,hasHammer)) then {
        _out pushBack [localize "STR_MISERY_IBUILDOPEN",localize "STR_MISERY_IBUILDOPEN"];
    };
    if (call EFUNC(buildex,hasSledghammer)) then {
        _out pushBack [localize "STR_MISERY_USESLEDGE",localize "STR_MISERY_USESLEDGE"];
    };
};

// if (MiseryJerrycanacts) then {
//     if ([[QCLASS(WaterJerryF"]] call EFUNC(common,hasItem)) then {
//         _out pushBack [localize "STR_MISERY_USEJERRYCANCLEAN",localize "STR_MISERY_USEJERRYCANCLEAN"];
//     };
//     if ([[QCLASS(WaterJerryFD"]] call EFUNC(common,hasItem)) then {
//         _out pushBack [localize "STR_MISERY_USEJERRYCANDIRTY",localize "STR_MISERY_USEJERRYCANDIRTY"];
//     };
// };

if (EGVAR(rfdetector,enabled)) then {
    if ([[QCLASS(rfHighRange_Off)]] call EFUNC(common,hasItem)) then {
        _out pushBack [localize "STR_MISERY_TURNONRFDETEC",localize "STR_MISERY_TURNONRFDETEC"];
    };
    if ([[QCLASS(rfHighRange_On)]] call EFUNC(common,hasItem)) then {
        _out pushBack [localize "STR_MISERY_TURNOFFRFDETEC",localize "STR_MISERY_TURNOFFRFDETEC"];
    };
};

/*
if ((count (entities QCLASS(RadioSettings")) > 0) then {
    if ([[QCLASS(PortableRadioOFF"]] call EFUNC(common,hasItem)) then {
        _out pushBack ["Turn on Portable Radio", "Turn on Portable Radio"];
    };
    if ([[QCLASS(PortableRadioON"]] call EFUNC(common,hasItem)) then {
    _out pushBack ["Turn off Portable Radio", "Turn off Portable Radio"];
    };
};
*/

if ([[QCLASS(jetFuel)]] call EFUNC(common,hasItem)) then {
_out pushBack [localize "STR_MISERY_DUMPOUTFUELJET",localize "STR_MISERY_DUMPOUTFUELJET"];
};
if ([[QCLASS(jetFuelJerryCan_Empty)]] call EFUNC(common,hasItem)) then {
_out pushBack [localize "STR_MISERY_SWAPFUELTYPEJET",localize "STR_MISERY_SWAPFUELTYPEJET"];
};

if ([[QCLASS(diesel)]] call EFUNC(common,hasItem)) then {
_out pushBack [localize "STR_MISERY_DUMPOUTFUELDIESEL",localize "STR_MISERY_DUMPOUTFUELDIESEL"];
};
if ([[QCLASS(dieselJerryCan_Empty)]] call EFUNC(common,hasItem)) then {
_out pushBack [localize "STR_MISERY_SWAPFUELTYPEDIESEL",localize "STR_MISERY_SWAPFUELTYPEDIESEL"];
};

if ([[QCLASS(petrol)]] call EFUNC(common,hasItem)) then {
    _out pushBack [localize "STR_MISERY_DUMPOUTFUELPETROL",localize "STR_MISERY_DUMPOUTFUELPETROL"];
};
if ([[QCLASS(petrolJerryCan_Empty)]] call EFUNC(common,hasItem)) then {
    _out pushBack [localize "STR_MISERY_SWAPFUELTYPEPETROL",localize "STR_MISERY_SWAPFUELTYPEPETROL"];
};

if (EGVAR(common,ace) && [[QCLASS(needleThread)]] call EFUNC(common,hasItem)) then {
    _out pushBack [localize "STR_MISERY_STITCHWOUNDS",localize "STR_MISERY_STITCHWOUNDS"];
};

if (MiseryinVehiclerepairarea) then {
_out pushBack [localize "STR_MISERY_REQREPAIRS",localize "STR_MISERY_REQREPAIRS"];
};

if (Miseryinrearmarea) then {
_out pushBack [localize "STR_MISERY_REQRESUPPLY",localize "STR_MISERY_REQRESUPPLY"];
};

if (MiseryinRefuelzonearea) then {
_out pushBack [localize "STR_MISERY_REQREFUEL",localize "STR_MISERY_REQREFUEL"];
};

if (MiseryinMedzonearea) then {
_out pushBack [localize "STR_MISERY_REQTREATMENT",localize "STR_MISERY_REQTREATMENT"];
};

//Item swappers:
//Radiation / Geiger conversion:
if EGVAR(radiation,enhancedExposure) then {
    [player, "rvg_Geiger", QCLASS(geiger_NoBattery)] call EFUNC(common,itemSwap);
};

//Vanilla toolkit conversion:
[player, "ToolKit", "rvg_toolkit"] call EFUNC(common,itemSwap);

//ACE compat notepad swap:
if (EGVAR(common,ace)) then {
    [player, "rvg_notepad", "acex_intelitems_notepad"] call EFUNC(common,itemSwap);
};

//Fuel canister conversion:
[player, "rvg_canisterFuel", selectRandom [QCLASS(diesel),QCLASS(petrol)]] call EFUNC(common,itemSwap);
[player, "rvg_canisterFuel_Empty", selectRandom [QCLASS(dieselJerryCan_Empty),QCLASS(petrolJerryCan_Empty)]] call EFUNC(common,itemSwap);

//Money Collection:
if (((call EFUNC(money,nearestCorpseMoney)) select 0)) then {
    _out pushBack ["Search for Money","Search For Money"];
};

_out
