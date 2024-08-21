#define COMPONENT assets
#define COMPONENT_BEAUTIFIED Assets
#include "\z\misery\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_ASSETS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_ASSETS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_ASSETS
#endif

#include "\z\misery\addons\main\script_macros.hpp"

#define MACRO_ITEM_COMMON \
        author = "TenuredCLOUD"; \
        scope = 2; \
        scopeCurator = 2; \
        vehicleClass = QCLASS(Objects); \
        mapSize = 0.25

#define MACRO_HOUSE_COMMON \
        scope = 2; \
        scopeCurator = 2; \
        numberOfDoors = 0; \
        placement = "vertical"; \
        destrType = "DestructNo"; \
        cost = 0; \
        vehicleClass = QCLASS(Objects)

#define MACRO_ADDITEM(ITEM,COUNT) \
    class TransportItems { \
        class _xx_##ITEM { \
            name = #ITEM; \
            count = COUNT; \
        }; \
    }
