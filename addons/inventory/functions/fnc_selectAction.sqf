/*
Misery Mod actions
Default Mod actions
Designed specifically for Misery mod
by TenuredCLOUD
*/

#include "\z\misery\addons\main\script_macros.hpp"

disableSerialization;
private _ctrl=(findDisplay 982377)displayCtrl 1500;
private _index=lbCurSel _ctrl;
private _action=_ctrl lbData _index;
private _playAction=FALSE;
private _pos=[];

//Insulation check:
if (_action == localize "STR_MISERY_CheckClothing") exitWith {call Misery_fnc_Clothingcheck};

//Gear weight check:
if (_action == localize "STR_MISERY_CheckGearweight") exitWith {
    private _bagweightload = loadAbs player / getNumber (configFile >> "CfgInventoryGlobalVariable" >> "maxSoldierLoad");
    private _formattedText = format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_GearweightVAL", round(_bagweightload * 100), round((_bagweightload * 100) / 2.2)]];
    [_formattedText] call Misery_fnc_FormatToTile;
};

//Sleep UI:
if (_action == "Sleep") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
createDialog "MiserySleepMenuGUI";
};

//Check corpse for money:
if(_action == "Search for Money") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
[] execVM "\z\misery\addons\money\functions\fnc_Search_Corpse.sqf";
};

//Cycle MiseryHUD:
if(_action == localize "STR_MISERY_MiseryHUDONOFF") exitWith {
    if(MiserysurvivalShowStatus)exitWith{MiserysurvivalShowStatus=FALSE};
    MiserysurvivalShowStatus=TRUE;
};

//Mechanic repairs:
if(_action== localize "STR_MISERY_REQREPAIRS") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
createDialog "MiseryMechShop_GUI";
};

//Veh Resupply:
if(_action== localize "STR_MISERY_REQRESUPPLY") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
createDialog "MiseryRearmShop_GUI";
};

//Veh Refuel:
if(_action== localize "STR_MISERY_REQREFUEL") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
createDialog "MiseryRefuelShop_GUI";
};

//Wood collection (Axe):
if(_action== localize "STR_MISERY_CHOPWOOD") exitWith {
    (findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
    (findDisplay 602) closeDisplay 2;
    private ["_axeType","_WBKIMSAXETYPE"];
    _WBKIMSAXETYPE = ["WBK_axe","WBK_brush_axe","WBK_craftedAxe","FireAxe","Axe"];
    _axeType = if (MiseryWBKIMS) then {currentWeapon player} else {"Misery_Woodaxe"};
    switch (true) do {
        case (MiseryWBKIMS && {_axeType in _WBKIMSAXETYPE}): {
            [] spawn Misery_fnc_Axeaction;
        };
        case (!MiseryWBKIMS && {_axeType in items player}): {
            [] spawn Misery_fnc_Axeaction;
        };
        default {
            private _formattedText = format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_NOAXEFORWOODNOTI"], "PLAIN DOWN", -1, true, true];
            [_formattedText] call Misery_fnc_FormatToTile;
        };
    };
};

//Wood collection (Chainsaw):
if(_action== localize "STR_MISERY_SAWWOOD") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !("Misery_Chainsaw" in items player) then {
private _formattedText = format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_NOCHAINSAWFORWOODNOTI"], "PLAIN DOWN", -1, true, true];
[_formattedText] call Misery_fnc_FormatToTile;
}else{
[] spawn Misery_fnc_Sawaction;
};
};

//Wood collection (Hands):
if(_action== localize "STR_MISERY_COLLECTWOOD") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
[] spawn Misery_fnc_Foragetreeaction;
};

