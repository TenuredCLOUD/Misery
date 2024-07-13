#include "\z\misery\addons\framework\Scripts\Misery_PreParser.hpp"

/*
Misery UI Mod Config
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

class CfgPatches
{
	class ui
	{
		units[] = {};
		weapons[] = {};
		requiredAddons[] = {"MiseryFramework"};
		author="TenuredCLOUD";
		requiredVersion = ARMABUILD; 
		version = MISERYVERSION; 
		versionStr = MISERYVERSION; 
		versionAr[] = {MISERYVERSTR}; 
	};
};

#include "\z\misery\addons\ui\Menus\MICore.hpp"
#include "\z\misery\addons\ui\Menus\InventoryText.hpp"
#include "\z\misery\addons\ui\Menus\InventoryActions.hpp"
#include "\z\misery\addons\ui\Menus\MiseryFontChange.hpp"
#include "\z\misery\addons\ui\Menus\MiserySleepGUI.hpp"
#include "\z\misery\addons\ui\Menus\MiseryCraftingGUI.hpp"
#include "\z\misery\addons\ui\Menus\MiseryCookingGUI.hpp"
#include "\z\misery\addons\ui\Menus\MiseryWaterCollectionGUI.hpp"
#include "\z\misery\addons\ui\Menus\MiseryMedTreatment.hpp"
#include "\z\misery\addons\ui\Menus\MiseryVehicleMechShop.hpp"
#include "\z\misery\addons\ui\Menus\MiseryVehicleMaintGUI.hpp"
#include "\z\misery\addons\ui\Menus\MiseryVehicleRearmShop.hpp"
#include "\z\misery\addons\ui\Menus\MiseryVehicleRefuelShop.hpp"
#include "\z\misery\addons\ui\Menus\MiseryVehicleRefuel_JCan.hpp"
#include "\z\misery\addons\ui\Menus\MiseryTraderShop_Buy.hpp"
#include "\z\misery\addons\ui\Menus\MiseryMoneyTakeMenu.hpp"
//#include "\ui\Menus\MiseryMoneyGiveMenu.hpp"
#include "\z\misery\addons\ui\Menus\Misery_Bank_UI.hpp"
#include "\z\misery\addons\ui\Menus\MiseryWaitQue.hpp"
#include "\z\misery\addons\ui\Menus\MiseryINVFramework.hpp"
#include "\z\misery\addons\ui\Menus\Misery_Generator_UI.hpp"

class RscTitles
{
  //  #include "\z\misery\addons\ui\Menus\StatusBar.hpp"
  //  #include "\z\misery\addons\ui\Menus\PDATIMEHPP.hpp"
  //  #include "\z\misery\addons\ui\Menus\PDACOMPASSHPP.hpp"
  //  #include "\z\misery\addons\ui\Menus\PDATEMPHPP.hpp"
  //  #include "\z\misery\addons\ui\Menus\GeigerstatusHPP.hpp"
  //  #include "\z\misery\addons\ui\Menus\GascartridgeHPP.hpp"
	#include "\z\misery\addons\ui\Menus\MiseryGeigerUI.hpp"
};

class Extended_PostInit_EventHandlers {
	class SLX_ui_PREP {
		Init = "[] execVM '\z\misery\addons\ui\Functions\PREP.sqf';";
	};
};

