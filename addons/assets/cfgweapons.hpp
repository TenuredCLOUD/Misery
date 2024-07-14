
class CfgWeapons {
class ItemCore; 

class Misery_ItemCore : ItemCore {
  type = 4096;
  detectRange = -1;
  scopeCurator = 2;
  simulation = "ItemMineDetector";
};

class InventoryItem_Base_F;	
class InventoryFirstAidKitItem_Base_F;	
class MedikitItem;	
class SlotInfo;	

class Misery_Pickaxe : Misery_ItemCore {
  displayName = "$STR_MISERY_PICKAXE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_PICKAXE_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\pickaxe.paa";
  model = "\z\misery\addons\assets\data\models\pickaxe.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 85;
  };
};

class Misery_Pickaxebroken : Misery_ItemCore {
  displayName = "$STR_MISERY_PICKAXEBROKEN_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_PICKAXEBROKEN_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\brokenpickaxe.paa";
  model = "\z\misery\addons\assets\data\models\pickaxe.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 85;
  };
};

class Misery_fishingpole : Misery_ItemCore {
  displayName = "$STR_MISERY_FISHINGPOLE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_FISHINGPOLE_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\fishingpole2.paa";
  model = "\z\misery\addons\assets\data\models\fishingrod.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 30;
  };
};

class Misery_fishingspool : Misery_ItemCore {
  displayName = "$STR_MISERY_FISHINGSPOOL_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_FISHINGSPOOL_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\fishingspool.paa";
  model = "\z\misery\addons\assets\data\models\fishingspool.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 5;
  };
};

class Misery_personalgeigernobattery : Misery_ItemCore {
  displayName = "$STR_MISERY_PERSONALGEIGERNOBATTERY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_PERSONALGEIGERNOBATTERY_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\personalgeigernobattery.paa";
  model = "\A3\Weapons_F\Items\MineDetector";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 10;
  };
};

  class Misery_Headlamp_NB : Misery_ItemCore {
    displayName = "$STR_MISERY_HEADLAMP_NB_DISPLAYNAME";
    descriptionShort = "$STR_MISERY_HEADLAMP_NB_DESCRIPTION";
    picture = "\z\misery\addons\assets\data\headlamp.paa";
    scope = 2;
    scopeCurator = 2;

    class ItemInfo : InventoryItem_Base_F {
      mass = 10;
    };
  };

class Misery_Clozapine : Misery_ItemCore {
  displayName = "$STR_MISERY_CLOZAPINE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_CLOZAPINE_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\Clozapineinjection.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 5;
  };
};

class Misery_cocaine : Misery_ItemCore {
  displayName = "$STR_MISERY_COCAINE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_COCAINE_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\cocaine.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0.5;
  };
};

class Misery_Thrombomodulin : Misery_ItemCore {
  displayName = "$STR_MISERY_THROMBOMODULIN_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_THROMBOMODULIN_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\Thbd.paa";
  model = "a3\props_f_orange\humanitarian\garbage\medicalgarbage_01_injector_f.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 5;
  };
};

class Misery_ThrombomodulinStimpack : Misery_ItemCore {
  displayName = "$STR_MISERY_THROMBOMODULINSTIMPACK_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_THROMBOMODULINSTIMPACK_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\Thbdstim.paa";
  model = "a3\props_f_orange\humanitarian\garbage\medicalgarbage_01_injector_f.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 8;
  };
};

class Misery_randommedication : Misery_ItemCore {
  displayName = "$STR_MISERY_RANDOMMEDICATION_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_RANDOMMEDICATION_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\medication.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 5;
  };
};

class Misery_fishhook : Misery_ItemCore {
  displayName = "$STR_MISERY_FISHHOOK_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_FISHHOOK_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\fishhook.paa";
  model = "\z\misery\addons\assets\data\models\fishhook.p3d";
  hiddenSelectionsMaterials[] = {"\z\misery\addons\assets\data\models\ui\fishhook.rvmat"};
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 2;
  };
};

class Misery_worms : Misery_ItemCore {
  displayName = "$STR_MISERY_WORMS_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_WORMS_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\worms.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0.5;
  };
};

class Misery_lithiumbattery : Misery_ItemCore {
  displayName = "$STR_MISERY_LITHIUMBATTERY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_LITHIUMBATTERY_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\NitecoreBATT.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 2;
  };
};

