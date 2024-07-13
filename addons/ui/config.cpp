#include "\z\misery\addons\framework\scripts\Misery_PreParser.hpp"

/*
Misery UI Mod Config
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

class CfgPatches
{
	class miseryui
	{
		units[] = {};
		name = "misery_ui";
		weapons[] = {};
		requiredAddons[] = {"miseryframework"};
		author="TenuredCLOUD";
		requiredVersion = ARMABUILD; 
		version = MISERYVERSION; 
		versionStr = MISERYVERSION; 
		versionAr[] = {MISERYVERSTR}; 
	};
};

#include "\z\misery\addons\ui\menus\MICore.hpp"
#include "\z\misery\addons\ui\menus\InventoryText.hpp"
#include "\z\misery\addons\ui\menus\InventoryActions.hpp"
#include "\z\misery\addons\ui\menus\MiseryFontChange.hpp"
#include "\z\misery\addons\ui\menus\MiserySleepGUI.hpp"
#include "\z\misery\addons\ui\menus\MiseryCraftingGUI.hpp"
#include "\z\misery\addons\ui\menus\MiseryCookingGUI.hpp"
#include "\z\misery\addons\ui\menus\MiseryWaterCollectionGUI.hpp"
#include "\z\misery\addons\ui\menus\MiseryMedTreatment.hpp"
#include "\z\misery\addons\ui\menus\MiseryVehicleMechShop.hpp"
#include "\z\misery\addons\ui\menus\MiseryVehicleMaintGUI.hpp"
#include "\z\misery\addons\ui\menus\MiseryVehicleRearmShop.hpp"
#include "\z\misery\addons\ui\menus\MiseryVehicleRefuelShop.hpp"
#include "\z\misery\addons\ui\menus\MiseryVehicleRefuel_JCan.hpp"
#include "\z\misery\addons\ui\menus\MiseryTraderShop_Buy.hpp"
#include "\z\misery\addons\ui\menus\MiseryMoneyTakeMenu.hpp"
//#include "\ui\menus\MiseryMoneyGiveMenu.hpp"
#include "\z\misery\addons\ui\menus\Misery_Bank_UI.hpp"
#include "\z\misery\addons\ui\menus\MiseryWaitQue.hpp"
#include "\z\misery\addons\ui\menus\MiseryINVFramework.hpp"
#include "\z\misery\addons\ui\menus\Misery_Generator_UI.hpp"

class RscTitles
{
  //  #include "\z\misery\addons\ui\menus\StatusBar.hpp"
  //  #include "\z\misery\addons\ui\menus\PDATIMEHPP.hpp"
  //  #include "\z\misery\addons\ui\menus\PDACOMPASSHPP.hpp"
  //  #include "\z\misery\addons\ui\menus\PDATEMPHPP.hpp"
  //  #include "\z\misery\addons\ui\menus\GeigerstatusHPP.hpp"
  //  #include "\z\misery\addons\ui\menus\GascartridgeHPP.hpp"
	#include "\z\misery\addons\ui\menus\MiseryGeigerUI.hpp"
};

class Extended_PostInit_EventHandlers {
	class SLX_ui_PREP {
		Init = "[] execVM '\z\misery\addons\ui\Functions\PREP.sqf';";
	};
};

