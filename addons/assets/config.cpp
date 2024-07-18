
#include "script_component.hpp"

// class CfgPatches
// {
// 	class miseryassets
// 	{
// 		author="TenuredCLOUD";
// 		name = "misery_assets";
// 		units[]={"Misery_Forge","Misery_Anvil"};
// 		weapons[]={};
// 		magazines[]={};
// 		ammo[]={};
// 		requiredVersion = ARMABUILD; 
// 		version = MISERYVERSION; 
// 		versionStr = MISERYVERSION; 
// 		versionAr[] = {MISERYVERSTR}; 
// 	};
// };

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"misery_main"}; // Include addons from this mod that contain code or assets you depend on. Affects loadorder. Including main as an example here.
        authors[] = {"TenuredCLOUD"}; // sub array of authors, considered for the specific addon, can be removed or left empty {}
        VERSION_CONFIG;
    };
};


#include "cfgweapons.hpp"
#include "cfgvehicles.hpp"
#include "CfgVehicleClasses.hpp"
#include "CfgMagazines.hpp"
#include "CfgAmmo.hpp"


