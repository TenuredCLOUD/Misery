#define COMPONENT assets
#define COMPONENT_BEAUTIFIED Assets
#include "\z\misery\addons\main\script_mod.hpp"

#define MACRO_WEAPONS \
    QCLASS(18vBattery), \
    QCLASS(9vBattery), \
    QCLASS(amethyst), \
    QCLASS(antidote), \
    QCLASS(anvilHammer), \
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
    QCLASS(bakedBeans), \
    QCLASS(boneSaw), \
    QCLASS(camoNet), \
    QCLASS(cannedBacon), \
    QCLASS(canOpener), \
    QCLASS(canteen_Empty), \
    QCLASS(cbrn_parts), \
    QCLASS(cereal), \
    QCLASS(chainsaw_Empty), \
    QCLASS(circuitBoard), \
    QCLASS(clozapine), \
    QCLASS(coalOre), \
    QCLASS(cocaine), \
    QCLASS(coffeeBrewed), \
    QCLASS(coffeeMug), \
    QCLASS(coldpack), \
    QCLASS(cookedFish), \
    QCLASS(cookedMeat), \
    QCLASS(coolantEmpty), \
    QCLASS(copperWire), \
    QCLASS(craftingHammer), \
    QCLASS(diamond), \
    QCLASS(dieselEmpty), \
    QCLASS(dragonVase), \
    QCLASS(ductTape), \
    QCLASS(electricHandSaw_NoBattery), \
    QCLASS(electrolyte), \
    QCLASS(emerald), \
    QCLASS(emptyToolKit), \
    QCLASS(energyDrink), \
    QCLASS(eru_NoBattery), \
    QCLASS(firewood), \
    QCLASS(fishhook), \
    QCLASS(fishingPole), \
    QCLASS(fishingSpool), \
    QCLASS(flatheadScrewdriver), \
    QCLASS(gasCartridge), \
    QCLASS(gasMask_Empty), \
    QCLASS(geiger_dead), \
    QCLASS(geiger_NoBattery), \
    QCLASS(glucose), \
    QCLASS(goldIngot), \
    QCLASS(goldOre), \
    QCLASS(goldPiece), \
    QCLASS(guttingKnife), \
    QCLASS(heatpack), \
    QCLASS(ironIngot), \
    QCLASS(ironOre), \
    QCLASS(ironPiece), \
    QCLASS(ItemCore), \
    QCLASS(jetFuelEmpty), \
    QCLASS(lantern_NoBattery), \
    QCLASS(leadContainer_Closed), \
    QCLASS(leadContainer_Open), \
    QCLASS(lithiumBattery), \
    QCLASS(lockKit), \
    QCLASS(malachite), \
    QCLASS(matryoshka), \
    QCLASS(needleThread), \
    QCLASS(oilEmpty), \
    QCLASS(oldWatch), \
    QCLASS(orange), \
    QCLASS(petrolEmpty), \
    QCLASS(phillipsScrewdriver), \
    QCLASS(phone), \
    QCLASS(photos), \
    QCLASS(pickaxe_Broken), \
    QCLASS(pickaxeHead), \
    QCLASS(pliers), \
    QCLASS(powderedMilk), \
    QCLASS(randomMedication), \
    QCLASS(rawFish), \
    QCLASS(rawMeat), \
    QCLASS(rope), \
    QCLASS(ruby), \
    QCLASS(sapphire), \
    QCLASS(sledgehammer), \
    QCLASS(soda_1), \
    QCLASS(soda_2), \
    QCLASS(spareTire), \
    QCLASS(stoneChunk), \
    QCLASS(thrombomodulin), \
    QCLASS(thrombomodulin_Stimpack), \
    QCLASS(tinContainer), \
    QCLASS(tinder), \
    QCLASS(toySoldier), \
    QCLASS(vintageShipBottle), \
    QCLASS(waterBottle_Empty), \
    QCLASS(waterJerryCan_Empty), \
    QCLASS(woodaxe), \
    QCLASS(woodenlog), \
    QCLASS(woodensticks), \
    QCLASS(woodplank), \
    QCLASS(worms), \
    QCLASS(wrench), \
    QCLASS(zombie_Brain), \
    QCLASS(zombie_Eye), \
    QCLASS(zombie_Foot), \
    QCLASS(zombie_Hand), \
    QCLASS(zombie_Head), \
    QCLASS(zombie_Skin)

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