class Misery_Bearenergy : Misery_ItemCore {
  displayName = "$STR_MISERY_BEARENERGY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_BEARENERGY_DESCRIPTION";
 picture = "\z\misery\addons\assets\data\Bearstrength.paa";
  model = "\z\misery\addons\assets\data\models\Bearenergy.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 8;
  };
};

class Misery_SodaCan : Misery_ItemCore {
  displayName = "$STR_MISERY_BEARENERGY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_BEARENERGY_DESCRIPTION";
 picture = "\z\misery\addons\assets\data\Bearstrength.paa";
  model = "\z\misery\addons\assets\data\models\Pepsi_Soda.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 4;
  };
};

class Misery_CanOpener : Misery_ItemCore {
  displayName = "$STR_MISERY_CANOPENER_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_CANOPENER_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\canOpener.paa";
  model = "a3\structures_f_epa\items\tools\canopener_f.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 10;
  };
};

class Misery_CanteenEmpty : Misery_ItemCore {
	scope = 2;
	author = "TenuredCLOUD";
	displayName = "$STR_MISERY_CANTEENEMPTY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_CANTEENEMPTY_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\canteen.paa";
  model = "a3\structures_f_epa\items\food\canteen_f.p3d";
	
  class ItemInfo : InventoryItem_Base_F {
    mass = 30;
  };
	};

  class Misery_WaterBottleEmpty : Misery_ItemCore {
	scope = 2;
	author = "TenuredCLOUD";
	displayName = "$STR_MISERY_WATERBOTTLEEMPTY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_WATERBOTTLEEMPTY_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\waterbottle.paa";
  model = "a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d";
	
  class ItemInfo : InventoryItem_Base_F {
    mass = 15;
  };
	};

  class Misery_Cereal : Misery_ItemCore {
  displayName = "$STR_MISERY_BEARENERGY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_BEARENERGY_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\cereal.paa";
  model = "a3\structures_f_epa\items\food\cerealsbox_f.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 4;
  };
};

  class Misery_Orange : Misery_ItemCore {
  displayName = "$STR_MISERY_BEARENERGY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_BEARENERGY_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\orange.paa";
  model = "a3\props_f_orange\humanitarian\supplies\orange_01_f.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 2;
  };
};  

class Misery_Drymilk : Misery_ItemCore {
  displayName = "$STR_MISERY_BEARENERGY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_BEARENERGY_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\drymilk.paa";
  model = "a3\structures_f_epa\items\food\powderedmilk_f.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 4;
  };
}; 

class Misery_CannedBacon : Misery_ItemCore {
  displayName = "$STR_MISERY_BEARENERGY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_BEARENERGY_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\CannedBacon.paa";
  model = "a3\structures_f\items\food\tacticalbacon_f.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 10;
  };
}; 

class Misery_CannedBeans : Misery_ItemCore {
  displayName = "$STR_MISERY_BEARENERGY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_BEARENERGY_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\CannedBeans.paa";
  model = "a3\structures_f_epa\items\food\bakedbeans_f.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 10;
  };
}; 

class Misery_leadcontaineropen : Misery_ItemCore {
  displayName = "$STR_MISERY_LEADCONTAINEROPEN_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_LEADCONTAINEROPEN_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\artifactcontaineropen.paa";
  model = "a3\structures_f_bootcamp\items\food\foodcontainer_01_f.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 50;
  };
};

class Misery_leadcontainerclosed : Misery_ItemCore {
  displayName = "$STR_MISERY_LEADCONTAINERCLOSED_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_LEADCONTAINERCLOSED_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\artifactcontaineropen.paa";
  model = "a3\structures_f_bootcamp\items\food\foodcontainer_01_f.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 50;
  };
};

class Misery_artifact01 : Misery_ItemCore {
  displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\Artifact01.paa";
  model = "\z\misery\addons\assets\data\models\artifact.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 3;
  };
};

class Misery_artifact02 : Misery_ItemCore {
  displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\Artifact02.paa";
  model = "\z\misery\addons\assets\data\models\artifact.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 3;
  };
};

class Misery_artifact03 : Misery_ItemCore {
  displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\Artifact03.paa";
  model = "\z\misery\addons\assets\data\models\artifact.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 3;
  };
};

class Misery_artifact04 : Misery_ItemCore {
  displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\Artifact04.paa";
  model = "\z\misery\addons\assets\data\models\artifact.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 3;
  };
};

