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
    QEGVAR(hydrology,knowledge), \
    QEGVAR(gasmask,cartridgeEfficiency), \
    QEGVAR(hydrology,turbidWaterLogged)

#define MACRO_DEFAULT_ACE_DAMAGE \
    "{""ace_medical_openwounds"": {}, ""ace_medical_bloodpressure"": [79, 119], ""ace_medical_ivbags"": null, ""ace_medical_inpain"": false, ""ace_medical_medications"": [], ""ace_medical_tourniquets"": [0, 0, 0, 0, 0, 0], ""ace_medical_heartrate"": 79.2222, ""ace_medical_pain"": 0, ""ace_medical_bloodvolume"": 6, ""ace_medical_stitchedwounds"": {}, ""ace_medical_fractures"": [0, 0, 0, 0, 0, 0], ""ace_medical_triagelevel"": 0, ""ace_medical_bodypartdamage"": [0, 0, 0, 0, 0, 0], ""ace_medical_hemorrhage"": 0, ""ace_medical_occludedmedications"": null, ""ace_medical_triagecard"": [], ""ace_medical_bandagedwounds"": {}, ""ace_medical_peripheralresistance"": 100, ""ace_medical_painsuppress"": 0, ""ace_medical_statemachinestate"": ""Default""}"

#ifdef DEBUG_ENABLED_PERSISTENCE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_PERSISTENCE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_PERSISTENCE
#endif

#include "\z\misery\addons\main\script_macros.hpp"
