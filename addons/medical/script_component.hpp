#define COMPONENT medical
#define COMPONENT_BEAUTIFIED Medical
#include "\z\misery\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_MEDICAL
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MEDICAL
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MEDICAL
#endif

#define MACRO_MEDICATION_REGISTRY [ \
    [QCLASS(cocaine), QEFUNC(stims,cocaine)], \
    [QCLASS(antibiotic), QFUNC(antibiotics)], \
    [QCLASS(antidote), QFUNC(antidote)], \
    [QCLASS(antiparasitic), QFUNC(antiparasitic)], \
    [QCLASS(caffetin), QFUNC(caffetinTablets)], \
    [QCLASS(caffeine), QFUNC(caffieneTablets)], \
    [QCLASS(charcoalTablets), QFUNC(charcoalTablets)], \
    [QCLASS(clozapine), QFUNC(clozapineInjection)], \
    [QCLASS(clozapineBox), QFUNC(clozapine)], \
    [QCLASS(deconKit), QFUNC(deconKit)], \
    [QCLASS(electrolyte), QFUNC(electrolyteInjection)], \
    [QCLASS(glucose), QFUNC(glucoseInjection)], \
    [QCLASS(painkillers), QFUNC(painPill)], \
    [QCLASS(potassiumIodate), QFUNC(potassiumIodate)], \
    [QCLASS(randomMedication), QFUNC(randomPharm)], \
    [QCLASS(sleepingPills), QFUNC(sleepinPill)], \
    [QCLASS(thrombomodulin), QFUNC(thbdInjection)], \
    [QCLASS(thrombomodulin_Stimpack), QFUNC(thbdInjection)], \
    [QCLASSACE(salineIV_500), QFUNC(saline)], \
    [QCLASSACE(salineIV_250), QFUNC(saline)], \
    [QCLASSACE(salineIV), QFUNC(saline)] \
]

#define MACRO_MEDICATION_ANIMATIONS [ \
    [QCLASS(antibiotic), QEGVAR(animations,pillBottle)], \
    [QCLASS(antiparasitic), QEGVAR(animations,pillBottle)], \
    [QCLASS(caffetin), QEGVAR(animations,pillBottle)], \
    [QCLASS(caffeine), QEGVAR(animations,pillBottle)], \
    [QCLASS(charcoalTablets), QEGVAR(animations,pillBottle)], \
    [QCLASS(clozapineBox), QEGVAR(animations,pillBottle)], \
    [QCLASS(deconKit), QUOTE(AinvPknlMstpSnonWnonDnon_G01)], \
    [QCLASS(painkillers), QEGVAR(animations,pillBottle)], \
    [QCLASS(potassiumIodate), QEGVAR(animations,pillBottle)], \
    [QCLASS(randomMedication), QEGVAR(animations,pillBottle)], \
    [QCLASS(sleepingPills), QEGVAR(animations,pillBottle)] \
]

#define MACRO_MEDICATION_STRONG QCLASS(cocaine), QCLASS(randomMedication)

#include "\z\misery\addons\main\script_macros.hpp"
