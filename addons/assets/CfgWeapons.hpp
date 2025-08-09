class CfgWeapons {
    class CBA_MiscItem;
    class CBA_MiscItem_ItemInfo;
    class CLASS(ItemCore): CBA_MiscItem {};

    class CLASS(pickaxe): CLASS(ItemCore) {
        displayName = "$STR_MISERY_PICKAXE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_PICKAXE_DESCRIPTION";
        picture = QPATHTOF(data\icons\pickaxe.paa);
        model = QPATHTOF(data\models\pickaxe.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 85;
        };
    };

    class CLASS(pickaxe_Broken): CLASS(ItemCore) {
        displayName = "$STR_MISERY_PICKAXEBROKEN_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_PICKAXEBROKEN_DESCRIPTION";
        picture = QPATHTOF(data\icons\brokenpickaxe.paa);
        model = QPATHTOF(data\models\pickaxe.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 85;
        };
    };

    class CLASS(fishingPole): CLASS(ItemCore) {
        displayName = "$STR_MISERY_FISHINGPOLE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_FISHINGPOLE_DESCRIPTION";
        picture = QPATHTOF(data\icons\fishingpole2.paa);
        model = QPATHTOF(data\models\fishingrod.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 30;
        };
    };

    class CLASS(fishingSpool): CLASS(ItemCore) {
        displayName = "$STR_MISERY_FISHINGSPOOL_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_FISHINGSPOOL_DESCRIPTION";
        picture = QPATHTOF(data\icons\fishingspool.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
    };

    class CLASS(geiger_NoBattery): CLASS(ItemCore) {
        displayName = "$STR_MISERY_PERSONALGEIGERNOBATTERY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_PERSONALGEIGERNOBATTERY_DESCRIPTION";
        picture = QPATHTOF(data\icons\personalgeigernobattery.paa);
        model = "\A3\Weapons_F\Items\MineDetector.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };

    class CLASS(lantern_NoBattery): CLASS(ItemCore) {
        displayName = "Lantern (No battery)";
        descriptionShort = "- Useless without batteries...";
        picture = QPATHTOF(data\icons\lantern.paa);
        model = "a3\structures_f\civ\camping\camping_light_off_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };

    class CLASS(clozapine): CLASS(ItemCore) {
        displayName = "$STR_MISERY_CLOZAPINE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_CLOZAPINE_DESCRIPTION";
        picture = QPATHTOF(data\icons\Clozapineinjection.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
    };

    class CLASS(cocaine): CLASS(ItemCore) {
        displayName = "$STR_MISERY_COCAINE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_COCAINE_DESCRIPTION";
        picture = QPATHTOF(data\icons\cocaine.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0.5;
        };
    };

    class CLASS(thrombomodulin): CLASS(ItemCore) {
        displayName = "$STR_MISERY_THROMBOMODULIN_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_THROMBOMODULIN_DESCRIPTION";
        picture = QPATHTOF(data\icons\Thbd.paa);
        model = "a3\props_f_orange\humanitarian\garbage\medicalgarbage_01_injector_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
    };

    class CLASS(thrombomodulin_Stimpack): CLASS(ItemCore) {
        displayName = "$STR_MISERY_THROMBOMODULINSTIMPACK_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_THROMBOMODULINSTIMPACK_DESCRIPTION";
        picture = QPATHTOF(data\icons\Thbdstim.paa);
        model = "a3\props_f_orange\humanitarian\garbage\medicalgarbage_01_injector_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 8;
        };
    };

    class CLASS(randomMedication): CLASS(ItemCore) {
        displayName = "$STR_MISERY_RANDOMMEDICATION_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_RANDOMMEDICATION_DESCRIPTION";
        picture = QPATHTOF(data\icons\medication.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
    };

    class CLASS(fishhook): CLASS(ItemCore) {
        displayName = "$STR_MISERY_FISHHOOK_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_FISHHOOK_DESCRIPTION";
        picture = QPATHTOF(data\icons\fishhook.paa);
        model = QPATHTOF(data\models\fishhook.p3d);
        hiddenSelectionsMaterials[] = {"\z\misery\addons\assets\data\models\ui\fishhook.rvmat"};
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 2;
        };
    };

    class CLASS(worms): CLASS(ItemCore) {
        displayName = "$STR_MISERY_WORMS_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_WORMS_DESCRIPTION";
        picture = QPATHTOF(data\icons\worms.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0.5;
        };
    };

    class CLASS(lithiumBattery): CLASS(ItemCore) {
        displayName = "$STR_MISERY_LITHIUMBATTERY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_LITHIUMBATTERY_DESCRIPTION";
        picture = QPATHTOF(data\icons\NitecoreBATT.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 2;
        };
    };

    class CLASS(bearEnergy): CLASS(ItemCore) {
        displayName = "$STR_MISERY_BEARENERGY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_BEARENERGY_DESCRIPTION";
        picture = QPATHTOF(data\icons\Bearstrength.paa);
        model = QPATHTOF(data\models\Bearenergy.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 8;
        };
    };

    class CLASS(sodaCan): CLASS(ItemCore) {
        displayName = "$STR_MISERY_BEARENERGY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_BEARENERGY_DESCRIPTION";
        picture = QPATHTOF(data\icons\Bearstrength.paa);
        model = QPATHTOF(data\models\Pepsi_Soda.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 4;
        };
    };

    class CLASS(canOpener): CLASS(ItemCore) {
        displayName = "$STR_MISERY_CANOPENER_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_CANOPENER_DESCRIPTION";
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
        displayName = "$STR_MISERY_CANTEENEMPTY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_CANTEENEMPTY_DESCRIPTION";
        picture = QPATHTOF(data\icons\canteen.paa);
        model = "a3\structures_f_epa\items\food\canteen_f.p3d";

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 30;
        };
    };

    class CLASS(waterBottle_Empty): CLASS(ItemCore) {
        scope = 2;
        author = "TenuredCLOUD";
        displayName = "$STR_MISERY_WATERBOTTLEEMPTY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_WATERBOTTLEEMPTY_DESCRIPTION";
        picture = QPATHTOF(data\icons\waterbottle.paa);
        model = "a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d";

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 15;
        };
    };

    class CLASS(cereal): CLASS(ItemCore) {
        displayName = "$STR_MISERY_BEARENERGY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_BEARENERGY_DESCRIPTION";
        picture = QPATHTOF(data\icons\cereal.paa);
        model = "a3\structures_f_epa\items\food\cerealsbox_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 4;
        };
    };

    class CLASS(orange): CLASS(ItemCore) {
        displayName = "$STR_MISERY_BEARENERGY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_BEARENERGY_DESCRIPTION";
        picture = QPATHTOF(data\icons\orange.paa);
        model = "a3\props_f_orange\humanitarian\supplies\orange_01_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 2;
        };
    };

    class CLASS(dryMilk): CLASS(ItemCore) {
        displayName = "$STR_MISERY_BEARENERGY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_BEARENERGY_DESCRIPTION";
        picture = QPATHTOF(data\icons\drymilk.paa);
        model = "a3\structures_f_epa\items\food\powderedmilk_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 4;
        };
    };

    class CLASS(cannedBacon): CLASS(ItemCore) {
        displayName = "$STR_MISERY_BEARENERGY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_BEARENERGY_DESCRIPTION";
        picture = QPATHTOF(data\icons\CannedBacon.paa);
        model = "a3\structures_f\items\food\tacticalbacon_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };

    class CLASS(cannedBeans): CLASS(ItemCore) {
        displayName = "$STR_MISERY_BEARENERGY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_BEARENERGY_DESCRIPTION";
        picture = QPATHTOF(data\icons\CannedBeans.paa);
        model = "a3\structures_f_epa\items\food\bakedbeans_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };

    class CLASS(leadContainer_Open): CLASS(ItemCore) {
        displayName = "$STR_MISERY_LEADCONTAINEROPEN_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_LEADCONTAINEROPEN_DESCRIPTION";
        picture = QPATHTOF(data\icons\artifactcontaineropen.paa);
        model = "a3\structures_f_bootcamp\items\food\foodcontainer_01_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 50;
        };
    };

    class CLASS(leadContainer_Closed): CLASS(ItemCore) {
        displayName = "$STR_MISERY_LEADCONTAINERCLOSED_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_LEADCONTAINERCLOSED_DESCRIPTION";
        picture = QPATHTOF(data\icons\artifactcontaineropen.paa);
        model = "a3\structures_f_bootcamp\items\food\foodcontainer_01_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 50;
        };
    };

    class CLASS(artifact_01): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
        picture = QPATHTOF(data\icons\Artifact01.paa);
        model = QPATHTOF(data\models\artifact.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
    };

    class CLASS(artifact_02): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
        picture = QPATHTOF(data\icons\Artifact02.paa);
        model = QPATHTOF(data\models\artifact.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
    };

    class CLASS(artifact_03): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
        picture = QPATHTOF(data\icons\Artifact03.paa);
        model = QPATHTOF(data\models\artifact.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
    };

    class CLASS(artifact_04): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
        picture = QPATHTOF(data\icons\Artifact04.paa);
        model = QPATHTOF(data\models\artifact.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
    };

    class CLASS(artifact_05): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
        picture = QPATHTOF(data\icons\Artifact05.paa);
        model = QPATHTOF(data\models\artifact.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
    };

    class CLASS(artifact_06): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
        picture = QPATHTOF(data\icons\Artifact06.paa);
        model = QPATHTOF(data\models\artifact.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
    };

    class CLASS(artifact_07): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
        picture = QPATHTOF(data\icons\Artifact07.paa);
        model = QPATHTOF(data\models\artifact.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
    };

    class CLASS(artifact_08): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
        picture = QPATHTOF(data\icons\Artifact08.paa);
        model = QPATHTOF(data\models\artifact.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
    };

    class CLASS(artifact_09): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
        picture = QPATHTOF(data\icons\Artifact09.paa);
        model = QPATHTOF(data\models\artifact.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
    };

    class CLASS(artifact_10): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
        picture = QPATHTOF(data\icons\Artifact10.paa);
        model = QPATHTOF(data\models\artifact.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
    };

    class CLASS(heatpack): CLASS(ItemCore) {
        displayName = "$STR_MISERY_HEATPACK_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_HEATPACK_DESCRIPTION";
        picture = QPATHTOF(data\icons\hotpack.paa);
        model = "a3\structures_f_epa\items\medical\heatpack_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 8;
        };
    };

    class CLASS(coldpack): CLASS(ItemCore) {
        displayName = "$STR_MISERY_COLDPACK_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_COLDPACK_DESCRIPTION";
        picture = QPATHTOF(data\icons\coldpack.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 8;
        };
    };

    class CLASS(waterJerryCan_Empty): CLASS(ItemCore) {
        displayName = "$STR_MISERY_WATERJERRYE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_WATERJERRYE_DESCRIPTION";
        picture = QPATHTOF(data\icons\CanisterWater.paa);
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 50;
        };
    };

    class CLASS(castIronPot): CLASS(ItemCore) {
        displayName = "$STR_MISERY_CASTIRONPOT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_CASTIRONPOT_DESCRIPTION";
        picture = QPATHTOF(data\icons\castironpot.paa);
        model = QPATHTOF(data\models\CastIron_Pot.p3d);
        hiddenSelectionsMaterials[] = {QPATHTOF(data\rvmats\iron.rvmat)};
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 90;
        };
    };

    class CLASS(cookedFish): CLASS(ItemCore) {
        displayName = "$STR_MISERY_COOKEDFISH_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_COOKEDFISH_DESCRIPTION";
        picture = QPATHTOF(data\icons\cookedfish.paa);
        model = QPATHTOF(data\models\fishcooked.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
    };

    class CLASS(rawFish): CLASS(ItemCore) {
        displayName = "$STR_MISERY_RAWFISH_1_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_RAWFISH_1_DESCRIPTION";
        picture = QPATHTOF(data\icons\rawfish.paa);
        model = QPATHTOF(data\models\fish.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
    };

    class CLASS(cookedMeat): CLASS(ItemCore) {
        displayName = "Cooked Meat";
        descriptionShort = "Meat that's been cooked";
        picture = QPATHTOF(data\icons\cookedmeat.paa);
        model = QPATHTOF(data\models\cookedmeat.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
    };

    class CLASS(rawMeat): CLASS(ItemCore) {
        displayName = "Raw Meat";
        descriptionShort = "Raw meat, needs to be cooked";
        picture = QPATHTOF(data\icons\rawmeat.paa);
        model = QPATHTOF(data\models\rawmeat.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
    };

    class CLASS(coffeeMug): CLASS(ItemCore) {
        displayName = "$STR_MISERY_COFFEEMUG_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_COFFEEMUG_DESCRIPTION";
        picture = QPATHTOF(data\icons\coffeemug.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };

    class CLASS(coffeeBrewed): CLASS(ItemCore) {
        displayName = "$STR_MISERY_COFFEEBREWED_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_COFFEEBREWED_DESCRIPTION";
        picture = QPATHTOF(data\icons\coffeebrewed.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };

    class CLASS(gasMask_Empty): CLASS(ItemCore) {
        displayName = "$STR_MISERY_GASMASKEMPTY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_GASMASKEMPTY_DESCRIPTION";
        picture = QPATHTOF(data\icons\gasmask.paa);
        scope = 2;
        scopeCurator = 2;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 25;
        };
    };

    class CLASS(gasCartridge): CLASS(ItemCore) {
        displayName = "$STR_MISERY_GASCARTRIDGE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_GASCARTRIDGE_DESCRIPTION";
        picture = QPATHTOF(data\icons\maskcartridges.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 20;
        };
    };

    class CLASS(18vBattery): CLASS(ItemCore) {
        displayName = "$STR_MISERY_18VBAT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_18VBAT_DESCRIPTION";
        picture = QPATHTOF(data\icons\18vbat.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 20;
        };
    };

    class CLASS(ductTape): CLASS(ItemCore) {
        displayName = "$STR_MISERY_DUCTTAPE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_DUCTTAPE_DESCRIPTION";
        picture = QPATHTOF(data\icons\ducttape.paa);
        model = "a3\structures_f_epa\items\tools\ducttape_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 18;
        };
    };

    class CLASS(phillipsScrewdriver): CLASS(ItemCore) {
        displayName = "$STR_MISERY_PSCREWDRIVER_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_PSCREWDRIVER_DESCRIPTION";
        picture = QPATHTOF(data\icons\phillips.paa);
        model = "a3\structures_f\items\tools\screwdriver_v2_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 15;
        };
    };

    class CLASS(flatheadScrewdriver): CLASS(ItemCore) {
        displayName = "$STR_MISERY_FSCREWDRIVER_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_FSCREWDRIVER_DESCRIPTION";
        picture = QPATHTOF(data\icons\flathead.paa);
        model = "a3\structures_f\items\tools\screwdriver_v1_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 15;
        };
    };

    class CLASS(pliers): CLASS(ItemCore) {
        displayName = "$STR_MISERY_PLIERS_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_PLIERS_DESCRIPTION";
        picture = QPATHTOF(data\icons\pliers.paa);
        model = "a3\structures_f\items\tools\pliers_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 25;
        };
    };

    class CLASS(camoNet): CLASS(ItemCore) {
        displayName = "$STR_MISERY_CAMONET_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_CAMONET_DESCRIPTION";
        picture = QPATHTOF(data\icons\camonet.paa);
        model = QPATHTOF(data\models\camonet.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 40;
        };
    };

    class CLASS(9vBattery): CLASS(ItemCore) {
        displayName = "$STR_MISERY_9VBAT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_9VBAT_DESCRIPTION";
        picture = QPATHTOF(data\icons\9Vbat.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };

    class CLASS(copperWire): CLASS(ItemCore) {
        displayName = "$STR_MISERY_COPPWIRE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_COPPWIRE_DESCRIPTION";
        picture = QPATHTOF(data\icons\copperwire.paa);
        model = "a3\structures_f_epa\items\tools\metalwire_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };

    class CLASS(rope): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ROPE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ROPE_DESCRIPTION";
        picture = QPATHTOF(data\icons\rope.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 15;
        };
    };

    class CLASS(needleThread): CLASS(ItemCore) {
        displayName = "$STR_MISERY_NEEDLETHREAD_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_NEEDLETHREAD_DESCRIPTION";
        picture = QPATHTOF(data\icons\needlethread.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 8;
        };
    };

    class CLASS(circuitBoard): CLASS(ItemCore) {
        displayName = "$STR_MISERY_CIRCUITBOARD_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_CIRCUITBOARD_DESCRIPTION";
        picture = QPATHTOF(data\icons\CircutBoard.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };

    class CLASS(geiger_dead): CLASS(ItemCore) {
        displayName = "$STR_MISERY_DEADGEIGER_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_DEADGEIGER_DESCRIPTION";
        picture = QPATHTOF(data\icons\DeadGeiger.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };

    class CLASS(dragonVase): CLASS(ItemCore) {
        displayName = "$STR_MISERY_DRAGONVASE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_DRAGONVASE_DESCRIPTION";
        picture = QPATHTOF(data\icons\DragonVase.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 15;
        };
    };

    class CLASS(matryoshka): CLASS(ItemCore) {
        displayName = "$STR_MISERY_MATRYOSHKA_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_MATRYOSHKA_DESCRIPTION";
        picture = QPATHTOF(data\icons\Matryoshka.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 15;
        };
    };

    class CLASS(oldWatch): CLASS(ItemCore) {
        displayName = "$STR_MISERY_OLDWATCH_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_OLDWATCH_DESCRIPTION";
        picture = QPATHTOF(data\icons\OldWatch.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };

    class CLASS(phone): CLASS(ItemCore) {
        displayName = "$STR_MISERY_PHONE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_PHONE_DESCRIPTION";
        picture = QPATHTOF(data\icons\Phone.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 15;
        };
    };

    class CLASS(photos): CLASS(ItemCore) {
        displayName = "$STR_MISERY_PHOTOS_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_PHOTOS_DESCRIPTION";
        picture = QPATHTOF(data\icons\Photos.paa);
        model = "a3\structures_f\items\documents\filephotos_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
    };

    class CLASS(toySoldier): CLASS(ItemCore) {
        displayName = "$STR_MISERY_TOYSOLDIER_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_TOYSOLDIER_DESCRIPTION";
        picture = QPATHTOF(data\icons\ToySoldier.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
    };

    class CLASS(vintageShipBottle): CLASS(ItemCore) {
        displayName = "$STR_MISERY_VINTAGESHIPBOTTLE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_VINTAGESHIPBOTTLE_DESCRIPTION";
        picture = QPATHTOF(data\icons\VintageShipBottle.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 15;
        };
    };

    class CLASS(zombie_Head): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ZOMBIEHEAD_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ZOMBIEHEAD_DESCRIPTION";
        picture = QPATHTOF(data\icons\head.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 35;
        };
    };

    class CLASS(zombie_Hand): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ZOMBIEHAND_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ZOMBIEHAND_DESCRIPTION";
        picture = QPATHTOF(data\icons\hand.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 15;
        };
    };

    class CLASS(zombie_Eye): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ZOMBIEEYE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ZOMBIEEYE_DESCRIPTION";
        picture = QPATHTOF(data\icons\eye.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 10;
        };
    };

    class CLASS(zombie_Foot): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ZOMBIEFOOT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ZOMBIEFOOT_DESCRIPTION";
        picture = QPATHTOF(data\icons\foot.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 25;
        };
    };

    class CLASS(zombie_Brain): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ZOMBIEBRAIN_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ZOMBIEBRAIN_DESCRIPTION";
        picture = QPATHTOF(data\icons\brain.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 30;
        };
    };

    class CLASS(zombie_Skin): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ZOMBIESKIN_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ZOMBIESKIN_DESCRIPTION";
        picture = QPATHTOF(data\icons\skin.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 20;
        };
    };

    class CLASS(boneSaw): CLASS(ItemCore) {
        displayName = "$STR_MISERY_BONESAW_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_BONESAW_DESCRIPTION";
        picture = QPATHTOF(data\icons\hacksaw.paa);
        model = "\a3\structures_f\Items\Tools\Saw_F.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 35;
        };
    };

    class CLASS(guttingKnife): CLASS(ItemCore) {
        displayName = "$STR_MISERY_GUTTINGKNIFE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_GUTTINGKNIFE_DESCRIPTION";
        picture = QPATHTOF(data\icons\GuttingKnife.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 25;
        };
    };

    class CLASS(woodaxe): CLASS(ItemCore) {
        displayName = "$STR_MISERY_WOODAXE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_WOODAXE_DESCRIPTION";
        picture = QPATHTOF(data\icons\Woodaxe.paa);
        model = "a3\structures_f\items\tools\axe_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 50;
        };
    };

    class CLASS(sledgehammer): CLASS(ItemCore) {
        displayName = "$STR_MISERY_SLEDGHAMMER_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_SLEDGHAMMER_DESCRIPTION";
        picture = QPATHTOF(data\icons\sledgehammer.paa);
        model = QPATHTOF(data\models\sledgehammer.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 85;
        };
    };

    class CLASS(tinder): CLASS(ItemCore) {
        displayName = "$STR_MISERY_TINDER_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_TINDER_DESCRIPTION";
        picture = QPATHTOF(data\icons\tinder.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 5;
        };
    };

    class CLASS(cbrn_parts): CLASS(ItemCore) {
        displayName = "$STR_MISERY_CBRNPARTS_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_CBRNPARTS_DESCRIPTION";
        picture = QPATHTOF(data\icons\CBRN_Parts.paa);
        model = "a3\supplies_f_orange\bags\b_messenger_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 30;
        };
    };

    class CLASS(chainsaw_Empty): CLASS(ItemCore) {
        displayName = "$STR_MISERY_CHAINSAWEMPTY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_CHAINSAWEMPTY_DESCRIPTION";
        picture = QPATHTOF(data\icons\chainsaw.paa);
        model = QPATHTOF(data\models\chainsaw.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 100;
        };
    };

    class CLASS(woodplank): CLASS(ItemCore) {
        displayName = "$STR_MISERY_WOODPLANK_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_WOODPLANK_DESCRIPTION";
        picture = QPATHTOF(data\icons\woodplank.paa);
        model = QPATHTOF(data\models\woodplank.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };

    class CLASS(woodnail): CLASS(ItemCore) {
        displayName = "$STR_MISERY_WOODNAIL_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_WOODNAIL_DESCRIPTION";
        picture = QPATHTOF(data\icons\Woodnail.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };

    class CLASS(woodensticks): CLASS(ItemCore) {
        displayName = "$STR_MISERY_WOODENSTICKS_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_WOODENSTICKS_DESCRIPTION";
        picture = QPATHTOF(data\icons\woodsticks.paa);
        model = QPATHTOF(data\models\woodsticks.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 35;
        };
    };

    class CLASS(firewood): CLASS(ItemCore) {
        displayName = "$STR_MISERY_FIREWOOD_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_FIREWOOD_DESCRIPTION";
        picture = QPATHTOF(data\icons\firewood.paa);
        model = QPATHTOF(data\models\firewoodbundle.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 75;
        };
    };

    class CLASS(woodenlog): CLASS(ItemCore) {
        displayName = "$STR_MISERY_WOODENLOG_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_WOODENLOG_DESCRIPTION";
        picture = QPATHTOF(data\icons\woodenlog.paa);
        model = QPATHTOF(data\models\bigwoodlog.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 225;
        };
    };

    class CLASS(boxNails): CLASS(ItemCore) {
        displayName = "$STR_MISERY_BOXNAILS_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_BOXNAILS_DESCRIPTION";
        picture = QPATHTOF(data\icons\boxnails.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };

    class CLASS(craftingHammer): CLASS(ItemCore) {
        displayName = "$STR_MISERY_CRAFTINGHAMMER_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_CRAFTINGHAMMER_DESCRIPTION";
        picture = QPATHTOF(data\icons\craftinghammer.paa);
        model = QPATHTOF(data\models\craftinghammer.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 15;
        };
    };

    class CLASS(anvilHammer): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ANVILHAMMER_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ANVILHAMMER_DESCRIPTION";
        picture = QPATHTOF(data\icons\anvilhammer.paa);
        model = QPATHTOF(data\models\anvilhammer.p3d);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 35;
        };
    };

    class CLASS(electricHandSaw_NoBattery): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ELECTRICHANDSAWNOBATTERY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ELECTRICHANDSAWNOBATTERY_DESCRIPTION";
        picture = QPATHTOF(data\icons\ElectricHandCircularSaw.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 25;
        };
    };

    class CLASS(wrench): CLASS(ItemCore) {
        displayName = "$STR_MISERY_WRENCH_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_WRENCH_DESCRIPTION";
        picture = QPATHTOF(data\icons\wrench.paa);
        model = "a3\structures_f\items\tools\wrench_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 15;
        };
    };

    class CLASS(glucose): CLASS(ItemCore) {
        displayName = "$STR_MISERY_GLUCOSE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_GLUCOSE_DESCRIPTION";
        picture = QPATHTOF(data\icons\Glucose.paa);
        model = "a3\props_f_orange\humanitarian\garbage\medicalgarbage_01_injector_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
    };

    class CLASS(electrolyte): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ELECTROLYTE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ELECTROLYTE_DESCRIPTION";
        picture = QPATHTOF(data\icons\Electrolyte.paa);
        model = "a3\props_f_orange\humanitarian\garbage\medicalgarbage_01_injector_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 3;
        };
    };

    class CLASS(eru_NoBattery): CLASS(ItemCore) {
        displayName = "$STR_MISERY_ERU_NB_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_ERU_NB_DESCRIPTION";
        picture = QPATHTOF(data\icons\ERU_OFF.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 7;
        };
    };

    class CLASS(jetFuelEmpty): CLASS(ItemCore) {
        displayName = "$STR_MISERY_EMPTYJET_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_EMPTYJET_DESCRIPTION";
        picture = QPATHTOF(data\icons\CanisterJetFuel.paa);
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 50;
        };
    };

    class CLASS(dieselEmpty): CLASS(ItemCore) {
        displayName = "$STR_MISERY_EMPTYDIESEL_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_EMPTYDIESEL_DESCRIPTION";
        picture = QPATHTOF(data\icons\CanisterDiesel.paa);
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 50;
        };
    };

    class CLASS(petrolEmpty): CLASS(ItemCore) {
        displayName = "$STR_MISERY_EMPTYPETROL_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_EMPTYPETROL_DESCRIPTION";
        picture = QPATHTOF(data\icons\CanisterPetrol.paa);
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 50;
        };
    };

    class CLASS(tire): CLASS(ItemCore) {
        displayName = "Tire";
        descriptionShort = "used for vehicle repairs";
        picture = "a3\editorpreviews_f\data\cfgvehicles\land_tyre_f.jpg";
        model = "a3\structures_f\civ\garbage\tyre_f.p3d";
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 50;
        };
    };

    class CLASS(stoneChunk): CLASS(ItemCore) {
        displayName = "$STR_MISERY_STONECHUNK_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_STONECHUNK_DESCRIPTION";
        picture = QPATHTOF(data\icons\stonepieces.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };

    class CLASS(ironIngot): CLASS(ItemCore) {
        displayName = "$STR_MISERY_IRONINGOT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_IRONINGOT_DESCRIPTION";
        picture = QPATHTOF(data\icons\ironingot.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };

    class CLASS(ironOre): CLASS(ItemCore) {
        displayName = "$STR_MISERY_IRONORE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_IRONORE_DESCRIPTION";
        picture = QPATHTOF(data\icons\ironore.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };

    class CLASS(ironPiece): CLASS(ItemCore) {
        displayName = "$STR_MISERY_IRONPIECE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_IRONPIECE_DESCRIPTION";
        picture = QPATHTOF(data\icons\ironpiece.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };

    class CLASS(goldIngot): CLASS(ItemCore) {
        displayName = "$STR_MISERY_GOLDINGOT_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_GOLDINGOT_DESCRIPTION";
        picture = QPATHTOF(data\icons\goldingot.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };

    class CLASS(goldOre): CLASS(ItemCore) {
        displayName = "$STR_MISERY_GOLDORE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_GOLDORE_DESCRIPTION";
        picture = QPATHTOF(data\icons\goldore.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };

    class CLASS(goldPiece): CLASS(ItemCore) {
        displayName = "$STR_MISERY_GOLDPIECE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_GOLDPIECE_DESCRIPTION";
        picture = QPATHTOF(data\icons\goldpiece.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };

    class CLASS(coalOre): CLASS(ItemCore) {
        displayName = "$STR_MISERY_COALORE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_COALORE_DESCRIPTION";
        picture = QPATHTOF(data\icons\coalore.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };

    class CLASS(malachite): CLASS(ItemCore) {
        displayName = "$STR_MISERY_MALACHITE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_MALACHITE_DESCRIPTION";
        picture = QPATHTOF(data\icons\malachite.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };

    class CLASS(ruby): CLASS(ItemCore) {
        displayName = "$STR_MISERY_RUBY_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_RUBY_DESCRIPTION";
        picture = QPATHTOF(data\icons\ruby.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };

    class CLASS(sapphire): CLASS(ItemCore) {
        displayName = "$STR_MISERY_SAPPHIRE_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_SAPPHIRE_DESCRIPTION";
        picture = QPATHTOF(data\icons\sapphire.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };

    class CLASS(amethyst): CLASS(ItemCore) {
        displayName = "$STR_MISERY_AMETHYST_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_AMETHYST_DESCRIPTION";
        picture = QPATHTOF(data\icons\amethyst.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };

    class CLASS(diamond): CLASS(ItemCore) {
        displayName = "$STR_MISERY_DIAMOND_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_DIAMOND_DESCRIPTION";
        picture = QPATHTOF(data\icons\diamond.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };

    class CLASS(emerald): CLASS(ItemCore) {
        displayName = "$STR_MISERY_EMERALD_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_EMERALD_DESCRIPTION";
        picture = QPATHTOF(data\icons\emerald.paa);
        scope = 2;
        scopeCurator = 2;

        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 0;
        };
    };
};
