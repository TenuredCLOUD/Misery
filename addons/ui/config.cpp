#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cba_main","A3_ui_f",QCLASS(common)};
        authors[] = {"TenuredCLOUD"};
        VERSION_CONFIG;
    };
};

#include "\z\misery\addons\ui\menus\core.hpp"
#include "\z\misery\addons\ui\menus\inventoryText.hpp"
#include "\z\misery\addons\ui\menus\inventoryActions.hpp"
#include "\z\misery\addons\ui\menus\fontChange.hpp"
#include "\z\misery\addons\ui\menus\sleep.hpp"
#include "\z\misery\addons\ui\menus\crafting.hpp"
#include "\z\misery\addons\ui\menus\fireCrafting.hpp"
#include "\z\misery\addons\ui\menus\fishing.hpp"
#include "\z\misery\addons\ui\menus\cooking.hpp"
#include "\z\misery\addons\ui\menus\hydrology.hpp"
#include "\z\misery\addons\ui\menus\medicalTreatment.hpp"
#include "\z\misery\addons\ui\menus\repairShop.hpp"
#include "\z\misery\addons\ui\menus\maintenance.hpp"
#include "\z\misery\addons\ui\menus\rearmShop.hpp"
#include "\z\misery\addons\ui\menus\refuelShop.hpp"
#include "\z\misery\addons\ui\menus\refuelJerryCan.hpp"
#include "\z\misery\addons\ui\menus\traderShop.hpp"
#include "\z\misery\addons\ui\menus\moneyTakeMenu.hpp"
//#include "\ui\menus\moneyGiveMenu.hpp"
#include "\z\misery\addons\ui\menus\bank.hpp"
#include "\z\misery\addons\ui\menus\tradingQue.hpp"
#include "\z\misery\addons\ui\menus\inventoryFramework.hpp"
#include "\z\misery\addons\ui\menus\generator.hpp"

class RscTitles {
    #include "\z\misery\addons\ui\menus\geiger.hpp"
    #include "\z\misery\addons\ui\menus\eru.hpp"
};
