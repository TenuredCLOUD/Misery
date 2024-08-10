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

class Misery_ArtifactSpawner: Module_F
	{
		scope=2;
		displayName="Misery (Artifact Spawner)";
		icon="\z\misery\addons\icons\Artifacticon.paa";
		category="Misery_faction";
		function="";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=0;
		isDisposable=0;
		class Attributes: AttributesBase
		{
			class Misery_ArtifactSpawnnumber: Edit
  			{
				property="Misery_ArtifactSpawnnumber";
				displayName="Artifact count";
				tooltip="Number of Artifacts to spawn within your radius, placement locations are randomly generated at ground level...";
				typeName="NUMBER";
				defaultValue="15";
			};
			class Misery_ArtifactSpawnradius: Edit
  			{
				property="Misery_ArtifactSpawnradius";
				displayName="Radius of Spawn";
				tooltip="Distance from this modules center point to spawn artifacts";
				typeName="NUMBER";
				defaultValue="1000";
			};
			class ModuleDescription: ModuleDescription{};
		};
		class ModuleDescription: ModuleDescription
		{
			description[]=
			{
				"This module defines the spawning properties of Artifacts",
				"Multiple instances of these types of modules can be placed inside the editor"
			};
			position=0;
			duplicate=1;
			positionEnabled="Can't change this text?";
		};
	};

	class Misery_ArtifactSpawner_Settings: Module_F
	{
		scope=2;
		displayName="Misery (Artifact Spawner) Settings";
		icon="\z\misery\addons\icons\Artifacticon.paa";
		category="Misery_faction";
		function="Misery_fnc_ModuleArtifactSpawner";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=0;
		isDisposable=0;
		class Attributes: AttributesBase
		{
			class MiseryArtifactSpawnCheckDistance: Edit
  			{
				property="MiseryArtifactSpawnCheckDistance";
				displayName="Distance check (Spawn)";
				tooltip="Distance check value for Artifact spawning in meters, also halts spawning if a player is in this radius to prevent seeing Artifact generation (NOTE: This value is multiplied by 1.5x for a 'safe to spawn' buffer zone. This insures Artifacts will not spawn too far away and take unnecessary resources)";
				typeName="NUMBER";
				defaultValue="350";
			};
			class MiseryArtifactDeleteCheckDistance: Edit
  			{
				property="MiseryArtifactDeleteCheckDistance";
				displayName="Distance check (Deletion)";
				tooltip="Distance check value for Artifact Deletion in meters (NOTE: This value should be more than the spawn check value, recommended at an interval of 2x your spawn check distance)";
				typeName="NUMBER";
				defaultValue="700";
			};
			class MiseryArtifactSpawnTimer: Edit
  			{
				property="MiseryArtifactSpawnTimer";
				displayName="Artifact spawn check timer";
				tooltip="Timer for Artifact spawn checks in seconds (How long to wait to spawn artifacts after a player is close enough)";
				typeName="NUMBER";
				defaultValue="1";
			};
			class MiseryArtifactDeleteTimer: Edit
  			{
				property="MiseryArtifactDeleteTimer";
				displayName="Artifact delete check timer";
				tooltip="Timer for Artifact cleaning checks in seconds (How long to wait to delete artifacts after all players have left the area)";
				typeName="NUMBER";
				defaultValue="10";
			};
			class ModuleDescription: ModuleDescription{};
		};
		class ModuleDescription: ModuleDescription
		{
			description[]=
			{
				"This module defines the performance properties for Artifact loot Generation",
				"This system is built identical to the POI generation settings module, and is very performance friendly",
				"Only one of these types of Modules may be placed inside the editor"
			};
			position=0;
			duplicate=1;
			positionEnabled="Can't change this text?";
		};
	};
};