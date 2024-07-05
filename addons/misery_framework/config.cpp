 /* -----------------------------------
Misery Mod Config
Designed specifically for Misery mod 
by TenuredCLOUD 
-------------------------------------- */

#include "\z\misery\addons\misery_framework\Scripts\Misery_PreParser.hpp"

class CfgPatches
{
	class misery_framework
	{
		units[] = {"Misery_CustomItemAction","Misery_CustomAction","Misery_Survival","Misery_Temperature","Misery_HUDDefines","Misery_FearFramework","Misery_SaveData","Misery_AmbientAnimals","Misery_EconomyFramework","Misery_AmbientRadioDefines","Misery_GhostBase","Misery_GhostBase2","Misery_Ghost","Misery_Debug","Misery_SpawnerGhosts","Misery_SpawnerAmbient","Misery_Ghosts","Misery_Stalk","Misery_ItFollows","Misery_Thrall","Misery_Sleep"};
		weapons[] = {};
		requiredAddons[] = {"CBA_main"};
		author="TenuredCLOUD";
		requiredVersion = ARMABUILD; 
		version = MISERYVERSION; 
		versionStr = MISERYVERSION; 
		versionAr[] = {MISERYVERSTR}; 
	};
};

class Extended_PreInit_Eventhandlers {
	class Misery_Settings_PREP {
		Init = "[] execVM '\z\misery\addons\misery_framework\Scripts\Misery_Settings_PREP.sqf';";
	};
	class Misery_Func_PREP {
		Init = "[] execVM '\z\misery\addons\misery_framework\Scripts\Misery_Func_Compile_PREP.sqf';";
	};
	class Misery_NoFuel_PREP {
		serverInit = "[] execVM '\z\misery\addons\misery_framework\Scripts\No_FuelSource_PREP.sqf';";
	};
	class Misery_BlackOut_PREP {
		serverInit = "[] execVM '\z\misery\addons\misery_framework\Scripts\Blackout_PREP.sqf';";
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

class Extended_PostInit_EventHandlers {
	class Misery_PREP {
		Init = "[] execVM '\z\misery\addons\misery_framework\Scripts\Misery_Sys_PREP.sqf';";
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
        icon="\z\misery\addons\misery_framework\Scripts\Survival\data\Mappack\basematerial.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

     class Base_trader
    {
        name="Base trader";
        icon="\z\misery\addons\misery_framework\Scripts\Survival\data\Mappack\basetrader.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

     class Ecologists
    {
        name="Ecologists";
        icon="\z\misery\addons\misery_framework\Scripts\Survival\data\Mappack\gasMask.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

     class Lumber_Mill
    {
        name="Lumber mill";
        icon="\z\misery\addons\misery_framework\Scripts\Survival\data\Mappack\lumber.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

     class Mechanic
    {
        name="Mechanic";
        icon="\z\misery\addons\misery_framework\Scripts\Survival\data\Mappack\mechanic.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

     class Military
    {
        name="Military Zone";
        icon="\z\misery\addons\misery_framework\Scripts\Survival\data\Mappack\military.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

     class Mining
    {
        name="Mining";
        icon="\z\misery\addons\misery_framework\Scripts\Survival\data\Mappack\mining.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

     class Skull
    {
        name="Skull";
        icon="\z\misery\addons\misery_framework\Scripts\Survival\data\Mappack\skull.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

     class Radiation_zone
    {
        name="Radiation Zone";
        icon="\z\misery\addons\misery_framework\Scripts\Survival\data\Mappack\RadZone.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

     class Trader_presence
    {
        name="Trader";
        icon="\z\misery\addons\misery_framework\Scripts\Survival\data\Mappack\trader.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

     class Banker_presence
    {
        name="Banker";
        icon="\z\misery\addons\misery_framework\Scripts\Survival\data\Mappack\banker.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

    class Forge_Anvil
    {
        name="Forge & Anvil";
        icon="\z\misery\addons\misery_framework\Scripts\Survival\data\Mappack\anvil.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

    class Rearmer
    {
        name="Rearmer";
        icon="\z\misery\addons\misery_framework\Scripts\Survival\data\Mappack\rearm.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

	class Refueler
    {
        name="Refuel";
        icon="\z\misery\addons\misery_framework\Scripts\Survival\data\Mappack\pumpnozzle.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

	 class MedicalMap
    {
        name="Medical";
        icon="\z\misery\addons\misery_framework\Scripts\Survival\data\Mappack\medical.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

	class SafeZoneMap
    {
        name="Safezone";
        icon="\z\misery\addons\misery_framework\Scripts\Survival\data\Mappack\safezone.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };

	class HeliWreckMap
    {
        name="Helicopter Wreck";
        icon="\z\misery\addons\misery_framework\Scripts\Survival\data\Mappack\Heliwreck.paa";
        size=32;
        color[]={0,0,0,1};
        shadow = 0;
        scope = 2;
        markerClass = "Misery_map_markers";
    };
 };

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

	class Misery_CustomItemAction: Module_F
	{
		scope=2;
		displayName="Custom item usage";
		icon = "\z\misery\addons\misery_framework\Scripts\Survival\data\swap.paa";
		category="Misery_faction";
		function="Misery_fnc_ModuleCustomItemAction";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=0;
		isDisposable=0;
		class Attributes: AttributesBase
		{
			class Misery_ClassName: Edit
			{
				property="Misery_ClassName";
				displayName="Class name";
				tooltip="The class name of the item (ex. FirstAidKit - doesn't require qoutes '')";
				typeName="STRING";
				defaultValue="""""";
			};
			class Misery_Script: Edit
			{
				property="Misery_Script";
				displayName="Script path";
				tooltip="Path to a script that will be run when this item is clicked on (ex. MyScripts\myscript.sqf - doesn't require qoutes '')";
				typeName="STRING";
				defaultValue="""""";
			};
			class ModuleDescription: ModuleDescription{};
		};
		class ModuleDescription: ModuleDescription
		{
			description[]=
			{
				"**Requires utilization of the Misery framework, cannot use this with Ravage**",
				"Class name and path of custom item actions when the inventory item is double-clicked.",
				"Place as many of these modules as you want, or for each inventory item you want to have an action.",
				"Syncing and location have no effect."
			};
			//position=0;
			duplicate=1;
		};
	};

	class Misery_CustomAction: Module_F
	{
		scope=2;
		displayName="Custom action";
		icon = "\z\misery\addons\misery_framework\Scripts\Survival\data\action.paa";
		category="Misery_faction";
		function="Misery_fnc_ModuleCustomAction";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=0;
		isDisposable=0;
		class Attributes: AttributesBase
		{
			class Misery_Description: Edit
			{
				property="Misery_Description";
				displayName="Description";
				tooltip="The text that will appear in the player inventory menu (eg. My custom action)";
				typeName="STRING";
				defaultValue="""""";
			};
			class Misery_Script: Edit
			{
				property="Misery_Script";
				displayName="Script path";
				tooltip="Path to a script that will be run when this action is clicked on (eg. MyScripts\CustomAction1.sqf)";
				typeName="STRING";
				defaultValue="""""";
			};
			class Misery_WaitTime: Edit
			{
				property="Misery_WaitTime";
				displayName="Wait time";
				tooltip="Delay in seconds before adding this action (shorter wait means high in the list).";
				typeName="NUMBER";
				defaultValue="0";
			};
			class ModuleDescription: ModuleDescription{};
		};
		class ModuleDescription: ModuleDescription
		{
			description[]=
			{
				"Description and path of custom actions to add to the player inventory menu.",
				"If no units are synced, all players have access to this action.",
				"If units are synced, only they will have access to this action.",
				"Place as many of these modules as you want."
			};
			//position=0;
			duplicate=1;
		};
	};

