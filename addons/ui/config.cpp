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

#include "menus\core.hpp"
#include "menus\inventoryText.hpp"
#include "menus\inventoryActions.hpp"
#include "menus\fontChange.hpp"
#include "menus\sleep.hpp"
#include "menus\crafting.hpp"
#include "menus\fireCrafting.hpp"
#include "menus\fishing.hpp"
#include "menus\cooking.hpp"
#include "menus\hydrology.hpp"
#include "menus\medicalTreatment.hpp"
#include "menus\repairShop.hpp"
#include "menus\maintenance.hpp"
#include "menus\rearmShop.hpp"
#include "menus\refuelShop.hpp"
#include "menus\traderShop.hpp"
//#include "\ui\menus\moneyGiveMenu.hpp"
#include "menus\anvil.hpp"
#include "menus\bank.hpp"
#include "menus\moneyTakeMenu.hpp"
#include "menus\moneyGiveMenu.hpp"
#include "menus\inventoryFramework.hpp"
#include "menus\generator.hpp"
#include "menus\forge.hpp"
#include "menus\furniture.hpp"
#include "menus\vehicleFurniture.hpp"
#include "menus\refuelVehicle.hpp"
#include "menus\refill_fuelCan.hpp"
#include "menus\grad_persistence.hpp"
#include "menus\doorLock.hpp"

class RscTitles {
    #include "menus\geiger.hpp"
    #include "menus\eru.hpp"
    #include "menus\vehicleStats.hpp"
    #include "menus\bloodShot_overlay.hpp"
};
