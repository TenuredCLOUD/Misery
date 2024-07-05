 /* -----------------------------------
Misery Loot framework start
Code concepts from Drongo edited by TenuredCLOUD
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

#include "\Misery\Scripts\Misery_PreParser.hpp"

private["_info","_c","_types","_bannedTypes","_remove","_weapons","_magazines","_military","_ammo","_grenadeParents","_explosiveParents","_mag","_parents","_parent","_script"];
MiseryLootReady=FALSE;

_info=_this;
_c=0;

MiseryGearLootBaseOnly=TRUE;if((_info select _c)=="FALSE")then{MiseryGearLootBaseOnly=FALSE};_c=_c+1;

MiseryGearUseBISmedical=TRUE;if((_info select _c)=="FALSE")then{MiseryGearUseBISmedical=FALSE};_c=_c+1;
MiseryGearUseBISweapons=TRUE;if((_info select _c)=="FALSE")then{MiseryGearUseBISweapons=FALSE};_c=_c+1;
MiseryGearUseBISitems=TRUE;if((_info select _c)=="FALSE")then{MiseryGearUseBISitems=FALSE};_c=_c+1;
MiseryGearUseBISuniforms=TRUE;if((_info select _c)=="FALSE")then{MiseryGearUseBISuniforms=FALSE};_c=_c+1;
MiseryGearUseBISvests=TRUE;if((_info select _c)=="FALSE")then{MiseryGearUseBISvests=FALSE};_c=_c+1;
MiseryGearUseBISheadgear=TRUE;if((_info select _c)=="FALSE")then{MiseryGearUseBISheadgear=FALSE};_c=_c+1;
MiseryGearUseBISgoggles=TRUE;if((_info select _c)=="FALSE")then{MiseryGearUseBISgoggles=FALSE};_c=_c+1;
MiseryGearUseBISpacks=TRUE;if((_info select _c)=="FALSE")then{MiseryGearUseBISpacks=FALSE};_c=_c+1;
MiseryGearUseMiseryfood=TRUE;if((_info select _c)=="FALSE")then{MiseryGearUseMiseryfood=FALSE};_c=_c+1;
MiseryGearUseMiserymedical=TRUE;if((_info select _c)=="FALSE")then{MiseryGearUseMiserymedical=FALSE};_c=_c+1;
MiseryGearUseMiseryitems=TRUE;if((_info select _c)=="FALSE")then{MiseryGearUseMiseryitems=FALSE};_c=_c+1;

MiseryGearChanceLoot=_info select _c;_c=_c+1;
MiseryGearChanceFood=(_info select _c)call Misery_fnc_ParseArray2;_c=_c+1;
MiseryGearChanceMed=(_info select _c)call Misery_fnc_ParseArray2;_c=_c+1;
MiseryGearChanceItems=(_info select _c)call Misery_fnc_ParseArray2;_c=_c+1;
MiseryGearChanceWeapons=(_info select _c)call Misery_fnc_ParseArray2;_c=_c+1;
MiseryGearChanceAttachments=(_info select _c)call Misery_fnc_ParseArray2;_c=_c+1;
MiseryGearChanceMagazines=(_info select _c)call Misery_fnc_ParseArray2;_c=_c+1;
MiseryGearChanceUniforms=(_info select _c)call Misery_fnc_ParseArray2;_c=_c+1;
MiseryGearChanceVests=(_info select _c)call Misery_fnc_ParseArray2;_c=_c+1;
MiseryGearChanceHeadgear=(_info select _c)call Misery_fnc_ParseArray2;_c=_c+1;
MiseryGearChancePacks=(_info select _c)call Misery_fnc_ParseArray2;_c=_c+1;
MiseryGearChanceGoggles=(_info select _c)call Misery_fnc_ParseArray2;_c=_c+1;
MiseryGearChanceMagazineRandom=(_info select _c)call Misery_fnc_ParseArray2;_c=_c+1;
MiseryGearChanceGrenades=(_info select _c)call Misery_fnc_ParseArray2;_c=_c+1;
MiseryGearChanceExplosives=(_info select _c)call Misery_fnc_ParseArray2;_c=_c+1;

MiseryGearChanceLootM=_info select _c;_c=_c+1;
MiseryGearChanceFoodM=(_info select _c)call Misery_fnc_ParseArray2;_c=_c+1;
MiseryGearChanceMedM=(_info select _c)call Misery_fnc_ParseArray2;_c=_c+1;
MiseryGearChanceItemsM=(_info select _c)call Misery_fnc_ParseArray2;_c=_c+1;
MiseryGearChanceWeaponsM=(_info select _c)call Misery_fnc_ParseArray2;_c=_c+1;
MiseryGearChanceAttachmentsM=(_info select _c)call Misery_fnc_ParseArray2;_c=_c+1;
MiseryGearChanceMagazinesM=(_info select _c)call Misery_fnc_ParseArray2;_c=_c+1;
MiseryGearChanceUniformsM=(_info select _c)call Misery_fnc_ParseArray2;_c=_c+1;
MiseryGearChanceVestsM=(_info select _c)call Misery_fnc_ParseArray2;_c=_c+1;
MiseryGearChanceHeadgearM=(_info select _c)call Misery_fnc_ParseArray2;_c=_c+1;
MiseryGearChancePacksM=(_info select _c)call Misery_fnc_ParseArray2;_c=_c+1;
MiseryGearChanceGogglesM=(_info select _c)call Misery_fnc_ParseArray2;_c=_c+1;
MiseryGearChanceMagazineRandomM=(_info select _c)call Misery_fnc_ParseArray2;_c=_c+1;
MiseryGearChanceGrenadesM=(_info select _c)call Misery_fnc_ParseArray2;_c=_c+1;
MiseryGearChanceExplosivesM=(_info select _c)call Misery_fnc_ParseArray2;_c=_c+1;

MiseryCustomItemArrays=TRUE;if((_info select _c)=="FALSE")then{MiseryCustomItemArrays=FALSE};_c=_c+1;

MiseryItemsFood = (_info select _c) call Misery_fnc_ParseArray2;_c=_c+1;
MiseryItemsFoodM = (_info select _c) call Misery_fnc_ParseArray2;_c=_c+1;
MiseryItemsMedical = (_info select _c) call Misery_fnc_ParseArray2;_c=_c+1;
MiseryItemsMedicalM = (_info select _c) call Misery_fnc_ParseArray2;_c=_c+1;
MiseryItemsMisc = (_info select _c) call Misery_fnc_ParseArray2;_c=_c+1;
MiseryItemsMiscM = (_info select _c) call Misery_fnc_ParseArray2;_c=_c+1;
MiseryWeapons = (_info select _c) call Misery_fnc_ParseArray2;_c=_c+1;
MiseryWeaponsM = (_info select _c) call Misery_fnc_ParseArray2;_c=_c+1;
MiseryWeaponattachments = (_info select _c) call Misery_fnc_ParseArray2;_c=_c+1;
MiseryWeaponattachmentsM = (_info select _c) call Misery_fnc_ParseArray2;_c=_c+1;
MiseryUniforms = (_info select _c) call Misery_fnc_ParseArray2;_c=_c+1;
MiseryUniformsM = (_info select _c) call Misery_fnc_ParseArray2;_c=_c+1;
MiseryVests = (_info select _c) call Misery_fnc_ParseArray2;_c=_c+1;
MiseryVestsM = (_info select _c) call Misery_fnc_ParseArray2;_c=_c+1;
MiseryHeadgear = (_info select _c) call Misery_fnc_ParseArray2;_c=_c+1;
MiseryHeadgearM = (_info select _c) call Misery_fnc_ParseArray2;_c=_c+1;
MiseryPacks = (_info select _c) call Misery_fnc_ParseArray2;_c=_c+1;
MiseryPacksM = (_info select _c) call Misery_fnc_ParseArray2;_c=_c+1;
MiseryGoggles = (_info select _c) call Misery_fnc_ParseArray2;_c=_c+1;
MiseryGogglesM = (_info select _c) call Misery_fnc_ParseArray2;_c=_c+1;
MiseryGrenades = (_info select _c) call Misery_fnc_ParseArray2;_c=_c+1;
MiseryExplosives = (_info select _c) call Misery_fnc_ParseArray2;_c=_c+1;

MiseryItemsBlacklist=(_info select _c)call Misery_fnc_ParseArray2;_c=_c+1;
MiseryBuildingsBlacklist=(_info select _c)call Misery_fnc_ParseArray2;_c=_c+1;

Misery_Loottimer=_info select _c;_c=_c+1;
Misery_Lootrefreshtimer=_info select _c;_c=_c+1;
Misery_LootspawnDist=_info select _c;_c=_c+1;
Misery_LootDeleteDist=_info select _c;_c=_c+1;

PREPROC_FUNCTION(Misery_fnc_MilitaryWeapon,MIS_FILESYS(Modules\Loot\MilitaryWeapon))
PREPROC_FUNCTION(Misery_fnc_MilitaryVest,MIS_FILESYS(Modules\Loot\MilitaryVest))
PREPROC_FUNCTION(Misery_fnc_MilitaryUniform,MIS_FILESYS(Modules\Loot\MilitaryUniform))
PREPROC_FUNCTION(Misery_fnc_MilitaryHeadgear,MIS_FILESYS(Modules\Loot\MilitaryHeadgear))

private _blacklist=[] + MiseryItemsBlacklist;

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
if(MiseryGearUseMiseryfood)then{MiseryGearFood=["Misery_Bearenergy","Misery_vodkafull","Misery_vodka34","Misery_vodka12","Misery_vodka14","Misery_coffeegrounds","Misery_wolfbeer"]+MiseryItemsFood;MiseryGearFoodM=["Misery_Bearenergy","Misery_vodkafull","Misery_vodka34","Misery_vodka12","Misery_vodka14","Misery_coffeegrounds","Misery_wolfbeer"]+MiseryItemsFood};
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
]+MiseryItemsMedical;
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
"Misery_cigar"]+MiseryItemsMedical};
if(MiseryGearUseMiseryitems)then{MiseryGearItems=[
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
]+MiseryItemsMisc;MiseryGearItemsM=["Misery_Pickaxe",
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
"Misery_AutoBatt"]+MiseryItemsMisc};

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

//Check for Custom arrays restriction:
if !(MiseryCustomItemArrays) then {

//Add custom arrays to auto popped arrays:

MiseryGearFood = MiseryGearFood + MiseryItemsFood;
MiseryGearMedical = MiseryGearMedical + MiseryItemsMedical;
MiseryGearItems = MiseryGearItems + MiseryItemsMisc;
MiseryGearWeapons = MiseryGearWeapons + MiseryWeapons;
MiseryGearAttachments = MiseryGearAttachments + MiseryWeaponattachments;
MiseryGearUniforms = MiseryGearUniforms + MiseryUniforms;
MiseryGearVests = MiseryGearVests + MiseryVests;
MiseryGearHeadgear = MiseryGearHeadgear + MiseryHeadgear;
MiseryGearPacks = MiseryGearPacks + MiseryPacks;
MiseryGearGoggles = MiseryGearGoggles + MiseryGoggles;

MiseryGearFoodM = MiseryGearFoodM + MiseryItemsFoodM;
MiseryGearMedicalM = MiseryGearMedicalM + MiseryItemsMedicalM;
MiseryGearItemsM = MiseryGearItemsM + MiseryItemsMiscM;
MiseryGearWeaponsM = MiseryGearWeaponsM + MiseryWeaponsM;
MiseryGearAttachmentsM = MiseryGearAttachmentsM + MiseryWeaponattachmentsM;
MiseryGearUniformsM = MiseryGearUniformsM + MiseryUniformsM;
MiseryGearVestsM = MiseryGearVestsM + MiseryVestsM;
MiseryGearHeadgearM = MiseryGearHeadgearM + MiseryHeadgearM;
MiseryGearPacksM = MiseryGearPacksM + MiseryPacksM;
MiseryGearGogglesM = MiseryGearGogglesM + MiseryGogglesM;

MiseryGearGrenades = MiseryGearGrenades + MiseryGrenades;
MiseryGearExplosives = MiseryGearExplosives + MiseryExplosives;

//Populate arrays (Civilian):
MiseryGearChanceFood pushBack MiseryGearFood;
MiseryGearChanceMed pushBack MiseryGearMedical;
MiseryGearChanceItems pushBack MiseryGearItems;
MiseryGearChanceWeapons pushBack MiseryGearWeapons;
MiseryGearChanceAttachments pushBack MiseryGearAttachments;
MiseryGearChanceUniforms pushBack MiseryGearUniforms;
MiseryGearChanceVests pushBack MiseryGearVests;
MiseryGearChanceHeadgear pushBack MiseryGearHeadgear;
MiseryGearChancePacks pushBack MiseryGearPacks;
MiseryGearChanceGoggles pushBack MiseryGearGoggles;
MiseryGearChanceGrenades pushBack MiseryGearGrenades;
MiseryGearChanceExplosives pushBack MiseryGearExplosives;

//Populate arrays (Military)
MiseryGearChanceFoodM pushBack MiseryGearFoodM;
MiseryGearChanceMedM pushBack MiseryGearMedicalM;
MiseryGearChanceItemsM pushBack MiseryGearItemsM;
MiseryGearChanceWeaponsM pushBack MiseryGearWeaponsM;
MiseryGearChanceAttachmentsM pushBack MiseryGearAttachmentsM;
MiseryGearChanceUniformsM pushBack MiseryGearUniformsM;
MiseryGearChanceVestsM pushBack MiseryGearVestsM;
MiseryGearChanceHeadgearM pushBack MiseryGearHeadgearM;
MiseryGearChancePacksM pushBack MiseryGearPacksM;
MiseryGearChanceGogglesM pushBack MiseryGearGogglesM;
MiseryGearChanceGrenadesM pushBack MiseryGearGrenades;
MiseryGearChanceExplosivesM pushBack MiseryGearExplosives;

}else{
//Reset arrays:
MiseryGearFood = [] + MiseryItemsFood;
MiseryGearMedical = [] + MiseryItemsMedical;
MiseryGearItems = [] + MiseryItemsMisc;
MiseryGearWeapons = [] + MiseryWeapons;
MiseryGearAttachments = [] + MiseryWeaponattachments;
MiseryGearUniforms = [] + MiseryUniforms;
MiseryGearVests = [] + MiseryVests;
MiseryGearHeadgear = [] + MiseryHeadgear;
MiseryGearPacks = [] + MiseryPacks;
MiseryGearGoggles = [] + MiseryGoggles;

MiseryGearFoodM = [] + MiseryItemsFoodM;
MiseryGearMedicalM = [] + MiseryItemsMedicalM;
MiseryGearItemsM = [] + MiseryItemsMiscM;
MiseryGearWeaponsM = [] + MiseryWeaponsM;
MiseryGearAttachmentsM = [] + MiseryWeaponattachmentsM;
MiseryGearUniformsM = [] + MiseryUniformsM;
MiseryGearVestsM = [] + MiseryVestsM;
MiseryGearHeadgearM = [] + MiseryHeadgearM;
MiseryGearPacksM = [] + MiseryPacksM;
MiseryGearGogglesM = [] + MiseryGogglesM;

MiseryGearGrenades = [] + MiseryGrenades;
MiseryGearExplosives = [] + MiseryExplosives;

//Populate array with inputs:
//(Civilian):
MiseryGearChanceFood pushBack MiseryGearFood;
MiseryGearChanceMed pushBack MiseryGearMedical;
MiseryGearChanceItems pushBack MiseryGearItems;
MiseryGearChanceWeapons pushBack MiseryGearWeapons;
MiseryGearChanceAttachments pushBack MiseryGearAttachments;
MiseryGearChanceUniforms pushBack MiseryGearUniforms;
MiseryGearChanceVests pushBack MiseryGearVests;
MiseryGearChanceHeadgear pushBack MiseryGearHeadgear;
MiseryGearChancePacks pushBack MiseryGearPacks;
MiseryGearChanceGoggles pushBack MiseryGearGoggles;
MiseryGearChanceGrenades pushBack MiseryGearGrenades;
MiseryGearChanceExplosives pushBack MiseryGearExplosives;

//(Military)
MiseryGearChanceFoodM pushBack MiseryGearFoodM;
MiseryGearChanceMedM pushBack MiseryGearMedicalM;
MiseryGearChanceItemsM pushBack MiseryGearItemsM;
MiseryGearChanceWeaponsM pushBack MiseryGearWeaponsM;
MiseryGearChanceAttachmentsM pushBack MiseryGearAttachmentsM;
MiseryGearChanceUniformsM pushBack MiseryGearUniformsM;
MiseryGearChanceVestsM pushBack MiseryGearVestsM;
MiseryGearChanceHeadgearM pushBack MiseryGearHeadgearM;
MiseryGearChancePacksM pushBack MiseryGearPacksM;
MiseryGearChanceGogglesM pushBack MiseryGearGogglesM;
MiseryGearChanceGrenadesM pushBack MiseryGearGrenades;
MiseryGearChanceExplosivesM pushBack MiseryGearExplosives;
};

MiseryLootReady=TRUE;

if!(isServer)exitWith{};

if (Misery_Lootrefreshtimer != -1) then {
[] execVM MIS_FILESYS(Modules\Loot\Refresh); 
}else{
if (MiseryDebug) then {systemChat format["[Misery Loot Framework] Disabled loot refresh, due to refresh timer being set to %1 value...",Misery_Lootrefreshtimer];};
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