class Misery_artifact05 : Misery_ItemCore {
  displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\Artifact05.paa";
  model = "\z\misery\addons\assets\data\models\artifact.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 3;
  };
};

class Misery_artifact06 : Misery_ItemCore {
  displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\Artifact06.paa";
  model = "\z\misery\addons\assets\data\models\artifact.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 3;
  };
};

class Misery_artifact07 : Misery_ItemCore {
  displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\Artifact07.paa";
  model = "\z\misery\addons\assets\data\models\artifact.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 3;
  };
};

class Misery_artifact08 : Misery_ItemCore {
  displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\Artifact08.paa";
  model = "\z\misery\addons\assets\data\models\artifact.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 3;
  };
};

class Misery_artifact09 : Misery_ItemCore {
  displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\Artifact09.paa";
  model = "\z\misery\addons\assets\data\models\artifact.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 3;
  };
};

class Misery_artifact10 : Misery_ItemCore {
  displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\Artifact10.paa";
  model = "\z\misery\addons\assets\data\models\artifact.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 3;
  };
};

class Misery_Heatpack : Misery_ItemCore {
  displayName = "$STR_MISERY_HEATPACK_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_HEATPACK_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\hotpack.paa";
  model = "a3\structures_f_epa\items\medical\heatpack_f.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 8;
  };
};

class Misery_Coldpack : Misery_ItemCore {
  displayName = "$STR_MISERY_COLDPACK_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_COLDPACK_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\coldpack.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 8;
  };
};

class Misery_WaterJerryE : Misery_ItemCore {
  displayName = "$STR_MISERY_WATERJERRYE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_WATERJERRYE_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\CanisterWater.paa";
  model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 50;
  };
};

class Misery_castironpot : Misery_ItemCore {
  displayName = "$STR_MISERY_CASTIRONPOT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_CASTIRONPOT_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\castironpot.paa";
  model = "\z\misery\addons\assets\data\models\CastIron_Pot.p3d";
  hiddenSelectionsMaterials[] = {"\z\misery\addons\assets\data\models\ui\Iron.rvmat"};
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 90;
  };
};

class Misery_cookedfish : Misery_ItemCore {
  displayName = "$STR_MISERY_COOKEDFISH_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_COOKEDFISH_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\cookedfish.paa";
  model = "\z\misery\addons\assets\data\models\fishcooked.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 3;
  };
};

class Misery_rawfish_1 : Misery_ItemCore {
  displayName = "$STR_MISERY_RAWFISH_1_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_RAWFISH_1_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\rawfish.paa";
  model = "\z\misery\addons\assets\data\models\fish.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 5;
  };
};

class Misery_cookedmeat : Misery_ItemCore {
  displayName = "Cooked Meat";
  descriptionShort = "Meat that's been cooked";
  picture = "\z\misery\addons\assets\data\cookedmeat.paa";
  model = "\z\misery\addons\assets\data\models\cookedmeat.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 5;
  };
};

class Misery_rawmeat_1 : Misery_ItemCore {
  displayName = "Raw Meat";
  descriptionShort = "Raw meat, needs to be cooked";
  picture = "\z\misery\addons\assets\data\rawmeat.paa";
  model = "\z\misery\addons\assets\data\models\rawmeat.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 5;
  };
};

class Misery_guitar : Misery_ItemCore {
  displayName = "$STR_MISERY_GUITAR_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_GUITAR_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\guitar.paa";
  model = "\z\misery\addons\assets\data\models\guitar.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 40;
  };
};

class Misery_coffeemug : Misery_ItemCore {
  displayName = "$STR_MISERY_COFFEEMUG_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_COFFEEMUG_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\coffeemug.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 10;
  };
};

class Misery_coffeebrewed : Misery_ItemCore {
  displayName = "$STR_MISERY_COFFEEBREWED_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_COFFEEBREWED_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\coffeebrewed.paa";
  scope = 2;
  scopeCurator = 2;
  
  class ItemInfo : InventoryItem_Base_F {
    mass = 10;
  };
};

class Misery_gasmaskempty : Misery_ItemCore {
  displayName = "$STR_MISERY_GASMASKEMPTY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_GASMASKEMPTY_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\gasmask.paa";
  scope = 2;
  scopeCurator = 2;
  class ItemInfo : InventoryItem_Base_F {
    mass = 25;
  };
};