//Wood log splitting (Requires Axe or Chainsaw):
if(_action== localize "STR_MISERY_SPLITWOODLOG") exitWith {
    (findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
    (findDisplay 602) closeDisplay 2;
    private ["_toolType","_WBKIMSAXETYPE"];
    _WBKIMSAXETYPE = ["WBK_axe","WBK_brush_axe","WBK_craftedAxe","FireAxe","Axe"];
    if (MiseryWBKIMS) then {
        _toolType = currentWeapon player;
    } else {
        _toolType = "Misery_Woodaxe";
    };
    switch (true) do {
        case (!("Misery_woodenlog" in items player)): {
            private _formattedText = format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_NOWOODENLOGSFORSPLITTING"], "PLAIN DOWN", -1, true, true];
            [_formattedText] call Misery_fnc_FormatToTile;
        };
        case ("Misery_Chainsaw" in items player || _toolType in items player || _toolType in _WBKIMSAXETYPE): {
            [] spawn Misery_fnc_SplitWoodaction;
        };
        default {
            private _formattedText = format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_NOWOODAXEORCHAINSAWNOTI"], "PLAIN DOWN", -1, true, true];
            [_formattedText] call Misery_fnc_FormatToTile;
        };
    };
};

//Jet fuel collection:
if(_action== localize "STR_MISERY_JETFUELPUMPREQ") exitWith {
private _formattedText = format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_JETFUELPUMPREQTIP"], "PLAIN DOWN", -1, true, true];
[_formattedText] call Misery_fnc_FormatToTile;
};

//Fuel collection:
if(_action== localize "STR_MISERY_FUELPUMPREQ") exitWith {
private _formattedText = format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_FUELPUMPREQTIP"], "PLAIN DOWN", -1, true, true];
[_formattedText] call Misery_fnc_FormatToTile;
};

//Fuel dumping Jerrycans:
if(_action== localize "STR_MISERY_DUMPOUTFUELJET") exitWith {
if !("Misery_JetFuelF" in items player) then {
private _formattedText = format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_DUMPOUTFUELJETNOCANNOTI"], "PLAIN DOWN", -1, true, true];
[_formattedText] call Misery_fnc_FormatToTile;
}else{
private _formattedText = format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_DUMPOUTFUELJETSUCCESS"], "PLAIN DOWN", -1, true, true];
[_formattedText] call Misery_fnc_FormatToTile;
player removeItem "Misery_JetFuelF";
player additem "Misery_EmptyJet";
};
    };
if(_action== localize "STR_MISERY_DUMPOUTFUELDIESEL") exitWith {
if !("Misery_DieselF" in items player) then {
private _formattedText = format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_DUMPOUTFUELDIESELNOCANNOTI"], "PLAIN DOWN", -1, true, true];
[_formattedText] call Misery_fnc_FormatToTile;
}else{
private _formattedText = format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_DUMPOUTFUELDIESELSUCCESS"], "PLAIN DOWN", -1, true, true];
[_formattedText] call Misery_fnc_FormatToTile;
player removeItem "Misery_DieselF";
player additem "Misery_EmptyDiesel";
};
    };
if(_action== localize "STR_MISERY_DUMPOUTFUELPETROL") exitWith {
if !("Misery_PetrolF" in items player) then {
private _formattedText = format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_DUMPOUTFUELPETROLNOCANNOTI"], "PLAIN DOWN", -1, true, true];
[_formattedText] call Misery_fnc_FormatToTile;
}else{
private _formattedText = format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_DUMPOUTFUELPETROLSUCCESS"], "PLAIN DOWN", -1, true, true];
[_formattedText] call Misery_fnc_FormatToTile;
player removeItem "Misery_PetrolF";
player additem "Misery_EmptyPetrol";
};
    };

//Mining:
if(_action== localize "STR_MISERY_MINEORE") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !(call Misery_fnc_mineactcheck) exitwith {
private _formattedText =format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_MINEORENOTOOLS"], "PLAIN DOWN", -1, true, true];
[_formattedText] call Misery_fnc_FormatToTile;
}; //items pre-check
[] spawn Misery_fnc_mineoreact;
};

