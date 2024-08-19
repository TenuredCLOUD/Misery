class CfgWeapons {
    class InventoryItem_Base_F;
    class InventoryFirstAidKitItem_Base_F;
    class MedikitItem;
    class SlotInfo;
    class ItemCore;

    class CLASS(ItemCore): ItemCore {
        type = 4096;
        detectRange = -1;
        scopeCurator = 2;
        simulation = "ItemMineDetector";
    };

    class CLASS(Pickaxe): CLASS(ItemCore) {
        displayName = "$STR_MISERY_PICKAXE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_PICKAXE_DESCRIPTION";
        picture = QPATHTOF(data\icons\pickaxe.paa);
        model = QPATHTOF(data\models\pickaxe.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 85;
        };
    };

    class CLASS(PickaxeBroken): CLASS(ItemCore) {
        displayName = "$STR_MISERY_PICKAXEBROKEN_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_PICKAXEBROKEN_DESCRIPTION";
        picture = QPATHTOF(data\icons\brokenpickaxe.paa);
        model = QPATHTOF(data\models\pickaxe.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 85;
        };
    };

    class CLASS(FishingPole): CLASS(ItemCore) {
        displayName = "$STR_MISERY_FISHINGPOLE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_FISHINGPOLE_DESCRIPTION";
        picture = QPATHTOF(data\icons\fishingpole2.paa);
        model = QPATHTOF(data\models\fishingrod.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 30;
        };
    };

    class CLASS(FishingsPool): CLASS(ItemCore) {
        displayName = "$STR_MISERY_FISHINGSPOOL_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_FISHINGSPOOL_DESCRIPTION";
        picture = QPATHTOF(data\icons\fishingspool.paa);
        model = QPATHTOF(data\models\fishingspool.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
        };
    };

    class CLASS(PersonalGeigerNoBattery): CLASS(ItemCore) {
        displayName = "$STR_MISERY_PERSONALGEIGERNOBATTERY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_PERSONALGEIGERNOBATTERY_DESCRIPTION";
        picture = QPATHTOF(data\icons\personalgeigernobattery.paa);
        model = "\A3\Weapons_F\Items\MineDetector.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };

    class CLASS(Headlamp_NB): CLASS(ItemCore) {
        displayName = "$STR_MISERY_HEADLAMP_NB_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_HEADLAMP_NB_DESCRIPTION";
        picture = QPATHTOF(data\icons\headlamp.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };

    class CLASS(Clozapine): CLASS(ItemCore) {
        displayName = "$STR_MISERY_CLOZAPINE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_CLOZAPINE_DESCRIPTION";
        picture = QPATHTOF(data\icons\Clozapineinjection.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
        };
    };

    class CLASS(Cocaine): CLASS(ItemCore) {
        displayName = "$STR_MISERY_COCAINE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_COCAINE_DESCRIPTION";
        picture = QPATHTOF(data\icons\cocaine.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 0.5;
        };
    };

    class CLASS(Thrombomodulin): CLASS(ItemCore) {
        displayName = "$STR_MISERY_THROMBOMODULIN_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_THROMBOMODULIN_DESCRIPTION";
        picture = QPATHTOF(data\icons\Thbd.paa);
        model = "a3\props_f_orange\humanitarian\garbage\medicalgarbage_01_injector_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
        };
    };

    class CLASS(ThrombomodulinStimpack): CLASS(ItemCore) {
        displayName = "$STR_MISERY_THROMBOMODULINSTIMPACK_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_THROMBOMODULINSTIMPACK_DESCRIPTION";
        picture = QPATHTOF(data\icons\Thbdstim.paa);
        model = "a3\props_f_orange\humanitarian\garbage\medicalgarbage_01_injector_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 8;
        };
    };

    class CLASS(RandomMedication): CLASS(ItemCore) {
        displayName = "$STR_MISERY_RANDOMMEDICATION_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_RANDOMMEDICATION_DESCRIPTION";
        picture = QPATHTOF(data\icons\medication.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
        };
    };

    class CLASS(Fishhook): CLASS(ItemCore) {
        displayName = "$STR_MISERY_FISHHOOK_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_FISHHOOK_DESCRIPTION";
        picture = QPATHTOF(data\icons\fishhook.paa);
        model = QPATHTOF(data\models\fishhook.p3d);
        hiddenSelectionsMaterials[] = {"\z\misery\addons\assets\data\models\ui\fishhook.rvmat"};
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 2;
        };
    };

    class CLASS(Worms): CLASS(ItemCore) {
        displayName = "$STR_MISERY_WORMS_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_WORMS_DESCRIPTION";
        picture = QPATHTOF(data\icons\worms.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 0.5;
        };
    };

    class CLASS(LithiumBattery): CLASS(ItemCore) {
        displayName = "$STR_MISERY_LITHIUMBATTERY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_LITHIUMBATTERY_DESCRIPTION";
        picture = QPATHTOF(data\icons\NitecoreBATT.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 2;
        };
    };

    class CLASS(BearEnergy): CLASS(ItemCore) {
        displayName = "$STR_MISERY_BEARENERGY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_BEARENERGY_DESCRIPTION";
        picture = QPATHTOF(data\icons\Bearstrength.paa);
        model = QPATHTOF(data\models\Bearenergy.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 8;
        };
    };

    class CLASS(SodaCan): CLASS(ItemCore) {
        displayName = "$STR_MISERY_BEARENERGY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_BEARENERGY_DESCRIPTION";
        picture = QPATHTOF(data\icons\Bearstrength.paa);
        model = QPATHTOF(data\models\Pepsi_Soda.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 4;
        };
    };

    class CLASS(CanOpener): CLASS(ItemCore) {
        displayName = "$STR_MISERY_CANOPENER_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_CANOPENER_DESCRIPTION";
        picture = QPATHTOF(data\icons\canOpener.paa);
        model = "a3\structures_f_epa\items\tools\canopener_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };

    class CLASS(CanteenEmpty): CLASS(ItemCore) {
        scope = 2;
        author = "TenuredCLOUD";
        displayName = "$STR_MISERY_CANTEENEMPTY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_CANTEENEMPTY_DESCRIPTION";
        picture = QPATHTOF(data\icons\canteen.paa);
        model = "a3\structures_f_epa\items\food\canteen_f.p3d";

        class ItemInfo: InventoryItem_Base_F {
            mass = 30;
        };
    };

    class CLASS(WaterBottleEmpty): CLASS(ItemCore) {
        scope = 2;
        author = "TenuredCLOUD";
        displayName = "$STR_MISERY_WATERBOTTLEEMPTY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_WATERBOTTLEEMPTY_DESCRIPTION";
        picture = QPATHTOF(data\icons\waterbottle.paa);
        model = "a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d";

        class ItemInfo: InventoryItem_Base_F {
            mass = 15;
        };
    };

    class CLASS(Cereal): CLASS(ItemCore) {
        displayName = "$STR_MISERY_BEARENERGY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_BEARENERGY_DESCRIPTION";
        picture = QPATHTOF(data\icons\cereal.paa);
        model = "a3\structures_f_epa\items\food\cerealsbox_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 4;
        };
    };

    class CLASS(Orange): CLASS(ItemCore) {
        displayName = "$STR_MISERY_BEARENERGY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_BEARENERGY_DESCRIPTION";
        picture = QPATHTOF(data\icons\orange.paa);
        model = "a3\props_f_orange\humanitarian\supplies\orange_01_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 2;
        };
    };

    class CLASS(DryMilk): CLASS(ItemCore) {
        displayName = "$STR_MISERY_BEARENERGY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_BEARENERGY_DESCRIPTION";
        picture = QPATHTOF(data\icons\drymilk.paa);
        model = "a3\structures_f_epa\items\food\powderedmilk_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 4;
        };
    };

    class CLASS(CannedBacon): CLASS(ItemCore) {
        displayName = "$STR_MISERY_BEARENERGY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_BEARENERGY_DESCRIPTION";
        picture = QPATHTOF(data\icons\CannedBacon.paa);
        model = "a3\structures_f\items\food\tacticalbacon_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };

    class CLASS(CannedBeans): CLASS(ItemCore) {
        displayName = "$STR_MISERY_BEARENERGY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_BEARENERGY_DESCRIPTION";
        picture = QPATHTOF(data\icons\CannedBeans.paa);
        model = "a3\structures_f_epa\items\food\bakedbeans_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };

    class CLASS(LeadContainerOpen): CLASS(ItemCore) {
        displayName = "$STR_MISERY_LEADCONTAINEROPEN_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_LEADCONTAINEROPEN_DESCRIPTION";
        picture = QPATHTOF(data\icons\artifactcontaineropen.paa);
        model = "a3\structures_f_bootcamp\items\food\foodcontainer_01_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 50;
        };
    };

    class CLASS(LeadContainerClosed): CLASS(ItemCore) {
        displayName = "$STR_MISERY_LEADCONTAINERCLOSED_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_LEADCONTAINERCLOSED_DESCRIPTION";
        picture = QPATHTOF(data\icons\artifactcontaineropen.paa);
        model = "a3\structures_f_bootcamp\items\food\foodcontainer_01_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 50;
        };
    };

    class CLASS(artifact01): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
        picture = QPATHTOF(data\icons\Artifact01.paa);
        model = QPATHTOF(data\models\artifact.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 3;
        };
    };

    class CLASS(artifact02): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
        picture = QPATHTOF(data\icons\Artifact02.paa);
        model = QPATHTOF(data\models\artifact.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 3;
        };
    };

    class CLASS(artifact03): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
        picture = QPATHTOF(data\icons\Artifact03.paa);
        model = QPATHTOF(data\models\artifact.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 3;
        };
    };

    class CLASS(artifact04): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
        picture = QPATHTOF(data\icons\Artifact04.paa);
        model = QPATHTOF(data\models\artifact.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 3;
        };
    };

    class CLASS(artifact05): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
        picture = QPATHTOF(data\icons\Artifact05.paa);
        model = QPATHTOF(data\models\artifact.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 3;
        };
    };

    class CLASS(artifact06): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
        picture = QPATHTOF(data\icons\Artifact06.paa);
        model = QPATHTOF(data\models\artifact.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 3;
        };
    };

    class CLASS(artifact07): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
        picture = QPATHTOF(data\icons\Artifact07.paa);
        model = QPATHTOF(data\models\artifact.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 3;
        };
    };

    class CLASS(artifact08): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
        picture = QPATHTOF(data\icons\Artifact08.paa);
        model = QPATHTOF(data\models\artifact.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 3;
        };
    };

    class CLASS(artifact09): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
        picture = QPATHTOF(data\icons\Artifact09.paa);
        model = QPATHTOF(data\models\artifact.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 3;
        };
    };

    class CLASS(artifact10): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
        picture = QPATHTOF(data\icons\Artifact10.paa);
        model = QPATHTOF(data\models\artifact.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 3;
        };
    };

    class CLASS(Heatpack): CLASS(ItemCore) {
        displayName = "$STR_MISERY_HEATPACK_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_HEATPACK_DESCRIPTION";
        picture = QPATHTOF(data\icons\hotpack.paa);
        model = "a3\structures_f_epa\items\medical\heatpack_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 8;
        };
    };

    class CLASS(Coldpack): CLASS(ItemCore) {
        displayName = "$STR_MISERY_COLDPACK_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_COLDPACK_DESCRIPTION";
        picture = QPATHTOF(data\icons\coldpack.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 8;
        };
    };

    class CLASS(WaterJerryE): CLASS(ItemCore) {
        displayName = "$STR_MISERY_WATERJERRYE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_WATERJERRYE_DESCRIPTION";
        picture = QPATHTOF(data\icons\CanisterWater.paa);
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 50;
        };
    };

    class CLASS(CastIronPot): CLASS(ItemCore) {
        displayName = "$STR_MISERY_CASTIRONPOT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_CASTIRONPOT_DESCRIPTION";
        picture = QPATHTOF(data\icons\castironpot.paa);
        model = QPATHTOF(data\models\CastIron_Pot.p3d);
        hiddenSelectionsMaterials[] = {"\z\misery\addons\assets\data\models\ui\Iron.rvmat"};
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 90;
        };
    };

    class CLASS(CookedFish): CLASS(ItemCore) {
        displayName = "$STR_MISERY_COOKEDFISH_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_COOKEDFISH_DESCRIPTION";
        picture = QPATHTOF(data\icons\cookedfish.paa);
        model = QPATHTOF(data\models\fishcooked.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 3;
        };
    };

    class CLASS(RawFish): CLASS(ItemCore) {
        displayName = "$STR_MISERY_RAWFISH_1_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_RAWFISH_1_DESCRIPTION";
        picture = QPATHTOF(data\icons\rawfish.paa);
        model = QPATHTOF(data\models\fish.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
        };
    };

    class CLASS(CookedMeat): CLASS(ItemCore) {
        displayName = "Cooked Meat";
        descriptionShort = "Meat that's been cooked";
        picture = QPATHTOF(data\icons\cookedmeat.paa);
        model = QPATHTOF(data\models\cookedmeat.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
        };
    };

    class CLASS(RawMeat): CLASS(ItemCore) {
        displayName = "Raw Meat";
        descriptionShort = "Raw meat, needs to be cooked";
        picture = QPATHTOF(data\icons\rawmeat.paa);
        model = QPATHTOF(data\models\rawmeat.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
        };
    };

    class CLASS(Guitar): CLASS(ItemCore) {
        displayName = "$STR_MISERY_GUITAR_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_GUITAR_DESCRIPTION";
        picture = QPATHTOF(data\icons\guitar.paa);
        model = QPATHTOF(data\models\guitar.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 40;
        };
    };

    class CLASS(CoffeeMug): CLASS(ItemCore) {
        displayName = "$STR_MISERY_COFFEEMUG_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_COFFEEMUG_DESCRIPTION";
        picture = QPATHTOF(data\icons\coffeemug.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };

    class CLASS(CoffeeBrewed): CLASS(ItemCore) {
        displayName = "$STR_MISERY_COFFEEBREWED_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_COFFEEBREWED_DESCRIPTION";
        picture = QPATHTOF(data\icons\coffeebrewed.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };

    class CLASS(GasMaskEmpty): CLASS(ItemCore) {
        displayName = "$STR_MISERY_GASMASKEMPTY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_GASMASKEMPTY_DESCRIPTION";
        picture = QPATHTOF(data\icons\gasmask.paa);
        scope = 2;
        scopeCurator = 2;
        class ItemInfo: InventoryItem_Base_F {
            mass = 25;
        };
    };

    class CLASS(GasCartridge): CLASS(ItemCore) {
        displayName = "$STR_MISERY_GASCARTRIDGE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_GASCARTRIDGE_DESCRIPTION";
        picture = QPATHTOF(data\icons\maskcartridges.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 20;
        };
    };

    class CLASS(18vBattery): CLASS(ItemCore) {
        displayName = "$STR_MISERY_18VBAT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_18VBAT_DESCRIPTION";
        picture = QPATHTOF(data\icons\18vbat.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 20;
        };
    };

    class CLASS(DuctTape): CLASS(ItemCore) {
        displayName = "$STR_MISERY_DUCTTAPE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_DUCTTAPE_DESCRIPTION";
        picture = QPATHTOF(data\icons\ducttape.paa);
        model = "a3\structures_f_epa\items\tools\ducttape_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 18;
        };
    };

    class CLASS(PhillipsScrewdriver): CLASS(ItemCore) {
        displayName = "$STR_MISERY_PSCREWDRIVER_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_PSCREWDRIVER_DESCRIPTION";
        picture = QPATHTOF(data\icons\phillips.paa);
        model = "a3\structures_f\items\tools\screwdriver_v2_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 15;
        };
    };

    class CLASS(FlatheadScrewdriver): CLASS(ItemCore) {
        displayName = "$STR_MISERY_FSCREWDRIVER_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_FSCREWDRIVER_DESCRIPTION";
        picture = QPATHTOF(data\icons\flathead.paa);
        model = "a3\structures_f\items\tools\screwdriver_v1_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 15;
        };
    };

    class CLASS(Pliers): CLASS(ItemCore) {
        displayName = "$STR_MISERY_PLIERS_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_PLIERS_DESCRIPTION";
        picture = QPATHTOF(data\icons\pliers.paa);
        model = "a3\structures_f\items\tools\pliers_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 25;
        };
    };

    class CLASS(CamoNet): CLASS(ItemCore) {
        displayName = "$STR_MISERY_CAMONET_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_CAMONET_DESCRIPTION";
        picture = QPATHTOF(data\icons\camonet.paa);
        model = QPATHTOF(data\models\camonet.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 40;
        };
    };

    class CLASS(9vBattery): CLASS(ItemCore) {
        displayName = "$STR_MISERY_9VBAT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_9VBAT_DESCRIPTION";
        picture = QPATHTOF(data\icons\9Vbat.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };

    class CLASS(CopperWire): CLASS(ItemCore) {
        displayName = "$STR_MISERY_COPPWIRE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_COPPWIRE_DESCRIPTION";
        picture = QPATHTOF(data\icons\copperwire.paa);
        model = "a3\structures_f_epa\items\tools\metalwire_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };

    class CLASS(Rope): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ROPE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ROPE_DESCRIPTION";
        picture = QPATHTOF(data\icons\rope.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 15;
        };
    };

    class CLASS(NeedleThread): CLASS(ItemCore) {
        displayName = "$STR_MISERY_NEEDLETHREAD_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_NEEDLETHREAD_DESCRIPTION";
        picture = QPATHTOF(data\icons\needlethread.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 8;
        };
    };

    class CLASS(CircuitBoard): CLASS(ItemCore) {
        displayName = "$STR_MISERY_CIRCUITBOARD_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_CIRCUITBOARD_DESCRIPTION";
        picture = QPATHTOF(data\icons\CircutBoard.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };

    class CLASS(DeadGeiger): CLASS(ItemCore) {
        displayName = "$STR_MISERY_DEADGEIGER_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_DEADGEIGER_DESCRIPTION";
        picture = QPATHTOF(data\icons\DeadGeiger.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };

    class CLASS(DragonVase): CLASS(ItemCore) {
        displayName = "$STR_MISERY_DRAGONVASE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_DRAGONVASE_DESCRIPTION";
        picture = QPATHTOF(data\icons\DragonVase.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 15;
        };
    };

    class CLASS(Matryoshka): CLASS(ItemCore) {
        displayName = "$STR_MISERY_MATRYOSHKA_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_MATRYOSHKA_DESCRIPTION";
        picture = QPATHTOF(data\icons\Matryoshka.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 15;
        };
    };

    class CLASS(OldWatch): CLASS(ItemCore) {
        displayName = "$STR_MISERY_OLDWATCH_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_OLDWATCH_DESCRIPTION";
        picture = QPATHTOF(data\icons\OldWatch.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };

    class CLASS(Phone): CLASS(ItemCore) {
        displayName = "$STR_MISERY_PHONE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_PHONE_DESCRIPTION";
        picture = QPATHTOF(data\icons\Phone.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 15;
        };
    };

    class CLASS(Photos): CLASS(ItemCore) {
        displayName = "$STR_MISERY_PHOTOS_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_PHOTOS_DESCRIPTION";
        picture = QPATHTOF(data\icons\Photos.paa);
        model = "a3\structures_f\items\documents\filephotos_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
        };
    };

    class CLASS(ToySoldier): CLASS(ItemCore) {
        displayName = "$STR_MISERY_TOYSOLDIER_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_TOYSOLDIER_DESCRIPTION";
        picture = QPATHTOF(data\icons\ToySoldier.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
        };
    };

    class CLASS(VintageShipBottle): CLASS(ItemCore) {
        displayName = "$STR_MISERY_VINTAGESHIPBOTTLE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_VINTAGESHIPBOTTLE_DESCRIPTION";
        picture = QPATHTOF(data\icons\VintageShipBottle.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 15;
        };
    };

    class CLASS(ZombieHead): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ZOMBIEHEAD_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ZOMBIEHEAD_DESCRIPTION";
        picture = QPATHTOF(data\icons\head.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 35;
        };
    };

    class CLASS(ZombieHand): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ZOMBIEHAND_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ZOMBIEHAND_DESCRIPTION";
        picture = QPATHTOF(data\icons\hand.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 15;
        };
    };

    class CLASS(ZombieEye): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ZOMBIEEYE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ZOMBIEEYE_DESCRIPTION";
        picture = QPATHTOF(data\icons\eye.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 10;
        };
    };

    class CLASS(ZombieFoot): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ZOMBIEFOOT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ZOMBIEFOOT_DESCRIPTION";
        picture = QPATHTOF(data\icons\foot.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 25;
        };
    };

    class CLASS(ZombieBrain): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ZOMBIEBRAIN_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ZOMBIEBRAIN_DESCRIPTION";
        picture = QPATHTOF(data\icons\brain.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 30;
        };
    };

    class CLASS(ZombieSkin): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ZOMBIESKIN_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ZOMBIESKIN_DESCRIPTION";
        picture = QPATHTOF(data\icons\skin.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 20;
        };
    };

    class CLASS(BoneSaw): CLASS(ItemCore) {
        displayName = "$STR_MISERY_BONESAW_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_BONESAW_DESCRIPTION";
        picture = QPATHTOF(data\icons\hacksaw.paa);
        model = "\a3\structures_f\Items\Tools\Saw_F.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 35;
        };
    };

    class CLASS(GuttingKnife): CLASS(ItemCore) {
        displayName = "$STR_MISERY_GUTTINGKNIFE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_GUTTINGKNIFE_DESCRIPTION";
        picture = QPATHTOF(data\icons\GuttingKnife.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 25;
        };
    };

    class CLASS(Woodaxe): CLASS(ItemCore) {
        displayName = "$STR_MISERY_WOODAXE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_WOODAXE_DESCRIPTION";
        picture = QPATHTOF(data\icons\Woodaxe.paa);
        model = "a3\structures_f\items\tools\axe_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 50;
        };
    };

    class CLASS(Sledgehammer): CLASS(ItemCore) {
        displayName = "$STR_MISERY_SLEDGHAMMER_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_SLEDGHAMMER_DESCRIPTION";
        picture = QPATHTOF(data\icons\sledgehammer.paa);
        model = QPATHTOF(data\models\sledgehammer.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 85;
        };
    };

    class CLASS(Tinder): CLASS(ItemCore) {
        displayName = "$STR_MISERY_TINDER_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_TINDER_DESCRIPTION";
        picture = QPATHTOF(data\icons\tinder.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
        };
    };

    class CLASS(CBRNparts): CLASS(ItemCore) {
        displayName = "$STR_MISERY_CBRNPARTS_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_CBRNPARTS_DESCRIPTION";
        picture = QPATHTOF(data\icons\CBRN_Parts.paa);
        model = "a3\supplies_f_orange\bags\b_messenger_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 30;
        };
    };

    class CLASS(ChainsawEmpty): CLASS(ItemCore) {
        displayName = "$STR_MISERY_CHAINSAWEMPTY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_CHAINSAWEMPTY_DESCRIPTION";
        picture = QPATHTOF(data\icons\chainsaw.paa);
        model = QPATHTOF(data\models\chainsaw.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 100;
        };
    };

    class CLASS(Woodplank): CLASS(ItemCore) {
        displayName = "$STR_MISERY_WOODPLANK_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_WOODPLANK_DESCRIPTION";
        picture = QPATHTOF(data\icons\woodplank.paa);
        model = QPATHTOF(data\models\woodplank.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 0;
        };
    };

    class CLASS(Woodnail): CLASS(ItemCore) {
        displayName = "$STR_MISERY_WOODNAIL_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_WOODNAIL_DESCRIPTION";
        picture = QPATHTOF(data\icons\Woodnail.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 0;
        };
    };

    class CLASS(Woodensticks): CLASS(ItemCore) {
        displayName = "$STR_MISERY_WOODENSTICKS_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_WOODENSTICKS_DESCRIPTION";
        picture = QPATHTOF(data\icons\woodsticks.paa);
        model = QPATHTOF(data\models\woodsticks.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 35;
        };
    };

    class CLASS(Firewood): CLASS(ItemCore) {
        displayName = "$STR_MISERY_FIREWOOD_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_FIREWOOD_DESCRIPTION";
        picture = QPATHTOF(data\icons\firewood.paa);
        model = QPATHTOF(data\models\firewoodbundle.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 75;
        };
    };

    class CLASS(Woodenlog): CLASS(ItemCore) {
        displayName = "$STR_MISERY_WOODENLOG_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_WOODENLOG_DESCRIPTION";
        picture = QPATHTOF(data\icons\woodenlog.paa);
        model = QPATHTOF(data\models\bigwoodlog.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 225;
        };
    };

    class CLASS(BoxNails): CLASS(ItemCore) {
        displayName = "$STR_MISERY_BOXNAILS_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_BOXNAILS_DESCRIPTION";
        picture = QPATHTOF(data\icons\boxnails.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 0;
        };
    };

    class CLASS(CraftingHammer): CLASS(ItemCore) {
        displayName = "$STR_MISERY_CRAFTINGHAMMER_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_CRAFTINGHAMMER_DESCRIPTION";
        picture = QPATHTOF(data\icons\craftinghammer.paa);
        model = QPATHTOF(data\models\craftinghammer.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 15;
        };
    };

    class CLASS(AnvilHammer): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ANVILHAMMER_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ANVILHAMMER_DESCRIPTION";
        picture = QPATHTOF(data\icons\anvilhammer.paa);
        model = QPATHTOF(data\models\anvilhammer.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 35;
        };
    };

    class CLASS(ElectricHandSawNoBattery): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ELECTRICHANDSAWNOBATTERY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ELECTRICHANDSAWNOBATTERY_DESCRIPTION";
        picture = QPATHTOF(data\icons\ElectricHandCircularSaw.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 25;
        };
    };

    class CLASS(Wrench): CLASS(ItemCore) {
        displayName = "$STR_MISERY_WRENCH_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_WRENCH_DESCRIPTION";
        picture = QPATHTOF(data\icons\wrench.paa);
        model = "a3\structures_f\items\tools\wrench_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 15;
        };
    };

    class CLASS(Glucose): CLASS(ItemCore) {
        displayName = "$STR_MISERY_GLUCOSE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_GLUCOSE_DESCRIPTION";
        picture = QPATHTOF(data\icons\Glucose.paa);
        model = "a3\props_f_orange\humanitarian\garbage\medicalgarbage_01_injector_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 3;
        };
    };

    class CLASS(Electrolyte): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ELECTROLYTE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ELECTROLYTE_DESCRIPTION";
        picture = QPATHTOF(data\icons\Electrolyte.paa);
        model = "a3\props_f_orange\humanitarian\garbage\medicalgarbage_01_injector_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 3;
        };
    };

    class CLASS(ERU_NB): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ERU_NB_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ERU_NB_DESCRIPTION";
        picture = QPATHTOF(data\icons\ERU_OFF.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 7;
        };
    };

    class CLASS(EmptyJet): CLASS(ItemCore) {
        displayName = "$STR_MISERY_EMPTYJET_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_EMPTYJET_DESCRIPTION";
        picture = QPATHTOF(data\icons\CanisterJetFuel.paa);
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 50;
        };
    };

    class CLASS(EmptyDiesel): CLASS(ItemCore) {
        displayName = "$STR_MISERY_EMPTYDIESEL_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_EMPTYDIESEL_DESCRIPTION";
        picture = QPATHTOF(data\icons\CanisterDiesel.paa);
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 50;
        };
    };

    class CLASS(EmptyPetrol): CLASS(ItemCore) {
        displayName = "$STR_MISERY_EMPTYPETROL_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_EMPTYPETROL_DESCRIPTION";
        picture = QPATHTOF(data\icons\CanisterPetrol.paa);
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 50;
        };
    };

    class CLASS(StoneChunk): CLASS(ItemCore) {
        displayName = "$STR_MISERY_STONECHUNK_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_STONECHUNK_DESCRIPTION";
        picture = QPATHTOF(data\icons\stonepieces.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 0;
        };
    };

    class CLASS(IronIngot): CLASS(ItemCore) {
        displayName = "$STR_MISERY_IRONINGOT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_IRONINGOT_DESCRIPTION";
        picture = QPATHTOF(data\icons\ironingot.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 0;
        };
    };

    class CLASS(IronOre): CLASS(ItemCore) {
        displayName = "$STR_MISERY_IRONORE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_IRONORE_DESCRIPTION";
        picture = QPATHTOF(data\icons\ironore.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 0;
        };
    };

    class CLASS(IronPiece): CLASS(ItemCore) {
        displayName = "$STR_MISERY_IRONPIECE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_IRONPIECE_DESCRIPTION";
        picture = QPATHTOF(data\icons\ironpiece.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 0;
        };
    };

    class CLASS(GoldIngot): CLASS(ItemCore) {
        displayName = "$STR_MISERY_GOLDINGOT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_GOLDINGOT_DESCRIPTION";
        picture = QPATHTOF(data\icons\goldingot.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 0;
        };
    };

    class CLASS(GoldOre): CLASS(ItemCore) {
        displayName = "$STR_MISERY_GOLDORE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_GOLDORE_DESCRIPTION";
        picture = QPATHTOF(data\icons\goldore.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 0;
        };
    };

    class CLASS(GoldPiece): CLASS(ItemCore) {
        displayName = "$STR_MISERY_GOLDPIECE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_GOLDPIECE_DESCRIPTION";
        picture = QPATHTOF(data\icons\goldpiece.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 0;
        };
    };

    class CLASS(CoalOre): CLASS(ItemCore) {
        displayName = "$STR_MISERY_COALORE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_COALORE_DESCRIPTION";
        picture = QPATHTOF(data\icons\coalore.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 0;
        };
    };

    class CLASS(Malachite): CLASS(ItemCore) {
        displayName = "$STR_MISERY_MALACHITE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_MALACHITE_DESCRIPTION";
        picture = QPATHTOF(data\icons\malachite.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 0;
        };
    };

    class CLASS(Ruby): CLASS(ItemCore) {
        displayName = "$STR_MISERY_RUBY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_RUBY_DESCRIPTION";
        picture = QPATHTOF(data\icons\ruby.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 0;
        };
    };

    class CLASS(Sapphire): CLASS(ItemCore) {
        displayName = "$STR_MISERY_SAPPHIRE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_SAPPHIRE_DESCRIPTION";
        picture = QPATHTOF(data\icons\sapphire.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 0;
        };
    };

    class CLASS(Amethyst): CLASS(ItemCore) {
        displayName = "$STR_MISERY_AMETHYST_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_AMETHYST_DESCRIPTION";
        picture = QPATHTOF(data\icons\amethyst.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 0;
        };
    };

    class CLASS(Diamond): CLASS(ItemCore) {
        displayName = "$STR_MISERY_DIAMOND_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_DIAMOND_DESCRIPTION";
        picture = QPATHTOF(data\icons\diamond.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 0;
        };
    };

    class CLASS(Emerald): CLASS(ItemCore) {
        displayName = "$STR_MISERY_EMERALD_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_EMERALD_DESCRIPTION";
        picture = QPATHTOF(data\icons\emerald.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 0;
        };
    };

    class CLASS(RFHighNoBattery): CLASS(ItemCore) {
        displayName = "$STR_MISERY_RFHIGHNOBATTERY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_RFHIGHNOBATTERY_DESCRIPTION";
        picture = QPATHTOF(data\icons\EMFdetectorhighrangenobattery.paa);
        model = "\A3\Weapons_F\Items\MineDetector";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: InventoryItem_Base_F {
            mass = 5;
        };
    };
};
