#include "script_component.hpp"

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

class CfgMarkerClasses
{
    class Misery_map_markers
    {
        displayName="Misery";
    };

};

class CfgMarkers
{
    class Base_materials
    {
        name="Base materials";
        icon="\z\misery\addons\icons\mappack\basematerial.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

     class Base_trader
    {
        name="Base trader";
        icon="\z\misery\addons\icons\mappack\basetrader.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

     class Ecologists
    {
        name="Ecologists";
        icon="\z\misery\addons\icons\mappack\gasMask.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

     class Lumber_Mill
    {
        name="Lumber mill";
        icon="\z\misery\addons\icons\mappack\lumber.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

     class Mechanic
    {
        name="Mechanic";
        icon="\z\misery\addons\icons\mappack\mechanic.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

     class Military
    {
        name="Military Zone";
        icon="\z\misery\addons\icons\mappack\military.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

     class Mining
    {
        name="Mining";
        icon="\z\misery\addons\icons\mappack\mining.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

     class Skull
    {
        name="Skull";
        icon="\z\misery\addons\icons\mappack\skull.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

     class Radiation_zone
    {
        name="Radiation Zone";
        icon="\z\misery\addons\icons\mappack\RadZone.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

     class Trader_presence
    {
        name="Trader";
        icon="\z\misery\addons\icons\mappack\trader.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

     class Banker_presence
    {
        name="Banker";
        icon="\z\misery\addons\icons\mappack\banker.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

    class Forge_Anvil
    {
        name="Forge & Anvil";
        icon="\z\misery\addons\icons\mappack\anvil.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

    class Rearmer
    {
        name="Rearmer";
        icon="\z\misery\addons\icons\mappack\rearm.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

    class Refueler
    {
        name="Refuel";
        icon="\z\misery\addons\icons\mappack\pumpnozzle.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

     class MedicalMap
    {
        name="Medical";
        icon="\z\misery\addons\icons\mappack\medical.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

    class SafeZoneMap
    {
        name="Safezone";
        icon="\z\misery\addons\icons\mappack\safezone.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

    class HeliWreckMap
    {
        name="Helicopter Wreck";
        icon="\z\misery\addons\icons\mappack\Heliwreck.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };
 };