//iBuild start action:
if(_action== localize "STR_MISERY_IBUILDOPEN") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !(call Misery_fnc_Hashammer) exitwith {
private _formattedText =format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_IBUILDOPENNOTOOLS"], "PLAIN DOWN", -1, true, true];
[_formattedText] call Misery_fnc_FormatToTile;
}; //items pre-check
[] call NMIB_fnc_Action;
};
if(_action== localize "STR_MISERY_USESLEDGE") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !(call Misery_fnc_HasSledghammer) exitwith {
private _formattedText =format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_USESLEDGENOTOOLTIP"], "PLAIN DOWN", -1, true, true];
[_formattedText] call Misery_fnc_FormatToTile;
}; //items pre-check
[] call Misery_fnc_demolish;
};

//Back to default menu:
if(_action== localize "STR_MISERY_CANCEL")exitWith{MiseryActionsMode="";execVM "\z\misery\addons\inventory\functions\fnc_DisplayActions.sqf"};

//RF detector:
if(_action== localize "STR_MISERY_TURNONRFDETEC") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !("Misery_RFHighrangeOFF" in items player) then {
private _formattedText =format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_TURNONRFDETECNOITEM"], "PLAIN DOWN", -1, true, true];
[_formattedText] call Misery_fnc_FormatToTile;
}else{
execVM "\z\misery\addons\rfdetector\functions\fnc_RFreboot.sqf";
};
    };
if(_action== localize "STR_MISERY_TURNOFFRFDETEC") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !("Misery_RFHighrangeON" in items player) then {
private _formattedText =format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_TURNONRFDETECNOITEM"], "PLAIN DOWN", -1, true, true];
[_formattedText] call Misery_fnc_FormatToTile;
}else{
private _formattedText =format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_RFDETECTURNOFF"], "PLAIN DOWN", -1, true, true];
[_formattedText] call Misery_fnc_FormatToTile;
playSound3D ["\z\misery\addons\audio\sounds\Geigerenable\GeigerOFF.ogg", player, false, getPosASL player, 4, 1, 10];
player removeitem 'Misery_RFHighrangeON'; player additem 'Misery_RFHighrangeOFF';
player setVariable ["Misery_RFEMFDet", false,true];
};
    };

// //Portable Radio:
// if(_action=="Turn on Portable Radio") exitWith {
// (findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
// (findDisplay 602) closeDisplay 2;
// if !("Misery_PortableradioOFF" in items player) then {
// private _formattedText = ["You don't have a portable radio...", "PLAIN DOWN"];
// }else{
// private _formattedText = ["You turn on your portable radio...", "PLAIN DOWN"];
// player removeitem 'Misery_PortableradioOFF'; player additem 'Misery_PortableradioON';
// };
//     };
// if(_action=="Turn off Portable Radio") exitWith {
// (findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
// (findDisplay 602) closeDisplay 2;
// if !("Misery_PortableradioON" in items player) then {
// private _formattedText = ["You don't have a portable radio...", "PLAIN DOWN"];
// }else{
// private _formattedText = ["You turn off your portable radio...", "PLAIN DOWN"];
// player removeitem 'Misery_PortableradioON'; player additem 'Misery_PortableradioOFF';
// player setVariable ["Misery_HHRadio", false,true];
// };
//     };

//Artifacts:
if (_action== localize "STR_MISERY_STOREARTIFACT") exitwith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !("Misery_leadcontaineropen" in items player) then {
private _formattedText =format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_NOLLCONTAINER"], "PLAIN DOWN", -1, true, true];
[_formattedText] call Misery_fnc_FormatToTile;
}else{
execVM "\z\misery\addons\llcontainer\functions\fnc_putincontaineract.sqf";
};
    };

//Needle & thread:
if(_action== localize "STR_MISERY_STITCHWOUNDS") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !("Misery_Needlethread" in items player) exitWith {
private _formattedText =format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_STITCHWOUNDSNOITEM"], "PLAIN DOWN", -1, true, true];
[_formattedText] call Misery_fnc_FormatToTile;
};
if !([player] call ace_medical_blood_fnc_isBleeding) then {
private _formattedText =format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_STITCHWOUNDSNOTBLEEDING"], "PLAIN DOWN", -1, true, true];
[_formattedText] call Misery_fnc_FormatToTile;
}else{
[] spawn Misery_fnc_StitchThreadact;
};
    };