class Misery_gascartridge : Misery_ItemCore {
  displayName = "$STR_MISERY_GASCARTRIDGE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_GASCARTRIDGE_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\maskcartridges.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 20;
  };
};

class Misery_18vbat : Misery_ItemCore {
  displayName = "$STR_MISERY_18VBAT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_18VBAT_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\18vbat.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 20;
  };
};

class Misery_Ducttape : Misery_ItemCore {
  displayName = "$STR_MISERY_DUCTTAPE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_DUCTTAPE_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\ducttape.paa";
  model = "a3\structures_f_epa\items\tools\ducttape_f.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 18;
  };
};

class Misery_Pscrewdriver : Misery_ItemCore {
  displayName = "$STR_MISERY_PSCREWDRIVER_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_PSCREWDRIVER_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\phillips.paa";
  model = "a3\structures_f\items\tools\screwdriver_v2_f.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 15;
  };
};

class Misery_Fscrewdriver : Misery_ItemCore {
  displayName = "$STR_MISERY_FSCREWDRIVER_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_FSCREWDRIVER_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\flathead.paa";
  model = "a3\structures_f\items\tools\screwdriver_v1_f.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 15;
  };
};

class Misery_pliers : Misery_ItemCore {
  displayName = "$STR_MISERY_PLIERS_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_PLIERS_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\pliers.paa";
  model = "a3\structures_f\items\tools\pliers_f.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 25;
  };
};

class Misery_camonet : Misery_ItemCore {
  displayName = "$STR_MISERY_CAMONET_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_CAMONET_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\camonet.paa";
  model = "\z\misery\addons\assets\data\models\camonet.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 40;
  };
};

class Misery_9vbat : Misery_ItemCore {
  displayName = "$STR_MISERY_9VBAT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_9VBAT_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\9Vbat.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 10;
  };
};

class Misery_CoppWire : Misery_ItemCore {
  displayName = "$STR_MISERY_COPPWIRE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_COPPWIRE_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\copperwire.paa";
  model = "a3\structures_f_epa\items\tools\metalwire_f.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 10;
  };
};

class Misery_Rope : Misery_ItemCore {
  displayName = "$STR_MISERY_ROPE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ROPE_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\rope.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 15;
  };
};

class Misery_Needlethread : Misery_ItemCore {
  displayName = "$STR_MISERY_NEEDLETHREAD_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_NEEDLETHREAD_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\needlethread.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 8;
  };
};

class Misery_circuitboard : Misery_ItemCore {
  displayName = "$STR_MISERY_CIRCUITBOARD_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_CIRCUITBOARD_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\CircutBoard.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 10;
  };
};

class Misery_DeadGeiger : Misery_ItemCore {
  displayName = "$STR_MISERY_DEADGEIGER_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_DEADGEIGER_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\DeadGeiger.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 10;
  };
};

class Misery_DragonVase : Misery_ItemCore {
  displayName = "$STR_MISERY_DRAGONVASE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_DRAGONVASE_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\DragonVase.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 15;
  };
};

class Misery_Matryoshka : Misery_ItemCore {
  displayName = "$STR_MISERY_MATRYOSHKA_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_MATRYOSHKA_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\Matryoshka.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 15;
  };
};

class Misery_OldWatch : Misery_ItemCore {
  displayName = "$STR_MISERY_OLDWATCH_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_OLDWATCH_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\OldWatch.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 10;
  };
};

class Misery_Phone : Misery_ItemCore {
  displayName = "$STR_MISERY_PHONE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_PHONE_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\Phone.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 15;
  };
};

class Misery_Photos : Misery_ItemCore {
  displayName = "$STR_MISERY_PHOTOS_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_PHOTOS_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\Photos.paa";
  model = "a3\structures_f\items\documents\filephotos_f.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 5;
  };
};

class Misery_ToySoldier : Misery_ItemCore {
  displayName = "$STR_MISERY_TOYSOLDIER_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_TOYSOLDIER_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\ToySoldier.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 5;
  };
};

class Misery_VintageShipBottle : Misery_ItemCore {
  displayName = "$STR_MISERY_VINTAGESHIPBOTTLE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_VINTAGESHIPBOTTLE_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\VintageShipBottle.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 15;
  };
};

class Misery_zombiehead : Misery_ItemCore {
  displayName = "$STR_MISERY_ZOMBIEHEAD_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ZOMBIEHEAD_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\head.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 35;
  };
};

