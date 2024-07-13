
class CfgWeapons {
class ItemCore; // External class reference

//Placeholder item ignore this
class Misery_ItemCore : ItemCore {
  type = 4096;
  detectRange = -1;
  scopeCurator = 2;
  simulation = "ItemMineDetector";
};

//If model is NOT classed IE model = ""; the object will not be created, instead leave it blank if no model

class InventoryItem_Base_F;	// External class reference
class InventoryFirstAidKitItem_Base_F;	// External class reference
class MedikitItem;	// External class reference
class SlotInfo;	// External class reference

//class H_HelmetB;	// External class reference
//class HeadgearItem; //External class reference
//class NVGoggles;
//class Goggles;

class Misery_Pickaxe : Misery_ItemCore {
  displayName = "$STR_MISERY_PICKAXE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_PICKAXE_DESCRIPTION";
  picture = "z\misery\addons\assets\data\pickaxe.paa";
  model = "z\misery\addons\assets\data\models\other\pickaxe.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 85;
  };
};

class Misery_Pickaxebroken : Misery_ItemCore {
  displayName = "$STR_MISERY_PICKAXEBROKEN_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_PICKAXEBROKEN_DESCRIPTION";
  picture = "z\misery\addons\assets\data\brokenpickaxe.paa";
  model = "z\misery\addons\assets\data\models\other\pickaxe.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 85;
  };
};

class Misery_fishingpole : Misery_ItemCore {
  displayName = "$STR_MISERY_FISHINGPOLE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_FISHINGPOLE_DESCRIPTION";
  picture = "z\misery\addons\assets\data\fishingpole2.paa";
  model = "z\misery\addons\assets\data\models\fishingrod.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 30;
  };
};

class Misery_fishingspool : Misery_ItemCore {
  displayName = "$STR_MISERY_FISHINGSPOOL_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_FISHINGSPOOL_DESCRIPTION";
  picture = "z\misery\addons\assets\data\fishingspool.paa";
  model = "z\misery\addons\assets\data\models\fishingspool.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 5;
  };
};

// class Misery_personalgeiger : Misery_ItemCore {
//   displayName = "$STR_MISERY_PERSONALGEIGER_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_PERSONALGEIGER_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\personalgeiger.paa";
//   model = "\A3\Weapons_F\Items\MineDetector";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 10;
//   };
// };

class Misery_personalgeigernobattery : Misery_ItemCore {
  displayName = "$STR_MISERY_PERSONALGEIGERNOBATTERY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_PERSONALGEIGERNOBATTERY_DESCRIPTION";
  picture = "z\misery\addons\assets\data\personalgeigernobattery.paa";
  model = "\A3\Weapons_F\Items\MineDetector";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 10;
  };
};

// class Misery_personalgeigerOFF : Misery_ItemCore {
//   displayName = "$STR_MISERY_PERSONALGEIGEROFF_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_PERSONALGEIGEROFF_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\personalgeigernobattery.paa";
//   model = "\A3\Weapons_F\Items\MineDetector";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 10;
//   };
// };

// class Misery_crumpledpaper : Misery_ItemCore {
//   displayName = "crumpled paper";
//   descriptionShort = "Used to light fires 'kindling'<br/> - Fire crafting";
//   picture = "z\misery\addons\assets\data\crumpledpaper.paa";
//   model = "\A3\Structures_F\Items\Documents\Notepad_F.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 1;
//   };
// };

  class Misery_Headlamp_NB : Misery_ItemCore {
    displayName = "$STR_MISERY_HEADLAMP_NB_DISPLAYNAME";
    descriptionShort = "$STR_MISERY_HEADLAMP_NB_DESCRIPTION";
    picture = "z\misery\addons\assets\data\headlamp.paa";
    scope = "public";
    scopeCurator = 2;

    class ItemInfo : InventoryItem_Base_F {
      mass = 10;
    };
  };

//  class Misery_HeadlampOFF : Misery_ItemCore {
//     displayName = "$STR_MISERY_HEADLAMPOFF_DISPLAYNAME";
//     descriptionShort = "$STR_MISERY_HEADLAMPOFF_DESCRIPTION";
//     picture = "z\misery\addons\assets\data\headlamp.paa";
//     scope = "public";
//     scopeCurator = 2;

//     class ItemInfo : InventoryItem_Base_F {
//       mass = 10;
//     };
//   };

//  class Misery_HeadlampON : Misery_ItemCore {
//     displayName = "$STR_MISERY_HEADLAMPON_DISPLAYNAME";
//     descriptionShort = "$STR_MISERY_HEADLAMPON_DESCRIPTION";
//     picture = "z\misery\addons\assets\data\headlamp.paa";
//     scope = "public";
//     scopeCurator = 2;

//     class ItemInfo : InventoryItem_Base_F {
//       mass = 10;
//     };
//   };

//-------------Medical items:--------------------------//

// class Misery_potassiumiodate : Misery_ItemCore {
//   displayName = "Potassium Iodate";
//   descriptionShort = "Contains Anti-Radiation tablets";
//   picture = "z\misery\addons\assets\data\potassiumiodate2.paa";
//   model = "\a3\structures_f_epa\Items\Medical\VitaminBottle_F.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 2;
//   };
// };

// class Misery_sleeppack : Misery_ItemCore {
//   displayName = "$STR_MISERY_SLEEPPACK_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_SLEEPPACK_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\SleepingPillsBox.paa";
//   model = "\a3\structures_f_epa\Items\Medical\Antibiotic_F.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 8;
//   };
// };

// class Misery_sleeppill : Misery_ItemCore {
//   displayName = "$STR_MISERY_SLEEPPILL_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_SLEEPPILL_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\Sleeping_Pill.paa";
//   model = "z\misery\addons\assets\data\models\potassiumiodatepill.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 0.5;
//   };
// };

// class Misery_antibiotic : Misery_ItemCore {
//   displayName = "$STR_MISERY_ANTIBIOTIC_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_ANTIBIOTIC_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\antibiotics.paa";
//   model = "\a3\structures_f_epa\Items\Medical\Antibiotic_F.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 8;
//   };
// };

// class Misery_antibioticpill : Misery_ItemCore {
//   displayName = "$STR_MISERY_ANTIBIOTICPILL_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_ANTIBIOTICPILL_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\antibioticpill.paa";
//   model = "z\misery\addons\assets\data\models\antibioticpill.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 0.5;
//   };
// };

// class Misery_antiradiationpill : Misery_ItemCore {
//   displayName = "Potassium Iodate pill";
//   descriptionShort = "Can help treat radiation exposure<br/> - Radiation medication";
//   picture = "z\misery\addons\assets\data\antiradiationpill.paa";
//   model = "z\misery\addons\assets\data\models\potassiumiodatepill.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 1;
//   };
// };

// class Misery_antiparasitic : Misery_ItemCore {
//   displayName = "$STR_MISERY_ANTIPARASITIC_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_ANTIPARASITIC_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\antiparasites.paa";
//   model = "\a3\structures_f_epa\Items\Medical\Antibiotic_F.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 8;
//   };
// };

