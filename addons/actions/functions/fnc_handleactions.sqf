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

//SP sleeping
if (!EGVAR(common,checkMultiplayer)) then {
private _object = cursorObject;
private _model = getModelInfo _object select 0;
    if (_model in ["woodenbed_01_f.p3d",
        "bed_big_a.p3d",
        "bed_husbands.p3d",
        "vojenska_palanda.p3d",
        "postel_manz_kov.p3d",
        "sofa_01_f.p3d",
        "Land_ArmChair_01_F",
        "armchair.p3d",
        "armchair_big.p3d",
        "postel_panelak1.p3d",
        "postel_panelak2.p3d",
        "sleeping_bag_f.p3d",
        "sleeping_bag_blue_f.p3d",
        "sleeping_bag_brown_f.p3d",
        "ground_sheet_f.p3d",
        "ground_sheet_blue_f.p3d",
        "ground_sheet_khaki_f.p3d",
        "ground_sheet_opfor_f.p3d",
        "ground_sheet_yellow_f.p3d"
        ]) then {
    _out pushBack ["Sleep","Sleep"];
    };
};

//Vehicle data parsing:
private _position = getPos player;
private _vehicles = [];
{
    _vehicles append (nearestObjects [_position, [_x], 5]);
} forEach ["Car", "Tank", "Air", "Ship"];
EGVAR(common,targetVehicle) = if (count _vehicles > 0) then { _vehicles select 0 }else{ objNull };
EGVAR(common,targetVehicleType) = typeOf EGVAR(common,targetVehicle);

if (EGVAR(fishing,enabled)) then {
    if (call EFUNC(fishing,Canfish)) then {
        _out pushBack [localize "STR_MISERY_STARTFISHING",localize "STR_MISERY_STARTFISHING"];
    };
};

if (EGVAR(cooking,enabled)) then {
    if (call EFUNC(common,nearFire)) then {
        _out pushBack [localize "STR_MISERY_USEFIRE",localize "STR_MISERY_USEFIRE"];
    };
};

if (EGVAR(hydrology,enabled)) then {
    if (call EFUNC(common,nearWell)) then {
        _out pushBack [localize "STR_MISERY_COLLECTWATER",localize "STR_MISERY_COLLECTWATER"];
    };
};

if (EGVAR(forestry,woodCollection)) then {
    if (call EFUNC(common,nearTreeAxe)) then {
        _out pushBack [localize "STR_MISERY_CHOPWOOD",localize "STR_MISERY_CHOPWOOD"];
    };
    if (call EFUNC(common,nearTreeSaw)) then {
        _out pushBack [localize "STR_MISERY_SAWWOOD",localize "STR_MISERY_SAWWOOD"];
    };
    if (call EFUNC(common,nearTree)) then {
        _out pushBack [localize "STR_MISERY_COLLECTWOOD",localize "STR_MISERY_COLLECTWOOD"];
    };

    if ([[QCLASS(woodenlog)]] call EFUNC(common,hasItem)) then {
        _out pushBack [localize "STR_MISERY_SPLITWOODLOG",localize "STR_MISERY_SPLITWOODLOG"];
    };
};

if (EGVAR(forestry,foraging)) then {
    if (call EFUNC(forestry,Canforage)) then {
        _out pushBack [localize "STR_MISERY_FORAGE", localize "STR_MISERY_FORAGE"];
    };
};

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

if (EGVAR(crafting,enabled)) then {
    if ([[MACRO_CRAFTINGSTATIONS], 1.5] call EFUNC(common,nearCraftingStation)) then {
        _out pushBack [localize "STR_MISERY_CRAFTINGWORKBENCH",localize "STR_MISERY_CRAFTINGWORKBENCH"];
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

if (EGVAR(radiation,leadContainers)) then {
    if ([[QCLASS(leadContainer_Open)]] call EFUNC(common,hasItem) && [[MACRO_ARTIFACTS]] call EFUNC(common,hasItem)) then {
        _out pushBack [localize "STR_MISERY_STOREARTIFACT",localize "STR_MISERY_STOREARTIFACT"];
    };
};

if ([[QCLASS(headlamp_Off)]] call EFUNC(common,hasItem)) then {
    _out pushBack [localize "STR_MISERY_TURNONHEADLAMP",localize "STR_MISERY_TURNONHEADLAMP"];
};

if ([[QCLASS(headlamp_On)]] call EFUNC(common,hasItem)) then {
    _out pushBack [localize "STR_MISERY_TURNOFFHEADLAMP",localize "STR_MISERY_TURNOFFHEADLAMP"];
};

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

//WBKIMS checks + Swappers:
if (EGVAR(ims,enabled)) then {
    [player, QCLASS(woodaxe), "WBK_axe"] call EFUNC(common,weaponSwap);
    [player, QCLASS(sledgehammer), "WBK_survival_weapon_2"] call EFUNC(common,weaponSwap);
    [player, QCLASS(craftingHammer), "WBK_SmallHammer"] call EFUNC(common,weaponSwap);
    [player, QCLASS(anvilHammer), "WBK_SmallHammer"] call EFUNC(common,weaponSwap);
    [player, "rvg_guttingKnife", selectRandom [MACRO_KNIVES]] call EFUNC(common,weaponSwap);
    [player, QCLASS(guttingKnife), selectRandom [MACRO_KNIVES]] call EFUNC(common,weaponSwap);
};

//Money Collection:
if (((call EFUNC(money,nearestCorpseMoney)) select 0)) then {
    _out pushBack ["Search for Money","Search For Money"];
};

_out