	// class Misery_Loot: Module_F
	// {
	// 	author="Drongo - Source Code";
	// 	_generalMacro="Misery_Loot";
	// 	scope=2;
	// 	displayName="Loot Defines (Misery Loot framework)";
	// 	icon="\z\misery\addons\misery_framework\Scripts\Survival\data\loot.paa";
	// 	category="Misery_faction";
	// 	function="Misery_fnc_ModuleLoot";
	// 	functionPriority=1;
	// 	isGlobal=1;
	// 	isTriggerActivated=0;
	// 	isDisposable=0;
	// 	class Arguments
	// 	{
	// 		class MiseryBaseWeapons
	// 		{
	// 			displayName="Base weapons only";
	// 			description="Prevent all variants of a weapons being available as loot";
	// 			typeName="STRING";
	// 			class values
	// 			{
	// 				class TRUE
	// 				{
	// 					name="True";
	// 					value="TRUE";
	// 					default=1;
	// 				};
	// 				class FALSE
	// 				{
	// 					name="False";
	// 					value="FALSE";
	// 				};
	// 			};
	// 		};
	// 		class MiseryBISmedical
	// 		{
	// 			displayName="BIS medical items";
	// 			description="Allow BIS medical items (FirstAidKit, Medikit)";
	// 			typeName="STRING";
	// 			class values
	// 			{
	// 				class TRUE
	// 				{
	// 					name="True";
	// 					value="TRUE";
	// 					default=1;
	// 				};
	// 				class FALSE
	// 				{
	// 					name="False";
	// 					value="FALSE";
	// 				};
	// 			};
	// 		};
	// 		class MiseryBISweapons
	// 		{
	// 			displayName="BIS weapons";
	// 			description="Allow BIS weapons";
	// 			typeName="STRING";
	// 			class values
	// 			{
	// 				class TRUE
	// 				{
	// 					name="True";
	// 					value="TRUE";
	// 					default=1;
	// 				};
	// 				class FALSE
	// 				{
	// 					name="False";
	// 					value="FALSE";
	// 				};
	// 			};
	// 		};
	// 		class MiseryBISitems
	// 		{
	// 			displayName="BIS items";
	// 			description="Allow BIS items";
	// 			typeName="STRING";
	// 			class values
	// 			{
	// 				class TRUE
	// 				{
	// 					name="True";
	// 					value="TRUE";
	// 					default=1;
	// 				};
	// 				class FALSE
	// 				{
	// 					name="False";
	// 					value="FALSE";
	// 				};
	// 			};
	// 		};
	// 		class MiseryBISuniforms
	// 		{
	// 			displayName="BIS uniforms";
	// 			description="Allow BIS uniforms";
	// 			typeName="STRING";
	// 			class values
	// 			{
	// 				class TRUE
	// 				{
	// 					name="True";
	// 					value="TRUE";
	// 					default=1;
	// 				};
	// 				class FALSE
	// 				{
	// 					name="False";
	// 					value="FALSE";
	// 				};
	// 			};
	// 		};
	// 		class MiseryBISvests
	// 		{
	// 			displayName="BIS vests";
	// 			description="Allow BIS vests";
	// 			typeName="STRING";
	// 			class values
	// 			{
	// 				class TRUE
	// 				{
	// 					name="True";
	// 					value="TRUE";
	// 					default=1;
	// 				};
	// 				class FALSE
	// 				{
	// 					name="False";
	// 					value="FALSE";
	// 				};
	// 			};
	// 		};
	// 		class MiseryBISheadgear
	// 		{
	// 			displayName="BIS headgear";
	// 			description="Allow BIS headgear";
	// 			typeName="STRING";
	// 			class values
	// 			{
	// 				class TRUE
	// 				{
	// 					name="True";
	// 					value="TRUE";
	// 					default=1;
	// 				};
	// 				class FALSE
	// 				{
	// 					name="False";
	// 					value="FALSE";
	// 				};
	// 			};
	// 		};
	// 		class MiseryBISgoggles
	// 		{
	// 			displayName="BIS goggles";
	// 			description="Allow BIS goggles";
	// 			typeName="STRING";
	// 			class values
	// 			{
	// 				class TRUE
	// 				{
	// 					name="True";
	// 					value="TRUE";
	// 					default=1;
	// 				};
	// 				class FALSE
	// 				{
	// 					name="False";
	// 					value="FALSE";
	// 				};
	// 			};
	// 		};
	// 		class MiseryBISpacks
	// 		{
	// 			displayName="BIS backpacks";
	// 			description="Allow BIS backpacks";
	// 			typeName="STRING";
	// 			class values
	// 			{
	// 				class TRUE
	// 				{
	// 					name="True";
	// 					value="TRUE";
	// 					default=1;
	// 				};
	// 				class FALSE
	// 				{
	// 					name="False";
	// 					value="FALSE";
	// 				};
	// 			};
	// 		};
	// 		class MiseryFood
	// 		{
	// 			displayName="Misery food";
	// 			description="Allow Misery food items";
	// 			typeName="STRING";
	// 			class values
	// 			{
	// 				class TRUE
	// 				{
	// 					name="True";
	// 					value="TRUE";
	// 					default=1;
	// 				};
	// 				class FALSE
	// 				{
	// 					name="False";
	// 					value="FALSE";
	// 				};
	// 			};
	// 		};
	// 		class MiseryMedical
	// 		{
	// 			displayName="Misery medical";
	// 			description="Allow Misery medical items";
	// 			typeName="STRING";
	// 			class values
	// 			{
	// 				class TRUE
	// 				{
	// 					name="True";
	// 					value="TRUE";
	// 					default=1;
	// 				};
	// 				class FALSE
	// 				{
	// 					name="False";
	// 					value="FALSE";
	// 				};
	// 			};
	// 		};
	// 		class MiseryItems
	// 		{
	// 			displayName="Misery misc items";
	// 			description="Allow Misery misc items";
	// 			typeName="STRING";
	// 			class values
	// 			{
	// 				class TRUE
	// 				{
	// 					name="True";
	// 					value="TRUE";
	// 					default=1;
	// 				};
	// 				class FALSE
	// 				{
	// 					name="False";
	// 					value="FALSE";
	// 				};
	// 			};
	// 		};
	// 		class MiseryChanceHouse
  	// 		{
	// 			displayName="Chance building";
	// 			description="Chance a non-military building has loot";
	// 			typeName="NUMBER";
	// 			defaultValue="20";
	// 		};
	// 		class MiseryChanceFood
  	// 		{
	// 			displayName="Food chance";
	// 			description="Chance food (% chance,min items,max items)";
	// 			typeName="STRING";
	// 			defaultValue="10,1,3";
	// 		};
	// 		class MiseryChanceMedical
  	// 		{
	// 			displayName="Med chance";
	// 			description="Chance medical items (% chance,min items,max items)";
	// 			typeName="STRING";
	// 			defaultValue="10,1,3";
	// 		};
	// 		class MiseryChanceMisc
  	// 		{
	// 			displayName="Misc item chance";
	// 			description="Chance misc items (% chance,min items,max items)";
	// 			typeName="STRING";
	// 			defaultValue="30,1,3";
	// 		};
	// 		class MiseryChanceWeapon
  	// 		{
	// 			displayName="Weapon chance";
	// 			description="Chance weapon (% chance,min items,max items)";
	// 			typeName="STRING";
	// 			defaultValue="10,1,3";
	// 		};
	// 		class MiseryChanceAttachment
  	// 		{
	// 			displayName="Attachment chance";
	// 			description="Chance attachments (% chance,min items,max items)";
	// 			typeName="STRING";
	// 			defaultValue="10,1,2";
	// 		};
	// 		class MiseryChanceMagazine
  	// 		{
	// 			displayName="Magazine chance";
	// 			description="Chance magazines for contained weapons (% chance,min items,max items)";
	// 			typeName="STRING";
	// 			defaultValue="90,1,5";
	// 		};
	// 		class MiseryChanceUniform
  	// 		{
	// 			displayName="Uniform chance";
	// 			description="Chance uniforms (% chance,min items,max items)";
	// 			typeName="STRING";
	// 			defaultValue="30,1,3";
	// 		};
	// 		class MiseryChanceVest
  	// 		{
	// 			displayName="Vest chance";
	// 			description="Chance vests (% chance,min items,max items)";
	// 			typeName="STRING";
	// 			defaultValue="10,1,3";
	// 		};
	// 		class MiseryChanceHeadgear
  	// 		{
	// 			displayName="Headgear chance";
	// 			description="Chance headgear (% chance,min items,max items)";
	// 			typeName="STRING";
	// 			defaultValue="30,1,3";
	// 		};
	// 		class MiseryChancePack
  	// 		{
	// 			displayName="Backpack chance";
	// 			description="Chance backpacks (% chance,min items,max items)";
	// 			typeName="STRING";
	// 			defaultValue="30,1,3";
	// 		};
	// 		class MiseryChanceGoggle
  	// 		{
	// 			displayName="Goggle chance";
	// 			description="Chance goggles (% chance,min items,max items)";
	// 			typeName="STRING";
	// 			defaultValue="10,1,3";
	// 		};
	// 		class MiseryChanceMagazineRandom
  	// 		{
	// 			displayName="Random magazine chance";
	// 			description="Chance random magazines (% chance,min items,max items)";
	// 			typeName="STRING";
	// 			defaultValue="10,1,5";
	// 		};
	// 		class MiseryChanceGrenade
  	// 		{
	// 			displayName="Grenade chance";
	// 			description="Chance grenades (% chance,min items,max items)";
	// 			typeName="STRING";
	// 			defaultValue="1,1,3";
	// 		};
	// 		class MiseryChanceExplosive
  	// 		{
	// 			displayName="Explosive chance";
	// 			description="Chance explosives (% chance,min items,max items)";
	// 			typeName="STRING";
	// 			defaultValue="1,1,3";
	// 		};
	// 		class MiseryChanceHouseM
  	// 		{
	// 			displayName="Chance building (Military)";
	// 			description="Chance a military building has loot";
	// 			typeName="NUMBER";
	// 			defaultValue="50";
	// 		};
	// 		class MiseryChanceFoodM
  	// 		{
	// 			displayName="Food chance (Military)";
	// 			description="Chance food (% chance,min items,max items)";
	// 			typeName="STRING";
	// 			defaultValue="10,1,3";
	// 		};
	// 		class MiseryChanceMedicalM
  	// 		{
	// 			displayName="Med chance (Military)";
	// 			description="Chance medical items (% chance,min items,max items)";
	// 			typeName="STRING";
	// 			defaultValue="40,1,3";
	// 		};
	// 		class MiseryChanceMiscM
  	// 		{
	// 			displayName="Misc item chance (Military)";
	// 			description="Chance misc items (% chance,min items,max items)";
	// 			typeName="STRING";
	// 			defaultValue="20,1,3";
	// 		};
	// 		class MiseryChanceWeaponM
  	// 		{
	// 			displayName="Weapon chance (Military)";
	// 			description="Chance weapon (% chance,min items,max items)";
	// 			typeName="STRING";
	// 			defaultValue="40,1,3";
	// 		};
	// 		class MiseryChanceAttachmentM
  	// 		{
	// 			displayName="Attachment chance (Military)";
	// 			description="Chance attachments (% chance,min items,max items)";
	// 			typeName="STRING";
	// 			defaultValue="30,1,2";
	// 		};
	// 		class MiseryChanceMagazineM
  	// 		{
	// 			displayName="Magazine chance (Military)";
	// 			description="Chance magazines for contained weapons (% chance,min items,max items)";
	// 			typeName="STRING";
	// 			defaultValue="90,1,5";
	// 		};
	// 		class MiseryChanceUniformM
  	// 		{
	// 			displayName="Uniform chance (Military)";
	// 			description="Chance uniforms (% chance,min items,max items)";
	// 			typeName="STRING";
	// 			defaultValue="30,1,3";
	// 		};
	// 		class MiseryChanceVestM
  	// 		{
	// 			displayName="Vest chance (Military)";
	// 			description="Chance vests (% chance,min items,max items)";
	// 			typeName="STRING";
	// 			defaultValue="30,1,3";
	// 		};
	// 		class MiseryChanceHeadgearM
  	// 		{
	// 			displayName="Headgear chance (Military)";
	// 			description="Chance headgear (% chance,min items,max items)";
	// 			typeName="STRING";
	// 			defaultValue="30,1,3";
	// 		};
	// 		class MiseryChancePackM
  	// 		{
	// 			displayName="Backpack chance (Military)";
	// 			description="Chance backpacks (% chance,min items,max items)";
	// 			typeName="STRING";
	// 			defaultValue="30,1,3";
	// 		};
	// 		class MiseryChanceGoggleM
  	// 		{
	// 			displayName="Goggle chance (Military)";
	// 			description="Chance goggles (% chance,min items,max items)";
	// 			typeName="STRING";
	// 			defaultValue="10,1,3";
	// 		};
	// 		class MiseryChanceMagazineRandomM
  	// 		{
	// 			displayName="Random magazine chance (Military)";
	// 			description="Chance random magazines (% chance,min items,max items)";
	// 			typeName="STRING";
	// 			defaultValue="50,1,5";
	// 		};
	// 		class MiseryChanceGrenadeM
  	// 		{
	// 			displayName="Grenade chance";
	// 			description="Chance grenades (% chance,min items,max items)";
	// 			typeName="STRING";
	// 			defaultValue="50,1,3";
	// 		};
	// 		class MiseryChanceExplosiveM
  	// 		{
	// 			displayName="Explosive chance";
	// 			description="Chance explosives (% chance,min items,max items)";
	// 			typeName="STRING";
	// 			defaultValue="20,1,3";
	// 		};
	// 		class MiseryCustomArrays
	// 		{
	// 			displayName="Custom Arrays";
	// 			description="Only Allow Custom arrays? (This setting makes it so no loot arrays are automatically populated, instead only the classnames you list will be available for loot)";
	// 			typeName="STRING";
	// 			class values
	// 			{
	// 				class TRUE
	// 				{
	// 					name="True";
	// 					value="TRUE";
	// 				};
	// 				class FALSE
	// 				{
	// 					name="False";
	// 					value="FALSE";
	// 					default = 1;
	// 				};
	// 			};
	// 		};
	// 		class MiseryLootItemsFood
  	// 		{
	// 			displayName="Food items (Civilian)";
	// 			description="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
	// 			typeName="STRING";
	// 			defaultValue="";
	// 		};
	// 		class MiseryLootItemsFoodM
  	// 		{
	// 			displayName="Food items (Military)";
	// 			description="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
	// 			typeName="STRING";
	// 			defaultValue="";
	// 		};
	// 		class MiseryLootItemsMedical
  	// 		{
	// 			displayName="Medical items (Civilian)";
	// 			description="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
	// 			typeName="STRING";
	// 			defaultValue="";
	// 		};
	// 		class MiseryLootItemsMedicalM
  	// 		{
	// 			displayName="Medical items (Military)";
	// 			description="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
	// 			typeName="STRING";
	// 			defaultValue="";
	// 		};
	// 		class MiseryLootItemsMisc
  	// 		{
	// 			displayName="Misc items (Civilian)";
	// 			description="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
	// 			typeName="STRING";
	// 			defaultValue="";
	// 		};
	// 		class MiseryLootItemsMiscM
  	// 		{
	// 			displayName="Misc items (Military)";
	// 			description="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
	// 			typeName="STRING";
	// 			defaultValue="";
	// 		};
	// 		class MiseryLootWeapons
  	// 		{
	// 			displayName="Weapons (Civilian)";
	// 			description="Magazines are auto populated into arrays - (NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
	// 			typeName="STRING";
	// 			defaultValue="";
	// 		};
	// 		class MiseryLootWeaponsM
  	// 		{
	// 			displayName="Weapons (Military)";
	// 			description="Magazines are auto populated into arrays - (NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
	// 			typeName="STRING";
	// 			defaultValue="";
	// 		};
	// 		class MiseryLootWeaponattachments
  	// 		{
	// 			displayName="Weapon attachments (Civilian)";
	// 			description="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
	// 			typeName="STRING";
	// 			defaultValue="";
	// 		};
	// 		class MiseryLootWeaponattachmentsM
  	// 		{
	// 			displayName="Weapon attachments (Military)";
	// 			description="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
	// 			typeName="STRING";
	// 			defaultValue="";
	// 		};
	// 		class MiseryLootUniforms
  	// 		{
	// 			displayName="Uniforms (Civilian)";
	// 			description="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
	// 			typeName="STRING";
	// 			defaultValue="";
	// 		};
	// 		class MiseryLootUniformsM
  	// 		{
	// 			displayName="Uniforms (Military)";
	// 			description="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
	// 			typeName="STRING";
	// 			defaultValue="";
	// 		};
	// 		class MiseryLootVests
  	// 		{
	// 			displayName="Vests (Civilian)";
	// 			description="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
	// 			typeName="STRING";
	// 			defaultValue="";
	// 		};
	// 		class MiseryLootVestsM
  	// 		{
	// 			displayName="Vests (Military)";
	// 			description="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
	// 			typeName="STRING";
	// 			defaultValue="";
	// 		};
	// 		class MiseryLootHeadgear
  	// 		{
	// 			displayName="Headgear (Civilian)";
	// 			description="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
	// 			typeName="STRING";
	// 			defaultValue="";
	// 		};
	// 		class MiseryLootHeadgearM
  	// 		{
	// 			displayName="Headgear (Military)";
	// 			description="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
	// 			typeName="STRING";
	// 			defaultValue="";
	// 		};
	// 		class MiseryLootPacks
  	// 		{
	// 			displayName="Backpacks (Civilian)";
	// 			description="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
	// 			typeName="STRING";
	// 			defaultValue="";
	// 		};
	// 		class MiseryLootPacksM
  	// 		{
	// 			displayName="Backpacks (Military)";
	// 			description="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
	// 			typeName="STRING";
	// 			defaultValue="";
	// 		};
	// 		class MiseryLootGoggles
  	// 		{
	// 			displayName="Goggles / Facewear (Civilian)";
	// 			description="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
	// 			typeName="STRING";
	// 			defaultValue="";
	// 		};
	// 		class MiseryLootGogglesM
  	// 		{
	// 			displayName="Goggles / Facewear (Military)";
	// 			description="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
	// 			typeName="STRING";
	// 			defaultValue="";
	// 		};
	// 		class MiseryLootGrenades
  	// 		{
	// 			displayName="Grenades";
	// 			description="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
	// 			typeName="STRING";
	// 			defaultValue="";
	// 		};
	// 		class MiseryLootExplosives
  	// 		{
	// 			displayName="Explosives";
	// 			description="(NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
	// 			typeName="STRING";
	// 			defaultValue="";
	// 		};
	// 		class MiseryLootItemsBlacklist
  	// 		{
	// 			displayName="Blacklisted items";
	// 			description="Input classnames of items you do not wish to spawn, or be available, this array removes input items from every loot list. (NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
	// 			typeName="STRING";
	// 			defaultValue="";
	// 		};
	// 		class MiseryLootBldgBlacklist
  	// 		{
	// 			displayName="Blacklisted Buildings";
	// 			description="Input classnames of Buildings you don't want any loot to spawn in (NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
	// 			typeName="STRING";
	// 			defaultValue="";
	// 		};
	// 		class MiseryLoottimer
  	// 		{
	// 			displayName="Loot checks timer";
	// 			description="Timer for loot spawning and clean checks";
	// 			typeName="NUMBER";
	// 			defaultValue="20";
	// 		};
	// 		class MiseryLootrefreshtimer
  	// 		{
	// 			displayName="Loot refresh timer";
	// 			description="Timer for loot to refresh - Loot can respawn at previous positions (** Set to -1 to disable **)";
	// 			typeName="NUMBER";
	// 			defaultValue="3600";
	// 		};
	// 		class MiseryLootspawnDist
  	// 		{
	// 			displayName="Loot spawn distance";
	// 			description="Distance around players loot will spawn (NOTE: 50 - 200m recommended for performance)";
	// 			typeName="NUMBER";
	// 			defaultValue="200";
	// 		};
	// 		class MiseryLootDeleteDist
  	// 		{
	// 			displayName="Deletion distance";
	// 			description="Distance at which loot piles are deleted (NOTE: HIGHER values can be very performance demanding! ** Set to -1 to disable **)";
	// 			typeName="NUMBER";
	// 			defaultValue="1000";
	// 		};
	// 	};
	// };
	
