#include "\z\misery\addons\framework\scripts\Misery_PreParser.hpp"

/*
Misery Function compile PREP
Compiles most Misery functions prior to sessions
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

//Modules
PREPROC_FUNCTION(Misery_fnc_ModuleCustomItemAction,MIS_FILESYS(Modules\Functions\ModuleCustomItemAction))
PREPROC_FUNCTION(Misery_fnc_ModuleCustomAction,MIS_FILESYS(Modules\Functions\ModuleCustomAction))
PREPROC_FUNCTION(Misery_fnc_ModuleLoot,MIS_FILESYS(Modules\Functions\ModuleLoot))
PREPROC_FUNCTION(Misery_fnc_ModuleRandmed,MIS_FILESYS(Modules\Functions\ModuleRandmed))
PREPROC_FUNCTION(Misery_fnc_ModuleGearEquip,MIS_FILESYS(Modules\Functions\ModuleGearEquip))
PREPROC_FUNCTION(Misery_fnc_ModulePsyfield,MIS_FILESYS(Modules\Functions\ModulePsyfield))
PREPROC_FUNCTION(Misery_fnc_ModuleRadZone,MIS_FILESYS(Modules\Functions\ModuleRadZone))
PREPROC_FUNCTION(Misery_fnc_ModulePDA,MIS_FILESYS(Modules\Functions\ModulePDA))
PREPROC_FUNCTION(Misery_fnc_Modulekillzone,MIS_FILESYS(Modules\Functions\Modulekillzone))
PREPROC_FUNCTION(Misery_fnc_ModuleMechanic,MIS_FILESYS(Modules\Functions\ModuleMechanic))
PREPROC_FUNCTION(Misery_fnc_ModuleRearm,MIS_FILESYS(Modules\Functions\ModuleRearm))
PREPROC_FUNCTION(Misery_fnc_ModuleMedzone,MIS_FILESYS(Modules\Functions\ModuleMedzone))
PREPROC_FUNCTION(Misery_fnc_ModuleSafezone,MIS_FILESYS(Modules\Functions\ModuleSafezone))
PREPROC_FUNCTION(Misery_fnc_ModuleRefuelzone,MIS_FILESYS(Modules\Functions\ModuleRefuelzone))
PREPROC_FUNCTION(Misery_fnc_ModulePOISettings,MIS_FILESYS(Modules\Functions\ModulePOISettings))
PREPROC_FUNCTION(Misery_fnc_ModuleAISettings,MIS_FILESYS(Modules\Functions\ModuleAISettings))
PREPROC_FUNCTION(Misery_fnc_ModuleArtifactSpawner,MIS_FILESYS(Modules\Functions\ModuleArtifactSpawner))

//Near Corpse:
PREPROC_FUNCTION(Misery_fnc_NearestCorpse_Money,MIS_FILESYS(survival\Functions\Near\NearestCorpse_Money))

//Near vehicles:
// PREPROC_FUNCTION(Misery_fnc_NearLandVeh,MIS_FILESYS(survival\Functions\Mechanic\NearLandVeh))
// PREPROC_FUNCTION(Misery_fnc_NearHeli,MIS_FILESYS(survival\Functions\Mechanic\NearHeli))
// PREPROC_FUNCTION(Misery_fnc_NearPlane,MIS_FILESYS(survival\Functions\Mechanic\NearPlane))
// PREPROC_FUNCTION(Misery_fnc_NearShip,MIS_FILESYS(survival\Functions\Mechanic\NearShip))
// PREPROC_FUNCTION(Misery_fnc_NearTank,MIS_FILESYS(survival\Functions\Mechanic\NearTank))

//BuildingPositions:
PREPROC_FUNCTION(Misery_fnc_BuildingPositions,MIS_FILESYS(survival\Functions\BuildingPositions))

//BuildingPosinside:
PREPROC_FUNCTION(Misery_fnc_BuildingPositionsInside,MIS_FILESYS(survival\Functions\BuildingPositionsInside))

//IsInGeometry:
PREPROC_FUNCTION(Misery_fnc_IsInGeometry,MIS_FILESYS(survival\Functions\IsInGeometry))

//Mark3D:
PREPROC_FUNCTION(Misery_fnc_Mark3D,MIS_FILESYS(survival\Functions\Mark3D))

//LootPos check:
PREPROC_FUNCTION(Misery_fnc_LootPos,MIS_FILESYS(survival\Functions\LootPos))

//IsBIS check:
PREPROC_FUNCTION(Misery_fnc_IsBIS,MIS_FILESYS(survival\Functions\IsBIS))

//Dead zed check:
PREPROC_FUNCTION(Misery_fnc_IsdeadZed,MIS_FILESYS(survival\Functions\Research\IsdeadZed))

//Inventory handles:
PREPROC_FUNCTION(Misery_fnc_InventoryClickCustom,MIS_FILESYS(Inventory\ClickCustom))
PREPROC_FUNCTION(Misery_fnc_InventoryClick,MIS_FILESYS(Inventory\Click))

//Items:
PREPROC_FUNCTION(Misery_fnc_ItemDecrement,MIS_FILESYS(survival\Functions\ItemDecrement))
PREPROC_FUNCTION(Misery_fnc_ItemDecrement_Replace,MIS_FILESYS(survival\Functions\ItemDecrement_Replace))

//Numbers:
PREPROC_FUNCTION(Misery_fnc_ValToBar,MIS_FILESYS(survival\Functions\Numbers\ValToBar))
PREPROC_FUNCTION(Misery_fnc_addCurrency,MIS_FILESYS(survival\Functions\Numbers\addCurrency))

//Text:
PREPROC_FUNCTION(Misery_fnc_FormatToTile,MIS_FILESYS(survival\Functions\FormatToTile))

//Parsing:
PREPROC_FUNCTION(Misery_fnc_ParseArray,MIS_FILESYS(survival\Functions\Parsing\ParseArray))
PREPROC_FUNCTION(Misery_fnc_ParseArray2,MIS_FILESYS(survival\Functions\Parsing\ParseArray2))

//Array check:
PREPROC_FUNCTION(Misery_fnc_Inarray,MIS_FILESYS(survival\Functions\Inarray))

//SurfacePos:
PREPROC_FUNCTION(Misery_fnc_SurfacePos,MIS_FILESYS(survival\Functions\SurfacePos))

//Player list:
PREPROC_FUNCTION(Misery_fnc_ListPlayers,MIS_FILESYS(survival\Functions\ListPlayers))

//Player loadout (simplified):
PREPROC_FUNCTION(Misery_fnc_GetSimplifiedLoadout,MIS_FILESYS(survival\Functions\GetSimplifiedLoadout))

//Persistence:
PREPROC_FUNCTION(Misery_fnc_MiserySerializeplayer,MIS_FILESYS(survival\Persistency\Save\MiserySerializeplayer))
PREPROC_FUNCTION(Misery_fnc_MiseryDeserializeplayer,MIS_FILESYS(survival\Persistency\Load\MiseryDeserializeplayer))
PREPROC_FUNCTION(Misery_fnc_DeleteData,MIS_FILESYS(survival\Persistency\DeleteData))

//Campfire spawn:
PREPROC_FUNCTION(Misery_fnc_Campfiresmall,MIS_FILESYS(survival\Functions\CampFiresmall))
PREPROC_FUNCTION(Misery_fnc_CampfireBig,MIS_FILESYS(survival\Functions\CampFireBig))

//Near Fire checks:
PREPROC_FUNCTION(Misery_fnc_NearFire,MIS_FILESYS(survival\Functions\Near\NearFire))
PREPROC_FUNCTION(Misery_fnc_FireRainSafe,MIS_FILESYS(survival\Functions\FireRainSafe))

//Artifacts:
PREPROC_FUNCTION(Misery_fnc_ArtifactSafe,MIS_FILESYS(survival\Functions\ArtifactSafe))

//Building checks:
PREPROC_FUNCTION(Misery_fnc_IsInside,MIS_FILESYS(survival\Functions\IsInside))
PREPROC_FUNCTION(Misery_fnc_IsInsideloot,MIS_FILESYS(survival\Functions\IsInsideloot))

//Weapon Swap Function:
PREPROC_FUNCTION(Misery_fnc_WeapSwap,MIS_FILESYS(survival\Functions\WeapSwap))

//Item Swap Function:
PREPROC_FUNCTION(Misery_fnc_ItemSwap,MIS_FILESYS(survival\Functions\ItemSwap))

//Ballistics modifier:
PREPROC_FUNCTION(Misery_fnc_BallisticsModifier,MIS_FILESYS(survival\Immersion\BallisticsMod))

//Special damage / ACE
PREPROC_FUNCTION(Misery_fnc_SpecialDamage,MIS_FILESYS(survival\SpecialDamage))

//Stun / Unconsious:
PREPROC_FUNCTION(Misery_fnc_Stun,MIS_FILESYS(survival\Stun))

//Inventory:
PREPROC_FUNCTION(Misery_fnc_DefinesurvivalItems,MIS_FILESYS(survival\DefineItems));

//Fishing checks:
PREPROC_FUNCTION(Misery_fnc_Fishinggear,MIS_FILESYS(survival\Functions\Hasitems\Fishing\Fishinggear))
PREPROC_FUNCTION(Misery_fnc_Canfish,MIS_FILESYS(survival\Functions\Canfish))
PREPROC_FUNCTION(Misery_fnc_fishact,MIS_FILESYS(survival\Use\init\survival\Fishing\actions\fishact))

//Adv Refueling:
PREPROC_FUNCTION(Misery_fnc_Refillgear,MIS_FILESYS(survival\Functions\Hasitems\Refueling\Refillgear))
PREPROC_FUNCTION(Misery_fnc_RefillFuelact,MIS_FILESYS(survival\Use\init\fuel\actions\RefillFuelact))
PREPROC_FUNCTION(Misery_fnc_RefillgearJ,MIS_FILESYS(survival\Functions\Hasitems\Refueling\RefillgearJ))
PREPROC_FUNCTION(Misery_fnc_RefillJFuelact,MIS_FILESYS(survival\Use\init\fuel\actions\RefillJFuelact))
PREPROC_FUNCTION(Misery_fnc_NearFuel,MIS_FILESYS(survival\Functions\Near\NearFuel))
PREPROC_FUNCTION(Misery_fnc_NearJetFuel,MIS_FILESYS(survival\Functions\Near\NearJetFuel))
PREPROC_FUNCTION(Misery_fnc_Refuelatpump,MIS_FILESYS(survival\Functions\Refueling\Refuelatpump))
PREPROC_FUNCTION(Misery_fnc_RefuelatJetpump,MIS_FILESYS(survival\Functions\Refueling\RefuelatJetpump))
PREPROC_FUNCTION(Misery_fnc_RefillFuelPumpact,MIS_FILESYS(survival\Use\init\fuel\actions\RefillFuelPumpact))
PREPROC_FUNCTION(Misery_fnc_RefillJFuelPumpact,MIS_FILESYS(survival\Use\init\fuel\actions\RefillJFuelPumpact))

//Cooking checks:
PREPROC_FUNCTION(Misery_fnc_Cancookmeat,MIS_FILESYS(survival\Functions\Hasitems\Cooking\Cancookmeat))
PREPROC_FUNCTION(Misery_fnc_Canboilwater,MIS_FILESYS(survival\Functions\Hasitems\Cooking\Canboilwater))
PREPROC_FUNCTION(Misery_fnc_Canbrewcoffee,MIS_FILESYS(survival\Functions\Hasitems\Cooking\Canbrewcoffee))
PREPROC_FUNCTION(Misery_fnc_Cookact,MIS_FILESYS(survival\Use\init\survival\Cooking\actions\Cookact))
PREPROC_FUNCTION(Misery_fnc_Boilact,MIS_FILESYS(survival\Use\init\survival\Cooking\actions\Boilact))
PREPROC_FUNCTION(Misery_fnc_Brewact,MIS_FILESYS(survival\Use\init\survival\Cooking\actions\Brewact))

//Near fire (Crude Med)
PREPROC_FUNCTION(Misery_fnc_Cauterizeact,MIS_FILESYS(survival\Use\init\survival\CrudeMed\Cauterizeact))
PREPROC_FUNCTION(Misery_fnc_StitchThreadact,MIS_FILESYS(survival\Use\init\survival\CrudeMed\StitchThreadact))	

//Music
PREPROC_FUNCTION(Misery_fnc_playMusic_Random,MIS_FILESYS(survival\Functions\Music\playMusic_Random))

//Mining checks:
//Near checks:
PREPROC_FUNCTION(Misery_fnc_NearAnvil,MIS_FILESYS(survival\Functions\Near\NearAnvil))
PREPROC_FUNCTION(Misery_fnc_NearForge,MIS_FILESYS(survival\Functions\Near\NearForge))
PREPROC_FUNCTION(Misery_fnc_NearRockSource,MIS_FILESYS(survival\Functions\Near\NearRockSource))

//Mining gear check / actions:
PREPROC_FUNCTION(Misery_fnc_mineactcheck,MIS_FILESYS(survival\Functions\Hasitems\Mining\mineactcheck))
PREPROC_FUNCTION(Misery_fnc_mineoreact,MIS_FILESYS(survival\Use\init\mining\actions\mineoreact))

//Crafting checks:
PREPROC_FUNCTION(Misery_fnc_NearWorkbench,MIS_FILESYS(survival\Functions\Near\NearWorkbench))
//Workbench gear check / actions:
// PREPROC_FUNCTION(Misery_fnc_craftghillie,MIS_FILESYS(survival\Functions\Hasitems\Crafting\craftghillie))
// PREPROC_FUNCTION(Misery_fnc_craftghillieact,MIS_FILESYS(survival\Use\init\crafting\actions\craftghillieact))
// PREPROC_FUNCTION(Misery_fnc_craftsIED,MIS_FILESYS(survival\Functions\Hasitems\Crafting\craftsIED))
// PREPROC_FUNCTION(Misery_fnc_craftSIEDact,MIS_FILESYS(survival\Use\init\crafting\actions\craftSIEDact))
// PREPROC_FUNCTION(Misery_fnc_craftLIED,MIS_FILESYS(survival\Functions\Hasitems\Crafting\craftLIED))
// PREPROC_FUNCTION(Misery_fnc_craftLIEDact,MIS_FILESYS(survival\Use\init\crafting\actions\craftLIEDact))
// PREPROC_FUNCTION(Misery_fnc_craftTkit,MIS_FILESYS(survival\Functions\Hasitems\Crafting\craftTkit))
// PREPROC_FUNCTION(Misery_fnc_craftTkitact,MIS_FILESYS(survival\Use\init\crafting\actions\craftTkitact))
// PREPROC_FUNCTION(Misery_fnc_craftvest,MIS_FILESYS(survival\Functions\Hasitems\Crafting\craftvest))
// PREPROC_FUNCTION(Misery_fnc_craftvestact,MIS_FILESYS(survival\Use\init\crafting\actions\craftvestact))
// PREPROC_FUNCTION(Misery_fnc_craftCBRNas,MIS_FILESYS(survival\Functions\Hasitems\Crafting\craftCBRNas))
// PREPROC_FUNCTION(Misery_fnc_assembleCBRNact,MIS_FILESYS(survival\Use\init\crafting\actions\assembleCBRNact))
// PREPROC_FUNCTION(Misery_fnc_craftCBRNdis,MIS_FILESYS(survival\Functions\Hasitems\Crafting\craftCBRNdis))
// PREPROC_FUNCTION(Misery_fnc_disassembleCBRNact,MIS_FILESYS(survival\Use\init\crafting\actions\disassembleCBRNact))
// PREPROC_FUNCTION(Misery_fnc_woodplanks,MIS_FILESYS(survival\Functions\Hasitems\Crafting\woodplanks))
// PREPROC_FUNCTION(Misery_fnc_woodplanksact,MIS_FILESYS(survival\Use\init\crafting\actions\woodplanksact))

//Water collection Checks:
PREPROC_FUNCTION(Misery_fnc_NearWell,MIS_FILESYS(survival\Functions\Near\NearWell))
// PREPROC_FUNCTION(Misery_fnc_emptybottlefill,MIS_FILESYS(survival\Functions\Hasitems\WaterCollect\emptybottlefill))
// PREPROC_FUNCTION(Misery_fnc_waterbottleact,MIS_FILESYS(survival\Use\init\survival\WaterCollection\actions\waterbottleact))
// PREPROC_FUNCTION(Misery_fnc_emptycanteenfill,MIS_FILESYS(survival\Functions\Hasitems\WaterCollect\emptycanteenfill))
// PREPROC_FUNCTION(Misery_fnc_watercanteenact,MIS_FILESYS(survival\Use\init\survival\WaterCollection\actions\watercanteenact))
// PREPROC_FUNCTION(Misery_fnc_emptyjerrycanfill,MIS_FILESYS(survival\Functions\Hasitems\WaterCollect\emptyjerrycanfill))
// PREPROC_FUNCTION(Misery_fnc_waterjerryact,MIS_FILESYS(survival\Use\init\survival\WaterCollection\actions\waterjerryact))
// PREPROC_FUNCTION(Misery_fnc_hasptablets,MIS_FILESYS(survival\Functions\Hasitems\WaterCollect\hasptablets))

//Woodcutting actions Checks:
PREPROC_FUNCTION(Misery_fnc_NearTreeAxe,MIS_FILESYS(survival\Functions\Near\NearTreeAxe))
PREPROC_FUNCTION(Misery_fnc_Axeaction,MIS_FILESYS(survival\Use\init\survival\Woodcollection\actions\Axeaction))
PREPROC_FUNCTION(Misery_fnc_NearTreeSaw,MIS_FILESYS(survival\Functions\Near\NearTreeSaw))
PREPROC_FUNCTION(Misery_fnc_Sawaction,MIS_FILESYS(survival\Use\init\survival\Woodcollection\actions\Sawaction))
PREPROC_FUNCTION(Misery_fnc_NearTree,MIS_FILESYS(survival\Functions\Near\NearTree))
PREPROC_FUNCTION(Misery_fnc_Foragetreeaction,MIS_FILESYS(survival\Use\init\survival\Woodcollection\actions\Foragetreeaction))
PREPROC_FUNCTION(Misery_fnc_SplitWoodaction,MIS_FILESYS(survival\Use\init\survival\Woodcollection\actions\SplitWoodaction))

//Foraging actions Checks:
PREPROC_FUNCTION(Misery_fnc_Canforage,MIS_FILESYS(survival\Functions\Canforage))
PREPROC_FUNCTION(Misery_fnc_digforworms,MIS_FILESYS(survival\Use\init\survival\Foraging\actions\digforworms))
PREPROC_FUNCTION(Misery_fnc_searchfortinder,MIS_FILESYS(survival\Use\init\survival\Foraging\actions\searchfortinder))


//Jerrycans (dirty / clean):
PREPROC_FUNCTION(Misery_fnc_HasJerrycanClean,MIS_FILESYS(survival\Functions\Hasitems\Inventory\Jerrycan\HasJerrycanClean))
PREPROC_FUNCTION(Misery_fnc_HasJerrycanDirty,MIS_FILESYS(survival\Functions\Hasitems\Inventory\Jerrycan\HasJerrycanDirty))
PREPROC_FUNCTION(Misery_fnc_Hasfillable,MIS_FILESYS(survival\Functions\Hasitems\Inventory\Jerrycan\Hasfillable))
PREPROC_FUNCTION(Misery_fnc_drinkjdirtyact,MIS_FILESYS(survival\Use\init\inventory\WaterJerry\actions\drinkjdirtyact))
PREPROC_FUNCTION(Misery_fnc_canteenfilldact,MIS_FILESYS(survival\Use\init\inventory\WaterJerry\actions\canteenfilldact))
PREPROC_FUNCTION(Misery_fnc_bottlefilldact,MIS_FILESYS(survival\Use\init\inventory\WaterJerry\actions\bottlefilldact))
PREPROC_FUNCTION(Misery_fnc_bottlefillcact,MIS_FILESYS(survival\Use\init\inventory\WaterJerry\actions\bottlefillcact))
PREPROC_FUNCTION(Misery_fnc_canteenfillcact,MIS_FILESYS(survival\Use\init\inventory\WaterJerry\actions\canteenfillcact))
PREPROC_FUNCTION(Misery_fnc_drinkjcleanact,MIS_FILESYS(survival\Use\init\inventory\WaterJerry\actions\drinkjcleanact))

//Leadlined containers:
PREPROC_FUNCTION(Misery_fnc_Hasartifact,MIS_FILESYS(survival\Functions\Hasitems\Inventory\Leadcontainer\Hasartifact))
PREPROC_FUNCTION(Misery_fnc_putincontaineract,MIS_FILESYS(survival\Use\init\inventory\Leadcontainer\actions\putincontaineract))

//Buildact:
PREPROC_FUNCTION(Misery_fnc_Hashammer,MIS_FILESYS(survival\Functions\Hasitems\Buildext\Hashammer))
PREPROC_FUNCTION(Misery_fnc_HasSledghammer,MIS_FILESYS(survival\Functions\Hasitems\Buildext\HasSledghammer))
PREPROC_FUNCTION(Misery_fnc_NearNMB,MIS_FILESYS(survival\Functions\Near\NearNMB))
PREPROC_FUNCTION(Misery_fnc_demolish,MIS_FILESYS(survival\Use\init\Buildext\actions\demolish))

//Weather / Exposure checks:
PREPROC_FUNCTION(Misery_fnc_Temperature,MIS_FILESYS(survival\Functions\Temperature\Temperature))
PREPROC_FUNCTION(Misery_fnc_ClothingWarmth,MIS_FILESYS(survival\Functions\Temperature\ClothingWarmth))
PREPROC_FUNCTION(Misery_fnc_EffectiveTemperature,MIS_FILESYS(survival\Functions\Temperature\EffectiveTemperature))
PREPROC_FUNCTION(Misery_fnc_Warmup,MIS_FILESYS(survival\Functions\Temperature\Warmup))
PREPROC_FUNCTION(Misery_fnc_Overtemp,MIS_FILESYS(survival\Functions\Temperature\Overtemp))
PREPROC_FUNCTION(Misery_fnc_Sick,MIS_FILESYS(survival\Functions\Temperature\Sick))
PREPROC_FUNCTION(Misery_fnc_Cold,MIS_FILESYS(survival\Functions\Temperature\Cold))
PREPROC_FUNCTION(Misery_fnc_Water,MIS_FILESYS(survival\Functions\Temperature\Water))
PREPROC_FUNCTION(Misery_fnc_Clothingcheck,MIS_FILESYS(survival\Functions\Temperature\Clothingcheck))

