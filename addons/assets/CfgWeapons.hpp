class CfgWeapons {
    class CBA_MiscItem;
    class CBA_MiscItem_ItemInfo;
    class CLASS(ItemCore): CBA_MiscItem {};

    class CLASS(pickaxe_Broken): CLASS(ItemCore) {
        displayName = CSTRING(PickaxeBroken_DisplayName);
        descriptionShort = CSTRING(PickaxeBroken_Description);
        picture = QPATHTOF(data\icons\brokenpickaxe.paa);
        model = QPATHTOF(data\models\pickaxe.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 85;
        };
    };

    class CLASS(pickaxeHead): CLASS(ItemCore) {
        displayName = CSTRING(PickaxeHead_DisplayName);
        descriptionShort = CSTRING(PickaxeHead_Description);
        picture = QPATHTOF(data\icons\pickHead.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 45;
        };
    };

    class CLASS(fishingPole): CLASS(ItemCore) {
        displayName = CSTRING(FishingPole_DisplayName);
        descriptionShort = CSTRING(FishingPole_Description);
        picture = QPATHTOF(data\icons\fishingpole2.paa);
        model = QPATHTOF(data\models\fishingrod.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 30;
        };
    };

    class CLASS(fishingSpool): CLASS(ItemCore) {
        displayName = CSTRING(FishingSpool_DisplayName);
        descriptionShort = CSTRING(FishingSpool_Description);
        picture = QPATHTOF(data\icons\fishingspool.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
    };

    class CLASS(geiger_NoBattery): CLASS(ItemCore) {
        displayName = CSTRING(GeigerNoBattery_DisplayName);
        descriptionShort = CSTRING(RequiresLithiumBattery_Description);
        picture = QPATHTOF(data\icons\personalgeigernobattery.paa);
        model = "\A3\Weapons_F\Items\MineDetector.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };

    class CLASS(lantern_NoBattery): CLASS(ItemCore) {
        displayName = CSTRING(LanternNoBattery_DisplayName);
        descriptionShort = CSTRING(RequiresLithiumBattery_Description);
        picture = QPATHTOF(data\icons\lantern.paa);
        model = "a3\structures_f\civ\camping\camping_light_off_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };

    class CLASS(clozapine): CLASS(ItemCore) {
        displayName = CSTRING(Clozapine_DisplayName);
        descriptionShort = CSTRING(Clozapine_Description);
        picture = QPATHTOF(data\icons\Clozapineinjection.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
    };

    class CLASS(cocaine): CLASS(ItemCore) {
        displayName = CSTRING(Cocaine_DisplayName);
        descriptionShort = CSTRING(Cocaine_Description);
        picture = QPATHTOF(data\icons\cocaine.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0.5;
        };
    };

    class CLASS(thrombomodulin): CLASS(ItemCore) {
        displayName = CSTRING(thbd_DisplayName);
        descriptionShort = CSTRING(thbd_Description);
        picture = QPATHTOF(data\icons\Thbd.paa);
        model = "a3\props_f_orange\humanitarian\garbage\medicalgarbage_01_injector_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
    };

    class CLASS(thrombomodulin_Stimpack): CLASS(ItemCore) {
        displayName = CSTRING(thbdStimpack_DisplayName);
        descriptionShort = CSTRING(thbdStimpack_Description);
        picture = QPATHTOF(data\icons\Thbdstim.paa);
        model = "a3\props_f_orange\humanitarian\garbage\medicalgarbage_01_injector_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 8;
        };
    };

    class CLASS(antidote): CLASS(ItemCore) {
        displayName = CSTRING(Antidote_DisplayName);
        descriptionShort = CSTRING(Antidote_Description);
        picture = QPATHTOF(data\icons\antidote.paa);
        model = "a3\props_f_enoch\military\decontamination\antidotekit_01_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
    };

    class CLASS(randomMedication): CLASS(ItemCore) {
        displayName = CSTRING(RandomMedication_DisplayName);
        descriptionShort = CSTRING(RandomMedication_Description);
        picture = QPATHTOF(data\icons\medication.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
    };

    class CLASS(fishhook): CLASS(ItemCore) {
        displayName = CSTRING(FishHook_DisplayName);
        descriptionShort = CSTRING(FishHook_Description);
        picture = QPATHTOF(data\icons\fishhook.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 2;
        };
    };

    class CLASS(worms): CLASS(ItemCore) {
        displayName = CSTRING(Worms_DisplayName);
        descriptionShort = CSTRING(Worms_Description);
        picture = QPATHTOF(data\icons\worms.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0.5;
        };
    };

    class CLASS(lithiumBattery): CLASS(ItemCore) {
        displayName = CSTRING(LithiumBattery_DisplayName);
        descriptionShort = CSTRING(LithiumBattery_Description);
        picture = QPATHTOF(data\icons\NitecoreBATT.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 2;
        };
    };

    class CLASS(energyDrink): CLASS(ItemCore) {
        displayName = CSTRING(EnergyDrink_DisplayName);
        descriptionShort = CSTRING(EnergyDrink_Description);
        picture = QPATHTOF(data\icons\energyDrink.paa);
        model = "a3\structures_f\items\food\can_v3_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 4;
        };
    };

    class CLASS(soda_1): CLASS(ItemCore) {
        displayName = CSTRING(Soda_DisplayName);
        descriptionShort = CSTRING(Soda_Description);
        picture = QPATHTOF(data\icons\soda_1.paa);
        model = "a3\structures_f\items\food\can_v2_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 4;
        };
    };

    class CLASS(soda_2): CLASS(ItemCore) {
        displayName = CSTRING(Soda_DisplayName);
        descriptionShort = CSTRING(Soda_Description);
        picture = QPATHTOF(data\icons\soda_2.paa);
        model = "a3\structures_f\items\food\can_v1_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 4;
        };
    };

    class CLASS(canOpener): CLASS(ItemCore) {
        displayName = CSTRING(CanOpener_DisplayName);
        descriptionShort = CSTRING(CanOpener_Description);
        picture = QPATHTOF(data\icons\canOpener.paa);
        model = "a3\structures_f_epa\items\tools\canopener_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };

    class CLASS(canteen_Empty): CLASS(ItemCore) {
        scope = 2;
        author = "TenuredCLOUD";
        displayName = CSTRING(CanteenEmpty_DisplayName);
        descriptionShort = CSTRING(CanteenEmpty_Description);
        picture = QPATHTOF(data\icons\canteen.paa);
        model = "a3\structures_f_epa\items\food\canteen_f.p3d";

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 30;
        };
    };

    class CLASS(waterBottle_Empty): CLASS(ItemCore) {
        scope = 2;
        author = "TenuredCLOUD";
        displayName = CSTRING(WaterBottleEmpty_DisplayName);
        descriptionShort = CSTRING(WaterBottleEmpty_Description);
        picture = QPATHTOF(data\icons\waterbottle.paa);
        model = "a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d";

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 15;
        };
    };

    class CLASS(cereal): CLASS(ItemCore) {
        displayName = CSTRING(Cereal_DisplayName);
        descriptionShort = CSTRING(Cereal_Description);
        picture = QPATHTOF(data\icons\cereal.paa);
        model = "a3\structures_f_epa\items\food\cerealsbox_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 4;
        };
    };

    class CLASS(orange): CLASS(ItemCore) {
        displayName = CSTRING(Orange_DisplayName);
        descriptionShort = CSTRING(Orange_Description);
        picture = QPATHTOF(data\icons\orange.paa);
        model = "a3\props_f_orange\humanitarian\supplies\orange_01_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 2;
        };
    };

    class CLASS(powderedMilk): CLASS(ItemCore) {
        displayName = CSTRING(PowderedMilk_DisplayName);
        descriptionShort = CSTRING(PowderedMilk_Description);
        picture = QPATHTOF(data\icons\drymilk.paa);
        model = "a3\structures_f_epa\items\food\powderedmilk_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 4;
        };
    };

    class CLASS(cannedBacon): CLASS(ItemCore) {
        displayName = CSTRING(CannedBacon_DisplayName);
        descriptionShort = CSTRING(CannedBacon_Description);
        picture = QPATHTOF(data\icons\CannedBacon.paa);
        model = "a3\structures_f\items\food\tacticalbacon_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };

    class CLASS(bakedBeans): CLASS(ItemCore) {
        displayName = CSTRING(BakedBeans_DisplayName);
        descriptionShort = CSTRING(BakedBeans_Description);
        picture = QPATHTOF(data\icons\CannedBeans.paa);
        model = "a3\structures_f_epa\items\food\bakedbeans_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };

    class CLASS(leadContainer_Open): CLASS(ItemCore) {
        displayName = CSTRING(LeadContainerOpen_DisplayName);
        descriptionShort = CSTRING(LeadContainerOpen_Description);
        picture = QPATHTOF(data\icons\cbrn_container.paa);
        model = "a3\props_f_enoch\military\decontamination\cbrncase_01_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 50;
        };
    };

    class CLASS(leadContainer_Closed): CLASS(ItemCore) {
        displayName = CSTRING(LeadContainerClosed_DisplayName);
        descriptionShort = CSTRING(LeadContainerClosed_Description);
        picture = QPATHTOF(data\icons\cbrn_container.paa);
        model = "a3\props_f_enoch\military\decontamination\cbrncase_01_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 50;
        };
    };

    class CLASS(artifact_01): CLASS(ItemCore) {
        displayName = CSTRING(Artifact_DisplayName);
        descriptionShort = CSTRING(Artifact_Description);
        picture = QPATHTOF(data\icons\Artifact01.paa);
        model = QPATHTOF(data\models\artifact.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
    };

    class CLASS(artifact_02): CLASS(ItemCore) {
        displayName = CSTRING(Artifact_DisplayName);
        descriptionShort = CSTRING(Artifact_Description);
        picture = QPATHTOF(data\icons\Artifact02.paa);
        model = QPATHTOF(data\models\artifact.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
    };

    class CLASS(artifact_03): CLASS(ItemCore) {
        displayName = CSTRING(Artifact_DisplayName);
        descriptionShort = CSTRING(Artifact_Description);
        picture = QPATHTOF(data\icons\Artifact03.paa);
        model = QPATHTOF(data\models\artifact.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
    };

    class CLASS(artifact_04): CLASS(ItemCore) {
        displayName = CSTRING(Artifact_DisplayName);
        descriptionShort = CSTRING(Artifact_Description);
        picture = QPATHTOF(data\icons\Artifact04.paa);
        model = QPATHTOF(data\models\artifact.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
    };

    class CLASS(artifact_05): CLASS(ItemCore) {
        displayName = CSTRING(Artifact_DisplayName);
        descriptionShort = CSTRING(Artifact_Description);
        picture = QPATHTOF(data\icons\Artifact05.paa);
        model = QPATHTOF(data\models\artifact.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
    };

    class CLASS(artifact_06): CLASS(ItemCore) {
        displayName = CSTRING(Artifact_DisplayName);
        descriptionShort = CSTRING(Artifact_Description);
        picture = QPATHTOF(data\icons\Artifact06.paa);
        model = QPATHTOF(data\models\artifact.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
    };

    class CLASS(artifact_07): CLASS(ItemCore) {
        displayName = CSTRING(Artifact_DisplayName);
        descriptionShort = CSTRING(Artifact_Description);
        picture = QPATHTOF(data\icons\Artifact07.paa);
        model = QPATHTOF(data\models\artifact.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
    };

    class CLASS(artifact_08): CLASS(ItemCore) {
        displayName = CSTRING(Artifact_DisplayName);
        descriptionShort = CSTRING(Artifact_Description);
        picture = QPATHTOF(data\icons\Artifact08.paa);
        model = QPATHTOF(data\models\artifact.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
    };

    class CLASS(artifact_09): CLASS(ItemCore) {
        displayName = CSTRING(Artifact_DisplayName);
        descriptionShort = CSTRING(Artifact_Description);
        picture = QPATHTOF(data\icons\Artifact09.paa);
        model = QPATHTOF(data\models\artifact.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
    };

    class CLASS(artifact_10): CLASS(ItemCore) {
        displayName = CSTRING(Artifact_DisplayName);
        descriptionShort = CSTRING(Artifact_Description);
        picture = QPATHTOF(data\icons\Artifact10.paa);
        model = QPATHTOF(data\models\artifact.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
    };

    class CLASS(heatpack): CLASS(ItemCore) {
        displayName = CSTRING(HeatPack_DisplayName);
        descriptionShort = CSTRING(HeatPack_Description);
        picture = QPATHTOF(data\icons\hotpack.paa);
        model = "a3\structures_f_epa\items\medical\heatpack_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 8;
        };
    };

    class CLASS(coldpack): CLASS(ItemCore) {
        displayName = CSTRING(ColdPack_DisplayName);
        descriptionShort = CSTRING(ColdPack_Description);
        picture = QPATHTOF(data\icons\coldpack.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 8;
        };
    };

    class CLASS(waterJerryCan_Empty): CLASS(ItemCore) {
        displayName = CSTRING(JerryCanWaterEmpty_DisplayName);
        descriptionShort = CSTRING(JerryCanWaterEmpty_Description);
        picture = QPATHTOF(data\icons\CanisterWater.paa);
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 50;
        };
    };

    class CLASS(tinContainer): CLASS(ItemCore) {
        displayName = CSTRING(TinContainer_DisplayName);
        descriptionShort = CSTRING(TinContainer_Description);
        picture = QPATHTOF(data\icons\tinContainer.paa);
        model = "a3\structures_f_epa\items\vessels\tincontainer_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 50;
        };
    };

    class CLASS(cookedFish): CLASS(ItemCore) {
        displayName = CSTRING(CookedFish_DisplayName);
        descriptionShort = CSTRING(CookedFish_Description);
        picture = QPATHTOF(data\icons\cookedfish.paa);
        model = QPATHTOF(data\models\fishcooked.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
    };

    class CLASS(rawFish): CLASS(ItemCore) {
        displayName = CSTRING(RawFish_DisplayName);
        descriptionShort = CSTRING(RawFish_Description);
        picture = QPATHTOF(data\icons\rawfish.paa);
        model = QPATHTOF(data\models\fish.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
    };

    class CLASS(cookedMeat): CLASS(ItemCore) {
        displayName = CSTRING(CookedMeat_DisplayName);
        descriptionShort = CSTRING(CookedMeat_Description);
        picture = QPATHTOF(data\icons\cookedmeat.paa);
        model = QPATHTOF(data\models\cookedmeat.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
    };

    class CLASS(rawMeat): CLASS(ItemCore) {
        displayName = CSTRING(RawMeat_DisplayName);
        descriptionShort = CSTRING(RawMeat_Description);
        picture = QPATHTOF(data\icons\rawmeat.paa);
        model = QPATHTOF(data\models\rawmeat.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
    };

    class CLASS(coffeeMug): CLASS(ItemCore) {
        displayName = CSTRING(CoffeeMug_DisplayName);
        descriptionShort = CSTRING(CoffeeMug_Description);
        picture = QPATHTOF(data\icons\coffeemug.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };

    class CLASS(coffeeBrewed): CLASS(ItemCore) {
        displayName = CSTRING(CoffeeBrewed_DisplayName);
        descriptionShort = CSTRING(CoffeeBrewed_Description);
        picture = QPATHTOF(data\icons\coffeebrewed.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };

    class CLASS(gasMask_Empty): CLASS(ItemCore) {
        displayName = CSTRING(GasMaskEmpty_DisplayName);
        descriptionShort = CSTRING(GasMaskEmpty_Description);
        picture = QPATHTOF(data\icons\gasmask.paa);
        scope = 2;
        scopeCurator = 2;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 25;
        };
    };

    class CLASS(gasCartridge): CLASS(ItemCore) {
        displayName = CSTRING(GasCartridge_DisplayName);
        descriptionShort = CSTRING(GasCartridge_Description);
        picture = QPATHTOF(data\icons\maskcartridges.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 20;
        };
    };

    class CLASS(18vBattery): CLASS(ItemCore) {
        displayName = CSTRING(18VBattery_DisplayName);
        descriptionShort = CSTRING(18VBattery_Description);
        picture = QPATHTOF(data\icons\18vbat.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 20;
        };
    };

    class CLASS(ductTape): CLASS(ItemCore) {
        displayName = CSTRING(DuctTape_DisplayName);
        descriptionShort = CSTRING(DuctTape_Description);
        picture = QPATHTOF(data\icons\ducttape.paa);
        model = "a3\structures_f_epa\items\tools\ducttape_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 18;
        };
    };

    class CLASS(phillipsScrewdriver): CLASS(ItemCore) {
        displayName = CSTRING(Phillips_DisplayName);
        descriptionShort = CSTRING(Phillips_Description);
        picture = QPATHTOF(data\icons\phillips.paa);
        model = "a3\structures_f\items\tools\screwdriver_v2_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 15;
        };
    };

    class CLASS(flatheadScrewdriver): CLASS(ItemCore) {
        displayName = CSTRING(Flathead_DisplayName);
        descriptionShort = CSTRING(Flathead_Description);
        picture = QPATHTOF(data\icons\flathead.paa);
        model = "a3\structures_f\items\tools\screwdriver_v1_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 15;
        };
    };

    class CLASS(pliers): CLASS(ItemCore) {
        displayName = CSTRING(Pliers_DisplayName);
        descriptionShort = CSTRING(Pliers_Description);
        picture = QPATHTOF(data\icons\pliers.paa);
        model = "a3\structures_f\items\tools\pliers_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 25;
        };
    };

    class CLASS(camoNet): CLASS(ItemCore) {
        displayName = CSTRING(CamoNet_DisplayName);
        descriptionShort = CSTRING(CamoNet_Description);
        picture = QPATHTOF(data\icons\camonet.paa);
        model = QPATHTOF(data\models\camonet.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 40;
        };
    };

    class CLASS(9vBattery): CLASS(ItemCore) {
        displayName = CSTRING(9VBattery_DisplayName);
        descriptionShort = CSTRING(9VBattery_Description);
        picture = QPATHTOF(data\icons\9Vbat.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };

    class CLASS(copperWire): CLASS(ItemCore) {
        displayName = CSTRING(CopperWire_DisplayName);
        descriptionShort = CSTRING(CopperWire_Description);
        picture = QPATHTOF(data\icons\copperwire.paa);
        model = "a3\structures_f_epa\items\tools\metalwire_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };

    class CLASS(rope): CLASS(ItemCore) {
        displayName = CSTRING(Rope_DisplayName);
        descriptionShort = CSTRING(Rope_Description);
        picture = QPATHTOF(data\icons\rope.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 15;
        };
    };

    class CLASS(needleThread): CLASS(ItemCore) {
        displayName = CSTRING(NeedleThread_DisplayName);
        descriptionShort = CSTRING(NeedleThread_Description);
        picture = QPATHTOF(data\icons\needlethread.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 8;
        };
    };

    class CLASS(circuitBoard): CLASS(ItemCore) {
        displayName = CSTRING(CircuitBoard_DisplayName);
        descriptionShort = CSTRING(CircuitBoard_Description);
        picture = QPATHTOF(data\icons\CircutBoard.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };

    class CLASS(geiger_dead): CLASS(ItemCore) {
        displayName = CSTRING(GeigerDead_DisplayName);
        descriptionShort = CSTRING(GeigerDead_Description);
        picture = QPATHTOF(data\icons\DeadGeiger.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };

    class CLASS(dragonVase): CLASS(ItemCore) {
        displayName = CSTRING(DragonVase_DisplayName);
        descriptionShort = CSTRING(DragonVase_Description);
        picture = QPATHTOF(data\icons\DragonVase.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 15;
        };
    };

    class CLASS(matryoshka): CLASS(ItemCore) {
        displayName = CSTRING(Matryoshka_DisplayName);
        descriptionShort = CSTRING(Matryoshka_Description);
        picture = QPATHTOF(data\icons\Matryoshka.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 15;
        };
    };

    class CLASS(oldWatch): CLASS(ItemCore) {
        displayName = CSTRING(OldWatch_DisplayName);
        descriptionShort = CSTRING(OldWatch_Description);
        picture = QPATHTOF(data\icons\OldWatch.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };

    class CLASS(phone): CLASS(ItemCore) {
        displayName = CSTRING(Phone_DisplayName);
        descriptionShort = CSTRING(Phone_Description);
        picture = QPATHTOF(data\icons\Phone.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 15;
        };
    };

    class CLASS(photos): CLASS(ItemCore) {
        displayName = CSTRING(Photos_DisplayName);
        descriptionShort = CSTRING(Photos_Description);
        picture = QPATHTOF(data\icons\Photos.paa);
        model = "a3\structures_f\items\documents\filephotos_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
    };

    class CLASS(toySoldier): CLASS(ItemCore) {
        displayName = CSTRING(ToySoldier_DisplayName);
        descriptionShort = CSTRING(ToySoldier_Description);
        picture = QPATHTOF(data\icons\ToySoldier.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
    };

    class CLASS(vintageShipBottle): CLASS(ItemCore) {
        displayName = CSTRING(ShipBottle_DisplayName);
        descriptionShort = CSTRING(ShipBottle_Description);
        picture = QPATHTOF(data\icons\VintageShipBottle.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 15;
        };
    };

    class CLASS(zombie_Head): CLASS(ItemCore) {
        displayName = CSTRING(ZombieHead_DisplayName);
        descriptionShort = CSTRING(ZombieHead_Description);
        picture = QPATHTOF(data\icons\head.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 35;
        };
    };

    class CLASS(zombie_Hand): CLASS(ItemCore) {
        displayName = CSTRING(ZombieHand_DisplayName);
        descriptionShort = CSTRING(ZombieHand_Description);
        picture = QPATHTOF(data\icons\hand.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 15;
        };
    };

    class CLASS(zombie_Eye): CLASS(ItemCore) {
        displayName = CSTRING(ZombieEye_DisplayName);
        descriptionShort = CSTRING(ZombieEye_Description);
        picture = QPATHTOF(data\icons\eye.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };

    class CLASS(zombie_Foot): CLASS(ItemCore) {
        displayName = CSTRING(ZombieFoot_DisplayName);
        descriptionShort = CSTRING(ZombieFoot_Description);
        picture = QPATHTOF(data\icons\foot.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 25;
        };
    };

    class CLASS(zombie_Brain): CLASS(ItemCore) {
        displayName = CSTRING(ZombieBrain_DisplayName);
        descriptionShort = CSTRING(ZombieBrain_Description);
        picture = QPATHTOF(data\icons\brain.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 30;
        };
    };

    class CLASS(zombie_Skin): CLASS(ItemCore) {
        displayName = CSTRING(ZombieSkin_DisplayName);
        descriptionShort = CSTRING(ZombieSkin_Description);
        picture = QPATHTOF(data\icons\skin.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 20;
        };
    };

    class CLASS(boneSaw): CLASS(ItemCore) {
        displayName = CSTRING(BoneSaw_DisplayName);
        descriptionShort = CSTRING(BoneSaw_Description);
        picture = QPATHTOF(data\icons\hacksaw.paa);
        model = "\a3\structures_f\Items\Tools\Saw_F.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 35;
        };
    };

    class CLASS(guttingKnife): CLASS(ItemCore) {
        displayName = CSTRING(GuttingKnife_DisplayName);
        descriptionShort = CSTRING(GuttingKnife_Description);
        picture = QPATHTOF(data\icons\GuttingKnife.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 25;
        };
    };

    class CLASS(woodaxe): CLASS(ItemCore) {
        displayName = CSTRING(WoodAxe_DisplayName);
        descriptionShort = CSTRING(WoodAxe_Description);
        picture = QPATHTOF(data\icons\Woodaxe.paa);
        model = "a3\structures_f\items\tools\axe_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 50;
        };
    };

    class CLASS(sledgehammer): CLASS(ItemCore) {
        displayName = CSTRING(Sledgehammer_DisplayName);
        descriptionShort = CSTRING(Sledgehammer_Description);
        picture = QPATHTOF(data\icons\sledgehammer.paa);
        model = QPATHTOF(data\models\sledgehammer.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 85;
        };
    };

    class CLASS(tinder): CLASS(ItemCore) {
        displayName = CSTRING(Tinder_DisplayName);
        descriptionShort = CSTRING(Tinder_Description);
        picture = QPATHTOF(data\icons\tinder.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
    };

    class CLASS(cbrn_parts): CLASS(ItemCore) {
        displayName = CSTRING(CBRNParts_DisplayName);
        descriptionShort = CSTRING(CBRNParts_Description);
        picture = QPATHTOF(data\icons\CBRN_Parts.paa);
        model = "a3\supplies_f_orange\bags\b_messenger_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 30;
        };
    };

    class CLASS(chainsaw_Empty): CLASS(ItemCore) {
        displayName = CSTRING(ChainsawEmpty_DisplayName);
        descriptionShort = CSTRING(ChainsawEmpty_Description);
        picture = QPATHTOF(data\icons\chainsaw.paa);
        model = QPATHTOF(data\models\chainsaw.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 100;
        };
    };

    class CLASS(woodplank): CLASS(ItemCore) {
        displayName = CSTRING(WoodPlank_DisplayName);
        descriptionShort = CSTRING(WoodPlank_Description);
        picture = QPATHTOF(data\icons\woodplank.paa);
        model = QPATHTOF(data\models\woodplank.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };

    class CLASS(woodensticks): CLASS(ItemCore) {
        displayName = CSTRING(WoodenSticks_DisplayName);
        descriptionShort = CSTRING(WoodenSticks_Description);
        picture = QPATHTOF(data\icons\woodsticks.paa);
        model = QPATHTOF(data\models\woodsticks.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 35;
        };
    };

    class CLASS(firewood): CLASS(ItemCore) {
        displayName = CSTRING(Firewood_DisplayName);
        descriptionShort = CSTRING(Firewood_Description);
        picture = QPATHTOF(data\icons\firewood.paa);
        model = QPATHTOF(data\models\firewoodbundle.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 75;
        };
    };

    class CLASS(woodenlog): CLASS(ItemCore) {
        displayName = CSTRING(WoodenLog_DisplayName);
        descriptionShort = CSTRING(WoodenLog_Description);
        picture = QPATHTOF(data\icons\woodenlog.paa);
        model = QPATHTOF(data\models\bigwoodlog.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 225;
        };
    };

    class CLASS(craftingHammer): CLASS(ItemCore) {
        displayName = CSTRING(CraftingHammer_DisplayName);
        descriptionShort = CSTRING(CraftingHammer_Description);
        picture = QPATHTOF(data\icons\craftinghammer.paa);
        model = QPATHTOF(data\models\craftinghammer.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 15;
        };
    };

    class CLASS(anvilHammer): CLASS(ItemCore) {
        displayName = CSTRING(AnvilHammer_DisplayName);
        descriptionShort = CSTRING(AnvilHammer_Description);
        picture = QPATHTOF(data\icons\anvilhammer.paa);
        model = QPATHTOF(data\models\anvilhammer.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 35;
        };
    };

    class CLASS(electricHandSaw_NoBattery): CLASS(ItemCore) {
        displayName = CSTRING(ElectricHandSawNoBattery_DisplayName);
        descriptionShort = CSTRING(RequiresLithiumBattery_Description);
        picture = QPATHTOF(data\icons\ElectricHandCircularSaw.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 25;
        };
    };

    class CLASS(wrench): CLASS(ItemCore) {
        displayName = CSTRING(Wrench_DisplayName);
        descriptionShort = CSTRING(Wrench_Description);
        picture = QPATHTOF(data\icons\wrench.paa);
        model = "a3\structures_f\items\tools\wrench_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 15;
        };
    };

    class CLASS(glucose): CLASS(ItemCore) {
        displayName = CSTRING(Glucose_DisplayName);
        descriptionShort = CSTRING(Glucose_Description);
        picture = QPATHTOF(data\icons\Glucose.paa);
        model = "a3\props_f_orange\humanitarian\garbage\medicalgarbage_01_injector_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
    };

    class CLASS(electrolyte): CLASS(ItemCore) {
        displayName = CSTRING(Electrolyte_DisplayName);
        descriptionShort = CSTRING(Electrolyte_Description);
        picture = QPATHTOF(data\icons\Electrolyte.paa);
        model = "a3\props_f_orange\humanitarian\garbage\medicalgarbage_01_injector_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
    };

    class CLASS(eru_NoBattery): CLASS(ItemCore) {
        displayName = CSTRING(ERUNoBattery_DisplayName);
        descriptionShort = CSTRING(RequiresLithiumBattery_Description);
        picture = QPATHTOF(data\icons\ERU_OFF.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 7;
        };
    };

    class CLASS(jetFuelEmpty): CLASS(ItemCore) {
        displayName = CSTRING(JetFuelEmpty_DisplayName);
        descriptionShort = CSTRING(JetFuelEmpty_Description);
        picture = QPATHTOF(data\icons\CanisterJetFuel.paa);
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 50;
        };
    };

    class CLASS(dieselEmpty): CLASS(ItemCore) {
        displayName = CSTRING(DieselEmpty_DisplayName);
        descriptionShort = CSTRING(DieselEmpty_Description);
        picture = QPATHTOF(data\icons\CanisterDiesel.paa);
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 50;
        };
    };

    class CLASS(petrolEmpty): CLASS(ItemCore) {
        displayName = CSTRING(PetrolEmpty_DisplayName);
        descriptionShort = CSTRING(PetrolEmpty_Description);
        picture = QPATHTOF(data\icons\CanisterPetrol.paa);
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 50;
        };
    };

    class CLASS(oilEmpty): CLASS(ItemCore) {
        displayName = CSTRING(EngineOilEmpty_DisplayName);
        descriptionShort = CSTRING(EngineOilEmpty_Description);
        picture = QPATHTOF(data\icons\CanisterDiesel.paa);
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 50;
        };
    };

    class CLASS(coolantEmpty): CLASS(ItemCore) {
        displayName = CSTRING(EngineCoolant_DisplayName);
        descriptionShort = CSTRING(EngineCoolant_Description);
        picture = QPATHTOF(data\icons\CanisterWater.paa);
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 50;
        };
    };

    class CLASS(spareTire): CLASS(ItemCore) {
        displayName = CSTRING(SpareTire_DisplayName);
        descriptionShort = CSTRING(SpareTire_Description);
        picture = QPATHTOF(data\icons\tire.paa);
        model = "a3\structures_f\civ\garbage\tyre_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 150;
        };
    };

    class CLASS(emptyToolKit): CLASS(ItemCore) {
        displayName = CSTRING(EmptyToolKit_DisplayName);
        descriptionShort = CSTRING(EmptyToolKit_Description);
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 25;
        };
    };

    class CLASS(lockKit): CLASS(ItemCore) {
        displayName = "Door lock kit";
        descriptionShort = "electronic door locking kit, prevents unauthorized entry once installed";
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 25;
        };
    };

    class CLASS(stoneChunk): CLASS(ItemCore) {
        displayName = CSTRING(StoneChunk_DisplayName);
        descriptionShort = CSTRING(StoneChunk_Description);
        picture = QPATHTOF(data\icons\stonepieces.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };

    class CLASS(ironIngot): CLASS(ItemCore) {
        displayName = CSTRING(IronIngot_DisplayName);
        descriptionShort = CSTRING(IronIngot_Description);
        picture = QPATHTOF(data\icons\ironingot.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };

    class CLASS(ironOre): CLASS(ItemCore) {
        displayName = CSTRING(IronOre_DisplayName);
        descriptionShort = CSTRING(IronOre_Description);
        picture = QPATHTOF(data\icons\ironore.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };

    class CLASS(ironPiece): CLASS(ItemCore) {
        displayName = CSTRING(IronPiece_DisplayName);
        descriptionShort = CSTRING(IronPiece_Description);
        picture = QPATHTOF(data\icons\ironpiece.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };

    class CLASS(goldIngot): CLASS(ItemCore) {
        displayName = CSTRING(GoldIngot_DisplayName);
        descriptionShort = CSTRING(GoldIngot_Description);
        picture = QPATHTOF(data\icons\goldingot.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };

    class CLASS(goldOre): CLASS(ItemCore) {
        displayName = CSTRING(GoldOre_DisplayName);
        descriptionShort = CSTRING(GoldOre_Description);
        picture = QPATHTOF(data\icons\goldore.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };

    class CLASS(goldPiece): CLASS(ItemCore) {
        displayName = CSTRING(GoldPiece_DisplayName);
        descriptionShort = CSTRING(GoldPiece_Description);
        picture = QPATHTOF(data\icons\goldpiece.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };

    class CLASS(coalOre): CLASS(ItemCore) {
        displayName = CSTRING(CoalOre_DisplayName);
        descriptionShort = CSTRING(CoalOre_Description);
        picture = QPATHTOF(data\icons\coalore.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };

    class CLASS(malachite): CLASS(ItemCore) {
        displayName = CSTRING(Malachite_DisplayName);
        descriptionShort = CSTRING(Malachite_Description);
        picture = QPATHTOF(data\icons\malachite.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };

    class CLASS(ruby): CLASS(ItemCore) {
        displayName = CSTRING(Ruby_DisplayName);
        descriptionShort = CSTRING(Ruby_Description);
        picture = QPATHTOF(data\icons\ruby.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };

    class CLASS(sapphire): CLASS(ItemCore) {
        displayName = CSTRING(Sapphire_DisplayName);
        descriptionShort = CSTRING(Sapphire_Description);
        picture = QPATHTOF(data\icons\sapphire.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };

    class CLASS(amethyst): CLASS(ItemCore) {
        displayName = CSTRING(Amethyst_DisplayName);
        descriptionShort = CSTRING(Amethyst_Description);
        picture = QPATHTOF(data\icons\amethyst.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };

    class CLASS(diamond): CLASS(ItemCore) {
        displayName = CSTRING(Diamond_DisplayName);
        descriptionShort = CSTRING(Diamond_Description);
        picture = QPATHTOF(data\icons\diamond.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };

    class CLASS(emerald): CLASS(ItemCore) {
        displayName = CSTRING(Emerald_DisplayName);
        descriptionShort = CSTRING(Emerald_Description);
        picture = QPATHTOF(data\icons\emerald.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };
};
