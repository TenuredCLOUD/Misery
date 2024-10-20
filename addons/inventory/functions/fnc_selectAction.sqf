#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Default inventory UI actions
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_inventory_fnc_selectActions
 *
*/

disableSerialization;
private _ctrl=(findDisplay 982377)displayCtrl 1500;
private _index=lbCurSel _ctrl;
private _action=_ctrl lbData _index;
private _playAction=false;
private _pos=[];

//Insulation check:
if (_action == localize "STR_MISERY_CheckClothing") exitWith {call Misery_fnc_Clothingcheck};

//Gear weight check:
if (_action == localize "STR_MISERY_CheckGearweight") exitWith {
    private _bagweightload = loadAbs player / getNumber (configFile >> "CfgInventoryGlobalVariable" >> "maxSoldierLoad");
    private _formattedText = format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_GearweightVAL", round(_bagweightload * 100), round((_bagweightload * 100) / 2.2)]];
    [_formattedText] call EFUNC(common,formatToTile);
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
    if(MiserysurvivalShowStatus)exitWith{MiserysurvivalShowStatus=false};
    MiserysurvivalShowStatus=true;
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
if ([["WBK_axe","WBK_brush_axe","WBK_craftedAxe","FireAxe","Axe","Misery_Woodaxe"]] call EFUNC(common,hasItem)) then {
[] spawn Misery_fnc_Axeaction
}else{
private _formattedText = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_NOAXEFORWOODNOTI"];
[_formattedText] call EFUNC(common,formatToTile);
    };
};

//Wood collection (Chainsaw):
if(_action== localize "STR_MISERY_SAWWOOD") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !([["Misery_Chainsaw"]] call EFUNC(common,hasItem)) then {
private _formattedText = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_NOCHAINSAWFORWOODNOTI"];
[_formattedText] call EFUNC(common,formatToTile);
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
        if (!([["Misery_woodenlog"]] call EFUNC(common,hasItem))) exitWith {
            private _formattedText = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_NOWOODENLOGSFORSPLITTING"];
            [_formattedText] call EFUNC(common,formatToTile);
        };
        if ([["Misery_Chainsaw","WBK_axe","WBK_brush_axe","WBK_craftedAxe","FireAxe","Axe","Misery_Woodaxe"]] call EFUNC(common,hasItem)) then {
            [] spawn Misery_fnc_SplitWoodaction;
        } else {
            private _formattedText = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_NOWOODAXEORCHAINSAWNOTI"];
            [_formattedText] call EFUNC(common,formatToTile);
    };
};

//Jet fuel collection:
if(_action== localize "STR_MISERY_JETFUELPUMPREQ") exitWith {
private _formattedText = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_JETFUELPUMPREQTIP"];
[_formattedText] call EFUNC(common,formatToTile);
};

//Fuel collection:
if(_action== localize "STR_MISERY_FUELPUMPREQ") exitWith {
private _formattedText = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_FUELPUMPREQTIP"];
[_formattedText] call EFUNC(common,formatToTile);
};

//Fuel dumping Jerrycans:
if(_action== localize "STR_MISERY_DUMPOUTFUELJET") exitWith {
if !([["Misery_JetFuelF"]] call EFUNC(common,hasItem)) then {
private _formattedText = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_DUMPOUTFUELJETNOCANNOTI"];
[_formattedText] call EFUNC(common,formatToTile);
}else{
private _formattedText = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_DUMPOUTFUELJETSUCCESS"];
[_formattedText] call EFUNC(common,formatToTile);
player removeItem "Misery_JetFuelF";
player addItem "Misery_EmptyJet";
};
    };
if(_action== localize "STR_MISERY_DUMPOUTFUELDIESEL") exitWith {
if !([["Misery_DieselF"]] call EFUNC(common,hasItem)) then {
private _formattedText = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_DUMPOUTFUELDIESELNOCANNOTI"];
[_formattedText] call EFUNC(common,formatToTile);
}else{
private _formattedText = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_DUMPOUTFUELDIESELSUCCESS"];
[_formattedText] call EFUNC(common,formatToTile);
player removeItem "Misery_DieselF";
player addItem "Misery_EmptyDiesel";
};
    };
if(_action== localize "STR_MISERY_DUMPOUTFUELPETROL") exitWith {
if !([["Misery_PetrolF"]] call EFUNC(common,hasItem)) then {
private _formattedText = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_DUMPOUTFUELPETROLNOCANNOTI"];
[_formattedText] call EFUNC(common,formatToTile);
}else{
private _formattedText = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_DUMPOUTFUELPETROLSUCCESS"];
[_formattedText] call EFUNC(common,formatToTile);
player removeItem "Misery_PetrolF";
player addItem "Misery_EmptyPetrol";
};
    };