//Headlamp:
if(_action== localize "STR_MISERY_TURNONHEADLAMP") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !("Misery_HeadlampOFF" in items player) exitwith {
private _formattedText =format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_TURNONHEADLAMPNOITEM"], "PLAIN DOWN", -1, true, true];
[_formattedText] call Misery_fnc_FormatToTile;
};
[player] execVM "\z\misery\addons\headlamp\functions\fnc_HeadlampON.sqf";
};

if(_action== localize "STR_MISERY_TURNOFFHEADLAMP") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !("Misery_HeadlampON" in items player) exitwith {
private _formattedText =format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_TURNONHEADLAMPNOITEM"], "PLAIN DOWN", -1, true, true];
[_formattedText] call Misery_fnc_FormatToTile;
};
[player] execVM "\z\misery\addons\headlamp\functions\fnc_HeadlampOFF.sqf";
};

//Crafting Framework:
if(_action== localize "STR_MISERY_CRAFTINGWORKBENCH") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
createDialog "MiseryCraftingFramework_GUI";
};

//Water collection menu:
if(_action=="Collect water") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
createDialog "MiseryWaterCollection_GUI";
};

//Medical treatment menu:
if(_action== localize "STR_MISERY_REQTREATMENT") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
createDialog "MiseryMedTreatment_GUI";
};

//Action submenu defines:
if(MiseryActionsMode=="") exitWith {
    if(_action in [
        localize "STR_MISERY_FORAGE",
        localize "STR_MISERY_STARTFISHING",
        localize "STR_MISERY_USEFIRE",
        localize "STR_MISERY_USEANVIL",
        localize "STR_MISERY_USEFORGE",
        localize "STR_MISERY_PLAYERDATA",
        localize "STR_MISERY_USEJERRYCANCLEAN",
        localize "STR_MISERY_USEJERRYCANDIRTY",
        localize "STR_MISERY_USEFUELPUMP",
        localize "STR_MISERY_USEJETFUELPUMP",
        localize "STR_MISERY_SWAPFUELTYPEJET",
        localize "STR_MISERY_SWAPFUELTYPEDIESEL",
        localize "STR_MISERY_SWAPFUELTYPEPETROL"])
        exitWith {
        MiseryActionsMode=_action;
        execVM "\z\misery\addons\inventory\functions\fnc_DisplayActions.sqf";
    };
    if(isNull(findDisplay 602))then{(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1};
    call _action;
};

//Submenu's ---<<---

//Fishing:
if(_action== localize "STR_MISERY_STARTFISHING") exitWith {
MiseryActionsMode= localize "STR_MISERY_STARTFISHING";
};
if(_action==localize "STR_MISERY_STARTFISHINGACT") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
[] spawn Misery_fnc_fishact;
};
if(_action== localize "STR_MISERY_STARTFISHINGREQUIRMENTS") exitWith {
private _formattedText =format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_STARTFISHINGREQUIRMENTS_LISTED"], "PLAIN DOWN", -1, true, true];
[_formattedText] call Misery_fnc_FormatToTile;
};

//Foraging:
if(_action== localize "STR_MISERY_FORAGE") exitWith {
MiseryActionsMode= localize "STR_MISERY_FORAGE";
};
if(_action== localize "STR_MISERY_FORAGE_DIGFORWORMS") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
[] spawn Misery_fnc_digforworms;
};
if(_action== localize "STR_MISERY_FORAGE_SEARCHFORTINDER") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
[] spawn Misery_fnc_searchfortinder;
};

//Cooking / Fire usage:
if(_action== localize "STR_MISERY_USEFIRE") exitWith {
MiseryActionsMode= localize "STR_MISERY_USEFIRE";
};
if(_action== localize "STR_MISERY_USEFIRE_COOK") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
createDialog "MiseryCookingFramework_GUI";
};
if(_action=="Cauterize wounds") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !([player] call ace_medical_blood_fnc_isBleeding) then {
private _formattedText = ["You aren't bleeding right now...", "PLAIN DOWN"];
}else{
[] spawn Misery_fnc_Cauterizeact;
};
    };

