#define MAINPREFIX z
#define PREFIX misery

#include "script_version.hpp"

#define VERSION MAJOR.MINOR
#define VERSION_AR MAJOR,MINOR,PATCH,BUILD

#define REQUIRED_VERSION 2.18

#ifdef COMPONENT_BEAUTIFIED
    #define COMPONENT_NAME QUOTE(Misery - COMPONENT_BEAUTIFIED)
#else
    #define COMPONENT_NAME QUOTE(misery - COMPONENT)
#endif