// class Misery_antiparasiticpill : Misery_ItemCore {
//   displayName = "$STR_MISERY_ANTIPARASITICPILL_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_ANTIPARASITICPILL_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\antiradiationpill.paa";
//   model = "z\misery\addons\assets\data\models\potassiumiodatepill.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 0.5;
//   };
// };

// class Misery_Clozapinebox : Misery_ItemCore {
//   displayName = "$STR_MISERY_CLOZAPINEBOX_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_CLOZAPINEBOX_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\clozapinebox.paa";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 8;
//   };
// };

// class Misery_ClozapinePill : Misery_ItemCore {
//   displayName = "$STR_MISERY_CLOZAPINEPILL_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_CLOZAPINEPILL_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\ClozapinePill.paa";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 0.1;
//   };
// };

class Misery_Clozapine : Misery_ItemCore {
  displayName = "$STR_MISERY_CLOZAPINE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_CLOZAPINE_DESCRIPTION";
  picture = "z\misery\addons\assets\data\Clozapineinjection.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 5;
  };
};


// class Misery_caffetin : Misery_ItemCore {
//   displayName = "$STR_MISERY_CAFFETIN_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_CAFFETIN_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\Caffetin.paa";
//   model = "\a3\structures_f_epa\Items\Medical\Antibiotic_F.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 8;
//   };
// };

// class Misery_caffetincaps : Misery_ItemCore {
//   displayName = "$STR_MISERY_CAFFETINCAPS_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_CAFFETINCAPS_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\Caffetinpills.paa";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 0.5;
//   };
// };

// class Misery_caffeine : Misery_ItemCore {
//   displayName = "$STR_MISERY_CAFFEINE_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_CAFFEINE_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\Caffeine.paa";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 0.5;
//   };
// };

// class Misery_charcoaltabs : Misery_ItemCore {
//   displayName = "$STR_MISERY_CHARCOALTABS_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_CHARCOALTABS_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\charcoaltabs.paa";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 0.5;
//   };
// };

// class Misery_pain : Misery_ItemCore {
//   displayName = "$STR_MISERY_PAIN_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_PAIN_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\painkillers.paa";
//   model = "\a3\structures_f_epa\Items\Medical\Antibiotic_F.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 8;
//   };
// };

// class Misery_painpill : Misery_ItemCore {
//   displayName = "$STR_MISERY_PAINPILL_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_PAINPILL_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\painpill.paa";
//   model = "z\misery\addons\assets\data\models\painpill.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 0.5;
//   };
// };

class Misery_cocaine : Misery_ItemCore {
  displayName = "$STR_MISERY_COCAINE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_COCAINE_DESCRIPTION";
  picture = "z\misery\addons\assets\data\cocaine.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0.5;
  };
};

class Misery_Thrombomodulin : Misery_ItemCore {
  displayName = "$STR_MISERY_THROMBOMODULIN_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_THROMBOMODULIN_DESCRIPTION";
  picture = "z\misery\addons\assets\data\Thbd.paa";
  model = "a3\props_f_orange\humanitarian\garbage\medicalgarbage_01_injector_f.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 5;
  };
};

class Misery_ThrombomodulinStimpack : Misery_ItemCore {
  displayName = "$STR_MISERY_THROMBOMODULINSTIMPACK_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_THROMBOMODULINSTIMPACK_DESCRIPTION";
  picture = "z\misery\addons\assets\data\Thbdstim.paa";
  model = "a3\props_f_orange\humanitarian\garbage\medicalgarbage_01_injector_f.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 8;
  };
};

// class Misery_Cenestin : Misery_ItemCore {
//   displayName = "$STR_MISERY_CENESTIN_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_CENESTIN_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\Cenestin.paa";
//   model = "z\misery\addons\assets\data\models\cenestin.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 0.5;
//   };
// };

// class Misery_Cenestinbottle : Misery_ItemCore {
//   displayName = "$STR_MISERY_CENESTINBOTTLE_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_CENESTINBOTTLE_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\Cenestin_Bottle.paa";
//   model = "\a3\structures_f_epa\Items\Medical\VitaminBottle_F.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 8;
//   };
// };

class Misery_randommedication : Misery_ItemCore {
  displayName = "$STR_MISERY_RANDOMMEDICATION_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_RANDOMMEDICATION_DESCRIPTION";
  picture = "z\misery\addons\assets\data\medication.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 5;
  };
};

//End of Medical items^^------------------//

//Sixth item continued
// class Misery_match : Misery_ItemCore { 
//   displayName = "Match";
//   descriptionShort = "used to craft a fire";
//   picture = "z\misery\addons\assets\data\match.paa";
//   model = "z\misery\addons\assets\data\models\match.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 2;
//   };
// };

//9th item
class Misery_fishhook : Misery_ItemCore {
  displayName = "$STR_MISERY_FISHHOOK_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_FISHHOOK_DESCRIPTION";
  picture = "z\misery\addons\assets\data\fishhook.paa";
  model = "z\misery\addons\assets\data\models\fishhook.p3d";
  hiddenSelectionsMaterials[] = {"z\misery\addons\assets\data\models\other\ui\fishhook.rvmat"};
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 2;
  };
};

//10th item
class Misery_worms : Misery_ItemCore {
  displayName = "$STR_MISERY_WORMS_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_WORMS_DESCRIPTION";
  picture = "z\misery\addons\assets\data\worms.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0.5;
  };
};

//11th item
class Misery_lithiumbattery : Misery_ItemCore {
  displayName = "$STR_MISERY_LITHIUMBATTERY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_LITHIUMBATTERY_DESCRIPTION";
  picture = "z\misery\addons\assets\data\NitecoreBATT.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 2;
  };
};

//-------------Food / Drink: ---------------//

class Misery_Bearenergy : Misery_ItemCore {
  displayName = "$STR_MISERY_BEARENERGY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_BEARENERGY_DESCRIPTION";
 picture = "z\misery\addons\assets\data\Bearstrength.paa";
  model = "z\misery\addons\assets\data\models\other\Bearenergy.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 8;
  };
};

class Misery_SodaCan : Misery_ItemCore {
  displayName = "$STR_MISERY_BEARENERGY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_BEARENERGY_DESCRIPTION";
 picture = "z\misery\addons\assets\data\Bearstrength.paa";
  model = "z\misery\addons\assets\data\models\other\Pepsi_Soda.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 4;
  };
};

class Misery_CanOpener : Misery_ItemCore {
  displayName = "$STR_MISERY_CANOPENER_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_CANOPENER_DESCRIPTION";
  picture = "z\misery\addons\assets\data\canOpener.paa";
  model = "a3\structures_f_epa\items\tools\canopener_f.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 10;
  };
};

class Misery_CanteenEmpty : Misery_ItemCore {
	scope = "public";
	author = "TenuredCLOUD";
	displayName = "$STR_MISERY_CANTEENEMPTY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_CANTEENEMPTY_DESCRIPTION";
  picture = "z\misery\addons\assets\data\canteen.paa";
  model = "a3\structures_f_epa\items\food\canteen_f.p3d";
	
