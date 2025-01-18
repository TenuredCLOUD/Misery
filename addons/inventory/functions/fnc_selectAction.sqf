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
if (_action isEqualTo localize "STR_MISERY_CheckClothing") exitWith {call EFUNC(temperature,clothing)};

//Gear weight check:
if (_action isEqualTo localize "STR_MISERY_CheckGearweight") exitWith {
    private _bagweightload = loadAbs player / getNumber (configFile >> "CfgInventoryGlobalVariable" >> "maxSoldierLoad");
    private _gearWeightStr = format ["<t font='PuristaMedium'>%1</t>", format [localize "STR_MISERY_GearweightVAL", round(_bagweightload * 100), round((_bagweightload * 100) / 2.2)]];
    [QEGVAR(common,tileText), _gearWeightStr] call CBA_fnc_localEvent;
};

//Sleep UI:
if (_action isEqualTo "Sleep") exitWith {
[QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
createDialog QCLASS(sleepMenu_ui);
};

//Check corpse for money:
if(_action isEqualTo "Search for Money") exitWith {
[QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
[] call EFUNC(money,searchCorpse);
};

//Mechanic repairs:
if(_actionisEqualTo localize "STR_MISERY_REQREPAIRS") exitWith {
[QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
createDialog QCLASS(mechanicShop_ui);
};

//Veh Resupply:
if(_actionisEqualTo localize "STR_MISERY_REQRESUPPLY") exitWith {
[QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
createDialog QCLASS(rearmShop_ui);
};

//Veh Refuel:
if(_actionisEqualTo localize "STR_MISERY_REQREFUEL") exitWith {
[QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
createDialog QCLASS(refuelShop_ui);
};

//Wood collection (Axe):
if(_actionisEqualTo localize "STR_MISERY_CHOPWOOD") exitWith {
[QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
if ([["WBK_axe","WBK_brush_axe","WBK_craftedAxe","FireAxe","Axe",QCLASS(woodaxe)]] call EFUNC(common,hasItem)) then {
[] call EFUNC(forestry,axeAction);
}else{
private _noAxeForWoodStr = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_NOAXEFORWOODNOTI"];
[QEGVAR(common,tileText), _noAxeForWoodStr] call CBA_fnc_localEvent;
    };
};

//Wood collection (Chainsaw):
if(_actionisEqualTo localize "STR_MISERY_SAWWOOD") exitWith {
[QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
if !([[QCLASS(chainsaw)]] call EFUNC(common,hasItem)) then {
private _noChainsawForWoodStr = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_NOCHAINSAWFORWOODNOTI"];
[QEGVAR(common,tileText), _noChainsawForWoodStr] call CBA_fnc_localEvent;
}else{
[] call EFUNC(forestry,sawAction);
};
};

//Wood collection (Hands):
if(_actionisEqualTo localize "STR_MISERY_COLLECTWOOD") exitWith {
[QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
[] call EFUNC(forestry,forageTreeAction);
};

//Wood log splitting (Requires Axe or Chainsaw):
if(_actionisEqualTo localize "STR_MISERY_SPLITWOODLOG") exitWith {
[QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
        if (!([[QCLASS(woodenlog)]] call EFUNC(common,hasItem))) exitWith {
            private _noWoodLogForSplitStr = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_NOWOODENLOGSFORSPLITTING"];
            [QEGVAR(common,tileText), _noWoodLogForSplitStr] call CBA_fnc_localEvent;
        };
        if ([[QCLASS(chainsaw),"WBK_axe","WBK_brush_axe","WBK_craftedAxe","FireAxe","Axe",QCLASS(woodaxe)]] call EFUNC(common,hasItem)) then {
            [] call EFUNC(forestry,splitWoodAction);
        } else {
            private _noAxeOrSawForLogStr = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_NOWOODAXEORCHAINSAWNOTI"];
            [QEGVAR(common,tileText), _noAxeOrSawForLogStr] call CBA_fnc_localEvent;
    };
};

//Jet fuel collection:
if(_actionisEqualTo localize "STR_MISERY_JETFUELPUMPREQ") exitWith {
private _jetFuelPumpReqStr = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_JETFUELPUMPREQTIP"];
[QEGVAR(common,tileText), _jetFuelPumpReqStr] call CBA_fnc_localEvent;
};

//Fuel collection:
if(_actionisEqualTo localize "STR_MISERY_FUELPUMPREQ") exitWith {
private _fuelPumpReqStr = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_FUELPUMPREQTIP"];
[QEGVAR(common,tileText), _fuelPumpReqStr] call CBA_fnc_localEvent;
};

//Fuel dumping Jerrycans:
if(_actionisEqualTo localize "STR_MISERY_DUMPOUTFUELJET") exitWith {
if !([[QCLASS(jetFuel)]] call EFUNC(common,hasItem)) then {
private _noJetJerryCanStr = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_DUMPOUTFUELJETNOCANNOTI"];
[QEGVAR(common,tileText), _noJetJerryCanStr] call CBA_fnc_localEvent;
}else{
private _jetJerryCanDumpSuccessStr = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_DUMPOUTFUELJETSUCCESS"];
[QEGVAR(common,tileText), _jetJerryCanDumpSuccessStr] call CBA_fnc_localEvent;
player removeItem QCLASS(jetFuel);
player addItem QCLASS(jetFuelJerryCan_Empty);
};
    };
if(_actionisEqualTo localize "STR_MISERY_DUMPOUTFUELDIESEL") exitWith {
if !([[QCLASS(diesel)]] call EFUNC(common,hasItem)) then {
private _noDieselJerryCanStr = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_DUMPOUTFUELDIESELNOCANNOTI"];
[QEGVAR(common,tileText), _noDieselJerryCanStr] call CBA_fnc_localEvent;
}else{
private _dieselJerryCanDumpSuccessStr = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_DUMPOUTFUELDIESELSUCCESS"];
[QEGVAR(common,tileText), _dieselJerryCanDumpSuccessStr] call CBA_fnc_localEvent;
player removeItem QCLASS(diesel);
player addItem QCLASS(dieselJerryCan_Empty);
};
    };
if(_actionisEqualTo localize "STR_MISERY_DUMPOUTFUELPETROL") exitWith {
if !([[QCLASS(petrol)]] call EFUNC(common,hasItem)) then {
private _noPetrolJerryCanStr = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_DUMPOUTFUELPETROLNOCANNOTI"];
[QEGVAR(common,tileText), _noPetrolJerryCanStr] call CBA_fnc_localEvent;
}else{
private _petrolJerryCanDumpSuccessStr = format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_DUMPOUTFUELPETROLSUCCESS"];
[QEGVAR(common,tileText), _petrolJerryCanDumpSuccessStr] call CBA_fnc_localEvent;
player removeItem QCLASS(petrol);
player addItem QCLASS(petrolJerryCan_Empty);
};
    };

//Mining: (WIP needs GUI)
// if(_actionisEqualTo localize "STR_MISERY_MINEORE") exitWith {
// (findDisplay 46 createDisplay QCLASS(inventoryFramework_ui))closeDisplay 1;
// (findDisplay 602) closeDisplay 2;
// if !(call Misery_fnc_mineactcheck) exitWith {
// private _formattedText =format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_MINEORENOTOOLS"];
// [parseText _formattedText, true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
// }; //items pre-check
// [] spawn Misery_fnc_mineoreact;
// };

//iBuild start action:
if(_actionisEqualTo localize "STR_MISERY_IBUILDOPEN") exitWith {
[QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
if !(call EFUNC(buildex,hasHammer)) exitWith {
private _noIbuildToolsStr =format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_IBUILDOPENNOTOOLS"];
[QEGVAR(common,tileText), _noIbuildToolsStr] call CBA_fnc_localEvent;
}; //items pre-check
[] call NMIB_fnc_Action; //Misery NMIB compat function
};
if(_actionisEqualTo localize "STR_MISERY_USESLEDGE") exitWith {
[QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
if !(call EFUNC(buildex,hasSledghammer)) exitWith {
private _sledgeHammerProxToBaseStr =format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_USESLEDGENOTOOLTIP"];
[QEGVAR(common,tileText), _sledgeHammerProxToBaseStr] call CBA_fnc_localEvent;
}; //items pre-check
[] call EFUNC(buildex,demolish);
};

//Back to default menu:
if(_actionisEqualTo localize "STR_MISERY_CANCEL")exitWith{EGVAR(actions,guiActionsMode)="";call FUNC(displayActions)};

//RF detector:
if(_actionisEqualTo localize "STR_MISERY_TURNONRFDETEC") exitWith {
    [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
    if !([[QCLASS(rfHighRange_Off)]] call EFUNC(common,hasItem)) then {
    private _noRfDetectorStr =format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_TURNONRFDETECNOITEM"];
    [QEGVAR(common,tileText), _noRfDetectorStr] call CBA_fnc_localEvent;
}else{
    call EFUNC(rfdetecter,reboot);
};
    };
if(_actionisEqualTo localize "STR_MISERY_TURNOFFRFDETEC") exitWith {
    [QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
    if !([[QCLASS(rfHighRange_On)]] call EFUNC(common,hasItem)) then {
    private _noRfDetectorStr_2 =format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_TURNONRFDETECNOITEM"];
    [QEGVAR(common,tileText), _noRfDetectorStr_2] call CBA_fnc_localEvent;
}else{
    private _rfDetectorTurnOffStr =format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_RFDETECTURNOFF"];
    [QEGVAR(common,tileText), _rfDetectorTurnOffStr] call CBA_fnc_localEvent;
    playSound3D [QPATHTOEF(audio,sounds\Geigerenable\GeigerOFF.ogg), player, false, getPosASL player, 4, 1, 10];
    player removeItem 'Misery_RFHighrangeON';
    player addItem 'Misery_RFHighrangeOFF';
    player setVariable [QCLASS(rfdetectorStatus), false,true];
};
    };

//WIP
// //Portable Radio:
// if(_actionisEqualTo"Turn on Portable Radio") exitWith {
// (findDisplay 46 createDisplay QCLASS(inventoryFramework_ui))closeDisplay 1;
// (findDisplay 602) closeDisplay 2;
// if !([[QCLASS(PortableradioOFF"]] call EFUNC(common,hasItem)) then {
// private _formattedText = ["You don't have a portable radio...", "PLAIN DOWN"];
// }else{
// private _formattedText = ["You turn on your portable radio...", "PLAIN DOWN"];
// player removeItem 'Misery_PortableradioOFF'; player addItem 'Misery_PortableradioON';
// };
//     };
// if(_actionisEqualTo"Turn off Portable Radio") exitWith {
// (findDisplay 46 createDisplay QCLASS(inventoryFramework_ui))closeDisplay 1;
// (findDisplay 602) closeDisplay 2;
// if !([[QCLASS(PortableradioON"]] call EFUNC(common,hasItem)) then {
// private _formattedText = ["You don't have a portable radio...", "PLAIN DOWN"];
// }else{
// private _formattedText = ["You turn off your portable radio...", "PLAIN DOWN"];
// player removeItem 'Misery_PortableradioON'; player addItem 'Misery_PortableradioOFF';
// player setVariable [QCLASS(HHRadio", false,true];
// };
//     };

//Artifacts:
if (_actionisEqualTo localize "STR_MISERY_STOREARTIFACT") exitWith {
[QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
if !([[QCLASS(leadContainer_Open)]] call EFUNC(common,hasItem)) then {
private _noLeadContainerStr =format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_NOLLCONTAINER"];
[QEGVAR(common,tileText), _noLeadContainerStr] call CBA_fnc_localEvent;
}else{
call EFUNC(llcontianer,storeArtifact);
};
    };

//Needle & thread:
// if(_actionisEqualTo localize "STR_MISERY_STITCHWOUNDS") exitWith {
// (findDisplay 46 createDisplay QCLASS(inventoryFramework_ui))closeDisplay 1;
// (findDisplay 602) closeDisplay 2;
// if !([[QCLASS(needleThread)]] call EFUNC(common,hasItem)) exitWith {
// private _formattedText =format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_STITCHWOUNDSNOITEM"];
// [parseText _formattedText, true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
// };
// if !([player] call ace_medical_blood_fnc_isBleeding) then {
// private _formattedText =format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_STITCHWOUNDSNOTBLEEDING"];
// [parseText _formattedText, true, nil, 7, 0.7, 0] call BIS_fnc_textTiles;
// }else{
// [] spawn Misery_fnc_StitchThreadact;
// };
//     };

//Headlamp:
if(_actionisEqualTo localize "STR_MISERY_TURNONHEADLAMP") exitWith {
[QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
if !([[QCLASS(headlamp_Off)]] call EFUNC(common,hasItem)) exitWith {
private _noHeadLampItemStr =format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_TURNONHEADLAMPNOITEM"];
[QEGVAR(common,tileText), _noHeadLampItemStr] call CBA_fnc_localEvent;
};
[player] call EFUNC(headlamp,on);
};

if(_actionisEqualTo localize "STR_MISERY_TURNOFFHEADLAMP") exitWith {
[QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
if !([[QCLASS(headlamp_On)]] call EFUNC(common,hasItem)) exitWith {
private _noHeadLampItemStr_2 =format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_TURNONHEADLAMPNOITEM"];
[QEGVAR(common,tileText), _noHeadLampItemStr_2] call CBA_fnc_localEvent;
};
[player] call EFUNC(headlamp,off);
};

//Crafting Framework:
if(_actionisEqualTo localize "STR_MISERY_CRAFTINGWORKBENCH") exitWith {
[QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
createDialog QCLASS(craftingFramework_ui);
};

//Water collection menu:
if(_actionisEqualTo"Collect water") exitWith {
[QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
createDialog QCLASS(hydrology_ui);
};

//Medical treatment menu:
if(_actionisEqualTo localize "STR_MISERY_REQTREATMENT") exitWith {
[QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
createDialog QCLASS(medicalTreatment_ui);
};

//Action submenu defines:
if(EGVAR(actions,guiActionsMode)isEqualTo"") exitWith {
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
        EGVAR(actions,guiActionsMode)=_action;
        call FUNC(displayActions);
    };
    if(isNull(findDisplay 602))then{(findDisplay 46 createDisplay QCLASS(inventoryFramework_ui))closeDisplay 1};
    call _action; //reference to selected action in UI
};

//Submenu's ---<<---

//Fishing:
if(_actionisEqualTo localize "STR_MISERY_STARTFISHING") exitWith {
EGVAR(actions,guiActionsMode)= localize "STR_MISERY_STARTFISHING";
};
if(_actionisEqualTolocalize "STR_MISERY_STARTFISHINGACT") exitWith {
[QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
[] call EFUNC(fishing,fishAct);
};
if(_actionisEqualTo localize "STR_MISERY_STARTFISHINGREQUIRMENTS") exitWith {
private _fishingItemsReqStr =format ["<t font='PuristaMedium'>%1</t>", localize "STR_MISERY_STARTFISHINGREQUIRMENTS_LISTED"];
[QEGVAR(common,tileText), _fishingItemsReqStr] call CBA_fnc_localEvent;
};

//Foraging:
if(_actionisEqualTo localize "STR_MISERY_FORAGE") exitWith {
EGVAR(actions,guiActionsMode)= localize "STR_MISERY_FORAGE";
};
if(_actionisEqualTo localize "STR_MISERY_FORAGE_DIGFORWORMS") exitWith {
[QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
[] call EFUNC(forage,digForWorms);
};
if(_actionisEqualTo localize "STR_MISERY_FORAGE_SEARCHFORTINDER") exitWith {
[QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
[] call EFUNC(forage,searchForTinder);
};

//Cooking / Fire usage:
if(_actionisEqualTo localize "STR_MISERY_USEFIRE") exitWith {
EGVAR(actions,guiActionsMode)= localize "STR_MISERY_USEFIRE";
};
if(_actionisEqualTo localize "STR_MISERY_USEFIRE_COOK") exitWith {
[QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
createDialog QCLASS(cookingFramework_ui);
};
// if(_actionisEqualTo"Cauterize wounds") exitWith {
// (findDisplay 46 createDisplay QCLASS(inventoryFramework_ui))closeDisplay 1;
// (findDisplay 602) closeDisplay 2;
// if !([player] call ace_medical_blood_fnc_isBleeding) then {
// private _formattedText = ["You aren't bleeding right now...", "PLAIN DOWN"];
// }else{
// [] spawn Misery_fnc_Cauterizeact;
// };
//     };

if(_actionisEqualTo localize "STR_MISERY_PLAYERDATA") exitWith {
EGVAR(actions,guiActionsMode)=localize "STR_MISERY_PLAYERDATA";
};

if (_action isEqualTolocalize "STR_MISERY_SAVECHARACTER") exitWith {
[QEGVAR(common,exitGui)] call CBA_fnc_localEvent;
if (MiseryManualPData isEqualTo "ENABLED") then {
    if (MiserysurvivalHardCoreSaveMode isEqualTo "ENABLED" && !(call EFUNC(common,nearFire))) exitWith {systemChat format[localize "STR_MISERY_CHARACTERHARDCORESAVINGACTIVE",profileName]};
[player] call EFUNC(persistency,serializePlayer);
if !(EGVAR(common,debug)) then {systemChat format[localize "STR_MISERY_SAVECHARACTERNOTIF",profileName]};
};
};

if(_actionisEqualTo localize "STR_MISERY_DELETECHARACTER") exitWith {
    if (GVAR(confirmDeletion) > 0) exitWith {
    GVAR(confirmDeletion) = 0;
    [player] call EFUNC(persistency,deleteData);
    systemChat format[localize "STR_MISERY_DELETECHARACTERSUCCESS",profileName];
    player setDamage 1;
};
    systemChat format[localize "STR_MISERY_DELETECHARACTERWARNING",profileName];
    GVAR(confirmDeletion) = GVAR(confirmDeletion) + 1;
    sleep 5;
    GVAR(confirmDeletion) = 0;
};

//Jerrycans:
// if(_actionisEqualTolocalize "STR_MISERY_USEJERRYCANCLEAN") exitWith {
// EGVAR(actions,guiActionsMode)=localize "STR_MISERY_USEJERRYCANCLEAN";
// };
// if(_actionisEqualTo"Drink from Jerrycan (clean)") exitWith {
// (findDisplay 46 createDisplay QCLASS(inventoryFramework_ui))closeDisplay 1;
// (findDisplay 602) closeDisplay 2;
// if !([[QCLASS(WaterJerryF"]] call EFUNC(common,hasItem)) then {
// private _formattedText = ["You don't have a Jerrycan...", "PLAIN DOWN"];
// }else{
// [] spawn Misery_fnc_drinkjcleanact;
// };
//     };
// if(_actionisEqualTo"Pour into canteen") exitWith {
// (findDisplay 46 createDisplay QCLASS(inventoryFramework_ui))closeDisplay 1;
// (findDisplay 602) closeDisplay 2;
// if !([[QCLASS(WaterJerryF"]] call EFUNC(common,hasItem)) then {
// private _formattedText = ["You don't have a Jerrycan...", "PLAIN DOWN"];
// }else{
// [] spawn Misery_fnc_canteenfillcact;
// };
//     };
// if(_actionisEqualTo"Pour into water bottle") exitWith {
// (findDisplay 46 createDisplay QCLASS(inventoryFramework_ui))closeDisplay 1;
// (findDisplay 602) closeDisplay 2;
// if !([[QCLASS(WaterJerryF"]] call EFUNC(common,hasItem)) then {
// private _formattedText = ["You don't have a Jerrycan...", "PLAIN DOWN"];
// }else{
// [] spawn Misery_fnc_bottlefillcact;
// };
//     };
// if(_actionisEqualTo"Dump out water (clean)") exitWith {
// (findDisplay 46 createDisplay QCLASS(inventoryFramework_ui))closeDisplay 1;
// (findDisplay 602) closeDisplay 2;
// if !([[QCLASS(WaterJerryF"]] call EFUNC(common,hasItem)) then {
// private _formattedText = ["You don't have a Jerrycan...", "PLAIN DOWN"];
// }else{
// private _formattedText = ["You dump the water from the Jerrycan onto the ground...", "PLAIN DOWN"];
// player removeItem 'Misery_WaterJerryF';
// sleep 1;
// player addItem 'Misery_WaterJerryE';
// };
//     };

// if(_actionisEqualTo"Use Jerrycan (Dirty)") exitWith {
// EGVAR(actions,guiActionsMode)="Use Jerrycan (Dirty)";
// };
// if(_actionisEqualTo"Drink from Jerrycan (dirty)") exitWith {
// (findDisplay 46 createDisplay QCLASS(inventoryFramework_ui))closeDisplay 1;
// (findDisplay 602) closeDisplay 2;
// if !([[QCLASS(WaterJerryFD"]] call EFUNC(common,hasItem)) then {
// private _formattedText = ["You don't have a Jerrycan...", "PLAIN DOWN"];
// }else{
// [] spawn Misery_fnc_drinkjdirtyact;
// };
//     };
// if(_actionisEqualTo"Pour into canteen") exitWith {
// (findDisplay 46 createDisplay QCLASS(inventoryFramework_ui))closeDisplay 1;
// (findDisplay 602) closeDisplay 2;
// if !([[QCLASS(WaterJerryFD"]] call EFUNC(common,hasItem)) then {
// private _formattedText = ["You don't have a Jerrycan...", "PLAIN DOWN"];
// }else{
// [] spawn Misery_fnc_canteenfilldact;
// };
//     };
// if(_actionisEqualTo"Pour into water bottle") exitWith {
// (findDisplay 46 createDisplay QCLASS(inventoryFramework_ui))closeDisplay 1;
// (findDisplay 602) closeDisplay 2;
// if !([[QCLASS(WaterJerryFD"]] call EFUNC(common,hasItem)) then {
// private _formattedText = ["You don't have a Jerrycan...", "PLAIN DOWN"];
// }else{
// [] spawn Misery_fnc_bottlefilldact;
// };
//     };
// if(_actionisEqualTo"Dump out water (dirty)") exitWith {
// (findDisplay 46 createDisplay QCLASS(inventoryFramework_ui))closeDisplay 1;
// (findDisplay 602) closeDisplay 2;
// if !([[QCLASS(WaterJerryFD"]] call EFUNC(common,hasItem)) then {
// private _formattedText = ["You don't have a Jerrycan...", "PLAIN DOWN"];
// }else{
// private _formattedText = ["You dump the water from the Jerrycan onto the ground...", "PLAIN DOWN"];
// player removeItem 'Misery_WaterJerryFD';
// sleep 1;
// player addItem 'Misery_WaterJerryE';
// };
//     };

//Fuel collection pump / Jerrycan:
// if(_actionisEqualTo"Use Fuel pump") exitWith {
// EGVAR(actions,guiActionsMode)="Use Fuel pump";
// };
// if(_actionisEqualTo"Refill Fuel Jerrycan") exitWith {
// (findDisplay 46 createDisplay QCLASS(inventoryFramework_ui))closeDisplay 1;
// (findDisplay 602) closeDisplay 2;
// if !(call Misery_fnc_Refillgear) exitWith {private _formattedText = ["You don't have the required items to refill a Jerrycan...", "PLAIN DOWN"];};
// [] spawn Misery_fnc_RefillFuelact;
// };
// if(_actionisEqualTo"Refill vehicle") exitWith {
// (findDisplay 46 createDisplay QCLASS(inventoryFramework_ui))closeDisplay 1;
// (findDisplay 602) closeDisplay 2;
// if !(call Misery_fnc_Refuelatpump) exitWith {private _formattedText = ["You do not meet all the requirments to operate a fuel pump...", "PLAIN DOWN"];};
// [] spawn Misery_fnc_RefillFuelPumpact;
// };

// //Jet Fuel collection pump / Jerrycan:
// if(_actionisEqualTo"Use JetFuel pump") exitWith {
// EGVAR(actions,guiActionsMode)="Use JetFuel pump";
// };
// if(_actionisEqualTo"Refill JetFuel Jerrycan") exitWith {
// (findDisplay 46 createDisplay QCLASS(inventoryFramework_ui))closeDisplay 1;
// (findDisplay 602) closeDisplay 2;
// if !(call Misery_fnc_RefillgearJ) exitWith {private _formattedText = ["You don't have the required items to refill a Jerrycan...", "PLAIN DOWN"];};
// [] spawn Misery_fnc_RefillJFuelact;
// };
// if(_actionisEqualTo"Refill aircraft") exitWith {
// (findDisplay 46 createDisplay QCLASS(inventoryFramework_ui))closeDisplay 1;
// (findDisplay 602) closeDisplay 2;
// if !(call Misery_fnc_RefuelatJetpump) exitWith {private _formattedText = ["You do not meet all the requirments to operate a Jetfuel pump...", "PLAIN DOWN"];};
// [] spawn Misery_fnc_RefillJFuelPumpact;
// };

//Jerrycans:
// if(_actionisEqualTo"Swap Jerrycan fuel type (JetFuel)") exitWith {
// EGVAR(actions,guiActionsMode)="Swap Jerrycan fuel type (JetFuel)";
// };
// if(_actionisEqualTo"Swap to Petrol") exitWith {
// (findDisplay 46 createDisplay QCLASS(inventoryFramework_ui))closeDisplay 1;
// (findDisplay 602) closeDisplay 2;
// if !([[QCLASS(jetFuelJerryCan_Empty)]] call EFUNC(common,hasItem)) then {
// private _formattedText = ["You don't have a Jetfuel canister...", "PLAIN DOWN"];
// }else{
// player removeItem QCLASS(jetFuelJerryCan_Empty);
// player addItem QCLASS(petrolJerryCan_Empty);
// };
//     };
// if(_actionisEqualTo"Swap to Diesel") exitWith {
// (findDisplay 46 createDisplay QCLASS(inventoryFramework_ui))closeDisplay 1;
// (findDisplay 602) closeDisplay 2;
// if !([[QCLASS(jetFuelJerryCan_Empty)]] call EFUNC(common,hasItem)) then {
// private _formattedText = ["You don't have a Jetfuel canister...", "PLAIN DOWN"];
// }else{
// player removeItem QCLASS(jetFuelJerryCan_Empty);
// player addItem QCLASS(dieselJerryCan_Empty);
// };
//     };

// if(_actionisEqualTo"Swap Jerrycan fuel type (Diesel)") exitWith {
// EGVAR(actions,guiActionsMode)="Swap Jerrycan fuel type (Diesel)";
// };
// if(_actionisEqualTo"Swap to Petrol") exitWith {
// (findDisplay 46 createDisplay QCLASS(inventoryFramework_ui))closeDisplay 1;
// (findDisplay 602) closeDisplay 2;
// if !([[QCLASS(dieselJerryCan_Empty)]] call EFUNC(common,hasItem)) then {
// private _formattedText = ["You don't have a Diesel canister...", "PLAIN DOWN"];
// }else{
// player removeItem QCLASS(dieselJerryCan_Empty);
// player addItem QCLASS(petrolJerryCan_Empty);
// };
//     };
// if(_actionisEqualTo"Swap to Jetfuel") exitWith {
// (findDisplay 46 createDisplay QCLASS(inventoryFramework_ui))closeDisplay 1;
// (findDisplay 602) closeDisplay 2;
// if !([[QCLASS(dieselJerryCan_Empty)]] call EFUNC(common,hasItem)) then {
// private _formattedText = ["You don't have a Diesel canister...", "PLAIN DOWN"];
// }else{
// player removeItem QCLASS(dieselJerryCan_Empty);
// player addItem QCLASS(jetFuelJerryCan_Empty);
// };
//     };

// if(_actionisEqualTo"Swap Jerrycan fuel type (Petrol)") exitWith {
// EGVAR(actions,guiActionsMode)="Swap Jerrycan fuel type (Petrol)";
// };
// if(_actionisEqualTo"Swap to Diesel") exitWith {
// (findDisplay 46 createDisplay QCLASS(inventoryFramework_ui))closeDisplay 1;
// (findDisplay 602) closeDisplay 2;
// if !([[QCLASS(petrolJerryCan_Empty)]] call EFUNC(common,hasItem)) then {
// private _formattedText = ["You don't have a Petrol canister...", "PLAIN DOWN"];
// }else{
// player removeItem QCLASS(petrolJerryCan_Empty);
// player addItem QCLASS(dieselJerryCan_Empty);
// };
//     };
// if(_actionisEqualTo"Swap to Jetfuel") exitWith {
// (findDisplay 46 createDisplay QCLASS(inventoryFramework_ui))closeDisplay 1;
// (findDisplay 602) closeDisplay 2;
// if !([[QCLASS(petrolJerryCan_Empty)]] call EFUNC(common,hasItem)) then {
// private _formattedText = ["You don't have a Petrol canister...", "PLAIN DOWN"];
// }else{
// player removeItem QCLASS(petrolJerryCan_Empty);
// player addItem QCLASS(jetFuelJerryCan_Empty);
// };
//     };
