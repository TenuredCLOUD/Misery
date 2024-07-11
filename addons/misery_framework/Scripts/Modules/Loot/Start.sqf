/*
Misery Loot framework start
Code concepts from Drongo edited by TenuredCLOUD
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

#include "\z\misery\addons\misery_framework\Scripts\Misery_PreParser.hpp"

private["_info","_c","_types","_bannedTypes","_remove","_weapons","_magazines","_military","_ammo","_grenadeParents","_explosiveParents","_mag","_parents","_parent","_script"];

MiseryLootReady=FALSE;

MiseryGearLootBaseOnly=TRUE;

MiseryGearUseBISmedical=TRUE;
MiseryGearUseBISweapons=TRUE;
MiseryGearUseBISitems=TRUE;
MiseryGearUseBISuniforms=TRUE;
MiseryGearUseBISvests=TRUE;
MiseryGearUseBISheadgear=TRUE;
MiseryGearUseBISgoggles=TRUE;
MiseryGearUseBISpacks=TRUE;
MiseryGearUseMiseryfood=TRUE;
MiseryGearUseMiserymedical=TRUE;
MiseryGearUseMiseryitems=TRUE;

PREPROC_FUNCTION(Misery_fnc_MilitaryWeapon,MIS_FILESYS(Modules\Loot\MilitaryWeapon))
PREPROC_FUNCTION(Misery_fnc_MilitaryVest,MIS_FILESYS(Modules\Loot\MilitaryVest))
PREPROC_FUNCTION(Misery_fnc_MilitaryUniform,MIS_FILESYS(Modules\Loot\MilitaryUniform))
PREPROC_FUNCTION(Misery_fnc_MilitaryHeadgear,MIS_FILESYS(Modules\Loot\MilitaryHeadgear))

private _LootData = [
"MiseryLootItemsFood", 
"MiseryLootItemsMedical", 
"MiseryLootItemsMisc", 
"MiseryLootWeapons", 
"MiseryLootWeaponattachments", 
"MiseryLootUniforms", 
"MiseryLootVests", 
"MiseryLootHeadgear", 
"MiseryLootPacks", 
"MiseryLootGoggles", 
"MiseryLootItemsFoodM", 
"MiseryLootItemsMedicalM", 
"MiseryLootItemsMiscM", 
"MiseryLootWeaponsM", 
"MiseryLootWeaponattachmentsM", 
"MiseryLootUniformsM", 
"MiseryLootVestsM", 
"MiseryLootHeadgearM", 
"MiseryLootPacksM", 
"MiseryLootGogglesM", 
"MiseryLootGrenades", 
"MiseryLootExplosives",
"MiseryLootItemsBlacklist",
"MiseryLootBldgBlacklist"];

{
    if (isNil _x) then {
        missionNamespace setVariable [_x, []];
    };
} forEach _LootData;

private _blacklist=[] + MiseryLootItemsBlacklist;

MiseryGearFood=[];
MiseryGearMedical=[];
MiseryGearItems=[];
MiseryGearWeapons=[];
MiseryGearAttachments=[];
MiseryGearUniforms=[];
MiseryGearVests=[];
MiseryGearHeadgear=[];
MiseryGearPacks=[];
MiseryGearGoggles=[];
MiseryGearMagazines=[];

MiseryGearFoodM=[];
MiseryGearMedicalM=[];
MiseryGearItemsM=[];
MiseryGearWeaponsM=[];
MiseryGearAttachmentsM=[];
MiseryGearUniformsM=[];
MiseryGearVestsM=[];
MiseryGearHeadgearM=[];
MiseryGearPacksM=[];
MiseryGearGogglesM=[];
MiseryGearMagazinesM=[];

MiseryGearGrenades=[];
MiseryGearExplosives=[];

_types=[
0, //grenade/GL/throw
2, // handgun
1, // rifle
4, // launcher
604, // scuba item
611, // radio item
6166, // hmd item?
617, //bino item
620, // toolkit item
701, // vest item
4096, //bino/int nvg
131072 //FAK/item
];

_bannedTypes=[
65536 // vehicle weapon
];

_remove=["Zasleh2"];

_weapons=("((getNumber(_x>>'scope')>1)AND(getNumber(_x>>'type')in _types))"configClasses(configfile>>"CfgWeapons"))apply{configName _x};
//hint format["%1",_weapons];
_weapons=_weapons-_remove;

{if((typeName _x)=="CONFIG")then{_onSale=_onSale-[_x]}}forEach _weapons;

// Base weapons only
if(MiseryGearLootBaseOnly)then{
	{
	if(getNumber(configFile>>"CfgWeapons">>_x>>"type")in[0,1,2,4])then{
		if!((getText(configFile>>"CfgWeapons">>_x>>"baseWeapon"))==_x)then{_weapons=_weapons-[_x]};
	};
	}forEach _weapons;
};

// Process weapons
{
if(getNumber(configFile>>"CfgWeapons">>_x>>"type")in[0,1,2,4])then{
	if(_x call Misery_fnc_MilitaryWeapon)then{MiseryGearWeaponsM pushBack _x}else{MiseryGearWeapons pushBack _x};
	_weapons=_weapons-[_x];
};
}forEach _weapons;

if!(MiseryGearUseBISweapons)then{
	{
	if(_x call Misery_fnc_IsBIS)then{MiseryGearWeaponsM=MiseryGearWeaponsM-[_x]};
	}forEach MiseryGearWeaponsM;
	{
	if(_x call Misery_fnc_IsBIS)then{MiseryGearWeapons=MiseryGearWeapons-[_x]};
	}forEach MiseryGearWeapons;
};
//hint format["CIV: %1",MiseryGearWeapons];//sleep 2;hint format["MIL: %1",MiseryGearWeaponsM];

// Uniforms
{
if(getNumber(configFile>>"CfgWeapons">>_x>>"ItemInfo">>"type")==801)then{
	if(_x call Misery_fnc_MilitaryUniform)then{MiseryGearUniformsM pushBack _x}else{MiseryGearUniforms pushBack _x};
	_weapons=_weapons-[_x];
};
}forEach _weapons;
if!(MiseryGearUseBISuniforms)then{
	{
	if(_x call Misery_fnc_IsBIS)then{MiseryGearUniformsM=MiseryGearUniformsM-[_x]};
	}forEach MiseryGearUniformsM;
	{
	if(_x call Misery_fnc_IsBIS)then{MiseryGearUniforms=MiseryGearUniforms-[_x]};
	}forEach MiseryGearUniformsM;
};
//hint format["UNI: %1",MiseryGearUniforms];
//sleep 2;hint format["UNI M: %1",MiseryGearUniformsM];

// Vests
{
if(getNumber(configFile>>"CfgWeapons">>_x>>"ItemInfo">>"type")==701)then{
	if(_x call Misery_fnc_MilitaryVest)then{MiseryGearVestsM pushBack _x}else{MiseryGearVests pushBack _x};
	_weapons=_weapons-[_x];
};
}forEach _weapons;
if!(MiseryGearUseBISvests)then{
	{
	if(_x call Misery_fnc_IsBIS)then{MiseryGearVestsM=MiseryGearVestsM-[_x]};
	}forEach MiseryGearVestsM;
	{
	if(_x call Misery_fnc_IsBIS)then{MiseryGearVests=MiseryGearVests-[_x]};
	}forEach MiseryGearVestsM;
};
//hint format["UNI: %1",MiseryGearVests];//sleep 2;hint format["UNI M: %1",MiseryGearVestsM];

// Headgear
{
//systemChat str _x;
if(getNumber(configFile>>"CfgWeapons">>_x>>"ItemInfo">>"type")==605)then{
	if(_x call Misery_fnc_MilitaryHeadgear)then{MiseryGearHeadgearM pushBack _x}else{MiseryGearHeadgear pushBack _x};
	_weapons=_weapons-[_x];
};
}forEach _weapons;
if!(MiseryGearUseBISheadgear)then{
	{
	if(_x call Misery_fnc_IsBIS)then{MiseryGearHeadgearM=MiseryGearHeadgearM-[_x]};
	}forEach MiseryGearHeadgearM;
	{
	if(_x call Misery_fnc_IsBIS)then{MiseryGearHeadgear=MiseryGearHeadgear-[_x]};
	}forEach MiseryGearHeadgearM;
};
//hint format["HAT: %1",MiseryGearHeadgear];//sleep 2;hint format["HAT M: %1",MiseryGearHeadgearM];

// Attachments
{
if(getNumber(configFile>>"CfgWeapons">>_x>>"ItemInfo">>"type")in[101,621])then{
	MiseryGearAttachmentsM pushBack _x;
	_weapons=_weapons-[_x];
};
if(getNumber(configFile>>"CfgWeapons">>_x>>"ItemInfo">>"type")in[201,301,302])then{
	MiseryGearAttachments pushBack _x;
	MiseryGearAttachmentsM pushBack _x;
	_weapons=_weapons-[_x];
};
}forEach _weapons;
if!(MiseryGearUseBISweapons)then{
	{
	if(_x call Misery_fnc_IsBIS)then{MiseryGearAttachmentsM=MiseryGearAttachmentsM-[_x]};
	}forEach MiseryGearAttachmentsM;
	{
	if(_x call Misery_fnc_IsBIS)then{MiseryGearAttachments=MiseryGearAttachments-[_x]};
	}forEach MiseryGearAttachmentsM;
};
//hint format["ATT: %1",MiseryGearAttachments];//sleep 2;hint format["ATT M: %1",MiseryGearAttachmentsM];

// Items
{
if(getNumber(configFile>>"CfgWeapons">>_x>>"laser")>0)then{MiseryGearItemsM pushBack _x;_weapons=_weapons-[_x]};
}forEach _weapons;
{
if(getNumber(configFile>>"CfgWeapons">>_x>>"ItemInfo">>"type")in[616])then{MiseryGearItemsM pushBack _x}else{MiseryGearItems pushBack _x};
_weapons=_weapons-[_x];
}forEach _weapons;
MiseryGearItemsM=MiseryGearItemsM+MiseryGearItems;
if!(MiseryGearUseBISitems)then{
	{
	if(_x call Misery_fnc_IsBIS)then{MiseryGearItemsM=MiseryGearItemsM-[_x]};
	}forEach MiseryGearItemsM;
	{
	if(_x call Misery_fnc_IsBIS)then{MiseryGearItems=MiseryGearItems-[_x]};
	}forEach MiseryGearItemsM;
};
//hint format["ITEMS: %1",MiseryGearItems];//sleep 3;hint format["ITEMS: %1",MiseryGearItemsM];

// Goggles
MiseryGearGoggles=("getNumber(_x>>'scope')>1"configClasses(configfile>>"CfgGlasses"))apply{configName _x};
MiseryGearGoggles=MiseryGearGoggles-["None"];
if!(MiseryGearUseBISgoggles)then{
	{
	if(_x call Misery_fnc_IsBIS)then{MiseryGearGoggles=MiseryGearGoggles-[_x]};
	}forEach MiseryGearGoggles;
	MiseryGearGogglesM=MiseryGearGoggles+[];
};
//hint format["GOG: %1",MiseryGearGoggles];

MiseryGearPacks="((getNumber(_x>>'isbackpack')==1)AND(getNumber(_x>>'scope')>1)AND(getNumber(_x>>'maximumLoad')!=0))"configClasses(configfile>>"CfgVehicles")apply{configName _x};
if!(MiseryGearUseBISpacks)then{
	{
	if(_x call Misery_fnc_IsBIS)then{MiseryGearPacks=MiseryGearPacks-[_x]};
	}forEach MiseryGearPacks;
	MiseryGearPacksM=MiseryGearPacks+[];
};
//hint format["PACK: %1",_backpacks];

if(MiseryGearUseBISmedical)then{MiseryGearMedical=["FirstAidKit","Medikit"];MiseryGearMedicalM=["FirstAidKit","Medikit"]};
if(MiseryGearUseMiseryfood)then{MiseryGearFood=["Misery_Bearenergy","Misery_vodkafull","Misery_vodka34","Misery_vodka12","Misery_vodka14","Misery_coffeegrounds","Misery_wolfbeer"]+MiseryLootItemsFood;MiseryGearFoodM=["Misery_Bearenergy","Misery_vodkafull","Misery_vodka34","Misery_vodka12","Misery_vodka14","Misery_coffeegrounds","Misery_wolfbeer"]+MiseryLootItemsFood};
if(MiseryGearUseMiserymedical)then{MiseryGearMedical=[
"Misery_antibioticpill",
"Misery_antiparasiticpill",
"Misery_ClozapinePill",
"Misery_caffetincaps",
"Misery_caffeine",
"Misery_charcoaltabs",
"Misery_painpill",
"Misery_cocaine",
"Misery_Cenestin",
"Misery_randommedication",
"Misery_Heatpack",
"Misery_Coldpack",
"Misery_cigarettepack"
]+MiseryLootItemsMedical;
MiseryGearMedicalM=[
"Misery_antibiotic",
"Misery_antiparasitic",
"Misery_Clozapinebox",
"Misery_Clozapine",
"Misery_caffetin",
"Misery_pain",
"Misery_cocaine",
"Misery_Thrombomodulin",
"Misery_ThrombomodulinStimpack",
"Misery_Cenestinbottle",
"Misery_Heatpack",
"Misery_Coldpack",
"Misery_glucose",
"Misery_electrolyte",
"Misery_cigarettepack",
"Misery_cigar"]+MiseryLootItemsMedical};

if (MiseryGearUseMiseryitems) then {

MiseryGearItems = [
"Misery_Pickaxe",
"Misery_Pickaxebroken",
"Misery_fishingpole",
"Misery_fishingspool",
"Misery_personalgeiger",
"Misery_personalgeigernobattery",
"Misery_personalgeigerOFF",
"Misery_Headlamp_NB",
"Misery_fishhook",
"Misery_lithiumbattery",
"Misery_leadcontaineropen",
"Misery_leadcontainerclosed",
"Misery_WaterJerryF",
"Misery_WaterJerryFD",
"Misery_WaterJerryE",
"Misery_castironpot",
"Misery_guitar",
"Misery_coffeemug",
"Misery_wolfbeer",
"Misery_gasmaskempty",
"Misery_gascartridge",
"Misery_18vbat",
"Misery_Ducttape",
"Misery_Pscrewdriver",
"Misery_Fscrewdriver",
"Misery_pliers",
"Misery_camonet",
"Misery_9vbat",
"Misery_CoppWire",
"Misery_Rope",
"Misery_Needlethread",
"Misery_circuitboard",
"Misery_DeadGeiger",
"Misery_DragonVase",
"Misery_Matryoshka",
"Misery_OldWatch",
"Misery_Phone",
"Misery_Photos",
"Misery_ToySoldier",
"Misery_VintageShipBottle",
"Misery_Woodaxe",
"Misery_Sledghammer",
"Misery_lighter",
"Misery_Chainsawfull",
"Misery_Chainsaw34",
"Misery_Chainsaw12",
"Misery_Chainsaw14",
"Misery_Chainsawempty",
"Misery_sawfuel",
"Misery_woodnail",
"Misery_boxnails",
"Misery_craftinghammer",
"Misery_Anvilhammer",
"Misery_electrichandsaw",
"Misery_electrichandsawnobattery",
"Misery_wrench",
"Misery_PDA",
"Misery_PDA_off",
"Misery_PDA_NB",
"Misery_EmptyJet",
"Misery_EmptyDiesel",
"Misery_EmptyPetrol",
"Misery_JetFuelF",
"Misery_DieselF",
"Misery_PetrolF",
"Misery_AutoBatt"
]+MiseryLootItemsMisc;

MiseryGearItemsM=["Misery_Pickaxe",
"Misery_Pickaxebroken",
"Misery_fishingpole",
"Misery_fishingspool",
"Misery_personalgeiger",
"Misery_personalgeigernobattery",
"Misery_personalgeigerOFF",
"Misery_Headlamp_NB",
"Misery_fishhook",
"Misery_lithiumbattery",
"Misery_leadcontaineropen",
"Misery_leadcontainerclosed",
"Misery_WaterJerryF",
"Misery_WaterJerryFD",
"Misery_WaterJerryE",
"Misery_castironpot",
"Misery_guitar",
"Misery_coffeemug",
"Misery_wolfbeer",
"Misery_gasmaskempty",
"Misery_gascartridge",
"Misery_18vbat",
"Misery_Ducttape",
"Misery_Pscrewdriver",
"Misery_Fscrewdriver",
"Misery_pliers",
"Misery_camonet",
"Misery_9vbat",
"Misery_CoppWire",
"Misery_Rope",
"Misery_Needlethread",
"Misery_circuitboard",
"Misery_DeadGeiger",
"Misery_DragonVase",
"Misery_Matryoshka",
"Misery_OldWatch",
"Misery_Phone",
"Misery_Photos",
"Misery_ToySoldier",
"Misery_VintageShipBottle",
"Misery_Woodaxe",
"Misery_Sledghammer",
"Misery_lighter",
"Misery_Chainsawfull",
"Misery_Chainsaw34",
"Misery_Chainsaw12",
"Misery_Chainsaw14",
"Misery_Chainsawempty",
"Misery_sawfuel",
"Misery_woodnail",
"Misery_boxnails",
"Misery_craftinghammer",
"Misery_Anvilhammer",
"Misery_electrichandsaw",
"Misery_electrichandsawnobattery",
"Misery_wrench",
"Misery_PDA",
"Misery_PDA_off",
"Misery_PDA_NB",
"Misery_EmptyJet",
"Misery_EmptyDiesel",
"Misery_EmptyPetrol",
"Misery_JetFuelF",
"Misery_DieselF",
"Misery_PetrolF",
"Misery_AutoBatt"]+MiseryLootItemsMisc};

_magazines=("getNumber(_x>>'scope')>1"configClasses(configfile>>"CfgMagazines"))apply{configName _x};

MiseryGrenadeParents=["HandGrenade","MiniGrenade","B_IR_Grenade","FlareGreen_F","FlareRed_F","FlareWhite_F","FlareYellow_F"];
MiseryExplosiveParents=["SatchelCharge_Remote_Mag","APERSBoundingMine_Range_Mag","APERSMine_Range_Mag","APERSMineDispenser_Mag","APERSTripMine_Wire_Mag","ATMine_Range_Mag"];

_grenadeParents=[]+MiseryGrenadeParents;
_explosiveParents=[]+MiseryExplosiveParents;

_mag="";
_parents=[];
_parent="";
{
_mag=_x;
_parents=[configfile>>"CfgMagazines">>_mag,TRUE]call BIS_fnc_returnParents;
	{
	_parent=_x;
	if(_parent in _grenadeParents)exitWith{_magazines=_magazines-[_mag];MiseryGearGrenades pushBackUnique _mag};
	if(_parent in _explosiveParents)exitWith{_magazines=_magazines-[_mag];MiseryGearExplosives pushBackUnique _mag};
	}forEach _parents;
}forEach _magazines;

if!(MiseryGearUseBISweapons)then{
	{if(_x call Misery_fnc_IsBIS)then{_magazines=_magazines-[_x]}}forEach _magazines;
	{if("VehicleMagazine"in([configfile>>"CfgMagazines">>_x,TRUE]call BIS_fnc_returnParents))then{_magazines=_magazines-[_x]}}forEach _magazines;
};
_military=FALSE;
_ammo="";
{
_military=FALSE;
if(TRUE)then{
	if(getNumber(configFile>>"CfgMagazines">>_x>>"count")>20)exitWith{MiseryGearMagazinesM pushBack _x;_military=TRUE};
	if("CA_LauncherMagazine"in([configfile>>"CfgMagazines">>_x,TRUE]call BIS_fnc_returnParents))exitWith{MiseryGearMagazinesM pushBack _x;_military=TRUE};
	_ammo=getText(configFile>>"CfgMagazines">>_x>>"ammo");
	if(getNumber(configFile>>"CfgAmmo">>_ammo>>"explosive")>0)exitWith{MiseryGearMagazinesM pushBack _x;_military=TRUE};
};
if!(_military)then{MiseryGearMagazines pushBack _x};
}forEach _magazines;
//hint format["MAGS: %1",_magazines];

MiseryAllBuildings=[];

PREPROC_FUNCTION(Misery_fnc_GenerateStash,MIS_FILESYS(Modules\Loot\GenerateStash))
PREPROC_FUNCTION(Misery_fnc_AddBuilding,MIS_FILESYS(Modules\Loot\AddBuilding))
PREPROC_FUNCTION(Misery_fnc_Time,MIS_FILESYS(Modules\Loot\Time))

if (count MiseryLootItemsBlacklist > 0) then {
//Blacklist (regular):
MiseryGearFood=MiseryGearFood-_blacklist;
MiseryGearMedical=MiseryGearMedical-_blacklist;
MiseryGearItems=MiseryGearItems-_blacklist;
MiseryGearWeapons=MiseryGearWeapons-_blacklist;
MiseryGearAttachments=MiseryGearAttachments-_blacklist;
MiseryGearUniforms=MiseryGearUniforms-_blacklist;
MiseryGearVests=MiseryGearVests-_blacklist;
MiseryGearHeadgear=MiseryGearHeadgear-_blacklist;
MiseryGearPacks=MiseryGearPacks-_blacklist;
MiseryGearGoggles=MiseryGearGoggles-_blacklist;
MiseryGearMagazines=MiseryGearMagazines-_blacklist;

//Blacklist (Military):
MiseryGearFoodM=MiseryGearFood-_blacklist;
MiseryGearMedicalM=MiseryGearMedical-_blacklist;
MiseryGearItemsM=MiseryGearItems-_blacklist;
MiseryGearWeaponsM=MiseryGearWeapons-_blacklist;
MiseryGearAttachmentsM=MiseryGearAttachments-_blacklist;
MiseryGearUniformsM=MiseryGearUniforms-_blacklist;
MiseryGearVestsM=MiseryGearVests-_blacklist;
MiseryGearHeadgearM=MiseryGearHeadgear-_blacklist;
MiseryGearPacksM=MiseryGearPacks-_blacklist;
MiseryGearGogglesM=MiseryGearGoggles-_blacklist;
MiseryGearMagazinesM=MiseryGearMagazines-_blacklist;

MiseryGearGrenades=MiseryGearGrenades-_blacklist;
MiseryGearExplosives=MiseryGearExplosives-_blacklist;
};

//Check for Custom arrays restriction:
if !(MiseryLootCustomArrays) then {

//Add custom arrays to auto popped arrays:

MiseryGearFood = MiseryGearFood + MiseryLootItemsFood;
MiseryGearMedical = MiseryGearMedical + MiseryLootItemsMedical;
MiseryGearItems = MiseryGearItems + MiseryLootItemsMisc;
MiseryGearWeapons = MiseryGearWeapons + MiseryLootWeapons;
MiseryGearAttachments = MiseryGearAttachments + MiseryLootWeaponattachments;
MiseryGearUniforms = MiseryGearUniforms + MiseryLootUniforms;
MiseryGearVests = MiseryGearVests + MiseryLootVests;
MiseryGearHeadgear = MiseryGearHeadgear + MiseryLootHeadgear;
MiseryGearPacks = MiseryGearPacks + MiseryLootPacks;
MiseryGearGoggles = MiseryGearGoggles + MiseryLootGoggles;

MiseryGearFoodM = MiseryGearFoodM + MiseryLootItemsFoodM;
MiseryGearMedicalM = MiseryGearMedicalM + MiseryLootItemsMedicalM;
MiseryGearItemsM = MiseryGearItemsM + MiseryLootItemsMiscM;
MiseryGearWeaponsM = MiseryGearWeaponsM + MiseryLootWeaponsM;
MiseryGearAttachmentsM = MiseryGearAttachmentsM + MiseryLootWeaponattachmentsM;
MiseryGearUniformsM = MiseryGearUniformsM + MiseryLootUniformsM;
MiseryGearVestsM = MiseryGearVestsM + MiseryLootVestsM;
MiseryGearHeadgearM = MiseryGearHeadgearM + MiseryLootHeadgearM;
MiseryGearPacksM = MiseryGearPacksM + MiseryLootPacksM;
MiseryGearGogglesM = MiseryGearGogglesM + MiseryLootGogglesM;

MiseryGearGrenades = MiseryGearGrenades + MiseryLootGrenades;
MiseryGearExplosives = MiseryGearExplosives + MiseryLootExplosives;

//Populate arrays (Civilian):
MiseryLootChanceFood pushBack MiseryGearFood;
MiseryLootChanceMedical pushBack MiseryGearMedical;
MiseryLootChanceMisc pushBack MiseryGearItems;
MiseryLootChanceWeapon pushBack MiseryGearWeapons;
MiseryLootChanceAttachment pushBack MiseryGearAttachments;
MiseryLootChanceUniform pushBack MiseryGearUniforms;
MiseryLootChanceVest pushBack MiseryGearVests;
MiseryLootChanceHeadgear pushBack MiseryGearHeadgear;
MiseryLootChancePack pushBack MiseryGearPacks;
MiseryLootChanceGoggle pushBack MiseryGearGoggles;
MiseryLootChanceGrenade pushBack MiseryGearGrenades;
MiseryLootChanceExplosive pushBack MiseryGearExplosives;

//Populate arrays (Military)
MiseryLootChanceFoodM pushBack MiseryGearFoodM;
MiseryLootChanceMedicalM pushBack MiseryGearMedicalM;
MiseryLootChanceMiscM pushBack MiseryGearItemsM;
MiseryLootChanceWeaponM pushBack MiseryGearWeaponsM;
MiseryLootChanceAttachmentM pushBack MiseryGearAttachmentsM;
MiseryLootChanceUniformM pushBack MiseryGearUniformsM;
MiseryLootChanceVestM pushBack MiseryGearVestsM;
MiseryLootChanceHeadgearM pushBack MiseryGearHeadgearM;
MiseryLootChancePackM pushBack MiseryGearPacksM;
MiseryLootChanceGoggleM pushBack MiseryGearGogglesM;
MiseryLootChanceGrenadeM pushBack MiseryGearGrenades;
MiseryLootChanceExplosiveM pushBack MiseryGearExplosives;

}else{
//Reset arrays:
MiseryGearFood = [] + MiseryLootItemsFood;
MiseryGearMedical = [] + MiseryLootItemsMedical;
MiseryGearItems = [] + MiseryLootItemsMisc;
MiseryGearWeapons = [] + MiseryLootWeapons;
MiseryGearAttachments = [] + MiseryLootWeaponattachments;
MiseryGearUniforms = [] + MiseryLootUniforms;
MiseryGearVests = [] + MiseryLootVests;
MiseryGearHeadgear = [] + MiseryLootHeadgear;
MiseryGearPacks = [] + MiseryLootPacks;
MiseryGearGoggles = [] + MiseryLootGoggles;

MiseryGearFoodM = [] + MiseryLootItemsFoodM;
MiseryGearMedicalM = [] + MiseryLootItemsMedicalM;
MiseryGearItemsM = [] + MiseryLootItemsMiscM;
MiseryGearWeaponsM = [] + MiseryLootWeaponsM;
MiseryGearAttachmentsM = [] + MiseryLootWeaponattachmentsM;
MiseryGearUniformsM = [] + MiseryLootUniformsM;
MiseryGearVestsM = [] + MiseryLootVestsM;
MiseryGearHeadgearM = [] + MiseryLootHeadgearM;
MiseryGearPacksM = [] + MiseryLootPacksM;
MiseryGearGogglesM = [] + MiseryLootGogglesM;

MiseryGearGrenades = [] + MiseryLootGrenades;
MiseryGearExplosives = [] + MiseryLootExplosives;

//Populate array with inputs:
//(Civilian):
MiseryLootChanceFood pushBack MiseryGearFood;
MiseryLootChanceMedical pushBack MiseryGearMedical;
MiseryLootChanceMisc pushBack MiseryGearItems;
MiseryLootChanceWeapon pushBack MiseryGearWeapons;
MiseryLootChanceAttachment pushBack MiseryGearAttachments;
MiseryLootChanceUniform pushBack MiseryGearUniforms;
MiseryLootChanceVest pushBack MiseryGearVests;
MiseryLootChanceHeadgear pushBack MiseryGearHeadgear;
MiseryLootChancePack pushBack MiseryGearPacks;
MiseryLootChanceGoggle pushBack MiseryGearGoggles;
MiseryLootChanceGrenade pushBack MiseryGearGrenades;
MiseryLootChanceExplosive pushBack MiseryGearExplosives;

//(Military)
MiseryLootChanceFoodM pushBack MiseryGearFoodM;
MiseryLootChanceMedicalM pushBack MiseryGearMedicalM;
MiseryLootChanceMiscM pushBack MiseryGearItemsM;
MiseryLootChanceWeaponM pushBack MiseryGearWeaponsM;
MiseryLootChanceAttachmentM pushBack MiseryGearAttachmentsM;
MiseryLootChanceUniformM pushBack MiseryGearUniformsM;
MiseryLootChanceVestM pushBack MiseryGearVestsM;
MiseryLootChanceHeadgearM pushBack MiseryGearHeadgearM;
MiseryLootChancePackM pushBack MiseryGearPacksM;
MiseryLootChanceGoggleM pushBack MiseryGearGogglesM;
MiseryLootChanceGrenadeM pushBack MiseryGearGrenades;
MiseryLootChanceExplosiveM pushBack MiseryGearExplosives;
};

MiseryLootReady=TRUE;

if!(isServer)exitWith{};

if (MiseryLootrefreshtimer != -1) then {
[] execVM MIS_FILESYS(Modules\Loot\Refresh); 
}else{
if (MiseryDebug) then {systemChat format["[Misery Loot Framework] Disabled loot refresh, due to refresh timer being set to %1 value...", MiseryLootrefreshtimer];};
};

[] execVM MIS_FILESYS(Modules\Loot\Dynamic); 

{publicVariable(str _x)} forEach [
MiseryGearFood,
MiseryGearMedical,
MiseryGearItems,
MiseryGearWeapons,
MiseryGearAttachments,
MiseryGearUniforms,
MiseryGearVests,
MiseryGearHeadgear,
MiseryGearPacks,
MiseryGearGoggles,
MiseryGearMagazines,
MiseryGearFoodM,
MiseryGearMedicalM,
MiseryGearItemsM,
MiseryGearWeaponsM,
MiseryGearAttachmentsM,
MiseryGearUniformsM,
MiseryGearVestsM,
MiseryGearHeadgearM,
MiseryGearPacksM,
MiseryGearGogglesM,
MiseryGearMagazinesM,
MiseryGearGrenades,
MiseryGearExplosives
];