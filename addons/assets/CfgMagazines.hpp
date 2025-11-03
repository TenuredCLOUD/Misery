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
        descriptionShort = CSTRING(Pain_Description);
        displayName = CSTRING(Pain_DisplayName);
        mass = 2;
        model = "a3\structures_f_epa\items\medical\waterpurificationtablets_f.p3d";
        picture = QPATHTOF(data\icons\painkillers.paa);
        scope = 2;
    };

    class CLASS(painkillers): CLASS(FakeMagazine) {
        count = 15;
        descriptionShort = CSTRING(Pain_Description);
        displayName = CSTRING(Pain_DisplayName);
        mass = 2;
        model = "a3\structures_f_epa\items\medical\painkillers_f.p3d";
        picture = QPATHTOF(data\icons\painkillers.paa);
        scope = 2;
    };

    class CLASS(caffeine): CLASS(FakeMagazine) {
        count = 8;
        descriptionShort = CSTRING(Caffeine_Description);
        displayName = CSTRING(Caffeine_DisplayName);
        mass = 0.5;
        picture = QPATHTOF(data\icons\caffeine.paa);
        scope = 2;
    };

    class CLASS(charcoalTablets): CLASS(FakeMagazine) {
        count = 10;
        descriptionShort = CSTRING(CharcoalTabs_Description);
        displayName = CSTRING(CharcoalTabs_DisplayName);
        mass = 0.5;
        picture = QPATHTOF(data\icons\charcoaltablets.paa);
        scope = 2;
    };

    class CLASS(caffetin): CLASS(FakeMagazine) {
        count = 4;
        descriptionShort = CSTRING(Caffetin_Description);
        displayName = CSTRING(Caffetin_DisplayName);
        mass = 2;
        model = "\a3\structures_f_epa\Items\Medical\Antibiotic_F.p3d";
        picture = QPATHTOF(data\icons\caffetin.paa);
        scope = 2;
    };

    class CLASS(clozapineBox): CLASS(FakeMagazine) {
        count = 8;
        descriptionShort = CSTRING(ClozapineBox_Description);
        displayName = CSTRING(ClozapineBox_DisplayName);
        mass = 2;
        picture = QPATHTOF(data\icons\clozapinebox.paa);
        scope = 2;
    };

    class CLASS(antiparasitic): CLASS(FakeMagazine) {
        count = 8;
        descriptionShort = CSTRING(Antiparasitic_Description);
        displayName = CSTRING(Antiparasitic_DisplayName);
        mass = 2;
        model = "\a3\structures_f_epa\Items\Medical\Antibiotic_F.p3d";
        picture = QPATHTOF(data\icons\antiparasites.paa);
        scope = 2;
    };

    class CLASS(antibiotic): CLASS(FakeMagazine) {
        count = 8;
        descriptionShort = CSTRING(Antibiotic_Description);
        displayName = CSTRING(Antibiotic_DisplayName);
        mass = 2;
        model = "\a3\structures_f_epa\Items\Medical\Antibiotic_F.p3d";
        picture = QPATHTOF(data\icons\antibiotics.paa);
        scope = 2;
    };

    class CLASS(deconKit): CLASS(FakeMagazine) {
        count = 6;
        descriptionShort = CSTRING(DeconKit_Description);
        displayName = CSTRING(DeconKit_DisplayName);
        mass = 10;
        model = "\a3\props_f_enoch\military\decontamination\deconkit_01_f.p3d";
        picture = QPATHTOF(data\icons\deconKit.paa);
        scope = 2;
    };

    class CLASS(sleepingPills): CLASS(FakeMagazine) {
        count = 8;
        descriptionShort = CSTRING(SleepPack_Description);
        displayName = CSTRING(SleepPack_DisplayName);
        mass = 2;
        model = "\a3\structures_f_epa\Items\Medical\Antibiotic_F.p3d";
        picture = QPATHTOF(data\icons\sleepingpillsbox.paa);
        scope = 2;
    };

    class CLASS(potassiumIodate): CLASS(FakeMagazine) {
        count = 15;
        descriptionShort = CSTRING(PotassiumIodate_Description);
        displayName = CSTRING(PotassiumIodate_DisplayName);
        mass = 2;
        model = "\a3\structures_f_epa\Items\Medical\VitaminBottle_F.p3d";
        picture = QPATHTOF(data\icons\potassiumiodate2.paa);
        scope = 2;
    };

    class CLASS(cenestinBottle): CLASS(FakeMagazine) {
        count = 15;
        descriptionShort = CSTRING(CenestinBottle_Description);
        displayName = CSTRING(CenestinBottle_DisplayName);
        mass = 2;
        model = "\a3\structures_f_epa\Items\Medical\VitaminBottle_F.p3d";
        picture = QPATHTOF(data\icons\cenestinbottle.paa);
        scope = 2;
    };

    class CLASS(lighter): CLASS(FakeMagazine) {
        count = 100;
        descriptionShort = CSTRING(Lighter_Description);
        displayName = CSTRING(Lighter_DisplayName);
        mass = 5;
        model = QPATHTOF(data\models\lighter.p3d);
        picture = QPATHTOF(data\icons\lighter.paa);
        scope = 2;
    };

    class CLASS(matchBox): CLASS(FakeMagazine) {
        count = 20;
        descriptionShort = CSTRING(MatchBox_Description);
        displayName = CSTRING(MatchBox_DisplayName);
        mass = 1;
        model = "a3\structures_f_epa\items\tools\matches_f.p3d";
        picture = QPATHTOF(data\icons\matchBox.paa);
        scope = 2;
    };

    class CLASS(electricHandsaw): CLASS(FakeMagazine) {
        count = 10;
        descriptionShort = CSTRING(ElectricHandSaw_Description);
        displayName = CSTRING(ElectricHandSaw_DisplayName);
        mass = 25;
        picture = QPATHTOF(data\icons\electrichandcircularsaw.paa);
        scope = 2;
    };

    class CLASS(chainsaw): CLASS(FakeMagazine) {
        count = 25;
        descriptionShort = CSTRING(Chainsaw_Description);
        displayName = CSTRING(Chainsaw_DisplayName);
        mass = 100;
        model = QPATHTOF(data\models\chainsaw.p3d);
        picture = QPATHTOF(data\icons\chainsaw.paa);
        scope = 2;
    };

    class CLASS(sawFuel): CLASS(FakeMagazine) {
        count = 100;
        descriptionShort = CSTRING(SawFuel_Description);
        displayName = CSTRING(SawFuel_DisplayName);
        mass = 10;
        model = "a3\structures_f\items\vessels\canisteroil_f.p3d";
        picture = QPATHTOF(data\icons\sawfuel.paa);
        scope = 2;
    };

    class CLASS(pickaxe): CLASS(FakeMagazine) {
        count = 1000;
        descriptionShort = CSTRING(Pickaxe_Description);
        displayName = CSTRING(Pickaxe_DisplayName);
        mass = 85;
        model = QPATHTOF(data\models\pickaxe.p3d);
        picture = QPATHTOF(data\icons\pickaxe.paa);
        scope = 2;
    };

    class CLASS(eru_On): CLASS(FakeMagazine) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = CSTRING(ERU_Description);
        displayName = CSTRING(ERU_DisplayName);
        mass = 7;
        picture = QPATHTOF(data\icons\eru_on.paa);
        scope = 2;
    };

    class CLASS(eru_Off): CLASS(FakeMagazine) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = CSTRING(ERUOff_Description);
        displayName = CSTRING(ERUOff_DisplayName);
        mass = 7;
        picture = QPATHTOF(data\icons\eru_off.paa);
        scope = 2;
    };

    class CLASS(lantern_On): CLASS(FakeMagazine) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = CSTRING(LanternOn_Description);
        displayName = CSTRING(LanternOn_DisplayName);
        mass = 10;
        picture = QPATHTOF(data\icons\lantern.paa);
        model = "a3\structures_f_epb\civ\camping\camping_light_f.p3d";
        scope = 2;
    };

    class CLASS(lantern_Off): CLASS(FakeMagazine) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = CSTRING(LanternOff_Description);
        displayName = CSTRING(LanternOff_DisplayName);
        mass = 10;
        picture = QPATHTOF(data\icons\lantern.paa);
        model = "a3\structures_f\civ\camping\camping_light_off_f.p3d";
        scope = 2;
    };

    class CLASS(geiger_On): CLASS(FakeMagazine) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = CSTRING(Geiger_Description);
        displayName = CSTRING(GeigerOn_DisplayName);
        mass = 10;
        model = "\A3\Weapons_F\Items\minedetector.p3d";
        picture = QPATHTOF(data\icons\personalgeiger.paa);
        scope = 2;
    };

    class CLASS(geiger_Off): CLASS(FakeMagazine) {
        ace_disableRepacking = 1;
        scope = 2;
        descriptionShort = CSTRING(Geiger_Description);
        displayName = CSTRING(GeigerOff_DisplayName);
        picture = QPATHTOF(data\icons\personalgeigernobattery.paa);
        model = "\A3\Weapons_F\Items\minedetector.p3d";
        count = 100;
        mass = 10;
    };

    class CLASS(autoBattery): CLASS(FakeMagazine) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = CSTRING(AutoBattery_Description);
        displayName = CSTRING(AutoBattery_DisplayName);
        mass = 110;
        model = "a3\structures_f_bootcamp\items\electronics\carbattery_02_f.p3d";
        picture = QPATHTOF(data\icons\autobatt.paa);
        scope = 2;
    };

    class CLASS(autoBattery_Heavy): CLASS(FakeMagazine) {
        ace_disableRepacking = 1;
        count = 100;
        descriptionShort = CSTRING(AutoBatteryHeavy_Description);
        displayName = CSTRING(AutoBatteryHeavy_DisplayName);
        mass = 200;
        model = "a3\structures_f_bootcamp\items\electronics\carbattery_01_f.p3d";
        picture = QPATHTOF(data\icons\autobatt_heavy.paa);
        scope = 2;
    };

    class CLASS(cigarettePack): CLASS(FakeMagazine) {
        count = 20;
        descriptionShort = CSTRING(CigarettePack_Description);
        displayName = CSTRING(CigarettePack_DisplayName);
        mass = 2;
        model = QPATHTOF(data\models\cigarettes.p3d);
        picture = QPATHTOF(data\icons\cigpack.paa);
        scope = 2;
    };

    class CLASS(cigar): CLASS(FakeMagazine) {
        count = 4;
        descriptionShort = CSTRING(Cigar_Description);
        displayName = CSTRING(Cigar_DisplayName);
        mass = 1;
        picture = QPATHTOF(data\icons\cigar.paa);
        scope = 2;
    };

    class CLASS(wolfBeer): CLASS(FakeMagazine) {
        count = 4;
        descriptionShort = CSTRING(WolfBeer_Description);
        displayName = CSTRING(WolfBeer_DisplayName);
        hiddenSelectionsMaterials[] = {QPATHTOF(data\rvmats\beer.rvmat)};
        mass = 20;
        model = QPATHTOF(data\models\beer.p3d);
        picture = QPATHTOF(data\icons\wolfbeer.paa);
        scope = 2;
    };

    class CLASS(vodka): CLASS(FakeMagazine) {
        count = 8;
        descriptionShort = CSTRING(Vodka_Description);
        displayName = CSTRING(Vodka_DisplayName);
        hiddenSelectionsMaterials[] = {QPATHTOF(data\rvmats\vodka.rvmat)};
        mass = 35;
        model = QPATHTOF(data\models\vodka.p3d);
        picture = QPATHTOF(data\icons\vodka.paa);
        scope = 2;
    };

    class CLASS(canteen_Purified): CLASS(FakeMagazine) {
        count = 8;
        descriptionShort = CSTRING(CanteenPurified_Description);
        displayName = CSTRING(CanteenPurified_DisplayName);
        mass = 30;
        model = "a3\structures_f_epa\items\food\canteen_f.p3d";
        picture = QPATHTOF(data\icons\canteen.paa);
        scope = 2;
    };

    class CLASS(canteen_Clean): CLASS(FakeMagazine) {
        count = 8;
        descriptionShort = CSTRING(CanteenClean_Description);
        displayName = CSTRING(CanteenClean_DisplayName);
        mass = 30;
        model = "a3\structures_f_epa\items\food\canteen_f.p3d";
        picture = QPATHTOF(data\icons\canteen.paa);
        scope = 2;
    };

    class CLASS(canteen_Dirty): CLASS(FakeMagazine) {
        count = 8;
        descriptionShort = CSTRING(CanteenDirty_Description);
        displayName = CSTRING(CanteenDirty_DisplayName);
        mass = 30;
        model = "a3\structures_f_epa\items\food\canteen_f.p3d";
        picture = QPATHTOF(data\icons\canteen.paa);
        scope = 2;
    };

    class CLASS(waterBottle_Purified): CLASS(FakeMagazine) {
        count = 4;
        descriptionShort = CSTRING(WaterBottlePurified_Description);
        displayName = CSTRING(WaterBottlePurified_DisplayName);
        mass = 15;
        model = "a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d";
        picture = QPATHTOF(data\icons\waterbottle.paa);
        scope = 2;
    };

    class CLASS(waterBottle_Clean): CLASS(FakeMagazine) {
        count = 4;
        descriptionShort = CSTRING(WaterBottleClean_Description);
        displayName = CSTRING(WaterBottleClean_DisplayName);
        mass = 15;
        model = "a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d";
        picture = QPATHTOF(data\icons\waterbottle.paa);
        scope = 2;
    };

    class CLASS(waterBottle_Dirty): CLASS(FakeMagazine) {
        count = 4;
        descriptionShort = CSTRING(WaterBottleDirty_Description);
        displayName = CSTRING(WaterBottleDirty_DisplayName);
        mass = 15;
        model = "a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d";
        picture = QPATHTOF(data\icons\waterbottle.paa);
        scope = 2;
    };

    class CLASS(coffeeGrounds): CLASS(FakeMagazine) {
        count = 4;
        descriptionShort = CSTRING(CoffeeGrounds_Description);
        displayName = CSTRING(CoffeeGrounds_DisplayName);
        mass = 10;
        picture = QPATHTOF(data\icons\coffeegrounds.paa);
        scope = 2;
    };

    class CLASS(rice): CLASS(FakeMagazine) {
        count = 20;
        descriptionShort = CSTRING(Rice_Description);
        displayName = CSTRING(Rice_DisplayName);
        mass = 15;
        model = "a3\structures_f_epa\items\food\ricebox_f.p3d";
        picture = QPATHTOF(data\icons\rice.paa);
        scope = 2;
    };

    class CLASS(waterJerryCan_Full): CLASS(FakeMagazine) {
        count = 20;
        descriptionShort = CSTRING(JerryCanWaterFull_Description);
        displayName = CSTRING(JerryCanWaterFull_DisplayName);
        mass = 150;
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        picture = QPATHTOF(data\icons\canisterwater.paa);
        scope = 2;
    };

    class CLASS(waterJerryCan_FullDirty): CLASS(FakeMagazine) {
        count = 20;
        descriptionShort = CSTRING(JerryCanWaterFullDirty_Description);
        displayName = CSTRING(JerryCanWaterFullDirty_DisplayName);
        mass = 150;
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        picture = QPATHTOF(data\icons\canisterwater.paa);
        scope = 2;
    };

    class CLASS(jetFuel): CLASS(FakeMagazine) {
        count = 20;
        descriptionShort = CSTRING(FuelGeneric_Description);
        displayName = CSTRING(JetFuel_DisplayName);
        mass = 150;
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        picture = QPATHTOF(data\icons\canisterjetfuel.paa);
        scope = 2;
    };

    class CLASS(diesel): CLASS(FakeMagazine) {
        count = 20;
        descriptionShort = CSTRING(FuelGeneric_Description);
        displayName = CSTRING(Diesel_DisplayName);
        mass = 150;
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        picture = QPATHTOF(data\icons\canisterdiesel.paa);
        scope = 2;
    };

    class CLASS(petrol): CLASS(FakeMagazine) {
        count = 20;
        descriptionShort = CSTRING(FuelGeneric_Description);
        displayName = CSTRING(Petrol_DisplayName);
        mass = 150;
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        picture = QPATHTOF(data\icons\canisterpetrol.paa);
        scope = 2;
    };

    class CLASS(coolant): CLASS(FakeMagazine) {
        count = 20;
        descriptionShort = CSTRING(Coolant_Description);
        displayName = CSTRING(Coolant_DisplayName);
        mass = 120;
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        picture = QPATHTOF(data\icons\canisterwater.paa);
        scope = 2;
    };

    class CLASS(engineOil): CLASS(FakeMagazine) {
        count = 20;
        descriptionShort = CSTRING(EngineOil_Description);
        displayName = CSTRING(EngineOil_DisplayName);
        mass = 50;
        model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
        picture = QPATHTOF(data\icons\canisterdiesel.paa);
        scope = 2;
    };

    class CLASS(metalFabricationKit): CLASS(FakeMagazine) {
        count = 5;
        descriptionShort = CSTRING(MetalFabricationKit_Description);
        displayName = CSTRING(MetalFabricationKit_DisplayName);
        mass = 150;
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
    };

    class CLASS(enginePartsKit): CLASS(FakeMagazine) {
        count = 10;
        descriptionShort = CSTRING(EnginePartsKit_Description);
        displayName = CSTRING(EnginePartsKit_DisplayName);
        mass = 70;
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
    };

    class CLASS(fuelSystemKit): CLASS(FakeMagazine) {
        count = 10;
        descriptionShort = CSTRING(FuelSystemKit_Description);
        displayName = CSTRING(FuelSystemKit_DisplayName);
        mass = 70;
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
    };

    class CLASS(electronicRepairKit): CLASS(FakeMagazine) {
        count = 20;
        descriptionShort = CSTRING(ElectronicRepairKit_Description);
        displayName = CSTRING(ElectronicRepairKit_DisplayName);
        mass = 50;
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
    };

    class CLASS(glassRepairKit): CLASS(FakeMagazine) {
        count = 15;
        descriptionShort = CSTRING(GlassRepairKit_Description);
        displayName = CSTRING(GlassRepairKit_DisplayName);
        mass = 50;
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
    };

    class CLASS(tirePatchKit): CLASS(FakeMagazine) {
        count = 10;
        descriptionShort = CSTRING(TirePatchKit_Description);
        displayName = CSTRING(TirePatchKit_DisplayName);
        mass = 50;
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
    };

    class CLASS(trackRepairKit): CLASS(FakeMagazine) {
        count = 4;
        descriptionShort = CSTRING(TrackRepairKit_Description);
        displayName = CSTRING(TrackRepairKit_DisplayName);
        mass = 150;
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
    };

    class CLASS(rotorRepairKit): CLASS(FakeMagazine) {
        count = 4;
        descriptionShort = CSTRING(RotorRepairKit_Description);
        displayName = CSTRING(RotorRepairKit_DisplayName);
        mass = 150;
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
    };

    class CLASS(winchRepairKit): CLASS(FakeMagazine) {
        count = 10;
        descriptionShort = CSTRING(WinchRepairKit_Description);
        displayName = CSTRING(WinchRepairKit_DisplayName);
        mass = 100;
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
    };

    class CLASS(hydraulicRepairKit): CLASS(FakeMagazine) {
        count = 5;
        descriptionShort = CSTRING(HydraulicRepairKit_Description);
        displayName = CSTRING(HydraulicRepairKit_DisplayName);
        mass = 100;
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
    };

    class CLASS(aerodynamicControlKit): CLASS(FakeMagazine) {
        count = 5;
        descriptionShort = CSTRING(AerodynamicControlKit_Description);
        displayName = CSTRING(AerodynamicControlKit_DisplayName);
        mass = 100;
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
    };

    class CLASS(transmissionRepairKit): CLASS(FakeMagazine) {
        count = 5;
        descriptionShort = CSTRING(TransmissionRepairKit_Description);
        displayName = CSTRING(TransmissionRepairKit_DisplayName);
        mass = 100;
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
    };

    class CLASS(landingGearKit): CLASS(FakeMagazine) {
        count = 5;
        descriptionShort = CSTRING(LandingGearKit_Description);
        displayName = CSTRING(LandingGearKit_DisplayName);
        mass = 100;
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
    };

    class CLASS(weaponSystemKit): CLASS(FakeMagazine) {
        count = 10;
        descriptionShort = CSTRING(WeaponSystemKit_Description);
        displayName = CSTRING(WeaponSystemKit_DisplayName);
        mass = 150;
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
    };

    class CLASS(countermeasureKit): CLASS(FakeMagazine) {
        count = 10;
        descriptionShort = CSTRING(CounterMeasureKit_Description);
        displayName = CSTRING(CounterMeasureKit_DisplayName);
        mass = 100;
        model = "a3\weapons_f\items\toolkit.p3d";
        picture = QPATHTOF(data\icons\toolkit.paa);
        scope = 2;
    };
};

