#define COMPONENT client
#define COMPONENT_BEAUTIFIED Client
#include "\z\misery\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_CLIENT
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_CLIENT
    #define DEBUG_SETTINGS DEBUG_SETTINGS_CLIENT
#endif

#include "\z\misery\addons\main\script_macros.hpp"

#define MISERY_PLAYER_VARIABLES QGVAR(cooking_recipes), QGVAR(crafting_recipes), QGVAR(debuffs), QGVAR(exposure), QGVAR(fatigue), QGVAR(fear), QGVAR(hunger), QGVAR(infection), QGVAR(radiation), QGVAR(sea_temperature), QGVAR(temperature), QGVAR(thirst), QGVAR(toxicity), QGVAR(water_collect_recipes), QGVAR(currency), QGVAR(currency_banked)
#define MISERY_PLAYER_VARIABLE_VALUES GVAR(cooking_recipes), GVAR(crafting_recipes), GVAR(debuffs), GVAR(exposure), GVAR(fatigue), GVAR(fear), GVAR(hunger), GVAR(infection), GVAR(radiation), GVAR(sea_temperature), GVAR(temperature), GVAR(thirst), GVAR(toxicity), GVAR(water_collect_recipes), GVAR(currency), GVAR(currency_banked)
