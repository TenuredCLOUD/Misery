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

class Misery_Ambient_AI_Zone: Module_F
    {
        scope=2;
        displayName="Misery Ambient AI Zone";
        icon = QPATHTOEF(icons,data\group_ca.paa);
        category="Misery_faction";
        function="";
        functionPriority=1;
        isGlobal=0;
        isTriggerActivated=0;
        isDisposable=0;
        class Attributes: AttributesBase
        {
            class Misery_AI_Zone_faction: Combo
            {
                property="Misery_AI_Zone_faction";
                displayName = "Faction";
                tooltip = "Defines what faction you want to control this zone";
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
            class Misery_AI_Zone_Class : Edit
              {
                property="Misery_AI_Zone_Class";
                displayName="AI type";
                tooltip="Single classname input, AI Class to spawn, doesn't need qoutes";
                defaultValue="""B_Soldier_F""";
                typeName="STRING";
            };
            class Misery_AI_Zone_GroupMAX: Edit
              {
                property="Misery_AI_Zone_GroupMAX";
                displayName="Group Size";
                tooltip="Maximum number of AI a group can spawn with";
                typeName="NUMBER";
                defaultValue="5";
            };
            class Misery_AI_Zone_WeapPrimaryLoot: Edit
              {
                property="Misery_AI_Zone_WeapPrimaryLoot";
                displayName="Primary Weapons for generated AI";
                tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
                typeName="STRING";
                defaultValue="""""";
            };
            class Misery_AI_Zone_WeapSecondaryLoot: Edit
              {
                property="Misery_AI_Zone_WeapSecondaryLoot";
                displayName="Secondary Weapons for generated AI";
                tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
                typeName="STRING";
                defaultValue="""""";
            };
            class Misery_AI_Zone_WeaplauncherLoot: Edit
              {
                property="Misery_AI_Zone_WeaplauncherLoot";
                displayName="launcher Weapons for generated AI";
                tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
                typeName="STRING";
                defaultValue="""""";
            };
            class Misery_AI_Zone_Ammo: Edit
              {
                property="Misery_AI_Zone_Ammo";
                displayName="Ammo count for AI";
                tooltip="Max allowed ammo (generated randomly)";
                typeName="NUMBER";
                defaultValue="5";
            };
            class Misery_AI_Zone_ItemLoot: Edit
              {
                property="Misery_AI_Zone_ItemLoot";
                displayName="Item Gear for generated AI";
                tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
                typeName="STRING";
                defaultValue="""""";
            };
            class Misery_AI_Zone_NVGLoot: Edit
              {
                property="Misery_AI_Zone_NVGLoot";
                displayName="NVG Gear for generated AI";
                tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
                typeName="STRING";
                defaultValue="""""";
            };
            class Misery_AI_Zone_FacewearLoot: Edit
              {
                property="Misery_AI_Zone_FacewearLoot";
                displayName="Facewear Gear for generated AI";
                tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
                typeName="STRING";
                defaultValue="""""";
            };
            class Misery_AI_Zone_HeadgearLoot: Edit
              {
                property="Misery_AI_Zone_HeadgearLoot";
                displayName="Headgear for generated AI";
                tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
                typeName="STRING";
                defaultValue="""""";
            };
            class Misery_AI_Zone_UniformLoot: Edit
              {
                property="Misery_AI_Zone_UniformLoot";
                displayName="Uniform Gear for generated AI";
                tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
                typeName="STRING";
                defaultValue="""""";
            };
            class Misery_AI_Zone_VestLoot: Edit
              {
                property="Misery_AI_Zone_VestLoot";
                displayName="Vest Gear for generated AI";
                tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
                typeName="STRING";
                defaultValue="""""";
            };
            class Misery_AI_Zone_BackpackLoot: Edit
              {
                property="Misery_AI_Zone_BackpackLoot";
                displayName="Backpack Gear for generated AI";
                tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
                typeName="STRING";
                defaultValue="""""";
            };
            class Misery_AI_Zone_Accuracy: Edit
              {
                property="Misery_AI_Zone_Accuracy";
                displayName="Spawned AI Accuracy";
                tooltip="Aiming Accuracy setting for spawned AI";
                typeName="NUMBER";
                defaultValue="0.25";
            };
            class Misery_AI_Zone_Shake: Edit
              {
                property="Misery_AI_Zone_Shake";
                displayName="Spawned AI Shake";
                tooltip="Aiming Shake setting for spawned AI";
                typeName="NUMBER";
                defaultValue="0.25";
            };
            class Misery_AI_Zone_Speed: Edit
              {
                property="Misery_AI_Zone_Speed";
                displayName="Spawned AI Speed";
                tooltip="Aiming Speed setting for spawned AI ";
                typeName="NUMBER";
                defaultValue="0.25";
            };
            class Misery_AI_Zone_SpawnChance: Edit
              {
                property="Misery_AI_Zone_SpawnChance";
                displayName="Spawn chance";
                tooltip="Spawn chance % input for this specified AI generater when spawn conditions are met (NOTE: If AI generator fails the random spawn chance, it will no longer attempt to generate for the remainder of the game session)";
                typeName="NUMBER";
                defaultValue="100";
            };
            class Misery_AI_Zone_ModuleSpawnDistanceMIN: Edit
              {
                property="Misery_AI_Zone_ModuleSpawnDistanceMIN";
                displayName="Min Distance";
                tooltip="Minimum distance the AI can spawn from this module";
                typeName="NUMBER";
                defaultValue="250";
            };
            class Misery_AI_Zone_ModuleSpawnDistanceMAX: Edit
              {
                property="Misery_AI_Zone_ModuleSpawnDistanceMAX";
                displayName="Max Distance";
                tooltip="Maximum distance the AI can spawn from this module";
                typeName="NUMBER";
                defaultValue="1000";
            };
            class ModuleDescription: ModuleDescription{};
        };
        class ModuleDescription: ModuleDescription
        {
            description[]=
            {
            "This module is responsible for defining the generation process of ambient AI groups for a 'controlled zone area'",
            "The module allows for customization and randomization of each AI spawned group. Factors such as difficulty, unit types, and loot are all defined under this module.",
            "If AI are less than 100m from a building, they may sometimes garrison a building.",
            "Performance settings, on the other hand, are defined under the separate AI settings module.",
            "Multiple of these types of Modules can be placed within the editor."
            };
            position=0;
            duplicate=1;
            positionEnabled="Can't change this text?";
        };
    };

    class Misery_AI_Settings: Module_F
    {
        scope=2;
        displayName="Misery (AI) Settings";
        icon = QPATHTOEF(icons,data\group_ca.paa);
        category="Misery_faction";
        function="Misery_fnc_ModuleAISettings";
        functionPriority=1;
        isGlobal=0;
        isTriggerActivated=0;
        isDisposable=0;
        class Attributes: AttributesBase
        {
            class Misery_AI_SpawnCheckDistance: Edit
              {
                property="Misery_AI_SpawnCheckDistance";
                displayName="Distance check (Spawn)";
                tooltip="Distance check value for AI spawning in meters, also halts spawning if a player is in this radius to prevent seeing AI generation (NOTE: This value is multiplied by 2x for a 'safe to spawn' buffer zone. This insures AI will not spawn too far away and take unnecessary resources)";
                typeName="NUMBER";
                defaultValue="1500";
            };
            class Misery_AI_DeleteCheckDistance: Edit
              {
                property="Misery_AI_DeleteCheckDistance";
                displayName="Distance check (Deletion)";
                tooltip="Distance check value for AI Deletion in meters (NOTE: This value should be more than the spawn check value, recommended at an interval of 3x your spawn check distance)";
                typeName="NUMBER";
                defaultValue="4500";
            };
            class Misery_AI_SpawnTimer: Edit
              {
                property="Misery_AI_SpawnTimer";
                displayName="AI spawn check timer";
                tooltip="Timer for AI spawn checks in seconds (How long to wait to spawn an AI group after a player is close enough)";
                typeName="NUMBER";
                defaultValue="1";
            };
            class Misery_AI_DeleteTimer: Edit
              {
                property="Misery_AI_DeleteTimer";
                displayName="AI delete check timer";
                tooltip="Timer for AI group cleaning checks in seconds (How long to wait to delete an AI group after all players have left the area)";
                typeName="NUMBER";
                defaultValue="10";
            };
            class Misery_AI_SpawnLimit: Edit
              {
                property="Misery_AI_SpawnLimit";
                displayName="AI Group spawn limit";
                tooltip="Maximum allowed AI groups (How many AI groups are allowed to be active on the map at once)";
                typeName="NUMBER";
                defaultValue="5";
            };
            class ModuleDescription: ModuleDescription{};
        };
        class ModuleDescription: ModuleDescription
        {
            description[]=
            {
                "This module defines the performance properties for Ambient AI Generation",
                "Only one of these types of Modules may be placed inside the editor"
            };
            position=0;
            duplicate=1;
            positionEnabled="Can't change this text?";
        };
    };
};