//Mining:
if(_action== localize "STR_MISERY_MINEORE") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !(call Misery_fnc_mineactcheck) exitWith {
private _formattedText =format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_MINEORENOTOOLS"];
[_formattedText] call EFUNC(common,formatToTile);
}; //items pre-check
[] spawn Misery_fnc_mineoreact;
};

//iBuild start action:
if(_action== localize "STR_MISERY_IBUILDOPEN") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !(call Misery_fnc_Hashammer) exitWith {
private _formattedText =format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_IBUILDOPENNOTOOLS"];
[_formattedText] call EFUNC(common,formatToTile);
}; //items pre-check
[] call NMIB_fnc_Action;
};
if(_action== localize "STR_MISERY_USESLEDGE") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !(call Misery_fnc_HasSledghammer) exitWith {
private _formattedText =format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_USESLEDGENOTOOLTIP"];
[_formattedText] call EFUNC(common,formatToTile);
}; //items pre-check
[] call Misery_fnc_demolish;
};

//Back to default menu:
if(_action== localize "STR_MISERY_CANCEL")exitWith{MiseryActionsMode="";execVM "\z\misery\addons\inventory\functions\fnc_DisplayActions.sqf"};

//RF detector:
if(_action== localize "STR_MISERY_TURNONRFDETEC") exitWith {
    (findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
    (findDisplay 602) closeDisplay 2;
    if !([["Misery_RFHighrangeOFF"]] call EFUNC(common,hasItem)) then {
    private _formattedText =format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_TURNONRFDETECNOITEM"];
    [_formattedText] call EFUNC(common,formatToTile);
}else{
    execVM "\z\misery\addons\rfdetector\functions\fnc_RFreboot.sqf";
};
    };
if(_action== localize "STR_MISERY_TURNOFFRFDETEC") exitWith {
    (findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
    (findDisplay 602) closeDisplay 2;
    if !([["Misery_RFHighrangeON"]] call EFUNC(common,hasItem)) then {
    private _formattedText =format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_TURNONRFDETECNOITEM"];
    [_formattedText] call EFUNC(common,formatToTile);
}else{
    private _formattedText =format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_RFDETECTURNOFF"];
    [_formattedText] call EFUNC(common,formatToTile);
    playSound3D ["\z\misery\addons\audio\sounds\Geigerenable\GeigerOFF.ogg", player, false, getPosASL player, 4, 1, 10];
    player removeItem 'Misery_RFHighrangeON';
    player addItem 'Misery_RFHighrangeOFF';
    player setVariable ["Misery_RFEMFDet", false,true];
};
    };

//WIP
// //Portable Radio:
// if(_action=="Turn on Portable Radio") exitWith {
// (findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
// (findDisplay 602) closeDisplay 2;
// if !([["Misery_PortableradioOFF"]] call EFUNC(common,hasItem)) then {
// private _formattedText = ["You don't have a portable radio...", "PLAIN DOWN"];
// }else{
// private _formattedText = ["You turn on your portable radio...", "PLAIN DOWN"];
// player removeItem 'Misery_PortableradioOFF'; player addItem 'Misery_PortableradioON';
// };
//     };
// if(_action=="Turn off Portable Radio") exitWith {
// (findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
// (findDisplay 602) closeDisplay 2;
// if !([["Misery_PortableradioON"]] call EFUNC(common,hasItem)) then {
// private _formattedText = ["You don't have a portable radio...", "PLAIN DOWN"];
// }else{
// private _formattedText = ["You turn off your portable radio...", "PLAIN DOWN"];
// player removeItem 'Misery_PortableradioON'; player addItem 'Misery_PortableradioOFF';
// player setVariable ["Misery_HHRadio", false,true];
// };
//     };

//Artifacts:
if (_action== localize "STR_MISERY_STOREARTIFACT") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !([["Misery_leadcontaineropen"]] call EFUNC(common,hasItem)) then {
private _formattedText =format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_NOLLCONTAINER"];
[_formattedText] call EFUNC(common,formatToTile);
}else{
execVM "\z\misery\addons\llcontainer\functions\fnc_putincontaineract.sqf";
};
    };

//Needle & thread:
if(_action== localize "STR_MISERY_STITCHWOUNDS") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !([["Misery_Needlethread"]] call EFUNC(common,hasItem)) exitWith {
private _formattedText =format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_STITCHWOUNDSNOITEM"];
[_formattedText] call EFUNC(common,formatToTile);
};
if !([player] call ace_medical_blood_fnc_isBleeding) then {
private _formattedText =format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_STITCHWOUNDSNOTBLEEDING"];
[_formattedText] call EFUNC(common,formatToTile);
}else{
[] spawn Misery_fnc_StitchThreadact;
};
    };

