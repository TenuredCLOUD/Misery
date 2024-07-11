/*
Misery UI Mod Config
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

#include "\z\misery\addons\misery_framework\Scripts\Misery_PreParser.hpp"

class CfgPatches
{
	class misery_ui
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

#include "\z\misery\addons\misery_ui\Menus\MICore.hpp"
#include "\z\misery\addons\misery_ui\Menus\InventoryText.hpp"
#include "\z\misery\addons\misery_ui\Menus\InventoryActions.hpp"
#include "\z\misery\addons\misery_ui\Menus\MiseryFontChange.hpp"
#include "\z\misery\addons\misery_ui\Menus\MiserySleepGUI.hpp"
#include "\z\misery\addons\misery_ui\Menus\MiseryCraftingGUI.hpp"
#include "\z\misery\addons\misery_ui\Menus\MiseryCookingGUI.hpp"
#include "\z\misery\addons\misery_ui\Menus\MiseryWaterCollectionGUI.hpp"
#include "\z\misery\addons\misery_ui\Menus\MiseryMedTreatment.hpp"
#include "\z\misery\addons\misery_ui\Menus\MiseryVehicleMechShop.hpp"
#include "\z\misery\addons\misery_ui\Menus\MiseryVehicleMaintGUI.hpp"
#include "\z\misery\addons\misery_ui\Menus\MiseryVehicleRearmShop.hpp"
#include "\z\misery\addons\misery_ui\Menus\MiseryVehicleRefuelShop.hpp"
#include "\z\misery\addons\misery_ui\Menus\MiseryVehicleRefuel_JCan.hpp"
#include "\z\misery\addons\misery_ui\Menus\MiseryTraderShop_Buy.hpp"
#include "\z\misery\addons\misery_ui\Menus\MiseryMoneyTakeMenu.hpp"
//#include "\misery_ui\Menus\MiseryMoneyGiveMenu.hpp"
#include "\z\misery\addons\misery_ui\Menus\Misery_Bank_UI.hpp"
#include "\z\misery\addons\misery_ui\Menus\MiseryWaitQue.hpp"
#include "\z\misery\addons\misery_ui\Menus\MiseryINVFramework.hpp"
#include "\z\misery\addons\misery_ui\Menus\Misery_Generator_UI.hpp"

class RscTitles
{
  //  #include "\z\misery\addons\misery_ui\Menus\StatusBar.hpp"
  //  #include "\z\misery\addons\misery_ui\Menus\PDATIMEHPP.hpp"
  //  #include "\z\misery\addons\misery_ui\Menus\PDACOMPASSHPP.hpp"
  //  #include "\z\misery\addons\misery_ui\Menus\PDATEMPHPP.hpp"
  //  #include "\z\misery\addons\misery_ui\Menus\GeigerstatusHPP.hpp"
  //  #include "\z\misery\addons\misery_ui\Menus\GascartridgeHPP.hpp"
	#include "\z\misery\addons\misery_ui\Menus\MiseryGeigerUI.hpp"
};

class Extended_PostInit_EventHandlers {
	class SLX_misery_ui_PREP {
		Init = "[] execVM '\z\misery\addons\misery_ui\Functions\PREP.sqf';";
	};
};