if(_action== localize "STR_MISERY_PLAYERDATA") exitWith {
MiseryActionsMode=localize "STR_MISERY_PLAYERDATA";
};

if (_action ==localize "STR_MISERY_SAVECHARACTER") exitwith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if (MiseryManualPData == "ENABLED") then {
    if (MiserysurvivalHardCoreSaveMode == "ENABLED" && !(call Misery_fnc_NearFire)) exitWith {systemChat format[localize "STR_MISERY_CHARACTERHARDCORESAVINGACTIVE",profilename]};
[player] call Misery_fnc_MiserySerializeplayer;
if !(MiseryDebug) then {systemChat format[localize "STR_MISERY_SAVECHARACTERNOTIF",profilename]};
};
};

if(_action== localize "STR_MISERY_DELETECHARACTER") exitWith {
    if (MiseryDeleteConfirm > 0) exitwith {
    MiseryDeleteConfirm = 0;
    [player] call Misery_fnc_DeleteData;
    systemChat format[localize "STR_MISERY_DELETECHARACTERSUCCESS",profilename];
    player setDamage 1;
};
    systemChat format[localize "STR_MISERY_DELETECHARACTERWARNING",profilename];
    MiseryDeleteConfirm = MiseryDeleteConfirm + 1;
    sleep 5;
    MiseryDeleteConfirm = 0;
};

//Jerrycans:
if(_action==localize "STR_MISERY_USEJERRYCANCLEAN") exitWith {
MiseryActionsMode=localize "STR_MISERY_USEJERRYCANCLEAN";
};
if(_action=="Drink from Jerrycan (clean)") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !("Misery_WaterJerryF" in items player) then {
private _formattedText = ["You don't have a Jerrycan...", "PLAIN DOWN"];
}else{
[] spawn Misery_fnc_drinkjcleanact;
};
    };
if(_action=="Pour into canteen") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !("Misery_WaterJerryF" in items player) then {
private _formattedText = ["You don't have a Jerrycan...", "PLAIN DOWN"];
}else{
[] spawn Misery_fnc_canteenfillcact;
};
    };
if(_action=="Pour into water bottle") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !("Misery_WaterJerryF" in items player) then {
private _formattedText = ["You don't have a Jerrycan...", "PLAIN DOWN"];
}else{
[] spawn Misery_fnc_bottlefillcact;
};
    };
if(_action=="Dump out water (clean)") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !("Misery_WaterJerryF" in items player) then {
private _formattedText = ["You don't have a Jerrycan...", "PLAIN DOWN"];
}else{
private _formattedText = ["You dump the water from the Jerrycan onto the ground...", "PLAIN DOWN"];
player removeitem 'Misery_WaterJerryF';
sleep 1;
player additem 'Misery_WaterJerryE';
};
    };

if(_action=="Use Jerrycan (Dirty)") exitWith {
MiseryActionsMode="Use Jerrycan (Dirty)";
};
if(_action=="Drink from Jerrycan (dirty)") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !("Misery_WaterJerryFD" in items player) then {
private _formattedText = ["You don't have a Jerrycan...", "PLAIN DOWN"];
}else{
[] spawn Misery_fnc_drinkjdirtyact;
};
    };
if(_action=="Pour into canteen") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !("Misery_WaterJerryFD" in items player) then {
private _formattedText = ["You don't have a Jerrycan...", "PLAIN DOWN"];
}else{
[] spawn Misery_fnc_canteenfilldact;
};
    };
if(_action=="Pour into water bottle") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !("Misery_WaterJerryFD" in items player) then {
private _formattedText = ["You don't have a Jerrycan...", "PLAIN DOWN"];
}else{
[] spawn Misery_fnc_bottlefilldact;
};
    };