	// class Misery_StartLoot: Misery_loot{scope=1;};

	class Misery_MedicalgearRand: Module_F
	{
		scope=2;
		displayName="Medical gear random (Sync module)";
		icon="\z\misery\addons\misery_framework\Scripts\Survival\data\medication.paa";
		category="Misery_faction";
		function="Misery_fnc_ModuleRandmed";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=0;
		isDisposable=0;
		class Attributes: AttributesBase
		{
			class Misery_Randmed: Edit
  			{
				property="Misery_Randmed";
				displayName="Amount Misery items";
				tooltip="Amount of Misery medical items to add";
				typeName="NUMBER";
				defaultValue="1";
			};
			class Misery_RandmedACE: Edit
  			{
				property="Misery_RandmedACE";
				displayName="Amount ACE items";
				tooltip="Amount of ACE medical items to add";
				typeName="NUMBER";
				defaultValue="1";
			};
			class Misery_Randmedrandom: CheckBox
			{
				property="Misery_Randmedrandom";
				displayName="Randomize values";
				tooltip="Randomize add values? (Randomized items added to inventories of synced units)";
				typeName="BOOL";
			};
			class ModuleDescription: ModuleDescription{};
		};
		class ModuleDescription: ModuleDescription
		{
			description[]=
			{
				"PLEASE READ BEFORE POSTING BUGS:",
				"Multiple modules of this type can be built and synced to units across the scenario",
				"This module needs to be SYNCED to a 'DUMMY' unit(s)",
				"This module defines how many medical items you wish to add to each synced unit(s) inventory",
				"If you use the randomizer option, it will randomly select an amount to add (Example: a value of 5 can be 1 - 5)",
				"ALL medical gear from this module is prelisted and selected at random, the only control points are amount to add to units"
			};
			position=0;
			duplicate=1;
			positionEnabled="Can't change this text?";
		};
	};

