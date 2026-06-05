#define COMPONENT power
#define COMPONENT_BEAUTIFIED Power
#include "\z\misery\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_POWER
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_POWER
    #define DEBUG_SETTINGS DEBUG_SETTINGS_POWER
#endif

#include "\z\misery\addons\main\script_macros.hpp"

#define MACRO_THING_COMMON \
    scope = 2; \
    scopeCurator = 2; \
    destrType = "DestructNo"; \
    cost = 0; \
    vehicleClass = QCLASS(Objects)

#define MACRO_TENTLAMPS Land_TentLamp_01_suspended_F, Land_TentLamp_01_standing_F, Land_TentLamp_01_suspended_red_F, Land_TentLamp_01_standing_red_F

#define MACRO_PORTABLELIGHT_SINGLE \
QCLASS(portableLight_single_black), \
QCLASS(portableLight_single_od), \
QCLASS(portableLight_single_sand), \
QCLASS(portableLight_single_yellow)

#define MACRO_PORTABLELIGHT_DOUBLE Land_PortableLight_02_double_olive_F, Land_PortableLight_02_double_yellow_F, Land_PortableLight_02_double_black_F, Land_PortableLight_02_double_sand_F

#define MACRO_PORTABLELIGHT_QUAD Land_PortableLight_02_quad_olive_F, Land_PortableLight_02_quad_yellow_F, Land_PortableLight_02_quad_black_F, Land_PortableLight_02_quad_sand_F
