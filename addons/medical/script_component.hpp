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
    [QCLASS(cocaine), QEFUNC(stims,cocaine), 60, 900, 40, 0.5, 0, 1], \
    [QCLASS(antibiotic), QFUNC(antibiotics), 120, 900, 0, 0, 0, 1], \
    [QCLASS(antidote), QFUNC(antidote), 60, 900, -5, 0, 0, 1], \
    [QCLASS(antiparasitic), QFUNC(antiparasitic), 120, 900, 0, 0, 0, 1], \
    [QCLASS(caffetin), QFUNC(caffetinTablets), 120, 900, 10, 0.2, 0, 1], \
    [QCLASS(caffeine), QFUNC(caffieneTablets), 120, 900, 15, 0, 0, 1], \
    [QCLASS(charcoalTablets), QFUNC(charcoalTablets), 120, 300, 0, 0, 0, 1], \
    [QCLASS(clozapine), QFUNC(clozapineInjection), 60, 1200, -10, 0, 0, 1], \
    [QCLASS(clozapineBox), QFUNC(clozapine), 120, 600, -5, 0, 0, 1], \
    [QCLASS(deconKit), QFUNC(deconKit), 120, 120, 0, 0, 0, 1], \
    [QCLASS(electrolyte), QFUNC(electrolyteInjection), 60, 120, 1, 0, 0, 1], \
    [QCLASS(glucose), QFUNC(glucoseInjection), 60, 120, 5, 0, 0, 1], \
    [QCLASS(painkillers), QFUNC(painPill), 120, 900, -5, 0.35, 5, 1], \
    [QCLASS(potassiumIodate), QFUNC(potassiumIodate), 120, 300, 1, 0, 0, 1], \
    [QCLASS(randomMedication), QFUNC(randomPharm), 120, 900, -30, 0.2, 0, 1], \
    [QCLASS(sleepingPills), QFUNC(sleepinPill), 120, 420, -5, 0, 0, 1], \
    [QCLASS(thrombomodulin), QFUNC(thbdInjection), 60, 900, 5, 0, 0, 1], \
    [QCLASS(thrombomodulin_Stimpack), QFUNC(thbdInjectionStim), 60, 1800, 10, 0, 0, 4], \
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

// #define MACRO_MEDICATION_INCOMPATIBLE [ \
//     [QCLASS(cocaine), QCLASSACE(morphine)], \
//     [QCLASS(antibiotic), QEGVAR(animations,pillBottle)], \
//     [QCLASS(antiparasitic), QEGVAR(animations,pillBottle)], \
//     [QCLASS(caffetin), QCLASS(cocaine)], \
//     [QCLASS(caffeine), QCLASS(cocaine)], \
//     [QCLASS(charcoalTablets), QEGVAR(animations,pillBottle)], \
//     [QCLASS(clozapine), QCLASSACE(morphine), QCLASSACE(glucose), QCLASSACE(electrolyte), QCLASSACE(epinephrine), QCLASS(cocaine)], \
//     [QCLASS(clozapineBox), QEGVAR(animations,pillBottle)], \
//     [QCLASS(deconKit), QUOTE(AinvPknlMstpSnonWnonDnon_G01)], \
//     [QCLASS(painkillers), QEGVAR(animations,pillBottle)], \
//     [QCLASS(potassiumIodate), QEGVAR(animations,pillBottle)], \
//     [QCLASS(randomMedication), QCLASS(cocaine)], \
//     [QCLASS(sleepingPills), QCLASS(cocaine)], \
//     [QCLASS(thrombomodulin), QCLASSACE(epinephrine), QCLASSACE(adenosine)], \
//     [QCLASS(thrombomodulin_Stimpack), QCLASSACE(epinephrine), QCLASSACE(adenosine)] \
// ]

#define MACRO_MEDICATION_STRONG QCLASS(cocaine), QCLASS(randomMedication)



#include "\z\misery\addons\main\script_macros.hpp"