//Headlamp:
if(_action== localize "STR_MISERY_TURNONHEADLAMP") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !([["Misery_HeadlampOFF"]] call EFUNC(common,hasItem)) exitWith {
private _formattedText =format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_TURNONHEADLAMPNOITEM"];
[_formattedText] call EFUNC(common,formatToTile);
};
[player] execVM "\z\misery\addons\headlamp\functions\fnc_HeadlampON.sqf";
};

if(_action== localize "STR_MISERY_TURNOFFHEADLAMP") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !([["Misery_HeadlampON"]] call EFUNC(common,hasItem)) exitWith {
private _formattedText =format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_TURNONHEADLAMPNOITEM"];
[_formattedText] call EFUNC(common,formatToTile);
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
private _formattedText =format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_STARTFISHINGREQUIRMENTS_LISTED"];
[_formattedText] call EFUNC(common,formatToTile);
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

if (_action ==localize "STR_MISERY_SAVECHARACTER") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if (MiseryManualPData == "ENABLED") then {
    if (MiserysurvivalHardCoreSaveMode == "ENABLED" && !(call Misery_fnc_NearFire)) exitWith {systemChat format[localize "STR_MISERY_CHARACTERHARDCORESAVINGACTIVE",profileName]};
[player] call Misery_fnc_MiserySerializeplayer;
if !(MiseryDebug) then {systemChat format[localize "STR_MISERY_SAVECHARACTERNOTIF",profileName]};
};
};

if(_action== localize "STR_MISERY_DELETECHARACTER") exitWith {
    if (MiseryDeleteConfirm > 0) exitWith {
    MiseryDeleteConfirm = 0;
    [player] call Misery_fnc_DeleteData;
    systemChat format[localize "STR_MISERY_DELETECHARACTERSUCCESS",profileName];
    player setDamage 1;
};
    systemChat format[localize "STR_MISERY_DELETECHARACTERWARNING",profileName];
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
if !([["Misery_WaterJerryF"]] call EFUNC(common,hasItem)) then {
private _formattedText = ["You don't have a Jerrycan...", "PLAIN DOWN"];
}else{
[] spawn Misery_fnc_drinkjcleanact;
};
    };
if(_action=="Pour into canteen") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !([["Misery_WaterJerryF"]] call EFUNC(common,hasItem)) then {
private _formattedText = ["You don't have a Jerrycan...", "PLAIN DOWN"];
}else{
[] spawn Misery_fnc_canteenfillcact;
};
    };
if(_action=="Pour into water bottle") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !([["Misery_WaterJerryF"]] call EFUNC(common,hasItem)) then {
private _formattedText = ["You don't have a Jerrycan...", "PLAIN DOWN"];
}else{
[] spawn Misery_fnc_bottlefillcact;
};
    };
if(_action=="Dump out water (clean)") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !([["Misery_WaterJerryF"]] call EFUNC(common,hasItem)) then {
private _formattedText = ["You don't have a Jerrycan...", "PLAIN DOWN"];
}else{
private _formattedText = ["You dump the water from the Jerrycan onto the ground...", "PLAIN DOWN"];
player removeItem 'Misery_WaterJerryF';
sleep 1;
player addItem 'Misery_WaterJerryE';
};
    };

if(_action=="Use Jerrycan (Dirty)") exitWith {
MiseryActionsMode="Use Jerrycan (Dirty)";
};
if(_action=="Drink from Jerrycan (dirty)") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !([["Misery_WaterJerryFD"]] call EFUNC(common,hasItem)) then {
private _formattedText = ["You don't have a Jerrycan...", "PLAIN DOWN"];
}else{
[] spawn Misery_fnc_drinkjdirtyact;
};
    };
if(_action=="Pour into canteen") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !([["Misery_WaterJerryFD"]] call EFUNC(common,hasItem)) then {
private _formattedText = ["You don't have a Jerrycan...", "PLAIN DOWN"];
}else{
[] spawn Misery_fnc_canteenfilldact;
};
    };
if(_action=="Pour into water bottle") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !([["Misery_WaterJerryFD"]] call EFUNC(common,hasItem)) then {
private _formattedText = ["You don't have a Jerrycan...", "PLAIN DOWN"];
}else{
[] spawn Misery_fnc_bottlefilldact;
};
    };
