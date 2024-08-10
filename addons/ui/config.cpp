#include "script_component.hpp"

/*
Misery UI Mod Config
Designed specifically for Misery mod 
by TenuredCLOUD 
*/

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cba_main","A3_ui_f","misery_main"}; // Include addons from this mod that contain code or assets you depend on. Affects loadorder. Including main as an example here.
        authors[] = {"TenuredCLOUD"}; // sub array of authors, considered for the specific addon, can be removed or left empty {}
        VERSION_CONFIG;
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
	#include "\z\misery\addons\ui\menus\MiseryGeigerUI.hpp"
  #include "\z\misery\addons\ui\menus\MiseryERUUI.hpp"
};