class Misery_zombiehand : Misery_ItemCore {
  displayName = "$STR_MISERY_ZOMBIEHAND_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ZOMBIEHAND_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\hand.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 15;
  };
};

class Misery_Zombieeye : Misery_ItemCore {
  displayName = "$STR_MISERY_ZOMBIEEYE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ZOMBIEEYE_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\eye.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 10;
  };
};

class Misery_Zombiefoot : Misery_ItemCore {
  displayName = "$STR_MISERY_ZOMBIEFOOT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ZOMBIEFOOT_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\foot.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 25;
  };
};

class Misery_Zombiebrain : Misery_ItemCore {
  displayName = "$STR_MISERY_ZOMBIEBRAIN_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ZOMBIEBRAIN_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\brain.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 30;
  };
};

class Misery_Zombieskin : Misery_ItemCore {
  displayName = "$STR_MISERY_ZOMBIESKIN_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ZOMBIESKIN_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\skin.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 20;
  };
};

class Misery_BONEsaw : Misery_ItemCore {
  displayName = "$STR_MISERY_BONESAW_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_BONESAW_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\hacksaw.paa";
  model = "\a3\structures_f\Items\Tools\Saw_F.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 35;
  };
};

class Misery_GuttingKnife : Misery_ItemCore {
  displayName = "$STR_MISERY_GUTTINGKNIFE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_GUTTINGKNIFE_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\GuttingKnife.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 25;
  };
};

class Misery_Woodaxe : Misery_ItemCore {
  displayName = "$STR_MISERY_WOODAXE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_WOODAXE_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\Woodaxe.paa";
  model = "a3\structures_f\items\tools\axe_f.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 50;
  };
};

class Misery_Sledghammer : Misery_ItemCore {
  displayName = "$STR_MISERY_SLEDGHAMMER_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_SLEDGHAMMER_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\sledgehammer.paa";
  model = "\z\misery\addons\assets\data\models\sledgehammer.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 85;
  };
};

class Misery_tinder : Misery_ItemCore {
  displayName = "$STR_MISERY_TINDER_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_TINDER_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\tinder.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 5;
  };
};

class Misery_CBRNparts : Misery_ItemCore {
  displayName = "$STR_MISERY_CBRNPARTS_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_CBRNPARTS_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\CBRN_Parts.paa";
  model = "a3\supplies_f_orange\bags\b_messenger_f.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 30;
  };
};

class Misery_Chainsawempty : Misery_ItemCore {
  displayName = "$STR_MISERY_CHAINSAWEMPTY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_CHAINSAWEMPTY_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\chainsaw.paa";
  model = "\z\misery\addons\assets\data\models\chainsaw.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 100;
  };
};

class Misery_woodplank : Misery_ItemCore {
  displayName = "$STR_MISERY_WOODPLANK_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_WOODPLANK_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\woodplank.paa";
  model = "\z\misery\addons\assets\data\models\woodplank.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_woodnail : Misery_ItemCore {
  displayName = "$STR_MISERY_WOODNAIL_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_WOODNAIL_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\Woodnail.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_woodensticks : Misery_ItemCore {
  displayName = "$STR_MISERY_WOODENSTICKS_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_WOODENSTICKS_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\woodsticks.paa";
  model = "\z\misery\addons\assets\data\models\woodsticks.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 35;
  };
};

class Misery_firewood : Misery_ItemCore {
  displayName = "$STR_MISERY_FIREWOOD_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_FIREWOOD_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\firewood.paa";
  model = "\z\misery\addons\assets\data\models\firewoodbundle.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 75;
  };
};

class Misery_woodenlog : Misery_ItemCore {
  displayName = "$STR_MISERY_WOODENLOG_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_WOODENLOG_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\woodenlog.paa";
  model = "\z\misery\addons\assets\data\models\bigwoodlog.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 225;
  };
};

class Misery_boxnails : Misery_ItemCore {
  displayName = "$STR_MISERY_BOXNAILS_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_BOXNAILS_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\boxnails.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_craftinghammer : Misery_ItemCore {
  displayName = "$STR_MISERY_CRAFTINGHAMMER_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_CRAFTINGHAMMER_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\craftinghammer.paa";
  model = "\z\misery\addons\assets\data\models\craftinghammer.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 15;
  };
};

class Misery_Anvilhammer : Misery_ItemCore {
  displayName = "$STR_MISERY_ANVILHAMMER_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ANVILHAMMER_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\anvilhammer.paa";
  model = "\z\misery\addons\assets\data\models\anvilhammer.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 35;
  };
};