  class ItemInfo : InventoryItem_Base_F {
    mass = 30;
  };
	};

  class Misery_WaterBottleEmpty : Misery_ItemCore {
	scope = "public";
	author = "TenuredCLOUD";
	displayName = "$STR_MISERY_WATERBOTTLEEMPTY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_WATERBOTTLEEMPTY_DESCRIPTION";
  picture = "z\misery\addons\assets\data\waterbottle.paa";
  model = "a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d";
	
  class ItemInfo : InventoryItem_Base_F {
    mass = 15;
  };
	};

  class Misery_Cereal : Misery_ItemCore {
  displayName = "$STR_MISERY_BEARENERGY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_BEARENERGY_DESCRIPTION";
  picture = "z\misery\addons\assets\data\cereal.paa";
  model = "a3\structures_f_epa\items\food\cerealsbox_f.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 4;
  };
};

  class Misery_Orange : Misery_ItemCore {
  displayName = "$STR_MISERY_BEARENERGY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_BEARENERGY_DESCRIPTION";
  picture = "z\misery\addons\assets\data\orange.paa";
  model = "a3\props_f_orange\humanitarian\supplies\orange_01_f.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 2;
  };
};  

class Misery_Drymilk : Misery_ItemCore {
  displayName = "$STR_MISERY_BEARENERGY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_BEARENERGY_DESCRIPTION";
  picture = "z\misery\addons\assets\data\drymilk.paa";
  model = "a3\structures_f_epa\items\food\powderedmilk_f.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 4;
  };
}; 

class Misery_CannedBacon : Misery_ItemCore {
  displayName = "$STR_MISERY_BEARENERGY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_BEARENERGY_DESCRIPTION";
  picture = "z\misery\addons\assets\data\CannedBacon.paa";
  model = "a3\structures_f\items\food\tacticalbacon_f.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 10;
  };
}; 

class Misery_CannedBeans : Misery_ItemCore {
  displayName = "$STR_MISERY_BEARENERGY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_BEARENERGY_DESCRIPTION";
  picture = "z\misery\addons\assets\data\CannedBeans.paa";
  model = "a3\structures_f_epa\items\food\bakedbeans_f.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 10;
  };
}; 

//Artifact containers ------------------------//
class Misery_leadcontaineropen : Misery_ItemCore {
  displayName = "$STR_MISERY_LEADCONTAINEROPEN_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_LEADCONTAINEROPEN_DESCRIPTION";
  picture = "z\misery\addons\assets\data\artifactcontaineropen.paa";
  model = "a3\structures_f_bootcamp\items\food\foodcontainer_01_f.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 50;
  };
};

class Misery_leadcontainerclosed : Misery_ItemCore {
  displayName = "$STR_MISERY_LEADCONTAINERCLOSED_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_LEADCONTAINERCLOSED_DESCRIPTION";
  picture = "z\misery\addons\assets\data\artifactcontaineropen.paa";
  model = "a3\structures_f_bootcamp\items\food\foodcontainer_01_f.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 50;
  };
};

//End of Artifact containers ------------------------//

//----------Artifacts:-------------------//
class Misery_artifact01 : Misery_ItemCore {
  displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
  picture = "z\misery\addons\assets\data\Artifact01.paa";
  model = "z\misery\addons\assets\data\models\other\artifact.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 3;
  };
};

class Misery_artifact02 : Misery_ItemCore {
  displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
  picture = "z\misery\addons\assets\data\Artifact02.paa";
  model = "z\misery\addons\assets\data\models\other\artifact.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 3;
  };
};

class Misery_artifact03 : Misery_ItemCore {
  displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
  picture = "z\misery\addons\assets\data\Artifact03.paa";
  model = "z\misery\addons\assets\data\models\other\artifact.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 3;
  };
};

class Misery_artifact04 : Misery_ItemCore {
  displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
  picture = "z\misery\addons\assets\data\Artifact04.paa";
  model = "z\misery\addons\assets\data\models\other\artifact.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 3;
  };
};

class Misery_artifact05 : Misery_ItemCore {
  displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
  picture = "z\misery\addons\assets\data\Artifact05.paa";
  model = "z\misery\addons\assets\data\models\other\artifact.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 3;
  };
};

class Misery_artifact06 : Misery_ItemCore {
  displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
  picture = "z\misery\addons\assets\data\Artifact06.paa";
  model = "z\misery\addons\assets\data\models\other\artifact.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 3;
  };
};

class Misery_artifact07 : Misery_ItemCore {
  displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
  picture = "z\misery\addons\assets\data\Artifact07.paa";
  model = "z\misery\addons\assets\data\models\other\artifact.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 3;
  };
};

class Misery_artifact08 : Misery_ItemCore {
  displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
  picture = "z\misery\addons\assets\data\Artifact08.paa";
  model = "z\misery\addons\assets\data\models\other\artifact.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 3;
  };
};

class Misery_artifact09 : Misery_ItemCore {
  displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
  picture = "z\misery\addons\assets\data\Artifact09.paa";
  model = "z\misery\addons\assets\data\models\other\artifact.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 3;
  };
};

class Misery_artifact10 : Misery_ItemCore {
  displayName = "$STR_MISERY_ARTIFACT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ARTIFACT_DESCRIPTION";
  picture = "z\misery\addons\assets\data\Artifact10.paa";
  model = "z\misery\addons\assets\data\models\other\artifact.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 3;
  };
};

//----------End of Artifacts^^ ------------------//


/////////////////////FOOD / MISC /////////////////////////////// 

class Misery_Heatpack : Misery_ItemCore {
  displayName = "$STR_MISERY_HEATPACK_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_HEATPACK_DESCRIPTION";
  picture = "z\misery\addons\assets\data\hotpack.paa";
  model = "a3\structures_f_epa\items\medical\heatpack_f.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 8;
  };
};

class Misery_Coldpack : Misery_ItemCore {
  displayName = "$STR_MISERY_COLDPACK_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_COLDPACK_DESCRIPTION";
  picture = "z\misery\addons\assets\data\coldpack.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 8;
  };
};

// class Misery_WaterJerryF : Misery_ItemCore {
//   displayName = "$STR_MISERY_WATERJERRYF_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_WATERJERRYF_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\CanisterWater.paa";
//   model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 150;
//   };
// };

// class Misery_WaterJerryFD : Misery_ItemCore {
//   displayName = "$STR_MISERY_WATERJERRYFD_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_WATERJERRYFD_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\CanisterWater.paa";
//   model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 150;
//   };
// };

class Misery_WaterJerryE : Misery_ItemCore {
  displayName = "$STR_MISERY_WATERJERRYE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_WATERJERRYE_DESCRIPTION";
  picture = "z\misery\addons\assets\data\CanisterWater.paa";
  model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 50;
  };
};

