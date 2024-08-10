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

class Misery_Ambient_AI: Module_F
	{
		scope=2;
		displayName="Misery Ambient AI"; 
		icon="\z\misery\addons\icons\AK.paa";
		category="Misery_faction";
		function="";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=0;
		isDisposable=0;
		class Attributes: AttributesBase
		{
			class Misery_AI_faction: Combo
			{
				property="Misery_AI_faction";
				displayName = "Faction";
				tooltip = "Defines what faction you want to be genrated";
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
			class Misery_AI_Class : Edit
  			{
				property="Misery_AI_Class";
				displayName="AI type";
				tooltip="Single classname input, AI Class to spawn, doesn't need qoutes";
				defaultValue="""B_Soldier_F""";
				typeName="STRING";
			};
			class Misery_AI_GroupMAX: Edit
  			{
				property="Misery_AI_GroupMAX";
				displayName="Group Size";
				tooltip="Maximum number of AI a group can spawn with";
				typeName="NUMBER";
				defaultValue="5";
			};
			class Misery_AI_WeapPrimaryLoot: Edit
  			{
				property="Misery_AI_WeapPrimaryLoot";
				displayName="Primary Weapons for generated AI";
				tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
				typeName="STRING";
				defaultValue="""""";
			};
			class Misery_AI_WeapSecondaryLoot: Edit
  			{
				property="Misery_AI_WeapSecondaryLoot";
				displayName="Secondary Weapons for generated AI";
				tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
				typeName="STRING";
				defaultValue="""""";
			};
			class Misery_AI_WeaplauncherLoot: Edit
  			{
				property="Misery_AI_WeaplauncherLoot";
				displayName="launcher Weapons for generated AI";
				tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
				typeName="STRING";
				defaultValue="""""";
			};
			class Misery_AI_Ammo: Edit
  			{
				property="Misery_AI_Ammo";
				displayName="Ammo count for AI";
				tooltip="Max allowed ammo (generated randomly)";
				typeName="NUMBER";
				defaultValue="5";
			};
			class Misery_AI_ItemLoot: Edit
  			{
				property="Misery_AI_ItemLoot";
				displayName="Item Gear for generated AI";
				tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
				typeName="STRING";
				defaultValue="""""";
			};
			class Misery_AI_NVGLoot: Edit
  			{
				property="Misery_AI_NVGLoot";
				displayName="NVG Gear for generated AI";
				tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
				typeName="STRING";
				defaultValue="""""";
			};
			class Misery_AI_FacewearLoot: Edit
  			{
				property="Misery_AI_FacewearLoot";
				displayName="Facewear Gear for generated AI";
				tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
				typeName="STRING";
				defaultValue="""""";
			};
			class Misery_AI_HeadgearLoot: Edit
  			{
				property="Misery_AI_HeadgearLoot";
				displayName="Headgear for generated AI";
				tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
				typeName="STRING";
				defaultValue="""""";
			};
			class Misery_AI_UniformLoot: Edit
  			{
				property="Misery_AI_UniformLoot";
				displayName="Uniform Gear for generated AI";
				tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
				typeName="STRING";
				defaultValue="""""";
			};
			class Misery_AI_VestLoot: Edit
  			{
				property="Misery_AI_VestLoot";
				displayName="Vest Gear for generated AI";
				tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
				typeName="STRING";
				defaultValue="""""";
			};
			class Misery_AI_BackpackLoot: Edit
  			{
				property="Misery_AI_BackpackLoot";
				displayName="Backpack Gear for generated AI";
				tooltip="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
				typeName="STRING";
				defaultValue="""""";
			};
			class Misery_AI_Accuracy: Edit
  			{
				property="Misery_AI_Accuracy";
				displayName="Spawned AI Accuracy";
				tooltip="Aiming Accuracy setting for spawned AI";
				typeName="NUMBER";
				defaultValue="0.25";
			};
			class Misery_AI_Shake: Edit
  			{
				property="Misery_AI_Shake";
				displayName="Spawned AI Shake";
				tooltip="Aiming Shake setting for spawned AI";
				typeName="NUMBER";
				defaultValue="0.25";
			};
			class Misery_AI_Speed: Edit
  			{
				property="Misery_AI_Speed";
				displayName="Spawned AI Speed";
				tooltip="Aiming Speed setting for spawned AI ";
				typeName="NUMBER";
				defaultValue="0.25";
			};
			class Misery_AI_SpawnChance: Edit
  			{
				property="Misery_AI_SpawnChance";
				displayName="Spawn chance";
				tooltip="Spawn chance % input for this specified AI generater when spawn conditions are met (NOTE: If AI generator fails the random spawn chance, it will no longer attempt to generate for the remainder of the game session)";
				typeName="NUMBER";
				defaultValue="100";
			};
			class Misery_AI_ModuleSpawnDistanceMIN: Edit
  			{
				property="Misery_AI_ModuleSpawnDistanceMIN";
				displayName="Min Distance";
				tooltip="Minimum distance the AI can spawn from this module";
				typeName="NUMBER";
				defaultValue="250";
			};
			class Misery_AI_ModuleSpawnDistanceMAX: Edit
  			{
				property="Misery_AI_ModuleSpawnDistanceMAX";
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
			"This module is responsible for defining the generation process of ambient AI groups.",
			"Not to be confused with the 'Misery Ambient AI Zone' module, this module consistently generates AI randomly around players...",
			"The module allows for customization and randomization of each AI spawned group.",
			"If AI are less than 100m from a building, they may sometimes garrison a building.",
			"Only ONE of these types of Modules can be placed within the editor."
			};
			position=0;
			duplicate=1;
			positionEnabled="Can't change this text?";
		};
	};
};