	class Misery_GearEquip: Module_F
	{
		scope=2;
		displayName="Gear Equip (Sync module)";
		icon="\z\misery\addons\misery_framework\Scripts\Survival\data\swap.paa";
		category="Misery_faction";
		function="Misery_fnc_ModuleGearEquip";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=0;
		isDisposable=0;
		class Attributes: AttributesBase
		{
			class Misery_equip_weapons : Edit
  			{
				property="Misery_equip_weapons";
				displayName="Weapons";
				tooltip="(NOTE: *Array format* Must use qoutes, and commas!)";
				typeName="STRING";
			};
			class Misery_equip_headGears : Edit
  			{
				property="Misery_equip_headGears";
				displayName="Headgears";
				tooltip="(NOTE: *Array format* Must use qoutes, and commas!)";
				typeName="STRING";
			};
			class Misery_equip_backpacks : Edit
  			{
				property="Misery_equip_backpacks";
				displayName="Backpacks";
				tooltip="(NOTE: *Array format* Must use qoutes, and commas!)";
				typeName="STRING";
			};
			class Misery_equip_vests : Edit
  			{
				property="Misery_equip_vests";
				displayName="Vests";
				tooltip="(NOTE: *Array format* Must use qoutes, and commas!)";
				typeName="STRING";
			};
			class Misery_equip_goggles : Edit
  			{
				property="Misery_equip_goggles";
				displayName="Goggles (facewear)";
				tooltip="(NOTE: *Array format* Must use qoutes, and commas!)";
				typeName="STRING";
			};
			class Misery_equip_uniforms : Edit
  			{
				property="Misery_equip_uniforms";
				displayName="Uniforms";
				tooltip="(NOTE: *Array format* Must use qoutes, and commas!)";
				typeName="STRING";
			};
			class Misery_equip_WeaponItems : Edit
  			{
				property="Misery_equip_WeaponItems";
				displayName="Weapon attachments";
				tooltip="(NOTE: *Array format* Must use qoutes, and commas!)";
				typeName="STRING";
			};
			class Misery_equip_uniqueItems : Edit
  			{
				property="Misery_equip_uniqueItems";
				displayName="Rare items";
				tooltip="(NOTE: *Array format* Must use qoutes, and commas!)";
				typeName="STRING";
			};
			class Misery_equip_Items : Edit
  			{
				property="Misery_equip_Items";
				displayName="Common items";
				tooltip="(NOTE: *Array format* Must use qoutes, and commas!)";
				typeName="STRING";
			};
			class Misery_equip_launchers : Edit
  			{
				property="Misery_equip_launchers";
				displayName="Launchers";
				tooltip="(NOTE: *Array format* Must use qoutes, and commas!)";
				typeName="STRING";
			};
			class Misery_equip_gasmasks : Edit
  			{
				property="Misery_equip_gasmasks";
				displayName="Gasmasks";
				tooltip="(NOTE: *Array format* Must use qoutes, and commas!)";
				typeName="STRING";
			};
			class Misery_equip_nvgs : Edit
  			{
				property="Misery_equip_nvgs";
				displayName="NVGs";
				tooltip="(NOTE: *Array format* Must use qoutes, and commas!)";
				typeName="STRING";
			};
			class Misery_equip_Wammo: Edit
  			{
				property="Misery_equip_Wammo";
				displayName="Weapon ammo";
				tooltip="Amount of ammmo to add (May not add all depending on inv space)";
				typeName="NUMBER";
				defaultValue="1";
			};
			class Misery_equip_Lammo: Edit
  			{
				property="Misery_equip_Lammo";
				displayName="Launcher ammo";
				tooltip="Amount of ammo to add for Launcher (May not add all depending on inv space)";
				typeName="NUMBER";
				defaultValue="1";
			};
			class Misery_equip_itemamount: Edit
  			{
				property="Misery_equip_itemamount";
				displayName="Amount items";
				tooltip="Amount of items to add";
				typeName="NUMBER";
				defaultValue="1";
			};
			class Misery_equip_ACE: Edit
  			{
				property="Misery_equip_ACE";
				displayName="Amount ACE items";
				tooltip="Amount of ACE medical items to add";
				typeName="NUMBER";
				defaultValue="1";
			};
			class Misery_equip_Rare: Edit
  			{
				property="Misery_equip_Rare";
				displayName="Amount Rare items";
				tooltip="Amount of Rare items to add";
				typeName="NUMBER";
				defaultValue="1";
			};
			class Misery_equip_randomam: CheckBox
			{
				property="Misery_equip_randomam";
				displayName="Randomize item values";
				tooltip="Randomize added Item / ACE Item values? (Does not include Rare items)";
				typeName="BOOL";
			};
			class ModuleDescription: ModuleDescription{};
		};
		class ModuleDescription: ModuleDescription
		{
			description[]=
			{
				"PLEASE READ BEFORE POSTING BUGS:",
				"Multiple modules of this type can be built and synced to units across the scenario",
				"This module needs to be SYNCED to a 'DUMMY' unit(s)",
				"This module defines what type of items / gear you wish to add to each synced unit(s) inventory",
				"Each input is an array input, so just list which items you wish to be possibly spawned on synced unit(s)"
			};
			position=0;
			duplicate=1;
			positionEnabled="Can't change this text?";
		};
	};

class Misery_Psyfieldcreate: Module_F
	{
		scope=2;
		displayName="Psyfield creation";
		icon="\z\misery\addons\misery_framework\Scripts\Survival\data\Psyfield.paa";
		category="Misery_faction";
		function="Misery_fnc_ModulePsyfield";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=0;
		isDisposable=0;
		class Attributes: AttributesBase
		{
			class Misery_Psyradius: Edit
  			{
				property="Misery_Psyradius";
				displayName="Radius of Psyfield";
				typeName="NUMBER";
				defaultValue="500";
			};
			class ModuleDescription: ModuleDescription{};
		};
		class ModuleDescription: ModuleDescription
		{
			description[]=
			{
				"This module will create a Psyfield area",
				"Psy fields are deadly areas that can cause brain damage to the player...",
				"If Psyfield Fear is active - Psyfields can greatly increase psychosis levels to the player if they enter them without protection...",
				"Multiple of these types of modules can be placed in the editor"
			};
			position=0;
			duplicate=1;
			positionEnabled="Can't change this text?";
		};
	};

class Misery_RadZonecreate: Module_F
	{
		scope=2;
		displayName="Radiation Zone creation";
		icon="\z\misery\addons\misery_framework\Scripts\Survival\data\Rad_zone.paa";
		category="Misery_faction";
		function="Misery_fnc_ModuleRadZone";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=0;
		isDisposable=0;
		class Attributes: AttributesBase
		{
			class Misery_RadiationRadius: Edit
  			{
				property="Misery_RadiationRadius";
				displayName="Radius of Zone";
				typeName="NUMBER";
				defaultValue="500";
			};
			class ModuleDescription: ModuleDescription{};
		};
		class ModuleDescription: ModuleDescription
		{
			description[]=
			{
				"This module will create a Radio-Active area",
				"Radiation zones are highly lethal if the player doesn't posess any protective gear...",
				"Multiple of these types of modules can be placed in the editor"
			};
			position=0;
			duplicate=1;
			positionEnabled="Can't change this text?";
		};
	};

class Misery_PDA_notifier: Module_F
	{
		scope=2;
		displayName="PDA notification create";
		icon="\z\misery\addons\misery_framework\Scripts\Survival\data\PDA.paa";
		category="Misery_faction";
		function="Misery_fnc_ModulePDA";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=0;
		isDisposable=0;
		class Attributes: AttributesBase
		{
			class Misery_PDAradius: Edit
  			{
				property="Misery_PDAradius";
				displayName="Radius of notification";
				typeName="NUMBER";
				defaultValue="500";
			};
			class Misery_PDAalertype: Combo
			{
				property="Misery_PDAalertype";
				displayName = "Alert type";
				tooltip = "Defines what type of alert you want the PDA to display";
				typeName = "STRING";
				class Values
				{
					class RADIATION
					{
						name = "Radiation / Contamination";
						value = "RADIATION";
						default = 1;
					};
					class RADIATIONHIGH
					{
						name = "Radiation / Contamination [HIGH]";
						value = "RADIATIONHIGH";
						default = 0;
					};
					class PSYFIELD
					{
						name = "Near Psy-emissions";
						value = "PSYFIELD";
						default = 0;
					};
					class ANOMALY
					{
						name = "Near Anomalies";
						value = "ANOMALY";
						default = 0;
					};
					class MILITARY
					{
						name = "Military Zone";
						value = "MILITARY";
						default = 0;
					};
				};
			};
			class ModuleDescription: ModuleDescription{};
		};
		class ModuleDescription: ModuleDescription
		{
			description[]=
			{
				"This module will create a customized PDA alert that is repeat-able",
				"Multiple of these types of modules can be placed in the editor"
			};
			position=0;
			duplicate=1;
			positionEnabled="Can't change this text?";
		};
	};