class Misery_castironpot : Misery_ItemCore {
  displayName = "$STR_MISERY_CASTIRONPOT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_CASTIRONPOT_DESCRIPTION";
  picture = "z\misery\addons\assets\data\castironpot.paa";
  model = "z\misery\addons\assets\data\models\other\CastIron_Pot.p3d";
  hiddenSelectionsMaterials[] = {"z\misery\addons\assets\data\models\other\ui\Iron.rvmat"};
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 90;
  };
};

class Misery_cookedfish : Misery_ItemCore {
  displayName = "$STR_MISERY_COOKEDFISH_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_COOKEDFISH_DESCRIPTION";
  picture = "z\misery\addons\assets\data\cookedfish.paa";
  model = "z\misery\addons\assets\data\models\other\fishcooked.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 3;
  };
};

class Misery_rawfish_1 : Misery_ItemCore {
  displayName = "$STR_MISERY_RAWFISH_1_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_RAWFISH_1_DESCRIPTION";
  picture = "z\misery\addons\assets\data\rawfish.paa";
  model = "z\misery\addons\assets\data\models\other\fish.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 5;
  };
};

// class Misery_rawfish_2 : Misery_ItemCore {
//   displayName = "Fish";
//   descriptionShort = "Fish, needs to be cooked";
//   picture = "z\misery\addons\assets\data\rawfish.paa";
//   model = "z\misery\addons\assets\data\models\other\fish.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 5;
//   };
// };

// class Misery_rawfish_3 : Misery_ItemCore {
//   displayName = "Fish";
//   descriptionShort = "Fish, needs to be cooked";
//   picture = "z\misery\addons\assets\data\rawfish.paa";
//   model = "z\misery\addons\assets\data\models\other\fish.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 5;
//   };
// };

// class Misery_rawfish_4 : Misery_ItemCore {
//   displayName = "Fish";
//   descriptionShort = "Fish, needs to be cooked";
//   picture = "z\misery\addons\assets\data\rawfish.paa";
//   model = "z\misery\addons\assets\data\models\other\fish.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 5;
//   };
// };

// class Misery_rawfish_5 : Misery_ItemCore {
//   displayName = "Fish";
//   descriptionShort = "Fish, needs to be cooked";
//   picture = "z\misery\addons\assets\data\rawfish.paa";
//   model = "z\misery\addons\assets\data\models\other\fish.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 5;
//   };
// };

class Misery_cookedmeat : Misery_ItemCore {
  displayName = "Cooked Meat";
  descriptionShort = "Meat that's been cooked";
  picture = "z\misery\addons\assets\data\cookedmeat.paa";
  model = "z\misery\addons\assets\data\models\other\cookedmeat.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 5;
  };
};

class Misery_rawmeat_1 : Misery_ItemCore {
  displayName = "Raw Meat";
  descriptionShort = "Raw meat, needs to be cooked";
  picture = "z\misery\addons\assets\data\rawmeat.paa";
  model = "z\misery\addons\assets\data\models\other\rawmeat.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 5;
  };
};

// class Misery_rawmeat_2 : Misery_ItemCore {
//   displayName = "Raw Meat";
//   descriptionShort = "Raw meat, needs to be cooked";
//   picture = "z\misery\addons\assets\data\rawmeat.paa";
//   model = "z\misery\addons\assets\data\models\other\rawmeat.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 5;
//   };
// };

// class Misery_rawmeat_3 : Misery_ItemCore {
//   displayName = "Raw Meat";
//   descriptionShort = "Raw meat, needs to be cooked";
//   picture = "z\misery\addons\assets\data\rawmeat.paa";
//  model = "z\misery\addons\assets\data\models\other\rawmeat.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 5;
//   };
// };

// class Misery_rawmeat_4 : Misery_ItemCore {
//   displayName = "Raw Meat";
//   descriptionShort = "Raw meat, needs to be cooked";
//   picture = "z\misery\addons\assets\data\rawmeat.paa";
//   model = "z\misery\addons\assets\data\models\other\rawmeat.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 5;
//   };
// };

// class Misery_rawmeat_5 : Misery_ItemCore {
//   displayName = "Raw meat";
//   descriptionShort = "Raw meat, needs to be cooked";
//   picture = "z\misery\addons\assets\data\rawmeat.paa";
//   model = "z\misery\addons\assets\data\models\other\rawmeat.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 5;
//   };
// };

// class Misery_rottenmeat : Misery_ItemCore {
//   displayName = "Rotten Meat";
//   descriptionShort = "Raw meat that has gone bad...";
//   picture = "z\misery\addons\assets\data\cookedfish.paa";
//   model = "z\misery\addons\assets\data\models\other\fish.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 5;
//   };
// };

// class Misery_vodkafull : Misery_ItemCore {
//   displayName = "$STR_MISERY_VODKAFULL_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_VODKA_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\vodka.paa";
//   model = "z\misery\addons\assets\data\models\other\vodka.p3d";
//   hiddenSelectionsMaterials[] = {"z\misery\addons\assets\data\models\other\UI\vodka.rvmat"};
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 35;
//   };
// };

// class Misery_vodka34 : Misery_ItemCore {
//   displayName = "$STR_MISERY_VODKA34_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_VODKA_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\vodka.paa";
//   model = "z\misery\addons\assets\data\models\other\vodka.p3d";
//   hiddenSelectionsMaterials[] = {"z\misery\addons\assets\data\models\other\UI\vodka.rvmat"};
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 30;
//   };
// };

// class Misery_vodka12 : Misery_ItemCore {
//   displayName = "$STR_MISERY_VODKA12_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_VODKA_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\vodka.paa";
//   model = "z\misery\addons\assets\data\models\other\vodka.p3d";
//   hiddenSelectionsMaterials[] = {"z\misery\addons\assets\data\models\other\UI\vodka.rvmat"};
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 25;
//   };
// };

// class Misery_vodka14 : Misery_ItemCore {
//   displayName = "$STR_MISERY_VODKA14_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_VODKA_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\vodka.paa";
//   model = "z\misery\addons\assets\data\models\other\vodka.p3d";
//   hiddenSelectionsMaterials[] = {"z\misery\addons\assets\data\models\other\UI\vodka.rvmat"};
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 20;
//   };
// };

//NEEDS NEW ASSETvvvvvvvvv

// class Misery_guitar : Misery_ItemCore {
//   displayName = "$STR_MISERY_GUITAR_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_GUITAR_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\guitar.paa";
//   model = "z\misery\addons\assets\data\models\other\dirtyguitar.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 40;
//   };
// };

class Misery_coffeemug : Misery_ItemCore {
  displayName = "$STR_MISERY_COFFEEMUG_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_COFFEEMUG_DESCRIPTION";
  picture = "z\misery\addons\assets\data\coffeemug.paa";
  model = "z\misery\addons\assets\data\models\coffeemug.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 10;
  };
};

class Misery_coffeebrewed : Misery_ItemCore {
  displayName = "$STR_MISERY_COFFEEBREWED_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_COFFEEBREWED_DESCRIPTION";
  picture = "z\misery\addons\assets\data\coffeebrewed.paa";
  model = "z\misery\addons\assets\data\models\coffeemugB.p3d";
  scope = "public";
  scopeCurator = 2;
  
