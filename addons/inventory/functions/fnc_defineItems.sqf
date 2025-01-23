#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Defined item usage, custom item params
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_inventory_fnc_defineItems
 *
*/

//Format:
// className
// |  hunger increase / decrease
// |  | thirst increase / decrease
// |  | | add to debuffs
// |  | | |  remove from debuffs
// |  | | |  |  script on use
// |  | | |  |  |  KEEP or remove on use ("KEEP" / "")
// |  | | |  |  |  |  sound played on use (Must be defined)
// |  | | |  |    |  |  |  check for gasmask (BOOL)
// |  | | |  |    |  |  |     |     check for canopener (BOOL)
// |  | | |  |    |  |  |     |       |     delay (numeric value)
// |  | | |  |    |  |  |     |       |     | rads
// |  | | |  |    |  |  |     |       |     | |
// |  | | |  |    |  |  |     |       |     | | exposure
// |  | | |  |  |  |  |  |     |     | | |
// |  | | |  |  |  |  |  |     |     | | |
//["",0,0,[],[],"","","",false,false,0,0,0];

private _items=[

// //Rvg Tents, sleeping bag:
// ["rvg_sleepingBag_Blue",0,0,[],[],"Use\init\inventory\Rvgtents\unfold.sqf","KEEP","",false,false,0,0,0], //Rvg action
// ["rvg_foldedTent_blue",0,0,[],[],"Use\init\inventory\Rvgtents\unpackblue.sqf","KEEP","",false,false,0,0,0], //Rvg action
// ["rvg_foldedTent",0,0,[],[],"Use\init\inventory\Rvgtents\unpackgreen.sqf","KEEP","",false,false,0,0,0], //Rvg action
// ["rvg_foldedTent_grey",0,0,[],[],"Use\init\inventory\Rvgtents\unpackgrey.sqf","KEEP","",false,false,0,0,0], //Rvg action
// ["rvg_purificationTablets",0,0,[],[],"\ravage\actions\purifyMenu.sqf","KEEP","",false,false,0,0,0], //Rvg action

// //Rvg antirads:
// ["rvg_antiRad",0,0,[],[],"\ravage\actions\antiRad.sqf","KEEP","",false,false,0,0,0], //Rvg action

// //Misery Research tools:
// [QCLASS(BONEsaw",0,0,[],[],"Use\init\inventory\Research\Sawzombie.sqf","KEEP","",false,false,0,0,0],
// [QCLASS(GuttingKnife",0,0,[],[],"Use\init\inventory\Research\Skinzombie.sqf","KEEP","",false,false,0,0,0],

// //Rvg gutting knife:
// ["rvg_guttingKnife",0,0,[],[],"\ravage\actions\gut.sqf","KEEP","",false,false,0,0,0],

// //WBK Knife usage (WBK IMS compat):
// ["Weap_melee_knife", 0,0,[],[],"Use\init\inventory\Research\Skinselected.sqf","KEEP","",false,false,0,0,0],
// ["Knife_kukri",0,0,[],[],"Use\init\inventory\Research\Skinselected.sqf","KEEP","",false,false,0,0,0],
// ["Knife_m3",0,0,[],[],"Use\init\inventory\Research\Skinselected.sqf","KEEP","",false,false,0,0,0],
// ["UNSC_Knife",0,0,[],[],"Use\init\inventory\Research\Skinselected.sqf","KEEP","",false,false,0,0,0],
// ["UNSC_Knife_reversed",0,0,[],[],"Use\init\inventory\Research\Skinselected.sqf","KEEP","",false,false,0,0,0],
// ["WBK_survival_weapon_4",0,0,[],[],"Use\init\inventory\Research\Skinselected.sqf","KEEP","",false,false,0,0,0],
// ["WBK_survival_weapon_4_r",0,0,[],[],"Use\init\inventory\Research\Skinselected.sqf","KEEP","",false,false,0,0,0],
// ["WBK_survival_weapon_3",0,0,[],[],"Use\init\inventory\Research\Skinselected.sqf","KEEP","",false,false,0,0,0],
// ["WBK_survival_weapon_3_r",0,0,[],[],"Use\init\inventory\Research\Skinselected.sqf","KEEP","",false,false,0,0,0],

// //Misery refueling / Misery Containers:
// [QCLASS(diesel),0,0,[],[],"Use\init\fuel\refuelveh\RefillVeh_Start.sqf","KEEP","",false,false,0,0,0],
// [QCLASS(petrol),0,0,[],[],"Use\init\fuel\refuelveh\RefillVeh_Start.sqf","KEEP","",false,false,0,0,0],
// [QCLASS(jetFuel),0,0,[],[],"Use\init\fuel\refuelveh\RefillVeh_Start.sqf","KEEP","",false,false,0,0,0],

// //Misery refueling / Syphoning:
// [QCLASS(dieselJerryCan_Empty),0,0,[],[],"Use\init\fuel\refuelveh\SyphonVehDiesel.sqf","KEEP","",false,false,0,0,0],
// [QCLASS(petrolJerryCan_Empty),0,0,[],[],"Use\init\fuel\refuelveh\SyphonVehPetrol.sqf","KEEP","",false,false,0,0,0],
// [QCLASS(jetFuelJerryCan_Empty),0,0,[],[],"Use\init\fuel\refuelveh\SyphonVehJet.sqf","KEEP","",false,false,0,0,0],

// //Rvg Food:
// ["rvg_beans",10,0,[],[],"","rvg_beansEmpty","eating_0",true,true,15,random 150,0],
// ["rvg_bacon",10,0,[],[],"","rvg_baconEmpty","eating_6",true,true,15,random 150,0],
// ["rvg_milk",5,-2,[],[],"","","eating_0",true,false,15,random 150,0],
// ["rvg_rice",25,0,[],[],"","","eating_7",true,false,15,random 150,0],
// ["rvg_rustyCan",10,0,[],[],"","rvg_rustyCanEmpty","eating_8",true,true,15,random 250,0],
// ["rvg_Rabbit_Meat",15,0,[],[],"Use\init\inventory\Food\rawmeat.sqf","","eating_6",true,false,15,random 250,0],
// ["rvg_Rabbit_Meat_Cooked",15,0,[],[],"","","eating_7",true,false,15,random 250,0],
// ["rvg_Chicken_Meat",15,0,[],[],"Use\init\inventory\Food\rawmeat.sqf","","eating_8",true,false,15,random 250,0],
// ["rvg_Chicken_Meat_Cooked",15,0,[],[],"","","eating_0",true,false,15,random 250,0],
// ["rvg_Sheep_Meat",25,0,[],[],"Use\init\inventory\Food\rawmeat.sqf","","eating_6",true,false,15,random 250,0],
// ["rvg_Sheep_Meat_Cooked",25,0,[],[],"","","eating_7",true,false,15,random 250,0],
// ["rvg_Boar_Meat",30,0,[],[],"Use\init\inventory\Food\rawmeat.sqf","","eating_8",true,false,15,random 250,0],
// ["rvg_Boar_Meat_Cooked",30,0,[],[],"","","eating_0",true,false,15,random 250,0],
// ["rvg_Buffalo_Meat",35,0,[],[],"Use\init\inventory\Food\rawmeat.sqf","","eating_6",true,false,15,random 250,0],
// ["rvg_Buffalo_Meat_Cooked",35,0,[],[],"","","eating_6",true,false,15,random 250,0],

// //Misery food:
// [QCLASS(rawFish),25,0,[],[],"Use\init\inventory\Food\rawmeat.sqf","","eating_8",true,false,15,random 250,0],
// [QCLASS(cookedfish",25,0,[],[],"","","eating_6",true,false,15,random 250,0],

// //Rvg Drinks:
// ["rvg_spirit",0,5,[],[],"","rvg_spiritEmpty","drink_soda_use",true,false,15,random 150,0],
// ["rvg_franta",0,5,[],[],"","rvg_frantaEmpty","drink_soda_use",true,false,15,random 150,0],
// ["rvg_plasticBottle",0,15,[],[],"Use\init\inventory\Drink\dirtywater.sqf","rvg_plasticBottleEmpty","drink_flask4",true,false,15,random 150,0],
// ["rvg_plasticBottlePurified",0,15,[],[],"","rvg_plasticBottleEmpty","drink_flask4",true,false,15,random 50,0],
// ["rvg_canteen",0,20,[],[],"Use\init\inventory\Drink\dirtywater.sqf","rvg_canteenEmpty","drink_flask4",true,false,15,random 150,0],
// ["rvg_canteenPurified",0,20,[],[],"","rvg_canteenEmpty","drink_flask4",true,false,15,random 50,0],

// //Misery drinks: (energy)
// [QCLASS(Bearenergy",0,10,[],[],"Use\init\inventory\Stims\BearEnergy.sqf","","drink_soda_use",true,false,15,random 150,0],
// [QCLASS(vodkafull",-5,15,[],[],"Use\init\inventory\Food\Drink_vodka.sqf",QCLASS(vodka34","drink_flask",true,false,15,0,0],
// [QCLASS(vodka34",-5,15,[],[],"Use\init\inventory\Food\Drink_vodka.sqf",QCLASS(vodka12","drink_flask",true,false,15,0,0],
// [QCLASS(vodka12",-5,15,[],[],"Use\init\inventory\Food\Drink_vodka.sqf",QCLASS(vodka14","drink_flask",true,false,15,0,0],
// [QCLASS(vodka14",-5,15,[],[],"Use\init\inventory\Food\Drink_vodka.sqf","","drink_flask",true,false,15,0,0],
// [QCLASS(wolfbeer",0,15,[],[],"Use\init\inventory\Food\Beer.sqf","","drink_flask4",true,false,15,random 150,0],
// [QCLASS(coffeebrewed",0,10,[],[],"Use\init\inventory\Stims\Coffee.sqf",QCLASS(coffeemug","drink_0",true,false,15,random 150,0],

// //Rvg Empty drink containers:
// ["rvg_plasticBottleEmpty",0,0,[],[],"","KEEP","",false,false,0,0,0],
// ["rvg_canteenEmpty",0,0,[],[],"","KEEP","",false,false,0,0,0],
// ["rvg_rustyCanEmpty",0,0,[],[],"Use\init\inventory\Rvgcontainers\Drinksource.sqf","KEEP","",true,false,0,0,0],
// ["rvg_beansEmpty",0,0,[],[],"Use\init\inventory\Rvgcontainers\Drinksource.sqf","KEEP","",true,false,0,0,0],
// ["rvg_baconEmpty",0,0,[],[],"Use\init\inventory\Rvgcontainers\Drinksource.sqf","KEEP","",true,false,0,0,0],
// ["rvg_spiritEmpty",0,0,[],[],"Use\init\inventory\Rvgcontainers\Drinksource.sqf","KEEP","",true,false,0,0,0],
// ["rvg_frantaEmpty",0,0,[],[],"Use\init\inventory\Rvgcontainers\Drinksource.sqf","KEEP","",true,false,0,0,0],

// //Rvg Fire crafting gear:
// ["rvg_money",0,0,[],[],"","","",false,false,0,0,0],
// ["rvg_notepad",0,0,[],[],"","","",false,false,0,0,0],
// ["rvg_docFolder",0,0,[],[],"","","",false,false,0,0,0],

// //ACE MRE's: (ACE must be loaded obviously)
// ["ACE_Humanitarian_Ration",45,0,[],[],"","","eating_0",true,false,15,random 50,0],
// ["ACE_MRE_BeefStew",45,0,[],[],"","","eating_6",true,false,15,random 50,0],
// ["ACE_MRE_ChickenTikkaMasala",45,0,[],[],"","","eating_7",true,false,15,random 50,0],
// ["ACE_MRE_ChickenHerbDumplings",45,0,[],[],"","","eating_8",true,false,15,random 50,0],
// ["ACE_MRE_CreamChickenSoup",45,0,[],[],"","","eating_0",true,false,15,random 50,0],
// ["ACE_MRE_CreamTomatoSoup",45,0,[],[],"","","eating_6",true,false,15,random 50,0],
// ["ACE_MRE_LambCurry",45,0,[],[],"","","eating_7",true,false,15,random 50,0],
// ["ACE_MRE_MeatballsPasta",45,0,[],[],"","","eating_8",true,false,15,random 50,0],
// ["ACE_MRE_SteakVegetables",45,0,[],[],"","","eating_0",true,false,15,random 50,0],

// //Misery misc:
// [QCLASS(cigarettePack),0,0,[],[],"Use\init\inventory\Cigarettes\Use_cigarettes.sqf","KEEP","",true,false,0,0,0],
// [QCLASS(cigar),0,0,[],[],"Use\init\inventory\Cigarettes\Use_cigar.sqf","KEEP","",true,false,0,0,0],
// [QCLASS(boxNails),0,0,[],[],"Use\init\inventory\Misc\nailbox.sqf","KEEP","",false,false,0,0,0],
// [QCLASS(sawFuel),0,0,[],[],"Use\init\inventory\Misc\Use_chainsawfuel.sqf","KEEP","",false,false,0,0,0],

// //Gasmask:
// [QCLASS(gasCartridge),0,0,[],[],"Use\init\inventory\Gasmask\Use_cartridges.sqf","KEEP","",false,false,0,0,0],
// [QCLASS(gasMask_Empty),0,0,[],[],"Use\init\inventory\Gasmask\Use_emptygasmask.sqf","KEEP","",false,false,0,0,0],

// //Misery batteries:
// [QCLASS(headlamp_NoBattery),0,0,[],[],"Use\init\inventory\Headlamp\headlampbatt.sqf","KEEP","",false,false,0,0,0],
// [QCLASS(geiger_NoBattery),0,0,[],[],"Use\init\inventory\Geiger\personalgeigerbatteries.sqf","KEEP","",false,false,0,0,0],
// [QCLASS(ERU_NB",0,0,[],[],"Use\init\inventory\PDA\Use_PDANB.sqf","KEEP","",false,false,0,0,0],
// [QCLASS(electricHandSaw_NoBattery),0,0,[],[],"Use\init\inventory\Misc\electricsawbatteries.sqf","KEEP","",false,false,0,0,0],
// [QCLASS(rfHighRange_NoBattery),0,0,[],[],"Use\init\inventory\RFdetector\RF_NB.sqf","KEEP","",false,false,0,0,0],
// [QCLASS(PortableradioNobattery",0,0,[],[],"Use\init\inventory\PortableRadio\PR_NB.sqf","KEEP","",false,false,0,0,0],

// //Fire crafting:
// ["rvg_matches",0,0,[],[],"Use\init\inventory\Firecraft\lightfire.sqf","KEEP","",false,false,0,0,0],
// [QCLASS(lighter),0,0,[],[],"Use\init\inventory\Firecraft\lightfire.sqf","KEEP","",false,false,0,0,0],

// //Misery temp items:
// [QCLASS(heatpack),0,0,[],[],"Use\init\inventory\Playertemp\Useheatpack.sqf","KEEP","",false,false,0,0,0],
// [QCLASS(coldpack),0,0,[],[],"Use\init\inventory\Playertemp\Usecoldpack.sqf","KEEP","",false,false,0,0,0],

// //Misery Medical:
// [QCLASS(thrombomodulin),0,0,[],[],"Use\init\inventory\Meds\Use_thbdinjection.sqf","KEEP","",false,false,0,0,0],
// [QCLASS(thrombomodulin_Stimpack),0,0,[],[],"Use\init\inventory\Meds\Use_thbdinjectionstim.sqf","KEEP","",false,false,0,0,0],
// [QCLASS(clozapineBox),0,0,[],[],"Use\init\inventory\Meds\Use_clozapineinjection.sqf","KEEP","",false,false,0,0,0],
// [QCLASS(Clozapinebox",0,0,[],[],"Use\init\inventory\Meds\Use_clozapinebox.sqf","KEEP","",false,false,0,0,0],
// [QCLASS(Cenestinbottle",0,0,[],[],"Use\init\inventory\Meds\Use_cenestinbottle.sqf","KEEP","",false,false,0,0,0],
// [QCLASS(antibiotic",0,0,[],[],"Use\init\inventory\Meds\UseAntibioticpack.sqf","KEEP","",false,false,0,0,0],
// [QCLASS(antiparasitic",0,0,[],[],"Use\init\inventory\Meds\UseAntiparasiticpack.sqf","KEEP","",false,false,0,0,0],
// [QCLASS(caffetin",0,0,[],[],"Use\init\inventory\Meds\Use_caffetinpack.sqf","KEEP","",false,false,0,0,0],
// [QCLASS(charcoalTablets),0,0,[],[],"Use\init\inventory\Meds\Use_charcoaltabs.sqf","KEEP","",false,false,0,0,0],
// [QCLASS(caffeine),0,0,[],[],"Use\init\inventory\Meds\Use_caffienetabs.sqf","KEEP","",false,false,0,0,0],
// [QCLASS(painkillers),0,0,[],[],"Use\init\inventory\Meds\Usepainpill.sqf","KEEP","",false,false,0,0,0],
// [QCLASS(cocaine),0,0,[],[],"Use\init\inventory\Meds\Use_cocaine.sqf","KEEP","",false,false,0,0,0],
// [QCLASS(randomMedication),0,0,["POISON"],[],"Use\init\inventory\Meds\Use_randompharm.sqf","KEEP","",false,false,0,0,0],
// [QCLASS(glucose),0,0,[],[],"Use\init\inventory\Meds\Use_glucoseinjection.sqf","KEEP","",false,false,0,0,0],
// [QCLASS(electrolyte),0,0,[],[],"Use\init\inventory\Meds\Use_electrolyteinjection.sqf","KEEP","",false,false,0,0,0],
// [QCLASS(sleeppack",0,0,[],[],"Use\init\inventory\Meds\UseSleeppack.sqf","KEEP","",false,false,0,0,0]

];

GVAR(itemEffects) = [] + _items;

{
    GVAR(items) pushBackUnique(toUpper(_x select 0));
} forEach _items;

GVAR(items)


