#define COMPONENT assets
#define COMPONENT_BEAUTIFIED Assets
#include "\z\misery\addons\main\script_mod.hpp"

#define MACRO_WEAPONS \
QCLASS(ItemCore), \
QCLASS(pickaxe_Broken), \
QCLASS(pickaxeHead), \
QCLASS(fishingPole), \
QCLASS(fishingSpool), \
QCLASS(geiger_NoBattery), \
QCLASS(lantern_NoBattery), \
QCLASS(clozapine), \
QCLASS(cocaine), \
QCLASS(thrombomodulin), \
QCLASS(thrombomodulin_Stimpack), \
QCLASS(antidote), \
QCLASS(randomMedication), \
QCLASS(fishhook), \
QCLASS(worms), \
QCLASS(lithiumBattery), \
QCLASS(energyDrink), \
QCLASS(soda_1), \
QCLASS(soda_2), \
QCLASS(canOpener), \
QCLASS(canteen_Empty), \
QCLASS(waterBottle_Empty), \
QCLASS(cereal), \
QCLASS(orange), \
QCLASS(powderedMilk), \
QCLASS(cannedBacon), \
QCLASS(bakedBeans), \
QCLASS(leadContainer_Open), \
QCLASS(leadContainer_Closed), \
QCLASS(artifact_01), \
QCLASS(artifact_02), \
QCLASS(artifact_03), \
QCLASS(artifact_04), \
QCLASS(artifact_05), \
QCLASS(artifact_06), \
QCLASS(artifact_07), \
QCLASS(artifact_08), \
QCLASS(artifact_09), \
QCLASS(artifact_10), \
QCLASS(heatpack), \
QCLASS(coldpack), \
QCLASS(waterJerryCan_Empty), \
QCLASS(tinContainer), \
QCLASS(cookedFish), \
QCLASS(rawFish), \
QCLASS(cookedMeat), \
QCLASS(rawMeat), \
QCLASS(coffeeMug), \
QCLASS(coffeeBrewed), \
QCLASS(gasMask_Empty), \
QCLASS(gasCartridge), \
QCLASS(18vBattery), \
QCLASS(ductTape), \
QCLASS(phillipsScrewdriver), \
QCLASS(flatheadScrewdriver), \
QCLASS(pliers), \
QCLASS(camoNet), \
QCLASS(9vBattery), \
QCLASS(copperWire), \
QCLASS(rope), \
QCLASS(needleThread), \
QCLASS(circuitBoard), \
QCLASS(geiger_dead), \
QCLASS(dragonVase), \
QCLASS(matryoshka), \
QCLASS(oldWatch), \
QCLASS(phone), \
QCLASS(photos), \
QCLASS(toySoldier), \
QCLASS(vintageShipBottle), \
QCLASS(zombie_Head), \
QCLASS(zombie_Hand), \
QCLASS(zombie_Eye), \
QCLASS(zombie_Foot), \
QCLASS(zombie_Brain), \
QCLASS(zombie_Skin), \
QCLASS(boneSaw), \
QCLASS(guttingKnife), \
QCLASS(woodaxe), \
QCLASS(sledgehammer), \
QCLASS(tinder), \
QCLASS(cbrn_parts), \
QCLASS(chainsaw_Empty), \
QCLASS(woodplank), \
QCLASS(woodnail), \
QCLASS(woodensticks), \
QCLASS(firewood), \
QCLASS(woodenlog), \
QCLASS(boxNails), \
QCLASS(craftingHammer), \
QCLASS(anvilHammer), \
QCLASS(electricHandSaw_NoBattery), \
QCLASS(wrench), \
QCLASS(glucose), \
QCLASS(electrolyte), \
QCLASS(eru_NoBattery), \
QCLASS(jetFuelEmpty), \
QCLASS(dieselEmpty), \
QCLASS(petrolEmpty), \
QCLASS(oilEmpty), \
QCLASS(coolantEmpty), \
QCLASS(spareTire), \
QCLASS(emptyToolKit), \
QCLASS(lockKit), \
QCLASS(stoneChunk), \
QCLASS(ironIngot), \
QCLASS(ironOre), \
QCLASS(ironPiece), \
QCLASS(goldIngot), \
QCLASS(goldOre), \
QCLASS(goldPiece), \
QCLASS(coalOre), \
QCLASS(malachite), \
QCLASS(ruby), \
QCLASS(sapphire), \
QCLASS(amethyst), \
QCLASS(diamond), \
QCLASS(emerald)

#define MACRO_VEHICLES \
QCLASS(forge), \
QCLASS(anvil)

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_ASSETS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_ASSETS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_ASSETS
#endif

#include "\z\misery\addons\main\script_macros.hpp"

#define MACRO_ITEM_COMMON \
        author = "TenuredCLOUD"; \
        scope = 2; \
        scopeCurator = 2; \
        vehicleClass = QCLASS(Objects); \
        mapSize = 0.25

#define MACRO_HOUSE_COMMON \
        scope = 2; \
        scopeCurator = 2; \
        numberOfDoors = 0; \
        placement = "vertical"; \
        destrType = "DestructNo"; \
        cost = 0; \
        vehicleClass = QCLASS(Objects)

#define MACRO_THING_COMMON \
    scope = 2; \
    scopeCurator = 2; \
    destrType = "DestructNo"; \
    cost = 0; \
    vehicleClass = QCLASS(Objects)

#define MACRO_ADDITEM(ITEM,COUNT) \
    class TransportItems { \
        class _xx_##ITEM { \
            name = #ITEM; \
            count = COUNT; \
        }; \
    }