  class ItemInfo : InventoryItem_Base_F {
    mass = 10;
  };
};

// class Misery_coffeegrounds : Misery_ItemCore {
//   displayName = "$STR_MISERY_COFFEEGROUNDS_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_COFFEEGROUNDS_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\coffeegrounds.paa";
//   model = "z\misery\addons\assets\data\models\coffeegrounds.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 10;
//   };
// };

// class Misery_wolfbeer : Misery_ItemCore {
//   displayName = "$STR_MISERY_WOLFBEER_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_WOLFBEER_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\WolfBeer.paa";
//   model = "z\misery\addons\assets\data\models\other\beer.p3d";
//   hiddenSelectionsMaterials[] = {"z\misery\addons\assets\data\models\other\UI\beer.rvmat"};
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 25;
//   };
// };

/////////////////////MISC///////////////////////////////

class Misery_gasmaskempty : Misery_ItemCore {
  displayName = "$STR_MISERY_GASMASKEMPTY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_GASMASKEMPTY_DESCRIPTION";
  picture = "z\misery\addons\assets\data\gasmask.paa";
  scope = "public";
  scopeCurator = 2;
  class ItemInfo : InventoryItem_Base_F {
    mass = 25;
  };
};

class Misery_gascartridge : Misery_ItemCore {
  displayName = "$STR_MISERY_GASCARTRIDGE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_GASCARTRIDGE_DESCRIPTION";
  picture = "z\misery\addons\assets\data\maskcartridges.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 20;
  };
};

class Misery_18vbat : Misery_ItemCore {
  displayName = "$STR_MISERY_18VBAT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_18VBAT_DESCRIPTION";
  picture = "z\misery\addons\assets\data\18vbat.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 20;
  };
};

class Misery_Ducttape : Misery_ItemCore {
  displayName = "$STR_MISERY_DUCTTAPE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_DUCTTAPE_DESCRIPTION";
  picture = "z\misery\addons\assets\data\ducttape.paa";
  model = "a3\structures_f_epa\items\tools\ducttape_f.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 18;
  };
};

class Misery_Pscrewdriver : Misery_ItemCore {
  displayName = "$STR_MISERY_PSCREWDRIVER_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_PSCREWDRIVER_DESCRIPTION";
  picture = "z\misery\addons\assets\data\phillips.paa";
  model = "a3\structures_f\items\tools\screwdriver_v2_f.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 15;
  };
};

class Misery_Fscrewdriver : Misery_ItemCore {
  displayName = "$STR_MISERY_FSCREWDRIVER_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_FSCREWDRIVER_DESCRIPTION";
  picture = "z\misery\addons\assets\data\flathead.paa";
  model = "a3\structures_f\items\tools\screwdriver_v1_f.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 15;
  };
};

class Misery_pliers : Misery_ItemCore {
  displayName = "$STR_MISERY_PLIERS_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_PLIERS_DESCRIPTION";
  picture = "z\misery\addons\assets\data\pliers.paa";
  model = "a3\structures_f\items\tools\pliers_f.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 25;
  };
};

class Misery_camonet : Misery_ItemCore {
  displayName = "$STR_MISERY_CAMONET_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_CAMONET_DESCRIPTION";
  picture = "z\misery\addons\assets\data\camonet.paa";
  model = "z\misery\addons\assets\data\models\other\camonet.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 40;
  };
};

class Misery_9vbat : Misery_ItemCore {
  displayName = "$STR_MISERY_9VBAT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_9VBAT_DESCRIPTION";
  picture = "z\misery\addons\assets\data\9Vbat.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 10;
  };
};

class Misery_CoppWire : Misery_ItemCore {
  displayName = "$STR_MISERY_COPPWIRE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_COPPWIRE_DESCRIPTION";
  picture = "z\misery\addons\assets\data\copperwire.paa";
  model = "a3\structures_f_epa\items\tools\metalwire_f.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 10;
  };
};

class Misery_Rope : Misery_ItemCore {
  displayName = "$STR_MISERY_ROPE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ROPE_DESCRIPTION";
  picture = "z\misery\addons\assets\data\rope.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 15;
  };
};

class Misery_Needlethread : Misery_ItemCore {
  displayName = "$STR_MISERY_NEEDLETHREAD_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_NEEDLETHREAD_DESCRIPTION";
  picture = "z\misery\addons\assets\data\needlethread.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 8;
  };
};

class Misery_circuitboard : Misery_ItemCore {
  displayName = "$STR_MISERY_CIRCUITBOARD_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_CIRCUITBOARD_DESCRIPTION";
  picture = "z\misery\addons\assets\data\CircutBoard.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 10;
  };
};

class Misery_DeadGeiger : Misery_ItemCore {
  displayName = "$STR_MISERY_DEADGEIGER_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_DEADGEIGER_DESCRIPTION";
  picture = "z\misery\addons\assets\data\DeadGeiger.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 10;
  };
};

class Misery_DragonVase : Misery_ItemCore {
  displayName = "$STR_MISERY_DRAGONVASE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_DRAGONVASE_DESCRIPTION";
  picture = "z\misery\addons\assets\data\DragonVase.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 15;
  };
};

class Misery_Matryoshka : Misery_ItemCore {
  displayName = "$STR_MISERY_MATRYOSHKA_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_MATRYOSHKA_DESCRIPTION";
  picture = "z\misery\addons\assets\data\Matryoshka.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 15;
  };
};

class Misery_OldWatch : Misery_ItemCore {
  displayName = "$STR_MISERY_OLDWATCH_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_OLDWATCH_DESCRIPTION";
  picture = "z\misery\addons\assets\data\OldWatch.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 10;
  };
};

class Misery_Phone : Misery_ItemCore {
  displayName = "$STR_MISERY_PHONE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_PHONE_DESCRIPTION";
  picture = "z\misery\addons\assets\data\Phone.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 15;
  };
};

class Misery_Photos : Misery_ItemCore {
  displayName = "$STR_MISERY_PHOTOS_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_PHOTOS_DESCRIPTION";
  picture = "z\misery\addons\assets\data\Photos.paa";
  model = "a3\structures_f\items\documents\filephotos_f.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 5;
  };
};

class Misery_ToySoldier : Misery_ItemCore {
  displayName = "$STR_MISERY_TOYSOLDIER_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_TOYSOLDIER_DESCRIPTION";
  picture = "z\misery\addons\assets\data\ToySoldier.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 5;
  };
};

class Misery_VintageShipBottle : Misery_ItemCore {
  displayName = "$STR_MISERY_VINTAGESHIPBOTTLE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_VINTAGESHIPBOTTLE_DESCRIPTION";
  picture = "z\misery\addons\assets\data\VintageShipBottle.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 15;
  };
};

/////////////////////Ecology / zed parts /////////////////////////////// 

class Misery_zombiehead : Misery_ItemCore {
  displayName = "$STR_MISERY_ZOMBIEHEAD_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ZOMBIEHEAD_DESCRIPTION";
  picture = "z\misery\addons\assets\data\head.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 35;
  };
};

