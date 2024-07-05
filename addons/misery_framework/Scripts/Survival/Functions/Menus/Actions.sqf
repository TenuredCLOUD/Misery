 /* -----------------------------------
Misery Mod actions (inventory GUI)
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

#include "\z\misery\addons\misery_framework\Scripts\Misery_PreParser.hpp"

private _out=[];
private _near=player nearObjects 5;
private _cursorObject=cursorObject;

private _items=[];
_items=_items+(items player);
_items=_items+(assignedItems player);
_items=_items+(magazines player);
_items=_items+(weapons player);

if (Miseryfish) then {
if (call Misery_fnc_Canfish) then {
	_out pushback [localize "STR_MISERY_STARTFISHING",localize "STR_MISERY_STARTFISHING"];
}; 
};

if (Miseryforage) then {
if (call Misery_fnc_Canforage) then {
	_out pushback [localize "STR_MISERY_FORAGE", localize "STR_MISERY_FORAGE"];
}; 
};

if (Miserycook) then {
if (call Misery_fnc_NearFire) then {
	_out pushback [localize "STR_MISERY_USEFIRE",localize "STR_MISERY_USEFIRE"];
}; 
};

if (Miserywatercoll) then {
if (call Misery_fnc_NearWell) then {
	_out pushback [localize "STR_MISERY_COLLECTWATER",localize "STR_MISERY_COLLECTWATER"];
}; 
};

if (Miserywoodcut) then {
if (call Misery_fnc_NearTreeAxe) then {
	_out pushback [localize "STR_MISERY_CHOPWOOD",localize "STR_MISERY_CHOPWOOD"];
}; 
if (call Misery_fnc_NearTreeSaw) then {
	_out pushback [localize "STR_MISERY_SAWWOOD",localize "STR_MISERY_SAWWOOD"];
}; 
if (call Misery_fnc_NearTree) then {
	_out pushback [localize "STR_MISERY_COLLECTWOOD",localize "STR_MISERY_COLLECTWOOD"];
}; 
if ("Misery_woodenlog" in items player) then {
	_out pushback [localize "STR_MISERY_SPLITWOODLOG",localize "STR_MISERY_SPLITWOODLOG"];
}; 
};

if (call Misery_fnc_NearJetFuel) then {
	_out pushback [localize "STR_MISERY_USEJETFUELPUMP",localize "STR_MISERY_USEJETFUELPUMP"];
	_out pushback [localize "STR_MISERY_JETFUELPUMPREQ",localize "STR_MISERY_JETFUELPUMPREQ"];
};
if (call Misery_fnc_NearFuel) then {
	_out pushback [localize "STR_MISERY_USEFUELPUMP",localize "STR_MISERY_USEFUELPUMP"];
	_out pushback [localize "STR_MISERY_FUELPUMPREQ",localize "STR_MISERY_FUELPUMPREQ"];
};

if (MiseryMine) then {
if (call Misery_fnc_NearAnvil) then {
	_out pushback [localize "STR_MISERY_USEANVIL",localize "STR_MISERY_USEANVIL"];
};
if (call Misery_fnc_NearForge) then {
	_out pushback [localize "STR_MISERY_USEFORGE",localize "STR_MISERY_USEFORGE"];
};
if (call Misery_fnc_NearRockSource) then {
	_out pushback [localize "STR_MISERY_MINEORE",localize "STR_MISERY_MINEORE"];
};
};

if (MiseryCraft) then {
if (call Misery_fnc_NearWorkbench) then {
	_out pushback [localize "STR_MISERY_CRAFTINGWORKBENCH",localize "STR_MISERY_CRAFTINGWORKBENCH"];
};
};

if (MiseryUsingiBuild) then {
if (call Misery_fnc_Hashammer) then {
	_out pushback [localize "STR_MISERY_IBUILDOPEN",localize "STR_MISERY_IBUILDOPEN"];
};
if (call Misery_fnc_HasSledghammer) then {
	_out pushback [localize "STR_MISERY_USESLEDGE",localize "STR_MISERY_USESLEDGE"];
};
};

if (MiseryJerrycanacts) then {
if (call Misery_fnc_HasJerrycanClean) then {
_out pushback [localize "STR_MISERY_USEJERRYCANCLEAN",localize "STR_MISERY_USEJERRYCANCLEAN"];
};
if (call Misery_fnc_HasJerrycanDirty) then {
_out pushback [localize "STR_MISERY_USEJERRYCANDIRTY",localize "STR_MISERY_USEJERRYCANDIRTY"];
};
};

if (MiseryPDAacts) then {
if ("Misery_PDA" in items player) then {
_out pushback [localize "STR_MISERY_USEPDA",localize "STR_MISERY_USEPDA"];
};
if ("Misery_PDA_off" in items player) then {
_out pushback [localize "STR_MISERY_REBOOTPDA",localize "STR_MISERY_REBOOTPDA"];
};
};

if (MiseryGeigeracts) then {
if ("Misery_personalgeigerOFF" in items player) then {
_out pushback [localize "STR_MISERY_TURNONGEIGER",localize "STR_MISERY_TURNONGEIGER"];
};
if ("Misery_personalgeiger" in items player) then {
_out pushback [localize "STR_MISERY_TURNOFFGEIGER",localize "STR_MISERY_TURNOFFGEIGER"];
};
};

if (MiseryRFEMFacts) then {
if ("Misery_RFHighrangeOFF" in items player) then {
_out pushback [localize "STR_MISERY_TURNONRFDETEC",localize "STR_MISERY_TURNONRFDETEC"];
};
if ("Misery_RFHighrangeON" in items player) then {
_out pushback [localize "STR_MISERY_TURNOFFRFDETEC",localize "STR_MISERY_TURNOFFRFDETEC"];
};
};

// if ((count (entities"Misery_RadioSettings")) > 0) then {
// if ("Misery_PortableradioOFF" in items player) then {
// _out pushback ["Turn on Portable Radio", "Turn on Portable Radio"];
// };
// if ("Misery_PortableradioON" in items player) then {
// _out pushback ["Turn off Portable Radio", "Turn off Portable Radio"];
// };
// };

if (MiseryLeadcontaineracts) then {
if ("Misery_leadcontaineropen" in items player && [MIS_Artifact,(items player)] call Misery_fnc_Inarray) then {
_out pushback [localize "STR_MISERY_STOREARTIFACT",localize "STR_MISERY_STOREARTIFACT"];
};
};

if ("Misery_HeadlampOFF" in items player) then {
_out pushback [localize "STR_MISERY_TURNONHEADLAMP",localize "STR_MISERY_TURNONHEADLAMP"];
};

if ("Misery_HeadlampON" in items player) then {
_out pushback [localize "STR_MISERY_TURNOFFHEADLAMP",localize "STR_MISERY_TURNOFFHEADLAMP"];
};

if ("Misery_guitar" in items player) then {
_out pushback [localize "STR_MISERY_PLAYGUITAR",localize "STR_MISERY_PLAYGUITAR"];
};

if ("Misery_JetFuelF" in items player) then {
_out pushback [localize "STR_MISERY_DUMPOUTFUELJET",localize "STR_MISERY_DUMPOUTFUELJET"];
};
if ("Misery_EmptyJet" in items player) then {
_out pushback [localize "STR_MISERY_SWAPFUELTYPEJET",localize "STR_MISERY_SWAPFUELTYPEJET"];
};

if ("Misery_DieselF" in items player) then {
_out pushback [localize "STR_MISERY_DUMPOUTFUELDIESEL",localize "STR_MISERY_DUMPOUTFUELDIESEL"];
};
if ("Misery_EmptyDiesel" in items player) then {
_out pushback [localize "STR_MISERY_SWAPFUELTYPEDIESEL",localize "STR_MISERY_SWAPFUELTYPEDIESEL"];
};

if ("Misery_PetrolF" in items player) then {
_out pushback [localize "STR_MISERY_DUMPOUTFUELPETROL",localize "STR_MISERY_DUMPOUTFUELPETROL"];
};
if ("Misery_EmptyPetrol" in items player) then {
_out pushback [localize "STR_MISERY_SWAPFUELTYPEPETROL",localize "STR_MISERY_SWAPFUELTYPEPETROL"];
};

if (MiseryACE && "Misery_Needlethread" in items player) then {
_out pushback [localize "STR_MISERY_STITCHWOUNDS",localize "STR_MISERY_STITCHWOUNDS"];
};

// if ((call Misery_fnc_NearLandVeh || call Misery_fnc_NearHeli || call Misery_fnc_NearPlane || call Misery_fnc_NearShip || call Misery_fnc_NearTank) && MiseryinVehiclerepairarea == true) then {
// _out pushback [localize "STR_MISERY_REQREPAIRS",localize "STR_MISERY_REQREPAIRS"];
// };
	
// if ((call Misery_fnc_NearLandVeh || call Misery_fnc_NearHeli || call Misery_fnc_NearPlane || call Misery_fnc_NearShip || call Misery_fnc_NearTank) && MiseryinVehiclerearmarea == true) then {
// _out pushback [localize "STR_MISERY_REQRESUPPLY",localize "STR_MISERY_REQRESUPPLY"];
// };

// if ((call Misery_fnc_NearLandVeh || call Misery_fnc_NearHeli || call Misery_fnc_NearPlane || call Misery_fnc_NearShip || call Misery_fnc_NearTank) && MiseryinRefuelzonearea == true) then {
// _out pushback [localize "STR_MISERY_REQREFUEL",localize "STR_MISERY_REQREFUEL"];
// };

if (MiseryinVehiclerepairarea == true) then {
_out pushback [localize "STR_MISERY_REQREPAIRS",localize "STR_MISERY_REQREPAIRS"];
};
	
if (MiseryinVehiclerearmarea == true) then {
_out pushback [localize "STR_MISERY_REQRESUPPLY",localize "STR_MISERY_REQRESUPPLY"];
};

if (MiseryinRefuelzonearea == true) then {
_out pushback [localize "STR_MISERY_REQREFUEL",localize "STR_MISERY_REQREFUEL"];
};
	
if (MiseryinMedzonearea == true) then {
_out pushback [localize "STR_MISERY_REQTREATMENT",localize "STR_MISERY_REQTREATMENT"];
};

//Gens:
if (!isNil "MiseryTarget_GenName") then {
if (MiseryTarget_GenName != "") then {
_out pushback ["Use Generator","Use Generator"];
	};
};

//Item swappers:
//Radiation / Geiger conversion:
if (MiseryEnhrads) then {
[player, "rvg_Geiger", "Misery_personalgeigernobattery"] call Misery_fnc_ItemSwap;
};

//Vanilla toolkit conversion:
[player, "ToolKit", "rvg_toolkit"] call Misery_fnc_ItemSwap;

//ACE compat notepad swap:
if (MiseryACE) then {
[player, "rvg_notepad", "acex_intelitems_notepad"] call Misery_fnc_ItemSwap;
};

//Fuel canister conversion:
[player, "rvg_canisterFuel", selectrandom ["Misery_DieselF","Misery_PetrolF"]] call Misery_fnc_ItemSwap;
[player, "rvg_canisterFuel_Empty", selectrandom ["Misery_EmptyDiesel","Misery_EmptyPetrol"]] call Misery_fnc_ItemSwap;

//WBKIMS checks + Swappers:
if (MiseryWBKIMS) then {
[player, "Misery_Woodaxe", "WBK_axe"] call Misery_fnc_WeapSwap;
[player, "Misery_Sledghammer", "WBK_survival_weapon_2"] call Misery_fnc_WeapSwap;
[player, "Misery_craftinghammer", "WBK_SmallHammer"] call Misery_fnc_WeapSwap;
[player, "Misery_Anvilhammer", "WBK_SmallHammer"] call Misery_fnc_WeapSwap;
[player, "rvg_guttingKnife", selectRandom ["Weap_melee_knife","Knife_kukri","Knife_m3","UNSC_Knife","UNSC_Knife_reversed","WBK_survival_weapon_4","WBK_survival_weapon_4_r","WBK_survival_weapon_3","WBK_survival_weapon_3_r"]] call Misery_fnc_WeapSwap;
[player, "Misery_GuttingKnife", selectRandom ["Weap_melee_knife","Knife_kukri","Knife_m3","UNSC_Knife","UNSC_Knife_reversed","WBK_survival_weapon_4","WBK_survival_weapon_4_r","WBK_survival_weapon_3","WBK_survival_weapon_3_r"]] call Misery_fnc_WeapSwap;
};

//Money Collection:
if ((([] call Misery_fnc_NearestCorpse_Money) select 0)) then {
_out pushback ["Search for Money","Search For Money"];    
};

_out