	class Misery_Killzone: Module_F
	{
		scope=2;
		displayName="Kill zone create";
		icon="\z\misery\addons\misery_framework\Scripts\Survival\data\Mappack\skull.paa";
		category="Misery_faction";
		function="Misery_fnc_Modulekillzone";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=0;
		isDisposable=0;
		class Attributes: AttributesBase
		{
			class Misery_killzoneradius: Edit
  			{
				property="Misery_killzoneradius";
				displayName="Radius of kill zone";
				typeName="NUMBER";
				defaultValue="500";
			};
			class Misery_killzonefactiontype: Combo
			{
				property="Misery_killzonefactiontype";
				displayName = "Faction";
				tooltip = "Defines what faction you want the zone to be for";
				typeName = "STRING";
				class Values
				{
					class SIDEANYONE
					{
						name = "Everyone";
						value = "SIDEANYONE";
						default = 1;
					};
					class SIDEWEST
					{
						name = "West / BLUFOR";
						value = "SIDEWEST";
						default = 0;
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
			class Misery_killzoneactiontype: Combo
			{
				property="Misery_killzoneactiontype";
				displayName = "Killzone action";
				tooltip = "Defines what you want the zone to do when activated";
				typeName = "STRING";
				class Values
				{
					class KILLALL
					{
						name = "Kill entities";
						value = "KILLALL";
						default = 1;
					};
					class DELETEALL
					{
						name = "Delete entities";
						value = "DELETEALL";
						default = 0;
					};
				};
			};
			class ModuleDescription: ModuleDescription{};
		};
		class ModuleDescription: ModuleDescription
		{
			description[]=
			{
				"This module will create a Kill zone, any entity of the defined side that enters it's radius will instantly die, or be deleted depending on settings...",
				"This module is very useful for keeping AI out of contaminated areas, or even Safezones...",
				"Multiple of these types of modules can be placed in the editor"
			};
			position=0;
			duplicate=1;
			positionEnabled="Can't change this text?";
		};
	};

class Misery_VehRepair: Module_F
	{
		scope=2;
		displayName="Vehicle repair zone";
		icon="\z\misery\addons\misery_framework\Scripts\Survival\data\Mappack\mechanic.paa";
		category="Misery_faction";
		function="Misery_fnc_ModuleMechanic";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=0;
		isDisposable=0;
		class Attributes: AttributesBase
		{
			class Misery_Mechradius: Edit
  			{
				property="Misery_Mechradius";
				displayName="Radius of Repair area";
				typeName="NUMBER";
				defaultValue="500";
			};
			class ModuleDescription: ModuleDescription{};
		};
		class ModuleDescription: ModuleDescription
		{
			description[]=
			{
				"This module will create a Vehicle repair zone area",
				"This module allows players to request repairs for vehicles once in the radius of this module...",
				"Players need to be outside the vehicle they wish to request repair services for...",
				"Multiple of these types of modules can be placed in the editor"
			};
			position=0;
			duplicate=1;
			positionEnabled="Can't change this text?";
		};
	};

class Misery_VehRearm: Module_F
	{
		scope=2;
		displayName="Vehicle rearming zone";
		icon="\z\misery\addons\misery_framework\Scripts\Survival\data\Mappack\rearm.paa";
		category="Misery_faction";
		function="Misery_fnc_ModuleRearm";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=0;
		isDisposable=0;
		class Attributes: AttributesBase
		{
			class Misery_Rearmradius: Edit
  			{
				property="Misery_Rearmradius";
				displayName="Radius of Rearming area";
				typeName="NUMBER";
				defaultValue="500";
			};
			class ModuleDescription: ModuleDescription{};
		};
		class ModuleDescription: ModuleDescription
		{
			description[]=
			{
				"This module will create a Vehicle rearming zone area",
				"This module allows players to request rearming support for vehicles once in the radius of this module...",
				"Players need to be outside the vehicle they wish to request rearming services for...",
				"Multiple of these types of modules can be placed in the editor"
			};
			position=0;
			duplicate=1;
			positionEnabled="Can't change this text?";
		};
	};

class Misery_MedZone: Module_F
	{
		scope=2;
		displayName="Medical (treatment zone)";
		icon="\z\misery\addons\misery_framework\Scripts\Survival\data\Mappack\medical.paa";
		category="Misery_faction";
		function="Misery_fnc_ModuleMedzone";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=0;
		isDisposable=0;
		class Attributes: AttributesBase
		{
			class Misery_MedZoneradius: Edit
  			{
				property="Misery_MedZoneradius";
				displayName="Radius of Medical area";
				typeName="NUMBER";
				defaultValue="25";
			};
			class ModuleDescription: ModuleDescription{};
		};
		class ModuleDescription: ModuleDescription
		{
			description[]=
			{
				"This module will create a Medical treatment zone area",
				"This module allows players to request medical assistance once in the radius of this module...",
				"Multiple of these types of modules can be placed in the editor"
			};
			position=0;
			duplicate=1;
			positionEnabled="Can't change this text?";
		};
	};

class Misery_SafeZone: Module_F
	{
		scope=2;
		displayName="SafeZone";
		icon="\z\misery\addons\misery_framework\Scripts\Survival\data\Mappack\safezone.paa";
		category="Misery_faction";
		function="Misery_fnc_ModuleSafezone";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=0;
		isDisposable=0;
		class Attributes: AttributesBase
		{
			class Misery_SafeZoneradius: Edit
  			{
				property="Misery_SafeZoneradius";
				displayName="Radius of Safezone area";
				typeName="NUMBER";
				defaultValue="500";
			};
			class ModuleDescription: ModuleDescription{};
		};
		class ModuleDescription: ModuleDescription
		{
			description[]=
			{
				"This module will create a Safezone area",
				"NOTE: When players enter a Safezone they Cannot inflict damage! Or recieve it!",
				"Safezone modules can be used with Killzone modules, simply set a killzone module near your safezone and it will enforce a safe area...",
				"Multiple of these types of modules can be placed in the editor"
			};
			position=0;
			duplicate=1;
			positionEnabled="Can't change this text?";
		};
	};

class Misery_RefuelZone: Module_F
	{
		scope=2;
		displayName="Vehicle refueling zone";
		icon="\z\misery\addons\misery_framework\Scripts\Survival\data\Mappack\pumpnozzle.paa";
		category="Misery_faction";
		function="Misery_fnc_ModuleRefuelzone";
		functionPriority=1;
		isGlobal=0;
		isTriggerActivated=0;
		isDisposable=0;
		class Attributes: AttributesBase
		{
			class Misery_RefuelZoneradius: Edit
  			{
				property="Misery_RefuelZoneradius";
				displayName="Radius of Refuel zone area";
				typeName="NUMBER";
				defaultValue="500";
			};
			class ModuleDescription: ModuleDescription{};
		};
		class ModuleDescription: ModuleDescription
		{
			description[]=
			{
				"This module will create a Refuel zone area",
				"This module allows players to request refueling assistance once in the radius of this module...",
				"Multiple of these types of modules can be placed in the editor"
			};
			position=0;
			duplicate=1;
			positionEnabled="Can't change this text?";
		};
	};

	class Misery_Ambient_AI_Zone: Module_F
	{
		scope=2;
		displayName="Misery Ambient AI Zone"; 
		icon="\z\misery\addons\misery_framework\Scripts\Survival\data\Group.paa";
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

	class Misery_Ambient_AI: Module_F
	{
		scope=2;
		displayName="Misery Ambient AI"; 
		icon="\z\misery\addons\misery_framework\Scripts\Survival\data\AK.paa";
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

	class Misery_AI_Settings: Module_F
	{
		scope=2;
		displayName="Misery (AI) Settings";
		icon="\z\misery\addons\misery_framework\Scripts\Survival\data\Group.paa";
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
	
	class Misery_ArtifactSpawner: Module_F
	{
		scope=2;
		displayName="Misery (Artifact Spawner)";
		icon="\z\misery\addons\misery_framework\Scripts\Survival\data\Artifacticon.paa";
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
		icon="\z\misery\addons\misery_framework\Scripts\Survival\data\Artifacticon.paa";
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

		class Misery_POI: Module_F
	{
		scope=2;
		displayName="Misery (POI)";
		icon="\z\misery\addons\misery_framework\Scripts\Survival\data\POI.paa";
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
		icon="\z\misery\addons\misery_framework\Scripts\Survival\data\POI.paa";
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

	// class Misery_RadioSettings: Module_F
	// {
	// 	scope=2;
	// 	displayName="Radio Broadcaster (Settings)";
	// 	icon="\z\misery\addons\misery_framework\Scripts\Survival\data\radio.paa";
	// 	category="Misery_faction";
	// 	function="Misery_fnc_ModuleRadioSettings";
	// 	functionPriority=1;
	// 	isGlobal=0;
	// 	isTriggerActivated=0;
	// 	isDisposable=0;
	// 	class Attributes: AttributesBase
	// 	{
	// 		class Misery_Radiosoundfilearray : Edit
  	// 		{
	// 			property="Misery_Radiosoundfilearray";
	// 			displayName="Radio Sound file list";
	// 			tooltip="File path to each sound you wish to broadcast to radios (NOTE: These sounds must be defined either as a mod sound, or in the description.ext file *Array format* Must use qoutes, and commas! Don't use []'s)";
	// 			defaultValue="mysounds\audiofile1.ogg";
	// 			typeName="STRING";
	// 		};
	// 		class Misery_Radiosoundclassarray : Edit
  	// 		{
	// 			property="Misery_Radiosoundclassarray";
	// 			displayName="Radio Sound class list";
	// 			tooltip="Classname of each sound you wish to broadcast to portable radios (*Array format* Must use qoutes, and commas! Don't use []'s)";
	// 			defaultValue="mysound";
	// 			typeName="STRING";
	// 		};
	// 		class Misery_Radioobjectarray : Edit
  	// 		{
	// 			property="Misery_Radioobjectarray";
	// 			displayName="Radio Object list";
	// 			tooltip="Classnames of each MAP Object you want to be simulated as a Radio (NOTE: *Array format* Must use qoutes, and commas! Don't use []'s)";
	// 			defaultValue="";
	// 			typeName="STRING";
	// 		};
	// 		class Misery_Radiosoundmaintimer: Edit
  	// 		{
	// 			property="Misery_Radiosoundmaintimer";
	// 			displayName="Radio loop timer";
	// 			tooltip="Timer for radio cycle loop (This value should reflect the longest sound you have playing, to avoid sounds duping)";
	// 			typeName="NUMBER";
	// 			defaultValue="60";
	// 		};
	// 		class ModuleDescription: ModuleDescription{};
	// 	};
	// 	class ModuleDescription: ModuleDescription
	// 	{
	// 		description[]=
	// 		{
	// 			"This module defines the sounds / songs you wish for a radio to play",
	// 			"This module activates a GLOBALLY active loop dedicated on the server that broadcasts audio samples to Map objects as well as players if they possess a radio",
	// 			"*Radio Sound file list* inputs MUST be a direct file path & not a classname; you must directly send the audio sources to the module!",
	// 			"*Radio Sound class list* inputs MUST be a classname; this insures handheld radios recieve a proper soundclass",
	// 			"NOTE: Make sure both your soundfile paths and classnames are matching arrays; for example select 0 - would return a classname sound that matches the file sound... This insures the same audio sample is played!",
	// 			"Radio map objects that are defined will be synced to players portable radios each loop cycle...",
	// 			"Only one module of this type may be placed inside the editor"
	// 		};
	// 		position=0;
	// 		duplicate=1;
	// 		positionEnabled="Can't change this text?";
	// 	};
	// };

};// Cfg vehicles

class Cfgsounds
    {
        sounds[] = {};

    //__________________________	Ambiance	__________________________