class Misery_zombiehand : Misery_ItemCore {
  displayName = "$STR_MISERY_ZOMBIEHAND_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ZOMBIEHAND_DESCRIPTION";
  picture = "z\misery\addons\assets\data\hand.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 15;
  };
};

class Misery_Zombieeye : Misery_ItemCore {
  displayName = "$STR_MISERY_ZOMBIEEYE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ZOMBIEEYE_DESCRIPTION";
  picture = "z\misery\addons\assets\data\eye.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 10;
  };
};

class Misery_Zombiefoot : Misery_ItemCore {
  displayName = "$STR_MISERY_ZOMBIEFOOT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ZOMBIEFOOT_DESCRIPTION";
  picture = "z\misery\addons\assets\data\foot.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 25;
  };
};

class Misery_Zombiebrain : Misery_ItemCore {
  displayName = "$STR_MISERY_ZOMBIEBRAIN_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ZOMBIEBRAIN_DESCRIPTION";
  picture = "z\misery\addons\assets\data\brain.paa";
  model = "z\misery\addons\assets\data\models\brain.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 30;
  };
};

class Misery_Zombieskin : Misery_ItemCore {
  displayName = "$STR_MISERY_ZOMBIESKIN_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ZOMBIESKIN_DESCRIPTION";
  picture = "z\misery\addons\assets\data\skin.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 20;
  };
};

class Misery_BONEsaw : Misery_ItemCore {
  displayName = "$STR_MISERY_BONESAW_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_BONESAW_DESCRIPTION";
  picture = "z\misery\addons\assets\data\hacksaw.paa";
  model = "\a3\structures_f\Items\Tools\Saw_F.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 35;
  };
};

class Misery_GuttingKnife : Misery_ItemCore {
  displayName = "$STR_MISERY_GUTTINGKNIFE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_GUTTINGKNIFE_DESCRIPTION";
  picture = "z\misery\addons\assets\data\GuttingKnife.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 25;
  };
};

class Misery_Woodaxe : Misery_ItemCore {
  displayName = "$STR_MISERY_WOODAXE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_WOODAXE_DESCRIPTION";
  picture = "z\misery\addons\assets\data\Woodaxe.paa";
  model = "a3\structures_f\items\tools\axe_f.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 50;
  };
};

class Misery_Sledghammer : Misery_ItemCore {
  displayName = "$STR_MISERY_SLEDGHAMMER_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_SLEDGHAMMER_DESCRIPTION";
  picture = "z\misery\addons\assets\data\sledgehammer.paa";
  model = "z\misery\addons\assets\data\models\other\sledgehammer.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 85;
  };
};

// class Misery_lighter : Misery_ItemCore {
//   displayName = "$STR_MISERY_LIGHTER_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_LIGHTER_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\lighter.paa";
//   model = "z\misery\addons\assets\data\models\other\lighter.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 8;
//   };
// };

class Misery_tinder : Misery_ItemCore {
  displayName = "$STR_MISERY_TINDER_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_TINDER_DESCRIPTION";
  picture = "z\misery\addons\assets\data\tinder.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 5;
  };
};

class Misery_CBRNparts : Misery_ItemCore {
  displayName = "$STR_MISERY_CBRNPARTS_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_CBRNPARTS_DESCRIPTION";
  picture = "z\misery\addons\assets\data\CBRN_Parts.paa";
  model = "a3\supplies_f_orange\bags\b_messenger_f.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 30;
  };
};

// class Misery_Chainsaw : Misery_ItemCore {
//   displayName = "$STR_MISERY_CHAINSAW_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_CHAINSAW_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\chainsaw.paa";
//   model = "z\misery\addons\assets\data\models\other\chainsaw.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 100;
//   };
// };

class Misery_Chainsawempty : Misery_ItemCore {
  displayName = "$STR_MISERY_CHAINSAWEMPTY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_CHAINSAWEMPTY_DESCRIPTION";
  picture = "z\misery\addons\assets\data\chainsaw.paa";
  model = "z\misery\addons\assets\data\models\other\chainsaw.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 100;
  };
};

// class Misery_sawfuel : Misery_ItemCore {
//   displayName = "$STR_MISERY_SAWFUEL_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_SAWFUEL_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\sawfuel.paa";
//   model = "a3\structures_f_epa\items\tools\butanecanister_f.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 25;
//   };
// };

// class Misery_cementbag : Misery_ItemCore {
//   displayName = "Cement bag";
//   descriptionShort = "A bag of cement";
//   picture = "z\misery\addons\assets\data\cement.paa";
//   model = "z\ace\addons\sandbag\data\ace_sandbag_build.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 90;
//   };
// };

// class Misery_rebar : Misery_ItemCore {
//   displayName = "Rebar";
//   descriptionShort = "A peice of rebar";
//   picture = "z\misery\addons\assets\data\rebar.paa";
//   model = "a3\structures_f_orange\walls\plastic\plasticnetfence_01_pole_f.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 80;
//   };
// };

// class Misery_2x4 : Misery_ItemCore {
//   displayName = "2x4";
//   descriptionShort = "A 2x4";
//   picture = "z\misery\addons\assets\data\2x4.paa";
//   model = "z\misery\addons\assets\data\models\2x4.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 30;
//   };
// };

class Misery_woodplank : Misery_ItemCore {
  displayName = "$STR_MISERY_WOODPLANK_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_WOODPLANK_DESCRIPTION";
  picture = "z\misery\addons\assets\data\woodplank.paa";
  model = "z\misery\addons\assets\data\models\other\woodplank.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_woodnail : Misery_ItemCore {
  displayName = "$STR_MISERY_WOODNAIL_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_WOODNAIL_DESCRIPTION";
  picture = "z\misery\addons\assets\data\Woodnail.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

// class Misery_2x8 : Misery_ItemCore {
//   displayName = "2x8";
//   descriptionShort = "A 2x8";
//   picture = "z\misery\addons\assets\data\2x8.paa";
//   model = "z\misery\addons\assets\data\models\2x8.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 30;
//   };
// };

// class Misery_sheetmetal : Misery_ItemCore {
//   displayName = "Sheetmetal";
//   descriptionShort = "A peice of sheetmetal";
//   picture = "z\misery\addons\assets\data\sheetmetal.paa";
//   model = "a3\structures_f_exp\walls\slum\slumwall_01_s_2m_f.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 60;
//   };
// };

// class Misery_woodpanel : Misery_ItemCore {
//   displayName = "Woodpanel";
//   descriptionShort = "A Woodenpanel";
//   picture = "z\misery\addons\assets\data\woodpanel.paa";
//   model = "z\misery\addons\assets\data\models\woodpanel.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 35;
//   };
// };

// class Misery_polyethylene : Misery_ItemCore {
//   displayName = "Polyethylene panel";
//   descriptionShort = "A panel of Polyethylene, very strong plastic<br/> - Crafting item";
//   picture = "z\misery\addons\assets\data\Polyethylene.paa";
//   model = "z\misery\addons\assets\data\models\Polyethylene.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 0;
//   };
// };

class Misery_woodensticks : Misery_ItemCore {
  displayName = "$STR_MISERY_WOODENSTICKS_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_WOODENSTICKS_DESCRIPTION";
  picture = "z\misery\addons\assets\data\woodsticks.paa";
  model = "z\misery\addons\assets\data\models\other\woodsticks.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 35;
  };
};

