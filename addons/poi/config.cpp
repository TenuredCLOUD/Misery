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

#include "CfgEventHandlers.hpp"

class CfgVehicles
{
    class Logic;
    class Module_F: Logic
    {
        class ArgumentsBaseUnits
        {
            class Units;
        };
        class AttributesBase
        {
            class Default;
            class Edit; //Text input
            class Combo; //Drop down list
            class CheckBox; //Checkbox that returns true or false
            class CheckboxNumber; //Checkbox that returns 1 or 0
            class ModuleDescription; //Description of module
        };
        class ModuleDescription
        {
            class Anything;
        };
    };

class Misery_POI: Module_F
    {
        scope=2;
        displayName="Misery (POI)";
        icon="\z\misery\addons\icons\POI.paa";
        category="Misery_faction";
        function="";
        functionPriority=1;
        isGlobal=0;
        isTriggerActivated=0;
        isDisposable=0;
        class Attributes: AttributesBase
        {
            class Misery_POI_Type: Combo
            {
                property="Misery_POI_Type";
                displayName = "POI type";
                tooltip = "Defines what POI you'd like this module to generate (Campground, Heli-Wreck, Washed ashore loot, Raid, etc...)";
                typeName = "STRING";
                class Values
                {
                    class CAMP
                    {
                        name = "Campground";
                        value = "CAMP";
                        default = 1;
                    };
                    class HELIWRECK
                    {
                        name = "Heli - wreck";
                        value = "HELIWRECK";
                        default = 0;
                    };
                    class SHORELOOT
                    {
                        name = "Washed ashore loot";
                        value = "SHORELOOT";
                        default = 0;
                    };
                    class PMCRAID
                    {
                        name = "PMC Raid";
                        value = "PMCRAID";
                        default = 0;
                    };
                };
            };
            class Misery_POI_faction: Combo
            {
                property="Misery_POI_faction";
                displayName = "Faction";
                tooltip = "Defines what faction you want the POI to spawn [Used only for Campground & Raids]";
                typeName = "STRING";
                class Values
                {
                    class SIDEWEST
                    {
                        name = "West / BLUFOR";
                        value = "SIDEWEST";
                        default = 1;
                    };
                    class SIDEEAST
                    {
                        name = "East / OPFOR";
                        value = "SIDEEAST";
                        default = 0;
                    };
                    class SIDECIVILIAN
                    {
                        name = "Civilian";
                        value = "SIDECIVILIAN";
                        default = 0;
                    };
                    class SIDEIND
                    {
                        name = "Independant";
                        value = "SIDEIND";
                        default = 0;
                    };
                };
            };
            class Misery_POI_AIClass : Edit
              {
                property="Misery_POI_AIClass";
                displayName="AI type";
                tooltip="Single classname input, AI Class to spawn, doesn't need qoutes [Used only for Campground & Raids]";
                defaultValue="""B_Soldier_F""";
                typeName="STRING";
            };
            class Misery_POI_AICountMAX: Edit
              {
                property="Misery_POI_AICountMAX";
                displayName="Maximum AI";
                tooltip="Maximum possible AI you want to be available at this POI [Used only for Campground & Raids]";
                typeName="NUMBER";
                defaultValue="10";
            };
            class Misery_POI_AICountMIN: Edit
              {
                property="Misery_POI_AICountMIN";
                displayName="Minimum AI";
                tooltip="Minimum possible AI you want to be available at this POI [Used only for Campground & Raids]";
                typeName="NUMBER";
                defaultValue="5";
            };
            class Misery_POI_AISpawnDistance: Edit
              {
                property="Misery_POI_AISpawnDistance";
                displayName="AI Spawn distance";
                tooltip="Random distance AI can spawn from POI [Used only for Campground & Raids]";
                typeName="NUMBER";
                defaultValue="50";
            };
            class MiseryPOIAIWeapPrimaryLoot: Edit
              {
                property="MiseryPOIAIWeapPrimaryLoot";
                displayName="Primary Weapons for generated AI";
                tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s) [Used only for Campground & Raids]";
                typeName="STRING";
                defaultValue="""""";
            };
            class MiseryPOIAIWeapSecondaryLoot: Edit
              {
                property="MiseryPOIAIWeapSecondaryLoot";
                displayName="Secondary Weapons for generated AI";
                tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s) [Used only for Campground & Raids]";
                typeName="STRING";
                defaultValue="""""";
            };
            class MiseryPOIAIWeaplauncherLoot: Edit
              {
                property="MiseryPOIAIWeaplauncherLoot";
                displayName="launcher Weapons for generated AI";
                tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s) [Used only for Campground & Raids]";
                typeName="STRING";
                defaultValue="""""";
            };
            class MiseryPOIAIAmmo: Edit
              {
                property="MiseryPOIAIAmmo";
                displayName="Ammo count for AI";
                tooltip="Max allowed ammo (generated randomly) [Used only for Campground & Raids]";
                typeName="NUMBER";
                defaultValue="5";
            };
            class MiseryPOIAIItemLoot: Edit
              {
                property="MiseryPOIAIItemLoot";
                displayName="Item Gear for generated AI";
                tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s) [Used only for Campground & Raids]";
                typeName="STRING";
                defaultValue="""""";
            };
            class MiseryPOIAINVGLoot: Edit
              {
                property="MiseryPOIAINVGLoot";
                displayName="NVG Gear for generated AI";
                tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s) [Used only for Campground & Raids]";
                typeName="STRING";
                defaultValue="""""";
            };
            class MiseryPOIAIFacewearLoot: Edit
              {
                property="MiseryPOIAIFacewearLoot";
                displayName="Facewear Gear for generated AI";
                tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s) [Used only for Campground & Raids]";
                typeName="STRING";
                defaultValue="""""";
            };
            class MiseryPOIAIHeadgearLoot: Edit
              {
                property="MiseryPOIAIHeadgearLoot";
                displayName="Headgear for generated AI";
                tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s) [Used only for Campground & Raids]";
                typeName="STRING";
                defaultValue="""""";
            };
            class MiseryPOIAIUniformLoot: Edit
              {
                property="MiseryPOIAIUniformLoot";
                displayName="Uniform Gear for generated AI";
                tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s) [Used only for Campground & Raids]";
                typeName="STRING";
                defaultValue="""""";
            };
            class MiseryPOIAIVestLoot: Edit
              {
                property="MiseryPOIAIVestLoot";
                displayName="Vest Gear for generated AI";
                tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s) [Used only for Campground & Raids]";
                typeName="STRING";
                defaultValue="""""";
            };
            class MiseryPOIAIBackpackLoot: Edit
              {
                property="MiseryPOIAIBackpackLoot";
                displayName="Backpack Gear for generated AI";
                tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s) [Used only for Campground & Raids]";
                typeName="STRING";
                defaultValue="""""";
            };
            class MiseryPOICrateWeaponLoot: Edit
              {
                property="MiseryPOICrateWeaponLoot";
                displayName="Weapon Loot for generated Crates";
                tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s) [Used for ALL POI types]";
                typeName="STRING";
                defaultValue="""""";
            };
            class MiseryPOICrateWeaponMagLoot: Combo
            {
                property="MiseryPOICrateWeaponMagLoot";
                displayName = "Magazine Loot for generated Crates";
                tooltip = "Defines Crate magazine generator behavior [Used for ALL POI types]";
                typeName = "STRING";
                class Values
                {
                    class BASIC
                    {
                        name = "Basic Magazine variants";
                        value = "BASIC";
                        default = 1;
                    };
                    class ALL
                    {
                        name = "All compatible Magazines";
                        value = "ALL";
                        default = 0;
                    };
                    class NOMAGS
                    {
                        name = "No magazines allowed";
                        value = "NOMAGS";
                        default = 0;
                    };
                };
            };
            class MiseryPOICrateWeaponAttachmentLoot: Combo
            {
                property="MiseryPOICrateWeaponAttachmentLoot";
                displayName = "Attachment Loot for generated Crates";
                tooltip = "Defines Crate attachment generator behavior [Used for ALL POI types]";
                typeName = "STRING";
                class Values
                {
                    class BASIC
                    {
                        name = "Basic attachment variants";
                        value = "BASIC";
                        default = 1;
                    };
                    class ALL
                    {
                        name = "All compatible attachments";
                        value = "ALL";
                        default = 0;
                    };
                    class NOATTCH
                    {
                        name = "No attachments allowed";
                        value = "NOATTCH";
                        default = 0;
                    };
                };
            };
            class MiseryPOICrateItemLoot: Edit
              {
                property="MiseryPOICrateItemLoot";
                displayName="Item Loot for generated Crates";
                tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s) [Used for ALL POI types]";
                typeName="STRING";
                defaultValue="""""";
            };
            class MiseryPOICrateUniformLoot: Edit
              {
                property="MiseryPOICrateUniformLoot";
                displayName="Uniform Loot for generated Crates";
                tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s) [Used for ALL POI types]";
                typeName="STRING";
                defaultValue="""""";
            };
            class MiseryPOICrateVestLoot: Edit
              {
                property="MiseryPOICrateVestLoot";
                displayName="Vest Loot for generated Crates";
                tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s) [Used for ALL POI types]";
                typeName="STRING";
                defaultValue="""""";
            };
            class MiseryPOICrateBackpackLoot: Edit
              {
                property="MiseryPOICrateBackpackLoot";
                displayName="Backpack Loot for generated Crates";
                tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s) [Used for ALL POI types]";
                typeName="STRING";
                defaultValue="""""";
            };
            class MiseryPOICrateItemsMAX: Edit
              {
                property="MiseryPOICrateItemsMAX";
                displayName="Crate items Maximum";
                tooltip="Maximum items allowed to spawn in a crate (this is PER item type; Backpacks, items, weapons, etc...) [Used for ALL POI types]";
                typeName="NUMBER";
                defaultValue="5";
            };
            class MiseryPOICrateItemsMIN: Edit
              {
                property="MiseryPOICrateItemsMIN";
                displayName="Crate items Minimum";
                tooltip="Minimum items allowed to spawn in a crate (this is PER item type; Backpacks, items, weapons, etc...) [Used for ALL POI types]";
                typeName="NUMBER";
                defaultValue="1";
            };
            class MiseryPOIObjectsMAX: Edit
              {
                property="MiseryPOIObjectsMAX";
                displayName="Spawned Objects Maximum";
                tooltip="Maximum Objects allowed to spawn at POI (Amount of tents, structures etc..) [Used only for Campground & Raids]";
                typeName="NUMBER";
                defaultValue="10";
            };
            class MiseryPOIObjectsMIN: Edit
              {
                property="MiseryPOIObjectsMIN";
                displayName="Spawned Objects Minimum";
                tooltip="Minimum Objects allowed to spawn at POI (Amount of tents, structures etc..) [Used only for Campground & Raids]";
                typeName="NUMBER";
                defaultValue="1";
            };
            class MiseryPOICratesMAX: Edit
              {
                property="MiseryPOICratesMAX";
                displayName="Spawned Crates Maximum";
                tooltip="Maximum Crates allowed to spawn at POI [Used for ALL POI types]";
                typeName="NUMBER";
                defaultValue="5";
            };
            class MiseryPOICratesMIN: Edit
              {
                property="MiseryPOICratesMIN";
                displayName="Spawned Crates Minimum";
                tooltip="Minimum Crates allowed to spawn at POI [Used for ALL POI types]";
                typeName="NUMBER";
                defaultValue="1";
            };
            class MiseryPOITenttypes: Edit
              {
                property="MiseryPOITenttypes";
                displayName="Tent types";
                tooltip="Defines what types of tents or structures you wish to be able to spawn [Used only for Campground & Raids] (NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
                typeName="STRING";
                defaultValue="""Land_TentA_F""";
            };
            class MiseryPOIFlagTypes: Edit
              {
                property="MiseryPOIFlagTypes";
                displayName="Flag types";
                tooltip="Defines what types of flags you wish to be able to spawn [Used only for Raids] (NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
                typeName="STRING";
                defaultValue="""Flag_CSAT_F""";
            };
            class MiseryPOICratetypes: Edit
              {
                property="MiseryPOICratetypes";
                displayName="Crate types";
                tooltip="Defines what types of crates you wish to be able to spawn [Used for ALL POI types] (NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
                typeName="STRING";
                defaultValue="""Box_NATO_Ammo_F""";
            };
            class MiseryPOIHeliwrecktypes: Edit
              {
                property="MiseryPOIHeliwrecktypes";
                displayName="Heliwreck types";
                tooltip="Defines what types of Heliwrecks you wish to be able to spawn [Used only for Heli-wreck POI] (NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
                typeName="STRING";
                defaultValue="""Land_Wreck_Heli_Attack_01_F""";
            };
            class MiseryPOIShorelootwrecktypes: Edit
              {
                property="MiseryPOIShorelootwrecktypes";
                displayName="Shore loot boat types";
                tooltip="Defines what types of Boat you wish to be able to spawn [Used only for Shore loot POI] (NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
                typeName="STRING";
                defaultValue="""Land_RowBoat_V1_F""";
            };
            class MiseryPOIAIAccuracy: Edit
              {
                property="MiseryPOIAIAccuracy";
                displayName="Spawned AI Accuracy";
                tooltip="Aiming Accuracy setting for spawned AI [Used only for Campground & Raids]";
                typeName="NUMBER";
                defaultValue="0.25";
            };
            class MiseryPOIAIShake: Edit
              {
                property="MiseryPOIAIShake";
                displayName="Spawned AI Shake";
                tooltip="Aiming Shake setting for spawned AI [Used only for Campground & Raids]";
                typeName="NUMBER";
                defaultValue="0.25";
            };
            class MiseryPOIAISpeed: Edit
              {
                property="MiseryPOIAISpeed";
                displayName="Spawned AI Speed";
                tooltip="Aiming Speed setting for spawned AI [Used only for Campground & Raids]";
                typeName="NUMBER";
                defaultValue="0.25";
            };
            class MiseryPOISpawnChance: Edit
              {
                property="MiseryPOISpawnChance";
                displayName="Spawn chance";
                tooltip="Spawn chance % input for this specified POI to generate when spawn conditions are met [Used for ALL POI types] (NOTE: If a POI fails the random spawn chance, it will no longer attempt to generate for the remainder of the game session)";
                typeName="NUMBER";
                defaultValue="100";
            };

            class ModuleDescription: ModuleDescription{};
        };
        class ModuleDescription: ModuleDescription
        {
            description[]=
            {
            "This module is responsible for defining the generation process of a Positions of Interest (POI). Each POI module operates as an independent structure with its own code generation. Its important to note that not all POIs utilize all settings of this module, rendering some settings redundant for certain POIs.",
            "The module allows for customization and randomization of each POI, with settings that can vary or be similar across different POIs. Factors such as difficulty, unit types, and loot are all defined under this module.",
            "Performance settings, on the other hand, are defined under the separate POI settings module. Multiple instances of these types of modules can be placed inside the editor for enhanced flexibility and control over the generation of POIs.",
            "For Shore loot modules be sure to place the module on the shoreline ONLY! Failure to do so will result in failure to generate a Shoreloot POI."
            };
            position=0;
            duplicate=1;
            positionEnabled="Can't change this text?";
        };
    };

    class Misery_POI_Settings: Module_F
    {
        scope=2;
        displayName="Misery (POI) Settings";
        icon="\z\misery\addons\icons\POI.paa";
        category="Misery_faction";
        function="Misery_fnc_ModulePOISettings";
        functionPriority=1;
        isGlobal=0;
        isTriggerActivated=0;
        isDisposable=0;
        class Attributes: AttributesBase
        {
            class MiseryPOISpawnCheckDistance: Edit
              {
                property="MiseryPOISpawnCheckDistance";
                displayName="Distance check (Spawn)";
                tooltip="Distance check value for POI spawning in meters, also halts spawning if a player is in this radius to prevent seeing POI generation (NOTE: This value is multiplied by 2x for a 'safe to spawn' buffer zone. This insures POI's will not spawn too far away and take unnecessary resources)";
                typeName="NUMBER";
                defaultValue="1500";
            };
            class MiseryPOIDeleteCheckDistance: Edit
              {
                property="MiseryPOIDeleteCheckDistance";
                displayName="Distance check (Deletion)";
                tooltip="Distance check value for POI Deletion in meters (NOTE: This value should be more than the spawn check value, recommended at an interval of 3x your spawn check distance)";
                typeName="NUMBER";
                defaultValue="4500";
            };
            class MiseryPOISpawnTimer: Edit
              {
                property="MiseryPOISpawnTimer";
                displayName="POI spawn check timer";
                tooltip="Timer for POI spawn checks in seconds (How long to wait to spawn a POI after a player is close enough)";
                typeName="NUMBER";
                defaultValue="1";
            };
            class MiseryPOIDeleteTimer: Edit
              {
                property="MiseryPOIDeleteTimer";
                displayName="POI delete check timer";
                tooltip="Timer for POI cleaning checks in seconds (How long to wait to delete a POI after all players have left the area)";
                typeName="NUMBER";
                defaultValue="10";
            };
            class MiseryPOISpawnLimit: Edit
              {
                property="MiseryPOISpawnLimit";
                displayName="POI spawn limit";
                tooltip="Maximum allowed POI's (How many POI's are allowed to be active on the map at once)";
                typeName="NUMBER";
                defaultValue="5";
            };
            class ModuleDescription: ModuleDescription{};
        };
        class ModuleDescription: ModuleDescription
        {
            description[]=
            {
                "This module defines the performance properties for POI Generation (Position of interests)",
                "Only one of these types of Modules may be placed inside the editor"
            };
            position=0;
            duplicate=1;
            positionEnabled="Can't change this text?";
        };
    };
};