    	class Ambiance_day_1{name = "Ambiance_day_1";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ambiance\Ambiance_day_1.ogg", 1.0};titles[] = {};};
    	class Ambiance_night_1{name = "Ambiance_night_1";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ambiance\Ambiance_night_1.ogg", 1.0};titles[] = {};};
		class DTAmbience1{name = "DTAmbience1";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ambiance\DTAmbience1.ogg", 1.0};titles[] = {};};
		class DTAmbience2{name = "DTAmbience2";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ambiance\DTAmbience2.ogg", 1.0};titles[] = {};};
		class DTAmbience3{name = "DTAmbience3";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ambiance\DTAmbience3.ogg", 1.0};titles[] = {};};
		class DTAmbience4{name = "DTAmbience4";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ambiance\DTAmbience4.ogg", 1.0};titles[] = {};};
		class DTAmbience5{name = "DTAmbience5";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ambiance\DTAmbience5.ogg", 1.0};titles[] = {};};
		class NTAmbience1{name = "NTAmbience1";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ambiance\NTAmbience1.ogg", 1.0};titles[] = {};};
		class NTAmbience2{name = "NTAmbience2";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ambiance\NTAmbience2.ogg", 1.0};titles[] = {};};
		class NTAmbience3{name = "NTAmbience3";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ambiance\NTAmbience3.ogg", 1.0};titles[] = {};};
		class NTAmbience4{name = "NTAmbience4";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ambiance\NTAmbience4.ogg", 1.0};titles[] = {};};
		class NTAmbience5{name = "NTAmbience5";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ambiance\NTAmbience5.ogg", 1.0};titles[] = {};};
		class whisper_day{name = "whisper_day";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ambiance\whisper_day.ogg", 1.0};titles[] = {};};
		class whisper_night{name = "whisper_night";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ambiance\whisper_night.ogg", 1.0};titles[] = {};};
		class WanderingSoul{name = "WanderingSoul";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ambiance\WanderingSoul.ogg", 1.0};titles[] = {};};

		//__________________________	Cave	Ambiance	__________________________

		class Cave{name = "Cave";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Cave\Cave.ogg", 1.0};titles[] = {};};
		class Cave01{name = "Cave01";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Cave\Cave01.ogg", 1.0};titles[] = {};};
		class Cave02{name = "Cave02";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Cave\Cave02.ogg", 1.0};titles[] = {};};
		class Cave03{name = "Cave03";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Cave\Cave03.ogg", 1.0};titles[] = {};};
		class Cave04{name = "Cave04";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Cave\Cave04.ogg", 1.0};titles[] = {};};
		class Cave05{name = "Cave05";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Cave\Cave05.ogg", 1.0};titles[] = {};};
		class Cave06{name = "Cave06";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Cave\Cave06.ogg", 1.0};titles[] = {};};
		class Cave07{name = "Cave07";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Cave\Cave07.ogg", 1.0};titles[] = {};};
		class Cave08{name = "Cave08";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Cave\Cave08.ogg", 1.0};titles[] = {};};

		//__________________________	Items 	__________________________
		class CaffetinBoxOpen{name = "CaffetinBoxOpen";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\inventory\Items\CaffetinBoxOpen.ogg", 1.0};titles[] = {};};
		class CrinklingPlastic{name = "CrinklingPlastic";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\inventory\Items\CrinklingPlastic.ogg", 1.0};titles[] = {};};
		// class geiger0{name = "geiger0";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\inventory\Items\Geiger1.ogg",  1.0};titles[] = {};};
		// class geiger1{name = "geiger1";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\inventory\Items\Geiger2.ogg",  1.0};titles[] = {};};
		// class geiger2{name = "geiger2";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\inventory\Items\Geiger3.ogg",  1.0};titles[] = {};};
		// class geiger3{name = "geiger3";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\inventory\Items\Geiger4.ogg",  1.0};titles[] = {};};
		class PillBottleOpen{name = "PillBottleOpen";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\inventory\Items\PillBottleOpen.ogg", 1.0};titles[] = {};};
		//class bagopen{name = "bagopen";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\inventory\UnZipping.ogg",  1, 800};titles[]={};};
		//class bagclose{name = "bagclose";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\inventory\Zipping.ogg",  1, 800};titles[]={};};
		class bagopen{name = "bagopen";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\inventory\in_open.ogg",  1, 800};titles[]={};};
		class bagclose{name = "bagclose";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\inventory\in_close.ogg",  1, 800};titles[]={};};
		class pickup{name = "pickup";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\inventory\pickup.ogg",  1, 800};titles[]={};};
		class drop{name = "drop";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\inventory\drop4.ogg", 1, 800};titles[]={};};
		class Sniff01{name = "Sniff01";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\inventory\Items\Sniff01.ogg", 1, 800};titles[]={};};
		class WoodChop01 {name = "WoodChop01";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\inventory\Items\WoodChop01.ogg", 1, 800};titles[]={};};
		class Chain1 {name = "Chain1";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\inventory\Items\Chain1.ogg", 1, 800};titles[]={};};
		class Chain2 {name = "Chain2";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\inventory\Items\Chain2.ogg", 1, 800};titles[]={};};
		class Chain3 {name = "Chain3";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\inventory\Items\Chain3.ogg", 1, 800};titles[]={};};
		class Chainsplit {name = "Chainsplit";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\inventory\Items\Chainsplit.ogg", 1, 800};titles[]={};};
		class ElectricSaw {name = "ElectricSaw";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\inventory\Items\ElectricSaw.ogg", 1, 800};titles[]={};};
		class HammerSound {name = "HammerSound";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\inventory\Items\HammerSound.ogg", 1, 800};titles[]={};};
		class SHammerWOOD {name = "SHammerWOOD";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\inventory\Items\SHammerWOOD.ogg", 1, 800};titles[]={};};

		//__________________________	Rumbles __________________________
		class Rumble1{name = "Rumble1";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Rumbles\Rumble1.ogg", 1.0};titles[] = {};};


		//__________________________	Immersion  __________________________
		class GatheringFirewood{name = "GatheringFirewood";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\GatheringFirewood.ogg", 1.0};titles[] = {};};
		class Cauterizing{name = "Cauterizing";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\Cauterizing.ogg", 1.0};titles[] = {};};
		class GasMask_Breathing{name = "GasMask_Breathing";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\GasMask_Breathing.ogg", 1.0};titles[] = {};};
    	class ColdShiver{name = "ColdShiver";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\sickness\ColdShiver.ogg", 1.0};titles[] = {};};
    	class Coughing{name = "Coughing";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\sickness\Coughing.ogg", 1.0};titles[] = {};};
		class coughMask1{name = "sneezeMask1";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\sickness\coughMask1.ogg", 1.0};titles[] = {};};
		class coughMask2{name = "sneezeMask2";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\sickness\coughMask2.ogg", 1.0};titles[] = {};};
		class coughMask3{name = "sneezeMask3";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\sickness\coughMask3.ogg", 1.0};titles[] = {};};
		class MaskCough01{name = "MaskCough01";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\sickness\MaskCough01.ogg", 1.0};titles[] = {};};
		class MaskCough02{name = "MaskCough02";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\sickness\MaskCough02.ogg", 1.0};titles[] = {};};
		class MaskCough03{name = "MaskCough03";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\sickness\MaskCough03.ogg", 1.0};titles[] = {};};
		class MaskCough04{name = "MaskCough04";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\sickness\MaskCough04.ogg", 1.0};titles[] = {};};
		class MaskCough05{name = "MaskCough05";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\sickness\MaskCough05.ogg", 1.0};titles[] = {};};
		class StomachGrowl{name = "StomachGrowl";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\sickness\StomachGrowl.ogg", 1.0};titles[] = {};};
		class Cough{name = "Cough";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\sickness\Cough.ogg", 1.0};titles[] = {};};
		class CoughMuffled{name = "CoughMuffled";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\sickness\CoughMuffled.ogg", 1.0};titles[] = {};};
    	class GasPump{name = "GasPump";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\GasPump.ogg", 1.0};titles[] = {};};
		class GasPump30{name = "GasPump30";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\GasPump30.ogg", 1.0};titles[] = {};};
    	class Sneeze{name = "Sneeze";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\sickness\Sneeze.ogg", 1.0};titles[] = {};};
		class Choking{name = "Choking";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\zones\Choking.ogg", 1, 800};titles[]={};};
		class DryGrass{name = "DryGrass";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\DryGrass.ogg", 1.0};titles[] = {};};
		class Shower{name = "Shower";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\Shower.ogg", 1.0};titles[] = {};};
		class SawMill2{name = "SawMill2";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\SawMill2.ogg", 1.0};titles[] = {};};
		class MeatRoasted{name = "MeatRoasted";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\MeatRoasted.ogg", 1.0};titles[] = {};};
		class WaterBoiling{name = "WaterBoiling";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\WaterBoiling.ogg", 1.0};titles[] = {};};
		class Lighter{name = "Lighter";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\Lighter.ogg", 1.0};titles[] = {};};
		class Match{name = "Match";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\Match.ogg", 1.0};titles[] = {};};
		class Lightersmoking{name = "Lightersmoking";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\Lightersmoking.ogg",  1.0};titles[] = {};};
		class Matchsmoking{name = "Matchsmoking";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\Matchsmoking.ogg",  1.0};titles[] = {};};
		class StaticRADIO{name = "StaticRADIO";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\StaticBASIC.ogg", 1.0};titles[] = {};};
		class StaticBASIC{name = "StaticBASIC";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\StaticBASIC.ogg", 1.0};titles[] = {};};
		class StaticWEIRD1{name = "StaticWEIRD1";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\StaticWEIRD1.ogg", 1.0};titles[] = {};};
		class StaticWEIRD2{name = "StaticWEIRD2";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\StaticWEIRD2.ogg", 1.0};titles[] = {};};
		class StaticWEIRD3{name = "StaticWEIRD3";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\StaticWEIRD3.ogg", 1.0};titles[] = {};};
		class StaticWEIRD4{name = "StaticWEIRD4";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\StaticWEIRD4.ogg", 1.0};titles[] = {};};
		class StaticWEIRD5{name = "StaticWEIRD5";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\StaticWEIRD5.ogg", 1.0};titles[] = {};};
		class StaticWEIRD6{name = "StaticWEIRD6";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\StaticWEIRD6.ogg", 1.0};titles[] = {};};
		class StaticWEIRD7{name = "StaticWEIRD7";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\StaticWEIRD7.ogg", 1.0};titles[] = {};};
		class StaticWEIRD8{name = "StaticWEIRD8";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\StaticWEIRD8.ogg", 1.0};titles[] = {};};
		class StaticWEIRD9{name = "StaticWEIRD9";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\StaticWEIRD9.ogg", 1.0};titles[] = {};};
		class StaticWEIRD10{name = "StaticWEIRD10";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\StaticWEIRD10.ogg", 1.0};titles[] = {};};
		class 25m{name = "25m";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\25m.ogg", 1.0};titles[] = {};};
		class 50m{name = "50m";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\50m.ogg", 1.0};titles[] = {};};
		class 150m{name = "150m";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\150m.ogg", 1.0};titles[] = {};};
		class 250m{name = "250m";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\250m.ogg", 1.0};titles[] = {};};
		class 350m{name = "350m";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\350m.ogg", 1.0};titles[] = {};};
		class 500m{name = "500m";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\500m.ogg", 1.0};titles[] = {};};
		class ArtifactSOUND{name = "ArtifactSOUND";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\immersion\ArtifactSOUND.ogg", 1.0};titles[] = {};};