class Misery_firewood : Misery_ItemCore {
  displayName = "$STR_MISERY_FIREWOOD_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_FIREWOOD_DESCRIPTION";
  picture = "z\misery\addons\assets\data\firewood.paa";
  model = "z\misery\addons\assets\data\models\other\firewoodbundle.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 75;
  };
};

class Misery_woodenlog : Misery_ItemCore {
  displayName = "$STR_MISERY_WOODENLOG_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_WOODENLOG_DESCRIPTION";
  picture = "z\misery\addons\assets\data\woodenlog.paa";
  model = "z\misery\addons\assets\data\models\other\bigwoodlog.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 225;
  };
};

class Misery_boxnails : Misery_ItemCore {
  displayName = "$STR_MISERY_BOXNAILS_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_BOXNAILS_DESCRIPTION";
  picture = "z\misery\addons\assets\data\boxnails.paa";
  model = "z\misery\addons\assets\data\models\boxofnails.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

// class Misery_boxbolts : Misery_ItemCore {
//   displayName = "Hex Bolts";
//   descriptionShort = "A box of Hex bolts<br/> - Crafting item";
//   picture = "z\misery\addons\assets\data\boxofbolts.paa";
//   model = "z\misery\addons\assets\data\models\boxofbolts.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 0;
//   };
// };

// class Misery_boxbricks : Misery_ItemCore {
//   displayName = "Bricks";
//   descriptionShort = "A box of bricks";
//   picture = "z\misery\addons\assets\data\boxofbricks.paa";
//   model = "z\misery\addons\assets\data\models\boxofbricks.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 95;
//   };
// };

class Misery_craftinghammer : Misery_ItemCore {
  displayName = "$STR_MISERY_CRAFTINGHAMMER_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_CRAFTINGHAMMER_DESCRIPTION";
  picture = "z\misery\addons\assets\data\craftinghammer.paa";
  model = "z\misery\addons\assets\data\models\other\craftinghammer.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 15;
  };
};

class Misery_Anvilhammer : Misery_ItemCore {
  displayName = "$STR_MISERY_ANVILHAMMER_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ANVILHAMMER_DESCRIPTION";
  picture = "z\misery\addons\assets\data\anvilhammer.paa";
  model = "z\misery\addons\assets\data\models\other\anvilhammer.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 35;
  };
};

// class Misery_electrichandsaw : Misery_ItemCore {
//   displayName = "$STR_MISERY_ELECTRICHANDSAW_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_ELECTRICHANDSAW_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\ElectricHandCircularSaw.paa";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 25;
//   };
// };

class Misery_electrichandsawnobattery : Misery_ItemCore {
  displayName = "$STR_MISERY_ELECTRICHANDSAWNOBATTERY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ELECTRICHANDSAWNOBATTERY_DESCRIPTION";
  picture = "z\misery\addons\assets\data\ElectricHandCircularSaw.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 25;
  };
};

class Misery_wrench : Misery_ItemCore {
  displayName = "$STR_MISERY_WRENCH_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_WRENCH_DESCRIPTION";
  picture = "z\misery\addons\assets\data\wrench.paa";
  model = "a3\structures_f\items\tools\wrench_f.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 15;
  };
};

class Misery_glucose : Misery_ItemCore {
  displayName = "$STR_MISERY_GLUCOSE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_GLUCOSE_DESCRIPTION";
  picture = "z\misery\addons\assets\data\Glucose.paa";
  model = "a3\props_f_orange\humanitarian\garbage\medicalgarbage_01_injector_f.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 3;
  };
};

class Misery_electrolyte : Misery_ItemCore {
  displayName = "$STR_MISERY_ELECTROLYTE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_ELECTROLYTE_DESCRIPTION";
  picture = "z\misery\addons\assets\data\Electrolyte.paa";
  model = "a3\props_f_orange\humanitarian\garbage\medicalgarbage_01_injector_f.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 3;
  };
};

// class Misery_PDA : Misery_ItemCore {
//   displayName = "$STR_MISERY_PDA_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_PDA_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\PDA.paa";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 7;
//   };
// };

// class Misery_PDA_off : Misery_ItemCore {
//   displayName = "$STR_MISERY_PDA_OFF_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_PDA_OFF_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\PDAnobattery.paa";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 7;
//   };
// };

class Misery_PDA_NB : Misery_ItemCore {
  displayName = "$STR_MISERY_PDA_NB_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_PDA_NB_DESCRIPTION";
  picture = "z\misery\addons\assets\data\PDAnobattery.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 7;
  };
};

// class Misery_cigarettepack : Misery_ItemCore {
//   displayName = "$STR_MISERY_CIGARETTEPACK_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_CIGARETTEPACK_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\cigpack.paa";
//   model = "z\misery\addons\assets\data\models\other\cigarettes.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 2;
//   };
// };

// class Misery_cigar : Misery_ItemCore {
//   displayName = "$STR_MISERY_CIGAR_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_CIGAR_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\Cigar.paa";
// //  model = "z\misery\addons\assets\data\models\other\cigar.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 1;
//   };
// };

// class Misery_Buildscrap : Misery_ItemCore {
//   displayName = "Scrap";
//   descriptionShort = "Random Scrapped peices and parts...";
//   picture = "z\misery\addons\assets\data\scrap.paa";
//   model = "a3\props_f_orange\humanitarian\supplies\paperbox_01_small_destroyed_f.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 80;
//   };
// };

/////////////////////FUEL///////////////////////////////  

class Misery_EmptyJet : Misery_ItemCore {
  displayName = "$STR_MISERY_EMPTYJET_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_EMPTYJET_DESCRIPTION";
  picture = "z\misery\addons\assets\data\CanisterJetFuel.paa";
  model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 50;
  };
};

class Misery_EmptyDiesel : Misery_ItemCore {
  displayName = "$STR_MISERY_EMPTYDIESEL_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_EMPTYDIESEL_DESCRIPTION";
  picture = "z\misery\addons\assets\data\CanisterDiesel.paa";
  model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 50;
  };
};

class Misery_EmptyPetrol : Misery_ItemCore {
  displayName = "$STR_MISERY_EMPTYPETROL_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_EMPTYPETROL_DESCRIPTION";
  picture = "z\misery\addons\assets\data\CanisterPetrol.paa";
  model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 50;
  };
};

// class Misery_JetFuelF : Misery_ItemCore {
//   displayName = "$STR_MISERY_JETFUELF_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_JETFUELF_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\CanisterJetFuel.paa";
//   model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 150;
//   };
// };

// class Misery_DieselF : Misery_ItemCore {
//   displayName = "$STR_MISERY_DIESELF_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_DIESELF_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\CanisterDiesel.paa";
//   model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 150;
//   };
// };