class Misery_electrichandsawnobattery : Misery_ItemCore {
  displayName = "$STR_MISERY_ELECTRICHANDSAWNOBATTERY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ELECTRICHANDSAWNOBATTERY_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\ElectricHandCircularSaw.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 25;
  };
};

class Misery_wrench : Misery_ItemCore {
  displayName = "$STR_MISERY_WRENCH_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_WRENCH_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\wrench.paa";
  model = "a3\structures_f\items\tools\wrench_f.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 15;
  };
};

class Misery_glucose : Misery_ItemCore {
  displayName = "$STR_MISERY_GLUCOSE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_GLUCOSE_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\Glucose.paa";
  model = "a3\props_f_orange\humanitarian\garbage\medicalgarbage_01_injector_f.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 3;
  };
};

class Misery_electrolyte : Misery_ItemCore {
  displayName = "$STR_MISERY_ELECTROLYTE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ELECTROLYTE_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\Electrolyte.paa";
  model = "a3\props_f_orange\humanitarian\garbage\medicalgarbage_01_injector_f.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 3;
  };
};

class Misery_PDA_NB : Misery_ItemCore {
  displayName = "$STR_MISERY_PDA_NB_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_PDA_NB_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\PDAnobattery.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 7;
  };
};

class Misery_EmptyJet : Misery_ItemCore {
  displayName = "$STR_MISERY_EMPTYJET_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_EMPTYJET_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\CanisterJetFuel.paa";
  model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 50;
  };
};

class Misery_EmptyDiesel : Misery_ItemCore {
  displayName = "$STR_MISERY_EMPTYDIESEL_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_EMPTYDIESEL_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\CanisterDiesel.paa";
  model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 50;
  };
};

class Misery_EmptyPetrol : Misery_ItemCore {
  displayName = "$STR_MISERY_EMPTYPETROL_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_EMPTYPETROL_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\CanisterPetrol.paa";
  model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 50;
  };
};

class Misery_Stonechunk : Misery_ItemCore {
  displayName = "$STR_MISERY_STONECHUNK_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_STONECHUNK_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\stonepieces.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_Ironingot : Misery_ItemCore {
  displayName = "$STR_MISERY_IRONINGOT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_IRONINGOT_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\ironingot.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_Ironore : Misery_ItemCore {
  displayName = "$STR_MISERY_IRONORE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_IRONORE_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\ironore.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_Ironpiece : Misery_ItemCore {
  displayName = "$STR_MISERY_IRONPIECE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_IRONPIECE_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\ironpiece.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_Goldingot : Misery_ItemCore {
  displayName = "$STR_MISERY_GOLDINGOT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_GOLDINGOT_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\goldingot.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_Goldore : Misery_ItemCore {
  displayName = "$STR_MISERY_GOLDORE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_GOLDORE_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\goldore.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_Goldpiece : Misery_ItemCore {
  displayName = "$STR_MISERY_GOLDPIECE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_GOLDPIECE_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\goldpiece.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_Coalore : Misery_ItemCore {
  displayName = "$STR_MISERY_COALORE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_COALORE_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\coalore.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_Malachite : Misery_ItemCore {
  displayName = "$STR_MISERY_MALACHITE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_MALACHITE_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\malachite.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_Ruby : Misery_ItemCore {
  displayName = "$STR_MISERY_RUBY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_RUBY_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\ruby.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_Sapphire : Misery_ItemCore {
  displayName = "$STR_MISERY_SAPPHIRE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_SAPPHIRE_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\sapphire.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_Amethyst : Misery_ItemCore {
  displayName = "$STR_MISERY_AMETHYST_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_AMETHYST_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\amethyst.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_Diamond : Misery_ItemCore {
  displayName = "$STR_MISERY_DIAMOND_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_DIAMOND_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\diamond.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_Emerald : Misery_ItemCore {
  displayName = "$STR_MISERY_EMERALD_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_EMERALD_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\emerald.paa";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_RFHighNobattery: Misery_ItemCore {
  displayName = "$STR_MISERY_RFHIGHNOBATTERY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_RFHIGHNOBATTERY_DESCRIPTION";
  picture = "\z\misery\addons\assets\data\EMFdetectorhighrangenobattery.paa";
  model = "\A3\Weapons_F\Items\MineDetector";
  scope = 2;
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 5;
  };
};

}; 
