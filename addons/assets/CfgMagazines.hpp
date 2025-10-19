class CfgMagazines {
    class CA_Magazine;
    class CLASS(FakeMagazine): CA_Magazine {
        scopeCurator = 1;
        descriptionShort = "";
        displayName = "";
        displayNameShort = "";
        count = 0;
    };

    class CLASS(pureTablets): CLASS(FakeMagazine) {
        count = 30;
        descriptionShort = "$STR_MISERY_PAIN_DESCRIPTION";
        displayName = "$STR_MISERY_PAIN_DISPLAYNAME";
        mass = 2;
        model = "a3\structures_f_epa\items\medical\waterpurificationtablets_f.p3d";
        picture = QPATHTOF(data\icons\painkillers.paa);
        scope = 2;
    };

    class CLASS(painkillers): CLASS(FakeMagazine) {
        count = 15;
        descriptionShort = "$STR_MISERY_PAIN_DESCRIPTION";
        displayName = "$STR_MISERY_PAIN_DISPLAYNAME";
        mass = 2;
        model = "a3\structures_f_epa\items\medical\painkillers_f.p3d";
        picture = QPATHTOF(data\icons\painkillers.paa);
        scope = 2;
    };

    class CLASS(caffeine): CLASS(FakeMagazine) {
        count = 8;
        descriptionShort = "$STR_MISERY_CAFFEINE_DESCRIPTION";
        displayName = "$STR_MISERY_CAFFEINE_DISPLAYNAME";
        mass = 0.5;
        picture = QPATHTOF(data\icons\caffeine.paa);
        scope = 2;
    };

    class CLASS(charcoalTablets): CLASS(FakeMagazine) {
        count = 10;
        descriptionShort = "$STR_MISERY_CHARCOALTABS_DESCRIPTION";
        displayName = "$STR_MISERY_CHARCOALTABS_DISPLAYNAME";
        mass = 0.5;
        picture = QPATHTOF(data\icons\charcoaltablets.paa);
        scope = 2;
    };

    class CLASS(caffetin): CLASS(FakeMagazine) {
        count = 4;
        descriptionShort = "$STR_MISERY_CAFFETIN_DESCRIPTION";
        displayName = "$STR_MISERY_CAFFETIN_DISPLAYNAME";
        mass = 2;
        model = "\a3\structures_f_epa\Items\Medical\Antibiotic_F.p3d";
        picture = QPATHTOF(data\icons\caffetin.paa);
        scope = 2;
    };

    class CLASS(clozapineBox): CLASS(FakeMagazine) {
        count = 8;
        descriptionShort = "$STR_MISERY_CLOZAPINEBOX_DESCRIPTION";
        displayName = "$STR_MISERY_CLOZAPINEBOX_DISPLAYNAME";
        mass = 2;
        picture = QPATHTOF(data\icons\clozapinebox.paa);
        scope = 2;
    };

    class CLASS(antiparasitic): CLASS(FakeMagazine) {
        count = 8;
        descriptionShort = "$STR_MISERY_ANTIPARASITIC_DESCRIPTION";
        displayName = "$STR_MISERY_ANTIPARASITIC_DISPLAYNAME";
        mass = 2;
        model = "\a3\structures_f_epa\Items\Medical\Antibiotic_F.p3d";
        picture = QPATHTOF(data\icons\antiparasites.paa);
        scope = 2;
    };

    class CLASS(antibiotic): CLASS(FakeMagazine) {
        count = 8;
        descriptionShort = "$STR_MISERY_ANTIBIOTIC_DESCRIPTION";
        displayName = "$STR_MISERY_ANTIBIOTIC_DISPLAYNAME";
        mass = 2;
        model = "\a3\structures_f_epa\Items\Medical\Antibiotic_F.p3d";
        picture = QPATHTOF(data\icons\antibiotics.paa);
        scope = 2;
    };

    class CLASS(deconKit): CLASS(FakeMagazine) {
        count = 6;
        descriptionShort = "- military decontamination kit";
        displayName = "Decon Kit";
        mass = 10;
        model = "\a3\props_f_enoch\military\decontamination\deconkit_01_f.p3d";
        picture = QPATHTOF(data\icons\deconKit.paa);
        scope = 2;
    };

    class CLASS(sleepingPills): CLASS(FakeMagazine) {
        count = 8;
        descriptionShort = "$STR_MISERY_SLEEPPACK_DESCRIPTION";
        displayName = "$STR_MISERY_SLEEPPACK_DISPLAYNAME";
        mass = 2;
        model = "\a3\structures_f_epa\Items\Medical\Antibiotic_F.p3d";
        picture = QPATHTOF(data\icons\sleepingpillsbox.paa);
        scope = 2;
    };

    class CLASS(potassiumIodate): CLASS(FakeMagazine) {
        count = 15;
        descriptionShort = "Contains Anti-Radiation tablets";
        displayName = "Potassium Iodate";
        mass = 2;
        model = "\a3\structures_f_epa\Items\Medical\VitaminBottle_F.p3d";
        picture = QPATHTOF(data\icons\potassiumiodate2.paa);
        scope = 2;
    };

    class CLASS(cenestinBottle): CLASS(FakeMagazine) {
        count = 15;
        descriptionShort = "$STR_MISERY_CENESTINBOTTLE_DESCRIPTION";
        displayName = "$STR_MISERY_CENESTINBOTTLE_DISPLAYNAME";
        mass = 2;
        model = "\a3\structures_f_epa\Items\Medical\VitaminBottle_F.p3d";
        picture = QPATHTOF(data\icons\cenestinbottle.paa);
        scope = 2;
    };

    class CLASS(lighter): CLASS(FakeMagazine) {
        count = 100;
        descriptionShort = "$STR_MISERY_LIGHTER_DESCRIPTION";
        displayName = "$STR_MISERY_LIGHTER_DISPLAYNAME";
        mass = 5;
        model = QPATHTOF(data\models\lighter.p3d);
        picture = QPATHTOF(data\icons\lighter.paa);
        scope = 2;
    };

    class CLASS(matchBox): CLASS(FakeMagazine) {
        count = 20;
        descriptionShort = "box of weathered matches";
        displayName = "Match Box";
        mass = 1;
        model = "a3\structures_f_epa\items\tools\matches_f.p3d";
        picture = QPATHTOF(data\icons\matchBox.paa);
        scope = 2;
    };

    class CLASS(electricHandsaw): CLASS(FakeMagazine) {
        count = 10;
        descriptionShort = "$STR_MISERY_ELECTRICHANDSAW_DESCRIPTION";
        displayName = "$STR_MISERY_ELECTRICHANDSAW_DISPLAYNAME";
        mass = 25;
        picture = QPATHTOF(data\icons\electrichandcircularsaw.paa);
        scope = 2;
    };

    class CLASS(chainsaw): CLASS(FakeMagazine) {
        count = 25;
        descriptionShort = "$STR_MISERY_CHAINSAW_DESCRIPTION";
        displayName = "$STR_MISERY_CHAINSAW_DISPLAYNAME";
        mass = 100;
        model = QPATHTOF(data\models\chainsaw.p3d);
        picture = QPATHTOF(data\icons\chainsaw.paa);
        scope = 2;
    };

    class CLASS(sawFuel): CLASS(FakeMagazine) {
        count = 100;
        descriptionShort = "$STR_MISERY_SAWFUEL_DESCRIPTION";
        displayName = "$STR_MISERY_SAWFUEL_DISPLAYNAME";
        mass = 10;
        model = "a3\structures_f\items\vessels\canisteroil_f.p3d";
        picture = QPATHTOF(data\icons\sawfuel.paa);
        scope = 2;
    };

    class CLASS(pickaxe): CLASS(FakeMagazine) {
        count = 1000;
        descriptionShort = "$STR_MISERY_PICKAXE_DESCRIPTION";
        displayName = "$STR_MISERY_PICKAXE_DISPLAYNAME";
        mass = 85;
        model = QPATHTOF(data\models\pickaxe.p3d);
        picture = QPATHTOF(data\icons\pickaxe.paa);
        scope = 2;
    };

    class CLASS(eru_On): CLASS(FakeMagazine) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = "$STR_MISERY_ERU_DESCRIPTION";
        displayName = "$STR_MISERY_ERU_DISPLAYNAME";
        mass = 7;
        picture = QPATHTOF(data\icons\eru_on.paa);
        scope = 2;
    };

    class CLASS(eru_Off): CLASS(FakeMagazine) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = "$STR_MISERY_ERU_OFF_DESCRIPTION";
        displayName = "$STR_MISERY_ERU_OFF_DISPLAYNAME";
        mass = 7;
        picture = QPATHTOF(data\icons\eru_off.paa);
        scope = 2;
    };

    class CLASS(lantern_On): CLASS(FakeMagazine) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = "- Helps light the way in the dark...";
        displayName = "Lantern (On)";
        mass = 10;
        picture = QPATHTOF(data\icons\lantern.paa);
        model = "a3\structures_f_epb\civ\camping\camping_light_f.p3d";
        scope = 2;
    };

    class CLASS(lantern_Off): CLASS(FakeMagazine) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = "- Equipped with batteries";
        displayName = "Lantern (Off)";
        mass = 10;
        picture = QPATHTOF(data\icons\lantern.paa);
        model = "a3\structures_f\civ\camping\camping_light_off_f.p3d";
        scope = 2;
    };

    class CLASS(geiger_On): CLASS(FakeMagazine) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = "$STR_MISERY_PERSONALGEIGER_DESCRIPTION";
        displayName = "$STR_MISERY_PERSONALGEIGER_DISPLAYNAME";
        mass = 10;
        model = "\A3\Weapons_F\Items\minedetector.p3d";
        picture = QPATHTOF(data\icons\personalgeiger.paa);
        scope = 2;
    };

    class CLASS(geiger_Off): CLASS(FakeMagazine) {
        ace_disableRepacking = 1;
        scope = 2;
        displayName = "$STR_MISERY_PERSONALGEIGEROFF_DISPLAYNAME";
        descriptionShort = "$STR_MISERY_PERSONALGEIGEROFF_DESCRIPTION";
        picture = QPATHTOF(data\icons\personalgeigernobattery.paa);
        model = "\A3\Weapons_F\Items\minedetector.p3d";
        count = 100;
        mass = 10;
    };

    class CLASS(autoBattery): CLASS(FakeMagazine) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = "$STR_MISERY_AUTOBATT_DESCRIPTION";
        displayName = "$STR_MISERY_AUTOBATT_DISPLAYNAME";
        mass = 110;
        model = "a3\structures_f_bootcamp\items\electronics\carbattery_02_f.p3d";
        picture = QPATHTOF(data\icons\autobatt.paa);
        scope = 2;
    };

    class CLASS(autoBattery_Heavy): CLASS(FakeMagazine) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = "$STR_MISERY_AUTOBATTHEAVY_DESCRIPTION";
        displayName = "$STR_MISERY_AUTOBATTHEAVY_DISPLAYNAME";
        mass = 200;
        model = "a3\structures_f_bootcamp\items\electronics\carbattery_01_f.p3d";
        picture = QPATHTOF(data\icons\autobatt_heavy.paa);
        scope = 2;
    };

    class CLASS(cigarettePack): CLASS(FakeMagazine) {
        count = 20;
        descriptionShort = "$STR_MISERY_CIGARETTEPACK_DESCRIPTION";
        displayName = "$STR_MISERY_CIGARETTEPACK_DISPLAYNAME";
        mass = 2;
        model = QPATHTOF(data\models\cigarettes.p3d);
        picture = QPATHTOF(data\icons\cigpack.paa);
        scope = 2;
    };

    class CLASS(cigar): CLASS(FakeMagazine) {
        count = 4;
        descriptionShort = "$STR_MISERY_CIGAR_DESCRIPTION";
        displayName = "$STR_MISERY_CIGAR_DISPLAYNAME";
        mass = 1;
        picture = QPATHTOF(data\icons\cigar.paa);
        scope = 2;
    };

    class CLASS(wolfBeer): CLASS(FakeMagazine) {
        count = 4;
        descriptionShort = "$STR_MISERY_WOLFBEER_DESCRIPTION";
        displayName = "$STR_MISERY_WOLFBEER_DISPLAYNAME";
        hiddenSelectionsMaterials[] = {QPATHTOF(data\rvmats\beer.rvmat)};
        mass = 20;
        model = QPATHTOF(data\models\beer.p3d);
        picture = QPATHTOF(data\icons\wolfbeer.paa);
        scope = 2;
    };

    class CLASS(vodka): CLASS(FakeMagazine) {
        count = 8;
        descriptionShort = "$STR_MISERY_VODKA_DESCRIPTION";
        displayName = "$STR_MISERY_VODKA_DISPLAYNAME";
        hiddenSelectionsMaterials[] = {QPATHTOF(data\rvmats\vodka.rvmat)};
        mass = 35;
        model = QPATHTOF(data\models\vodka.p3d);
        picture = QPATHTOF(data\icons\vodka.paa);
        scope = 2;
    };

    class CLASS(canteen_Purified): CLASS(FakeMagazine) {
        count = 8;
        descriptionShort = "$STR_MISERY_CANTEENPURIFIED_DESCRIPTION";
        displayName = "$STR_MISERY_CANTEENPURIFIED_DISPLAYNAME";
        mass = 30;
        model = "a3\structures_f_epa\items\food\canteen_f.p3d";
        picture = QPATHTOF(data\icons\canteen.paa);
        scope = 2;
    };

    class CLASS(canteen_Clean): CLASS(FakeMagazine) {
        count = 8;
        descriptionShort = "$STR_MISERY_CANTEENCLEAN_DESCRIPTION";
        displayName = "$STR_MISERY_CANTEENCLEAN_DISPLAYNAME";
        mass = 30;
        model = "a3\structures_f_epa\items\food\canteen_f.p3d";
        picture = QPATHTOF(data\icons\canteen.paa);
        scope = 2;
    };

    class CLASS(canteen_Dirty): CLASS(FakeMagazine) {
        count = 8;
        descriptionShort = "$STR_MISERY_CANTEENDIRTY_DESCRIPTION";
        displayName = "$STR_MISERY_CANTEENDIRTY_DISPLAYNAME";
        mass = 30;
        model = "a3\structures_f_epa\items\food\canteen_f.p3d";
        picture = QPATHTOF(data\icons\canteen.paa);
        scope = 2;
    };

    class CLASS(waterBottle_Purified): CLASS(FakeMagazine) {
        count = 4;
        descriptionShort = "$STR_MISERY_WATERBOTTLEPURIFIED_DESCRIPTION";
        displayName = "$STR_MISERY_WATERBOTTLEPURIFIED_DISPLAYNAME";
        mass = 15;
        model = "a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d";
        picture = QPATHTOF(data\icons\waterbottle.paa);
        scope = 2;
    };

    class CLASS(waterBottle_Clean): CLASS(FakeMagazine) {
        count = 4;
        descriptionShort = "$STR_MISERY_WATERBOTTLECLEAN_DESCRIPTION";
        displayName = "$STR_MISERY_WATERBOTTLECLEAN_DISPLAYNAME";
        mass = 15;
        model = "a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d";
        picture = QPATHTOF(data\icons\waterbottle.paa);
        scope = 2;
    };

    class CLASS(waterBottle_Dirty): CLASS(FakeMagazine) {
        count = 4;
        descriptionShort = "$STR_MISERY_WATERBOTTLEDIRTY_DESCRIPTION";
        displayName = "$STR_MISERY_WATERBOTTLEDIRTY_DISPLAYNAME";
        mass = 15;
        model = "a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d";
        picture = QPATHTOF(data\icons\waterbottle.paa);
        scope = 2;
    };

    class CLASS(coffeeGrounds): CLASS(FakeMagazine) {
        count = 4;
        descriptionShort = "$STR_MISERY_COFFEEGROUNDS_DESCRIPTION";
        displayName = "$STR_MISERY_COFFEEGROUNDS_DISPLAYNAME";
        mass = 10;
        model = QPATHTOF(data\models\coffeegrounds.p3d);
        picture = QPATHTOF(data\icons\coffeegrounds.paa);
        scope = 2;
    };

    class CLASS(rice): CLASS(FakeMagazine) {
        count = 20;
        descriptionShort = "$STR_MISERY_RICE_DESCRIPTION";
        displayName = "$STR_MISERY_RICE_DISPLAYNAME";
        mass = 15;
        model = "a3\structures_f_epa\items\food\ricebox_f.p3d";
        picture = QPATHTOF(data\icons\rice.paa);
        scope = 2;
    };

    class CLASS(waterJerryCan_Full): CLASS(FakeMagazine) {
        count = 20;
        descriptionShort = "$STR_MISERY_WATERJERRYF_DESCRIPTION";
        displayName = "$STR_MISERY_WATERJERRYF_DISPLAYNAME";
        mass = 150;
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        picture = QPATHTOF(data\icons\canisterwater.paa);
        scope = 2;
    };

    class CLASS(waterJerryCan_FullDirty): CLASS(FakeMagazine) {
        count = 20;
        descriptionShort = "$STR_MISERY_WATERJERRYFD_DESCRIPTION";
        displayName = "$STR_MISERY_WATERJERRYFD_DISPLAYNAME";
        mass = 150;
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        picture = QPATHTOF(data\icons\canisterwater.paa);
        scope = 2;
    };

    class CLASS(jetFuel): CLASS(FakeMagazine) {
        count = 20;
        descriptionShort = "$STR_MISERY_JETFUELF_DESCRIPTION";
        displayName = "$STR_MISERY_JETFUELF_DISPLAYNAME";
        mass = 150;
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        picture = QPATHTOF(data\icons\canisterjetfuel.paa);
        scope = 2;
    };

    class CLASS(diesel): CLASS(FakeMagazine) {
        count = 20;
        descriptionShort = "$STR_MISERY_DIESELF_DESCRIPTION";
        displayName = "$STR_MISERY_DIESELF_DISPLAYNAME";
        mass = 150;
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        picture = QPATHTOF(data\icons\canisterdiesel.paa);
        scope = 2;
    };

    class CLASS(petrol): CLASS(FakeMagazine) {
        count = 20;
        descriptionShort = "$STR_MISERY_PETROLF_DESCRIPTION";
        displayName = "$STR_MISERY_PETROLF_DISPLAYNAME";
        mass = 150;
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        picture = QPATHTOF(data\icons\canisterpetrol.paa);
        scope = 2;
    };

    class CLASS(coolant): CLASS(FakeMagazine) {
        count = 20;
        descriptionShort = "engine coolant";
        displayName = "Coolant (5Gal / 20L)";
        mass = 120;
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        picture = QPATHTOF(data\icons\canisterwater.paa);
        scope = 2;
    };

    class CLASS(engineOil): CLASS(FakeMagazine) {
        count = 20;
        descriptionShort = "engine oil";
        displayName = "Engine oil (5Gal / 20L)";
        mass = 50;
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        picture = QPATHTOF(data\icons\canisterdiesel.paa);
        scope = 2;
    };

    class CLASS(metalFabricationKit): CLASS(FakeMagazine) {
        count = 5;
        descriptionShort = "metal fabrication kit used for vehicle repair";
        displayName = "Metal fabrication kit";
        mass = 150;
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
    };

    class CLASS(enginePartsKit): CLASS(FakeMagazine) {
        count = 10;
        descriptionShort = "engine parts kit used for vehicle repair";
        displayName = "Engine parts kit";
        mass = 70;
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
    };

    class CLASS(fuelSystemKit): CLASS(FakeMagazine) {
        count = 10;
        descriptionShort = "fuel system kit used for vehicle repair";
        displayName = "Fuel system kit";
        mass = 70;
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
    };

    class CLASS(electronicRepairKit): CLASS(FakeMagazine) {
        count = 20;
        descriptionShort = "electronics repair kit used for vehicle repair";
        displayName = "Electronics repair kit";
        mass = 50;
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
    };

    class CLASS(glassRepairKit): CLASS(FakeMagazine) {
        count = 15;
        descriptionShort = "glass repair kit used for vehicle repair";
        displayName = "Glass repair kit";
        mass = 50;
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
    };

    class CLASS(tirePatchKit): CLASS(FakeMagazine) {
        count = 10;
        descriptionShort = "tire patch kit used for vehicle repair";
        displayName = "Tire patch kit";
        mass = 50;
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
    };

    class CLASS(trackRepairKit): CLASS(FakeMagazine) {
        count = 4;
        descriptionShort = "track repair kit used for vehicle repair";
        displayName = "Track repair kit";
        mass = 150;
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
    };

    class CLASS(rotorRepairKit): CLASS(FakeMagazine) {
        count = 4;
        descriptionShort = "rotor repair kit used for aircraft repairs";
        displayName = "Rotor repair kit";
        mass = 150;
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
    };

    class CLASS(winchRepairKit): CLASS(FakeMagazine) {
        count = 10;
        descriptionShort = "winch repair kit used for vehicles repairs";
        displayName = "Winch repair kit";
        mass = 100;
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
    };

    class CLASS(hydraulicRepairKit): CLASS(FakeMagazine) {
        count = 5;
        descriptionShort = "hydraulic repair kit used for vehicles repairs";
        displayName = "Hydraulic repair kit";
        mass = 100;
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
    };

    class CLASS(aerodynamicControlKit): CLASS(FakeMagazine) {
        count = 5;
        descriptionShort = "aerodynamic controls kit used for aircraft repairs";
        displayName = "Aerodynamic controls kit";
        mass = 100;
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
    };

    class CLASS(transmissionRepairKit): CLASS(FakeMagazine) {
        count = 5;
        descriptionShort = "transmission repair kit used for vehicle repairs";
        displayName = "Transmission repair kit";
        mass = 100;
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
    };

    class CLASS(landingGearKit): CLASS(FakeMagazine) {
        count = 5;
        descriptionShort = "landing gear kit used for aircraft repairs";
        displayName = "Landing gear kit";
        mass = 100;
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
    };

    class CLASS(weaponSystemKit): CLASS(FakeMagazine) {
        count = 10;
        descriptionShort = "weapons systems kit used for vehicle repairs";
        displayName = "Weapon system kit";
        mass = 150;
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
    };

    class CLASS(countermeasureKit): CLASS(FakeMagazine) {
        count = 10;
        descriptionShort = "counter measures kit used for vehicle repairs";
        displayName = "Counter measure kit";
        mass = 100;
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
    };
};