		//__________________________	Contamination Areas __________________________
		class SubmergedShort{name = "SubmergedShort";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\zones\SubmergedShort.ogg", 1, 800};titles[]={};};
		class Green_Mountain_chatter{name = "Green_Mountain_chatter";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Greenmountain\Green_Mountain_chatter.ogg", 1, 800};titles[]={};};
		class Green_Mountain_static{name = "Green_Mountain_static";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Greenmountain\Green_Mountain_static.ogg", 1, 800};titles[]={};};
		class Green_Mountain_beep{name = "Green_Mountain_beep";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Greenmountain\Green_Mountain_beep.ogg", 1, 800};titles[]={};};
		class BlowoutWarning{name = "BlowoutWarning";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Greenmountain\BlowoutWarning.ogg", 1, 800};titles[]={};};

	//__________________________	Generators __________________________
		class 100_KVA_Running{name = "100_KVA_Running";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\generator\100_KVA_Running.ogg", 1, 800};titles[]={};};
		class 100_KVA_Startup{name = "100_KVA_Startup";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\generator\100_KVA_Startup.ogg", 1, 800};titles[]={};};
		class 100_KVA_Shutdown{name = "100_KVA_Shutdown";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\generator\100_KVA_Shutdown.ogg", 1, 800};titles[]={};};
		class dieselgeneratorrunning{name = "diesel-generator_running";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\generator\diesel-generator_running.ogg", 1, 800};titles[]={};};
		class dieselgeneratorstart{name = "diesel-generator_start";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\generator\diesel-generator_start.ogg", 1, 800};titles[]={};};
		class dieselgeneratorstop{name = "diesel-generator_stop";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\generator\diesel-generator_stop.ogg", 1, 800};titles[]={};};
		class petorlgeneratorrunning{name = "petorl-generator_running";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\generator\petorl-generator_running.ogg", 1, 800};titles[]={};};
		class petorlgeneratorstart{name = "petorl-generator_start";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\generator\petorl-generator_start.ogg", 1, 800};titles[]={};};
		class petrolgeneratorstop{name = "petrol-generator_stop";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\generator\petrol-generator_stop.ogg", 1, 800};titles[]={};};

	//__________________________	Monsters __________________________
		class Brain_Scorcher2{name = "Brain_Scorcher2";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\NWAF\Brain_Scorcher2.ogg", 1, 800};titles[]={};};
		class Distant_Scream1{name = "Distant_Scream1";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Monster\Distant_Scream1.ogg", 1, 800};titles[]={};};
		class Distant_Scream2{name = "Distant_Scream2";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Monster\Distant_Scream2.ogg", 1, 800};titles[]={};};
		class Distant_Scream3{name = "Distant_Scream3";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Monster\Distant_Scream3.ogg", 1, 800};titles[]={};};
		class Distant_Scream4{name = "Distant_Scream4";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Monster\Distant_Scream4.ogg", 1, 800};titles[]={};};
		class Moan1{name = "Moan1";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Monster\Moan1.ogg", 1, 800};titles[]={};};
		class Monster_call{name = "Monster_call";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Monster\Monster_call.ogg", 1, 800};titles[]={};};
		class Monster_distant{name = "Monster_distant";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Monster\Monster_distant.ogg", 1, 800};titles[]={};};
		class Monster_scream1{name = "Monster_scream1";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Monster\Monster_scream1.ogg", 1, 800};titles[]={};};
		class Distant_ghost1{name = "Distant_ghost1";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Monster\Distant_ghost1.ogg", 1, 800};titles[]={};};
		class Distant_Hellspawn{name = "Distant_Hellspawn";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Monster\Distant_Hellspawn.ogg", 1, 800};titles[]={};};

		//__________________________EAS broadcast __________________________
		class EASPhantoms{name = "EASPhantoms";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\eas\EASPhantoms.ogg", 1, 800};titles[]={};};

		//__________________________Radio __________________________
		class Radio{name = "Radio";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\radio\Radio.ogg", 1, 800};titles[]={};};
		class EAS{name = "EAS";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\radio\EAS.ogg", 1, 800};titles[]={};};
		class Song1{name = "Song1";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\radio\Song1.ogg", 1, 800};titles[]={};};
		class Song2{name = "Song2";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\radio\Song2.ogg", 1, 800};titles[]={};};
		class Song3{name = "Song3";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\radio\Song3.ogg", 1, 800};titles[]={};};

		//__________________________GFSkin __________________________
		class Skinning_1{name = "Skinning_1";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\z\misery\addons\misery_frameworkSkin\Skinning_1.ogg", 1, 800};titles[]={};};
		class Skinning_2{name = "Skinning_2";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\z\misery\addons\misery_frameworkSkin\Skinning_2.ogg", 1, 800};titles[]={};};
		class Skinning_3{name = "Skinning_3";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\z\misery\addons\misery_frameworkSkin\Skinning_3.ogg", 1, 800};titles[]={};};
		class Cut1{name = "Cut1";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\z\misery\addons\misery_frameworkSkin\RUsaw\Cut1.ogg", 1, 800};titles[]={};};
		class Cut2{name = "Cut2";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\z\misery\addons\misery_frameworkSkin\RUsaw\Cut2.ogg", 1, 800};titles[]={};};
		class Cut3{name = "Cut3";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\z\misery\addons\misery_frameworkSkin\RUsaw\Cut3.ogg", 1, 800};titles[]={};};
		class BoneSaw{name = "BoneSaw";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\z\misery\addons\misery_frameworkSkin\RUsaw\BoneSaw.ogg", 1, 800};titles[]={};};

		//__________________________fire __________________________
		class ACE_BigFire{name = "ACE_BigFire";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\fire\ACE_BigFire.ogg", 1, 800};titles[]={};};

		//__________________________Trauma __________________________
		class Stage1{name = "Stage1";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Trauma\Stage1.ogg", 1, 800};titles[]={};};
		class Spooky3_6{name = "Spooky3_6";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Trauma\Spooky3_6.ogg", 1, 800};titles[]={};};
		class Spooky3_5{name = "Spooky3_5";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Trauma\Spooky3_5.ogg", 1, 800};titles[]={};};
		class Spooky3_4{name = "Spooky3_4";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Trauma\Spooky3_4.ogg", 1, 800};titles[]={};};
		class Spooky3_3{name = "Spooky3_3";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Trauma\Spooky3_3.ogg", 1, 800};titles[]={};};
		class Spooky3_2{name = "Spooky3_2";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Trauma\Spooky3_2.ogg", 1, 800};titles[]={};};
		class Spooky3_1{name = "Spooky3_1";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Trauma\Spooky3_1.ogg", 1, 800};titles[]={};};
		class Spooky3{name = "Spooky3";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Trauma\Spooky3.ogg", 1, 800};titles[]={};};
		class Spooky2_Copy{name = "Spooky2_Copy";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Trauma\Spooky2_Copy.ogg", 1, 800};titles[]={};};
		class Spooky2_4{name = "Spooky2_4";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Trauma\Spooky2_4.ogg", 1, 800};titles[]={};};
		class Spooky2_3{name = "Spooky2_3";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Trauma\Spooky2_3.ogg", 1, 800};titles[]={};};
		class Spooky2_2{name = "Spooky2_2";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Trauma\Spooky2_2.ogg", 1, 800};titles[]={};};
		class Spooky2_1{name = "Spooky2_1";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Trauma\Spooky2_1.ogg", 1, 800};titles[]={};};
		class Spooky2{name = "Spooky2";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Trauma\Spooky2.ogg", 1, 800};titles[]={};};
		class Spooky1_Copy{name = "Spooky1_Copy";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Trauma\Spooky1_Copy.ogg", 1, 800};titles[]={};};
		class Spooky1_3{name = "Spooky1_3";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Trauma\Spooky1_3.ogg", 1, 800};titles[]={};};
		class Spooky1_2{name = "Spooky1_2";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Trauma\Spooky1_2.ogg", 1, 800};titles[]={};};