if(_action=="Dump out water (dirty)") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !([["Misery_WaterJerryFD"]] call EFUNC(common,hasItem)) then {
private _formattedText = ["You don't have a Jerrycan...", "PLAIN DOWN"];
}else{
private _formattedText = ["You dump the water from the Jerrycan onto the ground...", "PLAIN DOWN"];
player removeItem 'Misery_WaterJerryFD';
sleep 1;
player addItem 'Misery_WaterJerryE';
};
    };

//Fuel collection pump / Jerrycan:
if(_action=="Use Fuel pump") exitWith {
MiseryActionsMode="Use Fuel pump";
};
if(_action=="Refill Fuel Jerrycan") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !(call Misery_fnc_Refillgear) exitWith {private _formattedText = ["You don't have the required items to refill a Jerrycan...", "PLAIN DOWN"];};
[] spawn Misery_fnc_RefillFuelact;
};
if(_action=="Refill vehicle") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !(call Misery_fnc_Refuelatpump) exitWith {private _formattedText = ["You do not meet all the requirments to operate a fuel pump...", "PLAIN DOWN"];};
[] spawn Misery_fnc_RefillFuelPumpact;
};

//Jet Fuel collection pump / Jerrycan:
if(_action=="Use JetFuel pump") exitWith {
MiseryActionsMode="Use JetFuel pump";
};
if(_action=="Refill JetFuel Jerrycan") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !(call Misery_fnc_RefillgearJ) exitWith {private _formattedText = ["You don't have the required items to refill a Jerrycan...", "PLAIN DOWN"];};
[] spawn Misery_fnc_RefillJFuelact;
};
if(_action=="Refill aircraft") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !(call Misery_fnc_RefuelatJetpump) exitWith {private _formattedText = ["You do not meet all the requirments to operate a Jetfuel pump...", "PLAIN DOWN"];};
[] spawn Misery_fnc_RefillJFuelPumpact;
};

//Jerrycans:
if(_action=="Swap Jerrycan fuel type (JetFuel)") exitWith {
MiseryActionsMode="Swap Jerrycan fuel type (JetFuel)";
};
if(_action=="Swap to Petrol") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !([["Misery_EmptyJet"]] call EFUNC(common,hasItem)) then {
private _formattedText = ["You don't have a Jetfuel canister...", "PLAIN DOWN"];
}else{
player removeItem "Misery_EmptyJet";
player addItem "Misery_EmptyPetrol";
};
    };
if(_action=="Swap to Diesel") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !([["Misery_EmptyJet"]] call EFUNC(common,hasItem)) then {
private _formattedText = ["You don't have a Jetfuel canister...", "PLAIN DOWN"];
}else{
player removeItem "Misery_EmptyJet";
player addItem "Misery_EmptyDiesel";
};
    };

if(_action=="Swap Jerrycan fuel type (Diesel)") exitWith {
MiseryActionsMode="Swap Jerrycan fuel type (Diesel)";
};
if(_action=="Swap to Petrol") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !([["Misery_EmptyDiesel"]] call EFUNC(common,hasItem)) then {
private _formattedText = ["You don't have a Diesel canister...", "PLAIN DOWN"];
}else{
player removeItem "Misery_EmptyDiesel";
player addItem "Misery_EmptyPetrol";
};
    };
if(_action=="Swap to Jetfuel") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !([["Misery_EmptyDiesel"]] call EFUNC(common,hasItem)) then {
private _formattedText = ["You don't have a Diesel canister...", "PLAIN DOWN"];
}else{
player removeItem "Misery_EmptyDiesel";
player addItem "Misery_EmptyJet";
};
    };

if(_action=="Swap Jerrycan fuel type (Petrol)") exitWith {
MiseryActionsMode="Swap Jerrycan fuel type (Petrol)";
};
if(_action=="Swap to Diesel") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !([["Misery_EmptyPetrol"]] call EFUNC(common,hasItem)) then {
private _formattedText = ["You don't have a Petrol canister...", "PLAIN DOWN"];
}else{
player removeItem "Misery_EmptyPetrol";
player addItem "Misery_EmptyDiesel";
};
    };
if(_action=="Swap to Jetfuel") exitWith {
(findDisplay 46 createDisplay "MiseryINVACT_GUI")closeDisplay 1;
(findDisplay 602) closeDisplay 2;
if !([["Misery_EmptyPetrol"]] call EFUNC(common,hasItem)) then {
private _formattedText = ["You don't have a Petrol canister...", "PLAIN DOWN"];
}else{
player removeItem "Misery_EmptyPetrol";
player addItem "Misery_EmptyJet";
};
    };
