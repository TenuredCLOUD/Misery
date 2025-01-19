#define COMPONENT persistence
#define COMPONENT_BEAUTIFIED Persistence
#include "\z\misery\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

// Do not alter the order of this, will cause variables to be set with the wrong values.
#define MISERY_PLAYER_VARIABLE_VALUES \
    QEGVAR(survival,hunger), \
    QEGVAR(survival,thirst), \
    QEGVAR(survival,energyDeficit), \
    QEGVAR(temperature,thermalIndex), \
    QEGVAR(temperature,exposure), \
    QEGVAR(survival,radiation), \
    QEGVAR(survival,infection), \
    QEGVAR(survival,parasites), \
    QEGVAR(survival,toxicity), \
    QEGVAR(psychosis,state), \
    QEGVAR(vitals,buffs), \
    QEGVAR(vitals,debuffs), \
    QEGVAR(currency,funds), \
    QEGVAR(currency,bankedFunds), \
    QEGVAR(cooking,knowledge), \
    QEGVAR(crafting,knowledge), \
    QEGVAR(hydrology,knowledge)

#ifdef DEBUG_ENABLED_PERSISTENCE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_PERSISTENCE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_PERSISTENCE
#endif

#include "\z\misery\addons\main\script_macros.hpp"