if(_action=="Dump out water (dirty)") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !("Misery_WaterJerryFD" in items player) then {
private _formattedText = ["You don't have a Jerrycan...", "PLAIN DOWN"];
}else{
private _formattedText = ["You dump the water from the Jerrycan onto the ground...", "PLAIN DOWN"];
player removeitem 'Misery_WaterJerryFD';
sleep 1;
player additem 'Misery_WaterJerryE';
};
    };

//Fuel collection pump / Jerrycan:
if(_action=="Use Fuel pump") exitWith {
MiseryActionsMode="Use Fuel pump";
};
if(_action=="Refill Fuel Jerrycan") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !(call Misery_fnc_Refillgear) exitwith {private _formattedText = ["You don't have the required items to refill a Jerrycan...", "PLAIN DOWN"];};
[] spawn Misery_fnc_RefillFuelact;
};
if(_action=="Refill vehicle") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !(call Misery_fnc_Refuelatpump) exitwith {private _formattedText = ["You do not meet all the requirments to operate a fuel pump...", "PLAIN DOWN"];};
[] spawn Misery_fnc_RefillFuelPumpact;
};

//Jet Fuel collection pump / Jerrycan:
if(_action=="Use JetFuel pump") exitWith {
MiseryActionsMode="Use JetFuel pump";
};
if(_action=="Refill JetFuel Jerrycan") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !(call Misery_fnc_RefillgearJ) exitwith {private _formattedText = ["You don't have the required items to refill a Jerrycan...", "PLAIN DOWN"];};
[] spawn Misery_fnc_RefillJFuelact;
};
if(_action=="Refill aircraft") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !(call Misery_fnc_RefuelatJetpump) exitwith {private _formattedText = ["You do not meet all the requirments to operate a Jetfuel pump...", "PLAIN DOWN"];};
[] spawn Misery_fnc_RefillJFuelPumpact;
};

//Jerrycans:
if(_action=="Swap Jerrycan fuel type (JetFuel)") exitWith {
MiseryActionsMode="Swap Jerrycan fuel type (JetFuel)";
};
if(_action=="Swap to Petrol") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !("Misery_EmptyJet" in items player) then {
private _formattedText = ["You don't have a Jetfuel canister...", "PLAIN DOWN"];
}else{
player removeItem "Misery_EmptyJet";
player additem "Misery_EmptyPetrol";
};
    };
if(_action=="Swap to Diesel") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !("Misery_EmptyJet" in items player) then {
private _formattedText = ["You don't have a Jetfuel canister...", "PLAIN DOWN"];
}else{
player removeItem "Misery_EmptyJet";
player additem "Misery_EmptyDiesel";
};
    };

if(_action=="Swap Jerrycan fuel type (Diesel)") exitWith {
MiseryActionsMode="Swap Jerrycan fuel type (Diesel)";
};
if(_action=="Swap to Petrol") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !("Misery_EmptyDiesel" in items player) then {
private _formattedText = ["You don't have a Diesel canister...", "PLAIN DOWN"];
}else{
player removeItem "Misery_EmptyDiesel";
player additem "Misery_EmptyPetrol";
};
    };
if(_action=="Swap to Jetfuel") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !("Misery_EmptyDiesel" in items player) then {
private _formattedText = ["You don't have a Diesel canister...", "PLAIN DOWN"];
}else{
player removeItem "Misery_EmptyDiesel";
player additem "Misery_EmptyJet";
};
    };

if(_action=="Swap Jerrycan fuel type (Petrol)") exitWith {
MiseryActionsMode="Swap Jerrycan fuel type (Petrol)";
};
if(_action=="Swap to Diesel") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !("Misery_EmptyPetrol" in items player) then {
private _formattedText = ["You don't have a Petrol canister...", "PLAIN DOWN"];
}else{
player removeItem "Misery_EmptyPetrol";
player additem "Misery_EmptyDiesel";
};
    };
if(_action=="Swap to Jetfuel") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !("Misery_EmptyPetrol" in items player) then {
private _formattedText = ["You don't have a Petrol canister...", "PLAIN DOWN"];
}else{
player removeItem "Misery_EmptyPetrol";
player additem "Misery_EmptyJet";
};
    };