// class Misery_PetrolF : Misery_ItemCore {
//   displayName = "$STR_MISERY_PETROLF_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_PETROLF_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\CanisterPetrol.paa";
//   model = "\a3\structures_f\Items\Vessels\CanisterFuel_F.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 150;
//   };
// };

//////////////////Vehicle parts (WIP)////////////////////////////

// class Misery_AutoBatt : Misery_ItemCore {
//   displayName = "$STR_MISERY_AUTOBATT_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_AUTOBATT_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\autobatt.paa";
//   model = "z\misery\addons\assets\data\models\other\Autobatt.p3d";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 110;
//   };
// };

//////////////////MINING////////////////////////////

class Misery_Stonechunk : Misery_ItemCore {
  displayName = "$STR_MISERY_STONECHUNK_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_STONECHUNK_DESCRIPTION";
  picture = "z\misery\addons\assets\data\stonepieces.paa";
  //model = "z\misery\addons\assets\data\models\other\stone.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_Ironingot : Misery_ItemCore {
  displayName = "$STR_MISERY_IRONINGOT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_IRONINGOT_DESCRIPTION";
  picture = "z\misery\addons\assets\data\ironingot.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_Ironore : Misery_ItemCore {
  displayName = "$STR_MISERY_IRONORE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_IRONORE_DESCRIPTION";
  picture = "z\misery\addons\assets\data\ironore.paa";
 // model = "z\misery\addons\assets\data\models\other\iron.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_Ironpiece : Misery_ItemCore {
  displayName = "$STR_MISERY_IRONPIECE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_IRONPIECE_DESCRIPTION";
  picture = "z\misery\addons\assets\data\ironpiece.paa";
 // model = "z\misery\addons\assets\data\models\other\iron.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_Goldingot : Misery_ItemCore {
  displayName = "$STR_MISERY_GOLDINGOT_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_GOLDINGOT_DESCRIPTION";
  picture = "z\misery\addons\assets\data\goldingot.paa";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_Goldore : Misery_ItemCore {
  displayName = "$STR_MISERY_GOLDORE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_GOLDORE_DESCRIPTION";
  picture = "z\misery\addons\assets\data\goldore.paa";
 // model = "z\misery\addons\assets\data\models\other\gold.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_Goldpiece : Misery_ItemCore {
  displayName = "$STR_MISERY_GOLDPIECE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_GOLDPIECE_DESCRIPTION";
  picture = "z\misery\addons\assets\data\goldpiece.paa";
 // model = "z\misery\addons\assets\data\models\other\gold.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_Coalore : Misery_ItemCore {
  displayName = "$STR_MISERY_COALORE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_COALORE_DESCRIPTION";
  picture = "z\misery\addons\assets\data\coalore.paa";
//  model = "z\misery\addons\assets\data\models\other\coal.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_Malachite : Misery_ItemCore {
  displayName = "$STR_MISERY_MALACHITE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_MALACHITE_DESCRIPTION";
  picture = "z\misery\addons\assets\data\malachite.paa";
//  model = "z\misery\addons\assets\data\models\other\gem.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_Ruby : Misery_ItemCore {
  displayName = "$STR_MISERY_RUBY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_RUBY_DESCRIPTION";
  picture = "z\misery\addons\assets\data\ruby.paa";
//  model = "z\misery\addons\assets\data\models\other\gem.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_Sapphire : Misery_ItemCore {
  displayName = "$STR_MISERY_SAPPHIRE_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_SAPPHIRE_DESCRIPTION";
  picture = "z\misery\addons\assets\data\sapphire.paa";
//  model = "z\misery\addons\assets\data\models\other\gem.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_Amethyst : Misery_ItemCore {
  displayName = "$STR_MISERY_AMETHYST_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_AMETHYST_DESCRIPTION";
  picture = "z\misery\addons\assets\data\amethyst.paa";
//  model = "z\misery\addons\assets\data\models\other\gem.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_Diamond : Misery_ItemCore {
  displayName = "$STR_MISERY_DIAMOND_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_DIAMOND_DESCRIPTION";
  picture = "z\misery\addons\assets\data\diamond.paa";
//  model = "z\misery\addons\assets\data\models\other\gem.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

class Misery_Emerald : Misery_ItemCore {
  displayName = "$STR_MISERY_EMERALD_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_EMERALD_DESCRIPTION";
  picture = "z\misery\addons\assets\data\emerald.paa";
//  model = "z\misery\addons\assets\data\models\other\gem.p3d";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 0;
  };
};

//////////////////////////End of mining stuff

//////survival: 

//////EMF detectors: 

class Misery_RFHighNobattery: Misery_ItemCore {
  displayName = "$STR_MISERY_RFHIGHNOBATTERY_DISPLAYNAME";
  descriptionShort = "$STR_MISERY_RFHIGHNOBATTERY_DESCRIPTION";
  picture = "z\misery\addons\assets\data\EMFdetectorhighrangenobattery.paa";
  model = "\A3\Weapons_F\Items\MineDetector";
  scope = "public";
  scopeCurator = 2;

  class ItemInfo : InventoryItem_Base_F {
    mass = 5;
  };
};

// class Misery_RFHighrangeOFF : Misery_ItemCore {
//   displayName = "$STR_MISERY_RFHIGHRANGEOFF_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_RFHIGHRANGE_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\EMFdetectorhighrangenobattery.paa";
//   model = "\A3\Weapons_F\Items\MineDetector";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 5;
//   };
// };

// class Misery_RFHighrangeON : Misery_ItemCore {
//   displayName = "$STR_MISERY_RFHIGHRANGEON_DISPLAYNAME";
//   descriptionShort = "$STR_MISERY_RFHIGHRANGE_DESCRIPTION";
//   picture = "z\misery\addons\assets\data\EMFdetectorhighrange.paa";
//   model = "\A3\Weapons_F\Items\MineDetector";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 5;
//   };
// };

////////////////////////////////End of EMF detectors

//////Radio device: 

// class Misery_PortableradioNobattery: Misery_ItemCore {
//   displayName = "Long range portable radio (No battery)";
//   descriptionShort = "Useless without a battery<br/> - Requires 9v battery";
//   picture = "z\misery\addons\assets\data\portableradioOFF.paa";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 5;
//   };
// };

// class Misery_PortableradioOFF : Misery_ItemCore {
//   displayName = "Long range portable radio (OFF)";
//   descriptionShort = "- High range portable AM / FM radio <br/> - Enables users to tune into radio stations that are still active";
//   picture = "z\misery\addons\assets\data\portableradioOFF.paa";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 5;
//   };
// };

// class Misery_PortableradioON : Misery_ItemCore {
//   displayName = "Long range portable radio (ON)";
//   descriptionShort = "- High range portable AM / FM radio <br/> - Enables users to tune into radio stations that are still active";
//   picture = "z\misery\addons\assets\data\portableradioON.paa";
//   scope = "public";
//   scopeCurator = 2;

//   class ItemInfo : InventoryItem_Base_F {
//     mass = 5;
//   };
// };

}; //DO NOT DELETE CfgWeapons secondary bracket