		//__________________________Ghost entity __________________________
		class drone1{name = "drone1";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\drone1.ogg", 1, 800};titles[]={};};
		class drone2{name = "drone2";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\drone2.ogg", 1, 800};titles[]={};};
		class drone3{name = "drone3";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\drone3.ogg", 1, 800};titles[]={};};
		class Ghost1{name = "Ghost1";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\Ghost1.ogg", 1, 800};titles[]={};};
		class Ghost2{name = "Ghost2";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\Ghost2.ogg", 1, 800};titles[]={};};
		class Ghost3{name = "Ghost3";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\Ghost3.ogg", 1, 800};titles[]={};};
		class Ghost4{name = "Ghost4";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\Ghost4.ogg", 1, 800};titles[]={};};
		class GhostAtmo{name = "GhostAtmo";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\GhostAtmo.ogg", 1, 800};titles[]={};};
		class GhostHowls{name = "GhostHowls";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\GhostHowls.ogg", 1, 800};titles[]={};};
		class GhostWhisp1{name = "GhostWhisp1";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\GhostWhisp1.ogg", 1, 800};titles[]={};};
		class GhostWhisp2{name = "GhostWhisp2";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\GhostWhisp2.ogg", 1, 800};titles[]={};};
		class GhostWhisp3{name = "GhostWhisp3";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\GhostWhisp3.ogg", 1, 800};titles[]={};};
		class GhostWhisp4{name = "GhostWhisp4";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\GhostWhisp4.ogg", 1, 800};titles[]={};};
		class GhostWhisp5{name = "GhostWhisp5";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\GhostWhisp5.ogg", 1, 800};titles[]={};};
		class GhostWhisp6{name = "GhostWhisp6";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\GhostWhisp6.ogg", 1, 800};titles[]={};};
		class GhostWhisp7{name = "GhostWhisp7";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\GhostWhisp7.ogg", 1, 800};titles[]={};};
		class GhostWhisp8{name = "GhostWhisp8";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\GhostWhisp8.ogg", 1, 800};titles[]={};};
		class GhostWhisp9{name = "GhostWhisp9";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\GhostWhisp9.ogg", 1, 800};titles[]={};};
		class GhostWhisp10{name = "GhostWhisp10";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\GhostWhisp10.ogg", 1, 800};titles[]={};};
		class GhostWhispChild{name = "GhostWhispChild";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\GhostWhispChild.ogg", 1, 800};titles[]={};};
		class Hell{name = "Hell";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\Hell.ogg", 1, 800};titles[]={};};
		class Spirits{name = "Spirits";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\Spirits.ogg", 1, 800};titles[]={};};
		class SnatcherDeath{name = "SnatcherDeath";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\SnatcherDeath.ogg", 1, 800};titles[]={};};
		class Rustle3{name = "Rustle3";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\Rustle3.ogg", 1, 800};titles[]={};};
		class Rustle2{name = "Rustle2";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\Rustle2.ogg", 1, 800};titles[]={};};
		class Rustle1{name = "Rustle1";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\Rustle1.ogg", 1, 800};titles[]={};};
		class Clicking2{name = "Clicking2";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\Clicking2.ogg", 1, 800};titles[]={};}; //Boosted audio for phantoms 
		class Clicking1{name = "Clicking1";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\Clicking1.ogg", 1, 800};titles[]={};}; //Boosted audio for phantoms
		class attack2{name = "attack2";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\attack2.ogg", 1, 800};titles[]={};};
		class attack1{name = "attack1";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\attack1.ogg", 1, 800};titles[]={};};
		class AttackCar1{name = "AttackCar1";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\AttackCar1.ogg", 1, 800};titles[]={};};
		class AttackCar2{name = "AttackCar2";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\AttackCar2.ogg", 1, 800};titles[]={};};

		//__________________________Controller audio entity __________________________
		class controller_attack_0{name = "controller_attack_0";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\controller_attack_0.ogg", 1, 800};titles[]={};};
		class controller_attack_1{name = "controller_attack_1";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\controller_attack_1.ogg", 1, 800};titles[]={};};
		class controller_attack_2{name = "controller_attack_2";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\controller_attack_2.ogg", 1, 800};titles[]={};};
		class talk1{name = "talk1";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\talk1.ogg", 1, 800};titles[]={};};
		class Talk2{name = "Talk2";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Ghost\Talk2.ogg", 1, 800};titles[]={};};

		//__________________________Jaroslav Forest __________________________
		class behindyou{name = "behindyou";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Jforest\behindyou.ogg", 1, 800};titles[]={};};
		class carefulnow{name = "carefulnow";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Jforest\carefulnow.ogg", 1, 800};titles[]={};};
		class donotbelong{name = "donotbelong";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Jforest\donotbelong.ogg", 1, 800};titles[]={};};
		class Hello{name = "Hello";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Jforest\Hello.ogg", 1, 800};titles[]={};};
		class helpme{name = "helpme";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Jforest\helpme.ogg", 1, 800};titles[]={};};
		class icanseeyou{name = "icanseeyou";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Jforest\icanseeyou.ogg", 1, 800};titles[]={};};
		class illkillyou{name = "illkillyou";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Jforest\illkillyou.ogg", 1, 800};titles[]={};};
		class iwillkillyou{name = "iwillkillyou";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Jforest\iwillkillyou.ogg", 1, 800};titles[]={};};
		class run{name = "run";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Jforest\run.ogg", 1, 800};titles[]={};};
		class running{name = "running";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Jforest\running.ogg", 1, 800};titles[]={};};
		class runninghello{name = "runninghello";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Jforest\runninghello.ogg", 1, 800};titles[]={};};
		class runnow{name = "runnow";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Jforest\runnow.ogg", 1, 800};titles[]={};};
		class runnow2{name = "runnow2";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Jforest\runnow2.ogg", 1, 800};titles[]={};};
		class walking{name = "walking";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Jforest\walking.ogg", 1, 800};titles[]={};};

		//__________________________Geiger enable __________________________
		class GeigerOFF{name = "GeigerOFF";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Geigerenable\GeigerOFF.ogg", 1, 800};titles[]={};};
		class GeigerON{name = "GeigerON";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Geigerenable\GeigerON.ogg", 1, 800};titles[]={};};

		//__________________________Mining __________________________
		class Coal{name = "Coal";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Mining\Coal.ogg", 1, 800};titles[]={};};
		class FurnaceFire{name = "FurnaceFire";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Mining\FurnaceFire.ogg", 1, 800};titles[]={};};
		class Gold{name = "Gold";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Mining\Gold.ogg", 1, 800};titles[]={};};
		class Iron{name = "Iron";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Mining\Iron.ogg", 1, 800};titles[]={};};
		class Stone{name = "Stone";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Mining\Stone.ogg", 1, 800};titles[]={};};
		class AnvilHammer{name = "AnvilHammer";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Mining\AnvilHammer.ogg", 1, 800};titles[]={};};
		class MetalSmelt{name = "MetalSmelt";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Mining\MetalSmelt.ogg", 1, 800};titles[]={};};
		class Pickaxe{name = "Pickaxe";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Mining\Pickaxe.ogg", 1, 800};titles[]={};};
		class Pickaxe60{name = "Pickaxe60";sound[] = {"\z\misery\addons\misery_framework\audio\sounds\Mining\Pickaxe60.ogg", 1, 800};titles[]={};};
}; 

class CfgMusic
{
tracks[] = {};
class CrimsonSunset{name = "CrimsonSunset";sound[] = {"\z\misery\addons\misery_framework\audio\music\CrimsonSunset.ogg", 1.0};titles[] = {0,""};};
class ExtinctionEntity{name = "ExtinctionEntity";sound[] = {"\z\misery\addons\misery_framework\audio\music\ExtinctionEntity.ogg", 1.0};titles[] = {0,""};};
class NotAlone{name = "NotAlone";sound[] = {"\z\misery\addons\misery_framework\audio\music\NotAlone.ogg", 1.0};titles[] = {0,""};};
class SacredForest{name = "SacredForest";sound[] = {"\z\misery\addons\misery_framework\audio\music\SacredForest.ogg", 1.0};titles[] = {0,""};};
class Wendigo{name = "Wendigo";sound[] = {"\z\misery\addons\misery_framework\audio\music\Wendigo.ogg", 1.0};titles[] = {0,""};};
class TheBurningRain{name = "TheBurningRain";sound[] = {"\z\misery\addons\misery_framework\audio\music\TheBurningRain.ogg", 1.0};titles[] = {0,""};};
class SullenSkies{name = "SullenSkies";sound[] = {"\z\misery\addons\misery_framework\audio\music\SullenSkies.ogg", 1.0};titles[] = {0,""};};
class Tectonic{name = "Tectonic";sound[] = {"\z\misery\addons\misery_framework\audio\music\Tectonic.ogg", 1.0};titles[] = {0,""};};
class Atmospheric{name = "Atmospheric";sound[] = {"\z\misery\addons\misery_framework\audio\music\Atmospheric.ogg", 1.0};titles[] = {0,""};};
class Limbo{name = "Limbo";sound[] = {"\z\misery\addons\misery_framework\audio\music\Limbo.ogg", 1.0};titles[] = {0,""};};
class TheBeginning{name = "TheBeginning";sound[] = {"\z\misery\addons\misery_framework\audio\music\TheBeginning.ogg", 1.0};titles[] = {0,""};};
class Elysium{name = "Elysium";sound[] = {"\z\misery\addons\misery_framework\audio\music\Elysium.ogg", 1.0};titles[] = {0,""};};
class EternalOhm{name = "EternalOhm";sound[] = {"\z\misery\addons\misery_framework\audio\music\EternalOhm.ogg", 1.0};titles[] = {0,""};};
class MyColdBones{name = "MyColdBones";sound[] = {"\z\misery\addons\misery_framework\audio\music\MyColdBones.ogg", 1.0};titles[] = {0,""};};
class OldWorld{name = "OldWorld";sound[] = {"\z\misery\addons\misery_framework\audio\music\OldWorld.ogg", 1.0};titles[] = {0,""};};
class RazorBurn{name = "RazorBurn";sound[] = {"\z\misery\addons\misery_framework\audio\music\RazorBurn.ogg", 1.0};titles[] = {0,""};};
class Ethereal{name = "Ethereal";sound[] = {"\z\misery\addons\misery_framework\audio\music\Ethereal.ogg", 1.0};titles[] = {0,""};};
class PassingThroughTheLight{name = "PassingThroughTheLight";sound[] = {"\z\misery\addons\misery_framework\audio\music\PassingThroughTheLight.ogg", 1.0};titles[] = {0,""};};
class PlaguedLands{name = "PlaguedLands";sound[] = {"\z\misery\addons\misery_framework\audio\music\PlaguedLands.ogg", 1.0};titles[] = {0,""};};
class Playground{name = "Playground";sound[] = {"\z\misery\addons\misery_framework\audio\music\Playground.ogg", 1.0};titles[] = {0,""};};
class Scars{name = "Scars";sound[] = {"\z\misery\addons\misery_framework\audio\music\Scars.ogg", 1.0};titles[] = {0,""};};
class TheySeeYou{name = "TheySeeYou";sound[] = {"\z\misery\addons\misery_framework\audio\music\TheySeeYou.ogg", 1.0};titles[] = {0,""};};
};

