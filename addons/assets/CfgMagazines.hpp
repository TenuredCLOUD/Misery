class CfgMagazines {
	class CA_Magazine;

	class Laserbatteries : CA_Magazine {};
	
	class Misery_ItemMagCore : Laserbatteries {
		scope = 0;
		displaynameshort = "";
		displayName = "";
		picture = "";
		descriptionShort = "";
	};

	class Misery_puretabs : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_PAIN_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_PAIN_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\painkillers.paa";
  		model = "a3\structures_f_epa\items\medical\waterpurificationtablets_f.p3d";
		count = 30;
		mass = 2;
	};

	class Misery_pain : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_PAIN_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_PAIN_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\painkillers.paa";
  		model = "a3\structures_f_epa\items\medical\painkillers_f.p3d";
		count = 15;
		mass = 2;
	};

	class Misery_caffeine : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_CAFFEINE_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_CAFFEINE_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\Caffeine.paa";
		count = 8;
		mass = 0.5;
	};

	class Misery_charcoaltabs : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_CHARCOALTABS_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_CHARCOALTABS_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\charcoaltabs.paa";
		count = 10;
		mass = 0.5;
	};

	class Misery_caffetin : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_CAFFETIN_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_CAFFETIN_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\Caffetin.paa";
  		model = "\a3\structures_f_epa\Items\Medical\Antibiotic_F.p3d";
		count = 4;
		mass = 2;
	};

	class Misery_Clozapinebox : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_CLOZAPINEBOX_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_CLOZAPINEBOX_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\clozapinebox.paa";
		count = 8;
		mass = 2;
	};

	class Misery_antiparasitic : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_ANTIPARASITIC_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_ANTIPARASITIC_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\antiparasites.paa";
  		model = "\a3\structures_f_epa\Items\Medical\Antibiotic_F.p3d";
		count = 8;
		mass = 2;
	};

	class Misery_antibiotic : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_ANTIBIOTIC_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_ANTIBIOTIC_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\antibiotics.paa";
  		model = "\a3\structures_f_epa\Items\Medical\Antibiotic_F.p3d";
		count = 8;
		mass = 2;
	};

	class Misery_sleeppack : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_SLEEPPACK_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_SLEEPPACK_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\SleepingPillsBox.paa";
  		model = "\a3\structures_f_epa\Items\Medical\Antibiotic_F.p3d";
		count = 8;
		mass = 2;
	};

	class Misery_potassiumiodate : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "Potassium Iodate";
		descriptionShort = "Contains Anti-Radiation tablets";
		picture = "\z\misery\addons\assets\data\potassiumiodate2.paa";
		model = "\a3\structures_f_epa\Items\Medical\VitaminBottle_F.p3d";
		count = 15;
		mass = 2;
	};

	class Misery_Cenestinbottle : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_CENESTINBOTTLE_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_CENESTINBOTTLE_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\Cenestin_Bottle.paa";
  		model = "\a3\structures_f_epa\Items\Medical\VitaminBottle_F.p3d";
		count = 15;
		mass = 2;
	};

	class Misery_lighter : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_LIGHTER_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_LIGHTER_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\lighter.paa";
  		model = "\z\misery\addons\assets\data\models\lighter.p3d";
		count = 100;
		mass = 5;
	};

	class Misery_electrichandsaw : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_ELECTRICHANDSAW_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_ELECTRICHANDSAW_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\ElectricHandCircularSaw.paa";
		count = 10;
		mass = 25;
	};

	class Misery_Chainsaw : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_CHAINSAW_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_CHAINSAW_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\chainsaw.paa";
  		model = "\z\misery\addons\assets\data\models\chainsaw.p3d";
		count = 25;
		mass = 100;
	};

	class Misery_sawfuel : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_SAWFUEL_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_SAWFUEL_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\sawfuel.paa";
  		model = "a3\structures_f\items\vessels\canisteroil_f.p3d";
		count = 100;
		mass = 10;
	};

	class Misery_PDA : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_PDA_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_PDA_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\PDA.paa";
		count = 100;
		mass = 7;
	};

	class Misery_PDA_off : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_PDA_OFF_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_PDA_OFF_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\PDAnobattery.paa";
		count = 100;
		mass = 7;
	};

	class Misery_HeadlampON : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_HEADLAMPON_DISPLAYNAME";
    	descriptionShort = "$STR_MISERY_HEADLAMPON_DESCRIPTION";
    	picture = "\z\misery\addons\assets\data\headlamp.paa";
		count = 100;
		mass = 10;
	};

	class Misery_HeadlampOFF : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_HEADLAMPOFF_DISPLAYNAME";
    	descriptionShort = "$STR_MISERY_HEADLAMPOFF_DESCRIPTION";
    	picture = "\z\misery\addons\assets\data\headlamp.paa";
		count = 100;
		mass = 10;
	};

	class Misery_personalgeiger : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_PERSONALGEIGER_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_PERSONALGEIGER_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\personalgeiger.paa";
  		model = "\A3\Weapons_F\Items\MineDetector";
		count = 100;
		mass = 10;
	};

	class Misery_personalgeigerOFF : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_PERSONALGEIGEROFF_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_PERSONALGEIGEROFF_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\personalgeigernobattery.paa";
  		model = "\A3\Weapons_F\Items\MineDetector";
		count = 100;
		mass = 10;
	};

	class Misery_RFHighrangeON : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_RFHIGHRANGEON_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_RFHIGHRANGE_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\EMFdetectorhighrange.paa";
  		model = "\A3\Weapons_F\Items\MineDetector";
		count = 100;
		mass = 5;
	};

	class Misery_RFHighrangeOFF : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_RFHIGHRANGEOFF_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_RFHIGHRANGE_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\EMFdetectorhighrangenobattery.paa";
  		model = "\A3\Weapons_F\Items\MineDetector";
		count = 100;
		mass = 5;
	};

	class Misery_AutoBatt : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_AUTOBATT_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_AUTOBATT_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\autobatt.paa";
  		model = "a3\structures_f_bootcamp\items\electronics\carbattery_02_f.p3d";
		count = 100;
		mass = 110;
	};

	class Misery_AutoBatt_Heavy : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_AUTOBATTHEAVY_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_AUTOBATTHEAVY_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\autobatt_heavy.paa";
  		model = "a3\structures_f_bootcamp\items\electronics\carbattery_01_f.p3d";
		count = 100;
		mass = 200;
	};

	class Misery_matchespack : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_MATCHESPACK_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_MATCHESPACK_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\matchespack.paa";
  		model = "a3\structures_f_epa\items\tools\matches_f.p3d";
		count = 20;
		mass = 3;
	};

	class Misery_cigarettepack : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_CIGARETTEPACK_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_CIGARETTEPACK_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\cigpack.paa";
  		model = "\z\misery\addons\assets\data\models\cigarettes.p3d";
		count = 20;
		mass = 2;
	};

	class Misery_cigar : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_CIGAR_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_CIGAR_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\Cigar.paa";
		count = 4;
		mass = 1;
	};

	class Misery_wolfbeer : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_WOLFBEER_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_WOLFBEER_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\WolfBeer.paa";
  		model = "\z\misery\addons\assets\data\models\beer.p3d";
  		hiddenSelectionsMaterials[] = {"\z\misery\addons\assets\data\models\UI\beer.rvmat"};
		count = 4;
		mass = 20;
	};

	class Misery_vodka : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_VODKA_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_VODKA_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\vodka.paa";
  		model = "\z\misery\addons\assets\data\models\vodka.p3d";
  		hiddenSelectionsMaterials[] = {"\z\misery\addons\assets\data\models\UI\vodka.rvmat"};
		count = 8;
		mass = 35;
	};

	class Misery_CanteenPure : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_CANTEENPURIFIED_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_CANTEENPURIFIED_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\canteen.paa";
  		model = "a3\structures_f_epa\items\food\canteen_f.p3d";
		count = 8;
		mass = 30;
	};

	class Misery_CanteenClean : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_CANTEENCLEAN_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_CANTEENCLEAN_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\canteen.paa";
  		model = "a3\structures_f_epa\items\food\canteen_f.p3d";
		count = 8;
		mass = 30;
	};

	class Misery_CanteenDirty : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_CANTEENDIRTY_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_CANTEENDIRTY_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\canteen.paa";
  		model = "a3\structures_f_epa\items\food\canteen_f.p3d";
		count = 8;
		mass = 30;
	};

	class Misery_WaterBottlePure : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_WATERBOTTLEPURIFIED_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_WATERBOTTLEPURIFIED_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\waterbottle.paa";
  		model = "a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d";
		count = 4;
		mass = 15;
	};

	class Misery_WaterBottleClean : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_WATERBOTTLECLEAN_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_WATERBOTTLECLEAN_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\waterbottle.paa";
  		model = "a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d";
		count = 4;
		mass = 15;
	};

	class Misery_WaterBottleDirty : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_WATERBOTTLEDIRTY_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_WATERBOTTLEDIRTY_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\waterbottle.paa";
  		model = "a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d";
		count = 4;
		mass = 15;
	};

	class Misery_coffeegrounds : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_COFFEEGROUNDS_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_COFFEEGROUNDS_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\coffeegrounds.paa";
  		model = "\z\misery\addons\assets\data\models\coffeegrounds.p3d";
		count = 4;
		mass = 10;
	};

	class Misery_rice : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_RICE_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_RICE_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\rice.paa";
  		model = "a3\structures_f_epa\items\food\ricebox_f.p3d";
		count = 20;
		mass = 15;
	};

	class Misery_WaterJerryF : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_WATERJERRYF_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_WATERJERRYF_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\CanisterWater.paa";
  		model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
		count = 20;
		mass = 150;
	};

	class Misery_WaterJerryFD : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_WATERJERRYFD_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_WATERJERRYFD_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\CanisterWater.paa";
  		model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
		count = 20;
		mass = 150;
	};

	class Misery_JetFuel : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_JETFUELF_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_JETFUELF_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\CanisterJetFuel.paa";
  		model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
		count = 20;
		mass = 150;
	};

	class Misery_Diesel : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_DIESELF_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_DIESELF_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\CanisterDiesel.paa";
  		model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
		count = 20;
		mass = 150;
	};

	class Misery_Petrol : Misery_ItemMagCore {
		scope = 2;
		author = "TenuredCLOUD";
		displayName = "$STR_MISERY_PETROLF_DISPLAYNAME";
  		descriptionShort = "$STR_MISERY_PETROLF_DESCRIPTION";
  		picture = "\z\misery\addons\assets\data\CanisterPetrol.paa";
  		model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
		count = 20;
		mass = 150;
	};

};

