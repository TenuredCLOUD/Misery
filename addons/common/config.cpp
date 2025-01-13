#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {QCLASS(main)};
        authors[] = {"TenuredCLOUD"};
        VERSION_CONFIG;
    };
};

class CfgFactionClasses
{
    class NO_CATEGORY;
    class Misery_faction: NO_CATEGORY
    {
        displayName="Misery";
        priority=0.1;
        side=7;
    };
};


#include "CfgEventHandlers.hpp"


