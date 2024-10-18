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

    class CLASS(PureTablets): CLASS(ItemMagCore) {
        count = 30;
        descriptionShort = "$STR_MISERY_PAIN_DESCRIPTION";
        displayName = "$STR_MISERY_PAIN_DISPLAYNAME";
        mass = 2;
        model = "a3\structures_f_epa\items\medical\waterpurificationtablets_f.p3d";
        picture = QPATHTOF(data\icons\painkillers.paa);
        scope = 2;
    };

    class CLASS(Painkillers): CLASS(ItemMagCore) {
        count = 15;
        descriptionShort = "$STR_MISERY_PAIN_DESCRIPTION";
        displayName = "$STR_MISERY_PAIN_DISPLAYNAME";
        mass = 2;
        model = "a3\structures_f_epa\items\medical\painkillers_f.p3d";
        picture = QPATHTOF(data\icons\painkillers.paa);
        scope = 2;
    };

    class CLASS(Caffeine): CLASS(ItemMagCore) {
        count = 8;
        descriptionShort = "$STR_MISERY_CAFFEINE_DESCRIPTION";
        displayName = "$STR_MISERY_CAFFEINE_DISPLAYNAME";
        mass = 0.5;
        picture = QPATHTOF(data\icons\caffeine.paa);
        scope = 2;
    };

    class CLASS(CharcoalTablets): CLASS(ItemMagCore) {
        count = 10;
        descriptionShort = "$STR_MISERY_CHARCOALTABS_DESCRIPTION";
        displayName = "$STR_MISERY_CHARCOALTABS_DISPLAYNAME";
        mass = 0.5;
        picture = QPATHTOF(data\icons\charcoaltablets.paa);
        scope = 2;
    };

    class CLASS(Caffetin): CLASS(ItemMagCore) {
        count = 4;
        descriptionShort = "$STR_MISERY_CAFFETIN_DESCRIPTION";
        displayName = "$STR_MISERY_CAFFETIN_DISPLAYNAME";
        mass = 2;
        model = "\a3\structures_f_epa\Items\Medical\Antibiotic_F.p3d";
        picture = QPATHTOF(data\icons\caffetin.paa);
        scope = 2;
    };

    class CLASS(ClozapineBox): CLASS(ItemMagCore) {
        count = 8;
        descriptionShort = "$STR_MISERY_CLOZAPINEBOX_DESCRIPTION";
        displayName = "$STR_MISERY_CLOZAPINEBOX_DISPLAYNAME";
        mass = 2;
        picture = QPATHTOF(data\icons\clozapinebox.paa);
        scope = 2;
    };

    class CLASS(Antiparasitic): CLASS(ItemMagCore) {
        count = 8;
        descriptionShort = "$STR_MISERY_ANTIPARASITIC_DESCRIPTION";
        displayName = "$STR_MISERY_ANTIPARASITIC_DISPLAYNAME";
        mass = 2;
        model = "\a3\structures_f_epa\Items\Medical\Antibiotic_F.p3d";
        picture = QPATHTOF(data\icons\antiparasites.paa);
        scope = 2;
    };

    class CLASS(Antibiotic): CLASS(ItemMagCore) {
        count = 8;
        descriptionShort = "$STR_MISERY_ANTIBIOTIC_DESCRIPTION";
        displayName = "$STR_MISERY_ANTIBIOTIC_DISPLAYNAME";
        mass = 2;
        model = "\a3\structures_f_epa\Items\Medical\Antibiotic_F.p3d";
        picture = QPATHTOF(data\icons\antibiotics.paa);
        scope = 2;
    };

    class CLASS(SleepingPills): CLASS(ItemMagCore) {
        count = 8;
        descriptionShort = "$STR_MISERY_SLEEPPACK_DESCRIPTION";
        displayName = "$STR_MISERY_SLEEPPACK_DISPLAYNAME";
        mass = 2;
        model = "\a3\structures_f_epa\Items\Medical\Antibiotic_F.p3d";
        picture = QPATHTOF(data\icons\sleepingpillsbox.paa);
        scope = 2;
    };

    class CLASS(PotassiumIodate): CLASS(ItemMagCore) {
        count = 15;
        descriptionShort = "Contains Anti-Radiation tablets";
        displayName = "Potassium Iodate";
        mass = 2;
        model = "\a3\structures_f_epa\Items\Medical\VitaminBottle_F.p3d";
        picture = QPATHTOF(data\icons\potassiumiodate2.paa);
        scope = 2;
    };

    class CLASS(CenestinBottle): CLASS(ItemMagCore) {
        count = 15;
        descriptionShort = "$STR_MISERY_CENESTINBOTTLE_DESCRIPTION";
        displayName = "$STR_MISERY_CENESTINBOTTLE_DISPLAYNAME";
        mass = 2;
        model = "\a3\structures_f_epa\Items\Medical\VitaminBottle_F.p3d";
        picture = QPATHTOF(data\icons\cenestinbottle.paa);
        scope = 2;
    };

    class CLASS(Lighter): CLASS(ItemMagCore) {
        count = 100;
        descriptionShort = "$STR_MISERY_LIGHTER_DESCRIPTION";
        displayName = "$STR_MISERY_LIGHTER_DISPLAYNAME";
        mass = 5;
        model = QPATHTOF(data\models\lighter.p3d);
        picture = QPATHTOF(data\icons\lighter.paa);
        scope = 2;
    };

    class CLASS(ElectricHandsaw): CLASS(ItemMagCore) {
        count = 10;
        descriptionShort = "$STR_MISERY_ELECTRICHANDSAW_DESCRIPTION";
        displayName = "$STR_MISERY_ELECTRICHANDSAW_DISPLAYNAME";
        mass = 25;
        picture = QPATHTOF(data\icons\electrichandcircularsaw.paa);
        scope = 2;
    };

    class CLASS(Chainsaw): CLASS(ItemMagCore) {
        count = 25;
        descriptionShort = "$STR_MISERY_CHAINSAW_DESCRIPTION";
        displayName = "$STR_MISERY_CHAINSAW_DISPLAYNAME";
        mass = 100;
        model = QPATHTOF(data\models\chainsaw.p3d);
        picture = QPATHTOF(data\icons\chainsaw.paa);
        scope = 2;
    };

    class CLASS(SawFuel): CLASS(ItemMagCore) {
        count = 100;
        descriptionShort = "$STR_MISERY_SAWFUEL_DESCRIPTION";
        displayName = "$STR_MISERY_SAWFUEL_DISPLAYNAME";
        mass = 10;
        model = "a3\structures_f\items\vessels\canisteroil_f.p3d";
        picture = QPATHTOF(data\icons\sawfuel.paa);
        scope = 2;
    };

    class CLASS(ERU_On): CLASS(ItemMagCore) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = "$STR_MISERY_ERU_DESCRIPTION";
        displayName = "$STR_MISERY_ERU_DISPLAYNAME";
        mass = 7;
        picture = QPATHTOF(data\icons\eru_on.paa);
        scope = 2;
    };

    class CLASS(ERU_Off): CLASS(ItemMagCore) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = "$STR_MISERY_ERU_OFF_DESCRIPTION";
        displayName = "$STR_MISERY_ERU_OFF_DISPLAYNAME";
        mass = 7;
        picture = QPATHTOF(data\icons\eru_off.paa);
        scope = 2;
    };

    class CLASS(HeadlampON): CLASS(ItemMagCore) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = "$STR_MISERY_HEADLAMPON_DESCRIPTION";
        displayName = "$STR_MISERY_HEADLAMPON_DISPLAYNAME";
        mass = 10;
        picture = QPATHTOF(data\icons\headlamp.paa);
        scope = 2;
    };

    class CLASS(HeadlampOFF): CLASS(ItemMagCore) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = "$STR_MISERY_HEADLAMPOFF_DESCRIPTION";
        displayName = "$STR_MISERY_HEADLAMPOFF_DISPLAYNAME";
        mass = 10;
        picture = QPATHTOF(data\icons\headlamp.paa);
        scope = 2;
    };

    class CLASS(PersonalGeigerOn): CLASS(ItemMagCore) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = "$STR_MISERY_PERSONALGEIGER_DESCRIPTION";
        displayName = "$STR_MISERY_PERSONALGEIGER_DISPLAYNAME";
        mass = 10;
        model = "\A3\Weapons_F\Items\MineDetector";
        picture = QPATHTOF(data\icons\personalgeiger.paa);
        scope = 2;
    };

    class CLASS(PersonalGeigerOff): CLASS(ItemMagCore) {
        ace_disableRepacking = 1;
        scope = 2;
        displayName = "$STR_MISERY_PERSONALGEIGEROFF_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_PERSONALGEIGEROFF_DESCRIPTION";
        picture = QPATHTOF(data\icons\personalgeigernobattery.paa);
        model = "\A3\Weapons_F\Items\MineDetector";
        count = 100;
        mass = 10;
    };

    class CLASS(RFHighRangeOn): CLASS(ItemMagCore) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = "$STR_MISERY_RFHIGHRANGE_DESCRIPTION";
        displayName = "$STR_MISERY_RFHIGHRANGEON_DISPLAYNAME";
        mass = 5;
        model = "\A3\Weapons_F\Items\MineDetector";
        picture = QPATHTOF(data\icons\emfdetectorhighrange.paa);
        scope = 2;
    };

    class CLASS(RFHighRangeOff): CLASS(ItemMagCore) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = "$STR_MISERY_RFHIGHRANGE_DESCRIPTION";
        displayName = "$STR_MISERY_RFHIGHRANGEOFF_DISPLAYNAME";
        mass = 5;
        model = "\A3\Weapons_F\Items\MineDetector";
        picture = QPATHTOF(data\icons\emfdetectorhighrangenobattery.paa);
        scope = 2;
    };

    class CLASS(AutoBatt): CLASS(ItemMagCore) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = "$STR_MISERY_AUTOBATT_DESCRIPTION";
        displayName = "$STR_MISERY_AUTOBATT_DISPLAYNAME";
        mass = 110;
        model = "a3\structures_f_bootcamp\items\electronics\carbattery_02_f.p3d";
        picture = QPATHTOF(data\icons\autobatt.paa);
        scope = 2;
    };

    class CLASS(AutoBatt_Heavy): CLASS(ItemMagCore) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = "$STR_MISERY_AUTOBATTHEAVY_DESCRIPTION";
        displayName = "$STR_MISERY_AUTOBATTHEAVY_DISPLAYNAME";
        mass = 200;
        model = "a3\structures_f_bootcamp\items\electronics\carbattery_01_f.p3d";
        picture = QPATHTOF(data\icons\autobatt_heavy.paa);
        scope = 2;
    };

    class CLASS(Matches): CLASS(ItemMagCore) {
        count = 20;
        descriptionShort = "$STR_MISERY_MATCHESPACK_DESCRIPTION";
        displayName = "$STR_MISERY_MATCHESPACK_DISPLAYNAME";
        mass = 3;
        model = "a3\structures_f_epa\items\tools\matches_f.p3d";
        picture = QPATHTOF(data\icons\matchespack.paa);
        scope = 2;
    };

    class CLASS(CigarettePack): CLASS(ItemMagCore) {
        count = 20;
        descriptionShort = "$STR_MISERY_CIGARETTEPACK_DESCRIPTION";
        displayName = "$STR_MISERY_CIGARETTEPACK_DISPLAYNAME";
        mass = 2;
        model = QPATHTOF(data\models\cigarettes.p3d);
        picture = QPATHTOF(data\icons\cigpack.paa);
        scope = 2;
    };

    class CLASS(Cigar): CLASS(ItemMagCore) {
        count = 4;
        descriptionShort = "$STR_MISERY_CIGAR_DESCRIPTION";
        displayName = "$STR_MISERY_CIGAR_DISPLAYNAME";
        mass = 1;
        picture = QPATHTOF(data\icons\cigar.paa);
        scope = 2;
    };

    class CLASS(WolfBeer): CLASS(ItemMagCore) {
        count = 4;
        descriptionShort = "$STR_MISERY_WOLFBEER_DESCRIPTION";
        displayName = "$STR_MISERY_WOLFBEER_DISPLAYNAME";
        hiddenSelectionsMaterials[] = {QPATHTOF(data\rvmats\beer.rvmat)};
        mass = 20;
        model = QPATHTOF(data\models\beer.p3d);
        picture = QPATHTOF(data\icons\wolfbeer.paa);
        scope = 2;
    };

    class CLASS(Vodka): CLASS(ItemMagCore) {
        count = 8;
        descriptionShort = "$STR_MISERY_VODKA_DESCRIPTION";
        displayName = "$STR_MISERY_VODKA_DISPLAYNAME";
        hiddenSelectionsMaterials[] = {QPATHTOF(data\rvmats\vodka.rvmat)};
        mass = 35;
        model = QPATHTOF(data\models\vodka.p3d);
        picture = QPATHTOF(data\icons\vodka.paa);
        scope = 2;
    };

    class CLASS(CanteenPurified): CLASS(ItemMagCore) {
        count = 8;
        descriptionShort = "$STR_MISERY_CANTEENPURIFIED_DESCRIPTION";
        displayName = "$STR_MISERY_CANTEENPURIFIED_DISPLAYNAME";
        mass = 30;
        model = "a3\structures_f_epa\items\food\canteen_f.p3d";
        picture = QPATHTOF(data\icons\canteen.paa);
        scope = 2;
    };

    class CLASS(CanteenClean): CLASS(ItemMagCore) {
        count = 8;
        descriptionShort = "$STR_MISERY_CANTEENCLEAN_DESCRIPTION";
        displayName = "$STR_MISERY_CANTEENCLEAN_DISPLAYNAME";
        mass = 30;
        model = "a3\structures_f_epa\items\food\canteen_f.p3d";
        picture = QPATHTOF(data\icons\canteen.paa);
        scope = 2;
    };

    class CLASS(CanteenDirty): CLASS(ItemMagCore) {
        count = 8;
        descriptionShort = "$STR_MISERY_CANTEENDIRTY_DESCRIPTION";
        displayName = "$STR_MISERY_CANTEENDIRTY_DISPLAYNAME";
        mass = 30;
        model = "a3\structures_f_epa\items\food\canteen_f.p3d";
        picture = QPATHTOF(data\icons\canteen.paa);
        scope = 2;
    };

    class CLASS(WaterBottlePurified): CLASS(ItemMagCore) {
        count = 4;
        descriptionShort = "$STR_MISERY_WATERBOTTLEPURIFIED_DESCRIPTION";
        displayName = "$STR_MISERY_WATERBOTTLEPURIFIED_DISPLAYNAME";
        mass = 15;
        model = "a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d";
        picture = QPATHTOF(data\icons\waterbottle.paa);
        scope = 2;
    };

    class CLASS(WaterBottleClean): CLASS(ItemMagCore) {
        count = 4;
        descriptionShort = "$STR_MISERY_WATERBOTTLECLEAN_DESCRIPTION";
        displayName = "$STR_MISERY_WATERBOTTLECLEAN_DISPLAYNAME";
        mass = 15;
        model = "a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d";
        picture = QPATHTOF(data\icons\waterbottle.paa);
        scope = 2;
    };

    class CLASS(WaterBottleDirty): CLASS(ItemMagCore) {
        count = 4;
        descriptionShort = "$STR_MISERY_WATERBOTTLEDIRTY_DESCRIPTION";
        displayName = "$STR_MISERY_WATERBOTTLEDIRTY_DISPLAYNAME";
        mass = 15;
        model = "a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d";
        picture = QPATHTOF(data\icons\waterbottle.paa);
        scope = 2;
    };

    class CLASS(CoffeeGrounds): CLASS(ItemMagCore) {
        count = 4;
        descriptionShort = "$STR_MISERY_COFFEEGROUNDS_DESCRIPTION";
        displayName = "$STR_MISERY_COFFEEGROUNDS_DISPLAYNAME";
        mass = 10;
        model = QPATHTOF(data\models\coffeegrounds.p3d);
        picture = QPATHTOF(data\icons\coffeegrounds.paa);
        scope = 2;
    };

    class CLASS(Rice): CLASS(ItemMagCore) {
        count = 20;
        descriptionShort = "$STR_MISERY_RICE_DESCRIPTION";
        displayName = "$STR_MISERY_RICE_DISPLAYNAME";
        mass = 15;
        model = "a3\structures_f_epa\items\food\ricebox_f.p3d";
        picture = QPATHTOF(data\icons\rice.paa);
        scope = 2;
    };

    class CLASS(WaterJerryF): CLASS(ItemMagCore) {
        count = 20;
        descriptionShort = "$STR_MISERY_WATERJERRYF_DESCRIPTION";
        displayName = "$STR_MISERY_WATERJERRYF_DISPLAYNAME";
        mass = 150;
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        picture = QPATHTOF(data\icons\canisterwater.paa);
        scope = 2;
    };

    class CLASS(WaterJerryFD): CLASS(ItemMagCore) {
        count = 20;
        descriptionShort = "$STR_MISERY_WATERJERRYFD_DESCRIPTION";
        displayName = "$STR_MISERY_WATERJERRYFD_DISPLAYNAME";
        mass = 150;
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        picture = QPATHTOF(data\icons\canisterwater.paa);
        scope = 2;
    };

    class CLASS(JetFuel): CLASS(ItemMagCore) {
        count = 20;
        descriptionShort = "$STR_MISERY_JETFUELF_DESCRIPTION";
        displayName = "$STR_MISERY_JETFUELF_DISPLAYNAME";
        mass = 150;
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        picture = QPATHTOF(data\icons\canisterjetfuel.paa);
        scope = 2;
    };

    class CLASS(Diesel): CLASS(ItemMagCore) {
        count = 20;
        descriptionShort = "$STR_MISERY_DIESELF_DESCRIPTION";
        displayName = "$STR_MISERY_DIESELF_DISPLAYNAME";
        mass = 150;
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        picture = QPATHTOF(data\icons\canisterdiesel.paa);
        scope = 2;
    };

    class CLASS(Petrol): CLASS(ItemMagCore) {
        count = 20;
        descriptionShort = "$STR_MISERY_PETROLF_DESCRIPTION";
        displayName = "$STR_MISERY_PETROLF_DISPLAYNAME";
        mass = 150;
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        picture = QPATHTOF(data\icons\canisterpetrol.paa);
        scope = 2;
    };
};

