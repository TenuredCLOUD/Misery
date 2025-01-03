class CfgMagazines {
    class Laserbatteries;
    class CLASS(ItemMagCore): Laserbatteries {
        author = "TenuredCLOUD";
        scope = 0;
        displaynameshort = "";
        displayName = "";
        picture = "";
        descriptionShort = "";
    };

    class CLASS(pureTablets): CLASS(ItemMagCore) {
        count = 30;
        descriptionShort = "$STR_MISERY_PAIN_DESCRIPTION";
        displayName = "$STR_MISERY_PAIN_DISPLAYNAME";
        mass = 2;
        model = "a3\structures_f_epa\items\medical\waterpurificationtablets_f.p3d";
        picture = QPATHTOF(data\icons\painkillers.paa);
        scope = 2;
    };

    class CLASS(painkillers): CLASS(ItemMagCore) {
        count = 15;
        descriptionShort = "$STR_MISERY_PAIN_DESCRIPTION";
        displayName = "$STR_MISERY_PAIN_DISPLAYNAME";
        mass = 2;
        model = "a3\structures_f_epa\items\medical\painkillers_f.p3d";
        picture = QPATHTOF(data\icons\painkillers.paa);
        scope = 2;
    };

    class CLASS(caffeine): CLASS(ItemMagCore) {
        count = 8;
        descriptionShort = "$STR_MISERY_CAFFEINE_DESCRIPTION";
        displayName = "$STR_MISERY_CAFFEINE_DISPLAYNAME";
        mass = 0.5;
        picture = QPATHTOF(data\icons\caffeine.paa);
        scope = 2;
    };

    class CLASS(charcoalTablets): CLASS(ItemMagCore) {
        count = 10;
        descriptionShort = "$STR_MISERY_CHARCOALTABS_DESCRIPTION";
        displayName = "$STR_MISERY_CHARCOALTABS_DISPLAYNAME";
        mass = 0.5;
        picture = QPATHTOF(data\icons\charcoaltablets.paa);
        scope = 2;
    };

    class CLASS(caffetin): CLASS(ItemMagCore) {
        count = 4;
        descriptionShort = "$STR_MISERY_CAFFETIN_DESCRIPTION";
        displayName = "$STR_MISERY_CAFFETIN_DISPLAYNAME";
        mass = 2;
        model = "\a3\structures_f_epa\Items\Medical\Antibiotic_F.p3d";
        picture = QPATHTOF(data\icons\caffetin.paa);
        scope = 2;
    };

    class CLASS(clozapineBox): CLASS(ItemMagCore) {
        count = 8;
        descriptionShort = "$STR_MISERY_CLOZAPINEBOX_DESCRIPTION";
        displayName = "$STR_MISERY_CLOZAPINEBOX_DISPLAYNAME";
        mass = 2;
        picture = QPATHTOF(data\icons\clozapinebox.paa);
        scope = 2;
    };

    class CLASS(antiparasitic): CLASS(ItemMagCore) {
        count = 8;
        descriptionShort = "$STR_MISERY_ANTIPARASITIC_DESCRIPTION";
        displayName = "$STR_MISERY_ANTIPARASITIC_DISPLAYNAME";
        mass = 2;
        model = "\a3\structures_f_epa\Items\Medical\Antibiotic_F.p3d";
        picture = QPATHTOF(data\icons\antiparasites.paa);
        scope = 2;
    };

    class CLASS(antibiotic): CLASS(ItemMagCore) {
        count = 8;
        descriptionShort = "$STR_MISERY_ANTIBIOTIC_DESCRIPTION";
        displayName = "$STR_MISERY_ANTIBIOTIC_DISPLAYNAME";
        mass = 2;
        model = "\a3\structures_f_epa\Items\Medical\Antibiotic_F.p3d";
        picture = QPATHTOF(data\icons\antibiotics.paa);
        scope = 2;
    };

    class CLASS(sleepingPills): CLASS(ItemMagCore) {
        count = 8;
        descriptionShort = "$STR_MISERY_SLEEPPACK_DESCRIPTION";
        displayName = "$STR_MISERY_SLEEPPACK_DISPLAYNAME";
        mass = 2;
        model = "\a3\structures_f_epa\Items\Medical\Antibiotic_F.p3d";
        picture = QPATHTOF(data\icons\sleepingpillsbox.paa);
        scope = 2;
    };

    class CLASS(potassiumIodate): CLASS(ItemMagCore) {
        count = 15;
        descriptionShort = "Contains Anti-Radiation tablets";
        displayName = "Potassium Iodate";
        mass = 2;
        model = "\a3\structures_f_epa\Items\Medical\VitaminBottle_F.p3d";
        picture = QPATHTOF(data\icons\potassiumiodate2.paa);
        scope = 2;
    };

    class CLASS(cenestinBottle): CLASS(ItemMagCore) {
        count = 15;
        descriptionShort = "$STR_MISERY_CENESTINBOTTLE_DESCRIPTION";
        displayName = "$STR_MISERY_CENESTINBOTTLE_DISPLAYNAME";
        mass = 2;
        model = "\a3\structures_f_epa\Items\Medical\VitaminBottle_F.p3d";
        picture = QPATHTOF(data\icons\cenestinbottle.paa);
        scope = 2;
    };

    class CLASS(lighter): CLASS(ItemMagCore) {
        count = 100;
        descriptionShort = "$STR_MISERY_LIGHTER_DESCRIPTION";
        displayName = "$STR_MISERY_LIGHTER_DISPLAYNAME";
        mass = 5;
        model = QPATHTOF(data\models\lighter.p3d);
        picture = QPATHTOF(data\icons\lighter.paa);
        scope = 2;
    };

    class CLASS(matchBox): CLASS(ItemMagCore) {
        count = 20;
        descriptionShort = "$STR_MISERY_LIGHTER_DESCRIPTION";
        displayName = "$STR_MISERY_LIGHTER_DISPLAYNAME";
        mass = 1;
        model = "a3\structures_f_epa\items\tools\matches_f.p3d";
        picture = QPATHTOF(data\icons\lighter.paa);
        scope = 2;
    };

    class CLASS(electricHandsaw): CLASS(ItemMagCore) {
        count = 10;
        descriptionShort = "$STR_MISERY_ELECTRICHANDSAW_DESCRIPTION";
        displayName = "$STR_MISERY_ELECTRICHANDSAW_DISPLAYNAME";
        mass = 25;
        picture = QPATHTOF(data\icons\electrichandcircularsaw.paa);
        scope = 2;
    };

    class CLASS(chainsaw): CLASS(ItemMagCore) {
        count = 25;
        descriptionShort = "$STR_MISERY_CHAINSAW_DESCRIPTION";
        displayName = "$STR_MISERY_CHAINSAW_DISPLAYNAME";
        mass = 100;
        model = QPATHTOF(data\models\chainsaw.p3d);
        picture = QPATHTOF(data\icons\chainsaw.paa);
        scope = 2;
    };

    class CLASS(sawFuel): CLASS(ItemMagCore) {
        count = 100;
        descriptionShort = "$STR_MISERY_SAWFUEL_DESCRIPTION";
        displayName = "$STR_MISERY_SAWFUEL_DISPLAYNAME";
        mass = 10;
        model = "a3\structures_f\items\vessels\canisteroil_f.p3d";
        picture = QPATHTOF(data\icons\sawfuel.paa);
        scope = 2;
    };

    class CLASS(eru_On): CLASS(ItemMagCore) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = "$STR_MISERY_ERU_DESCRIPTION";
        displayName = "$STR_MISERY_ERU_DISPLAYNAME";
        mass = 7;
        picture = QPATHTOF(data\icons\eru_on.paa);
        scope = 2;
    };

    class CLASS(eru_Off): CLASS(ItemMagCore) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = "$STR_MISERY_ERU_OFF_DESCRIPTION";
        displayName = "$STR_MISERY_ERU_OFF_DISPLAYNAME";
        mass = 7;
        picture = QPATHTOF(data\icons\eru_off.paa);
        scope = 2;
    };

    class CLASS(headlamp_On): CLASS(ItemMagCore) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = "$STR_MISERY_HEADLAMPON_DESCRIPTION";
        displayName = "$STR_MISERY_HEADLAMPON_DISPLAYNAME";
        mass = 10;
        picture = QPATHTOF(data\icons\headlamp.paa);
        scope = 2;
    };

    class CLASS(headlamp_Off): CLASS(ItemMagCore) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = "$STR_MISERY_HEADLAMPOFF_DESCRIPTION";
        displayName = "$STR_MISERY_HEADLAMPOFF_DISPLAYNAME";
        mass = 10;
        picture = QPATHTOF(data\icons\headlamp.paa);
        scope = 2;
    };

    class CLASS(geiger_On): CLASS(ItemMagCore) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = "$STR_MISERY_PERSONALGEIGER_DESCRIPTION";
        displayName = "$STR_MISERY_PERSONALGEIGER_DISPLAYNAME";
        mass = 10;
        model = "\A3\Weapons_F\Items\MineDetector";
        picture = QPATHTOF(data\icons\personalgeiger.paa);
        scope = 2;
    };

    class CLASS(geiger_Off): CLASS(ItemMagCore) {
        ace_disableRepacking = 1;
        scope = 2;
        displayName = "$STR_MISERY_PERSONALGEIGEROFF_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_PERSONALGEIGEROFF_DESCRIPTION";
        picture = QPATHTOF(data\icons\personalgeigernobattery.paa);
        model = "\A3\Weapons_F\Items\MineDetector";
        count = 100;
        mass = 10;
    };

    class CLASS(rfHighRange_On): CLASS(ItemMagCore) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = "$STR_MISERY_RFHIGHRANGE_DESCRIPTION";
        displayName = "$STR_MISERY_RFHIGHRANGEON_DISPLAYNAME";
        mass = 5;
        model = "\A3\Weapons_F\Items\MineDetector";
        picture = QPATHTOF(data\icons\emfdetectorhighrange.paa);
        scope = 2;
    };

    class CLASS(rfHighRange_Off): CLASS(ItemMagCore) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = "$STR_MISERY_RFHIGHRANGE_DESCRIPTION";
        displayName = "$STR_MISERY_RFHIGHRANGEOFF_DISPLAYNAME";
        mass = 5;
        model = "\A3\Weapons_F\Items\MineDetector";
        picture = QPATHTOF(data\icons\emfdetectorhighrangenobattery.paa);
        scope = 2;
    };

    class CLASS(autoBattery): CLASS(ItemMagCore) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = "$STR_MISERY_AUTOBATT_DESCRIPTION";
        displayName = "$STR_MISERY_AUTOBATT_DISPLAYNAME";
        mass = 110;
        model = "a3\structures_f_bootcamp\items\electronics\carbattery_02_f.p3d";
        picture = QPATHTOF(data\icons\autobatt.paa);
        scope = 2;
    };

    class CLASS(autoBattery_Heavy): CLASS(ItemMagCore) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = "$STR_MISERY_AUTOBATTHEAVY_DESCRIPTION";
        displayName = "$STR_MISERY_AUTOBATTHEAVY_DISPLAYNAME";
        mass = 200;
        model = "a3\structures_f_bootcamp\items\electronics\carbattery_01_f.p3d";
        picture = QPATHTOF(data\icons\autobatt_heavy.paa);
        scope = 2;
    };

    class CLASS(matches): CLASS(ItemMagCore) {
        count = 20;
        descriptionShort = "box of weathered matches";
        displayName = "Match Box";
        mass = 3;
        model = "a3\structures_f_epa\items\tools\matches_f.p3d";
        picture = QPATHTOF(data\icons\matchespack.paa);
        scope = 2;
    };

    class CLASS(cigarettePack): CLASS(ItemMagCore) {
        count = 20;
        descriptionShort = "$STR_MISERY_CIGARETTEPACK_DESCRIPTION";
        displayName = "$STR_MISERY_CIGARETTEPACK_DISPLAYNAME";
        mass = 2;
        model = QPATHTOF(data\models\cigarettes.p3d);
        picture = QPATHTOF(data\icons\cigpack.paa);
        scope = 2;
    };

    class CLASS(cigar): CLASS(ItemMagCore) {
        count = 4;
        descriptionShort = "$STR_MISERY_CIGAR_DESCRIPTION";
        displayName = "$STR_MISERY_CIGAR_DISPLAYNAME";
        mass = 1;
        picture = QPATHTOF(data\icons\cigar.paa);
        scope = 2;
    };

    class CLASS(wolfBeer): CLASS(ItemMagCore) {
        count = 4;
        descriptionShort = "$STR_MISERY_WOLFBEER_DESCRIPTION";
        displayName = "$STR_MISERY_WOLFBEER_DISPLAYNAME";
        hiddenSelectionsMaterials[] = {QPATHTOF(data\rvmats\beer.rvmat)};
        mass = 20;
        model = QPATHTOF(data\models\beer.p3d);
        picture = QPATHTOF(data\icons\wolfbeer.paa);
        scope = 2;
    };

    class CLASS(vodka): CLASS(ItemMagCore) {
        count = 8;
        descriptionShort = "$STR_MISERY_VODKA_DESCRIPTION";
        displayName = "$STR_MISERY_VODKA_DISPLAYNAME";
        hiddenSelectionsMaterials[] = {QPATHTOF(data\rvmats\vodka.rvmat)};
        mass = 35;
        model = QPATHTOF(data\models\vodka.p3d);
        picture = QPATHTOF(data\icons\vodka.paa);
        scope = 2;
    };

    class CLASS(canteen_Purified): CLASS(ItemMagCore) {
        count = 8;
        descriptionShort = "$STR_MISERY_CANTEENPURIFIED_DESCRIPTION";
        displayName = "$STR_MISERY_CANTEENPURIFIED_DISPLAYNAME";
        mass = 30;
        model = "a3\structures_f_epa\items\food\canteen_f.p3d";
        picture = QPATHTOF(data\icons\canteen.paa);
        scope = 2;
    };

    class CLASS(canteen_Clean): CLASS(ItemMagCore) {
        count = 8;
        descriptionShort = "$STR_MISERY_CANTEENCLEAN_DESCRIPTION";
        displayName = "$STR_MISERY_CANTEENCLEAN_DISPLAYNAME";
        mass = 30;
        model = "a3\structures_f_epa\items\food\canteen_f.p3d";
        picture = QPATHTOF(data\icons\canteen.paa);
        scope = 2;
    };

    class CLASS(canteen_Dirty): CLASS(ItemMagCore) {
        count = 8;
        descriptionShort = "$STR_MISERY_CANTEENDIRTY_DESCRIPTION";
        displayName = "$STR_MISERY_CANTEENDIRTY_DISPLAYNAME";
        mass = 30;
        model = "a3\structures_f_epa\items\food\canteen_f.p3d";
        picture = QPATHTOF(data\icons\canteen.paa);
        scope = 2;
    };

    class CLASS(waterBottle_Purified): CLASS(ItemMagCore) {
        count = 4;
        descriptionShort = "$STR_MISERY_WATERBOTTLEPURIFIED_DESCRIPTION";
        displayName = "$STR_MISERY_WATERBOTTLEPURIFIED_DISPLAYNAME";
        mass = 15;
        model = "a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d";
        picture = QPATHTOF(data\icons\waterbottle.paa);
        scope = 2;
    };

    class CLASS(waterBottle_Clean): CLASS(ItemMagCore) {
        count = 4;
        descriptionShort = "$STR_MISERY_WATERBOTTLECLEAN_DESCRIPTION";
        displayName = "$STR_MISERY_WATERBOTTLECLEAN_DISPLAYNAME";
        mass = 15;
        model = "a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d";
        picture = QPATHTOF(data\icons\waterbottle.paa);
        scope = 2;
    };

    class CLASS(waterBottle_Dirty): CLASS(ItemMagCore) {
        count = 4;
        descriptionShort = "$STR_MISERY_WATERBOTTLEDIRTY_DESCRIPTION";
        displayName = "$STR_MISERY_WATERBOTTLEDIRTY_DISPLAYNAME";
        mass = 15;
        model = "a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d";
        picture = QPATHTOF(data\icons\waterbottle.paa);
        scope = 2;
    };

    class CLASS(coffeeGrounds): CLASS(ItemMagCore) {
        count = 4;
        descriptionShort = "$STR_MISERY_COFFEEGROUNDS_DESCRIPTION";
        displayName = "$STR_MISERY_COFFEEGROUNDS_DISPLAYNAME";
        mass = 10;
        model = QPATHTOF(data\models\coffeegrounds.p3d);
        picture = QPATHTOF(data\icons\coffeegrounds.paa);
        scope = 2;
    };

    class CLASS(rice): CLASS(ItemMagCore) {
        count = 20;
        descriptionShort = "$STR_MISERY_RICE_DESCRIPTION";
        displayName = "$STR_MISERY_RICE_DISPLAYNAME";
        mass = 15;
        model = "a3\structures_f_epa\items\food\ricebox_f.p3d";
        picture = QPATHTOF(data\icons\rice.paa);
        scope = 2;
    };

    class CLASS(waterJerryCan_Full): CLASS(ItemMagCore) {
        count = 20;
        descriptionShort = "$STR_MISERY_WATERJERRYF_DESCRIPTION";
        displayName = "$STR_MISERY_WATERJERRYF_DISPLAYNAME";
        mass = 150;
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        picture = QPATHTOF(data\icons\canisterwater.paa);
        scope = 2;
    };

    class CLASS(waterJerryCan_FullDirty): CLASS(ItemMagCore) {
        count = 20;
        descriptionShort = "$STR_MISERY_WATERJERRYFD_DESCRIPTION";
        displayName = "$STR_MISERY_WATERJERRYFD_DISPLAYNAME";
        mass = 150;
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        picture = QPATHTOF(data\icons\canisterwater.paa);
        scope = 2;
    };

    class CLASS(jetFuel): CLASS(ItemMagCore) {
        count = 20;
        descriptionShort = "$STR_MISERY_JETFUELF_DESCRIPTION";
        displayName = "$STR_MISERY_JETFUELF_DISPLAYNAME";
        mass = 150;
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        picture = QPATHTOF(data\icons\canisterjetfuel.paa);
        scope = 2;
    };

    class CLASS(diesel): CLASS(ItemMagCore) {
        count = 20;
        descriptionShort = "$STR_MISERY_DIESELF_DESCRIPTION";
        displayName = "$STR_MISERY_DIESELF_DISPLAYNAME";
        mass = 150;
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        picture = QPATHTOF(data\icons\canisterdiesel.paa);
        scope = 2;
    };

    class CLASS(petrol): CLASS(ItemMagCore) {
        count = 20;
        descriptionShort = "$STR_MISERY_PETROLF_DESCRIPTION";
        displayName = "$STR_MISERY_PETROLF_DISPLAYNAME";
        mass = 150;
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        picture = QPATHTOF(data\icons\canisterpetrol.paa);
        scope = 2;
    };
};

