
class CfgVehicles {
	class Logic {};
	class Item_Base_F;	// External class reference
	class House_F;	// External class reference

	class Misery_Object_Firewood : Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = "Firewood";
		author = "TenuredCLOUD";
		vehicleClass = "Misery_ObjectClass";
		
		mapSize = 0.25;
		

		class TransportItems {
			class Misery_Object_Firewood {
				name = "Misery_firewood";
				count = 1;
			};
		};
	};

	class Misery_Object_Woodenlog : Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = "Wooden log";
		author = "TenuredCLOUD";
		vehicleClass = "Misery_ObjectClass";
		
		mapSize = 0.25;
		

		class TransportItems {
			class Misery_Object_Woodenlog {
				name = "Misery_woodenlog";
				count = 1;
			};
		};
	};

	class Misery_Object_Collapsiblefishingrod : Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = "Collapsible fishing rod";
		author = "TenuredCLOUD";
		vehicleClass = "Misery_ObjectClass";
		
		mapSize = 0.25;
		

		class TransportItems {
			class Misery_Object_Collapsiblefishingrod {
				name = "Misery_fishingpole";
				count = 1;
			};
		};
	};

	class Misery_Object_2x4 : Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = "2x4";
		author = "TenuredCLOUD";
		vehicleClass = "Misery_ObjectClass";
		
		mapSize = 0.25;
		

		class TransportItems {
			class Misery_Object_2x4 {
				name = "Misery_2x4";
				count = 1;
			};
		};
	};

	class Misery_Object_2x8 : Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = "2x8";
		author = "TenuredCLOUD";
		vehicleClass = "Misery_ObjectClass";
		
		mapSize = 0.25;
		

		class TransportItems {
			class Misery_Object_2x8 {
				name = "Misery_2x8";
				count = 1;
			};
		};
	};

	class Misery_Object_woodpanel : Item_Base_F {
		scope = 2;
		scopeCurator = 2;
		displayName = "Woodpanel";
		author = "TenuredCLOUD";
		vehicleClass = "Misery_ObjectClass";
		
		mapSize = 0.25;
		

		class TransportItems {
			class Misery_Object_woodpanel {
				name = "Misery_woodpanel";
				count = 1;
			};
		};
	};

	///////////END OF VEHICLE OBJECTS "Transporters"//////////////////////

	class Misery_Forge : House_F {
		
		displayName = "$STR_MISERY_FORGE_DISPLAYNAME";
		textSingular = "Forge";
		destrType = "DestructNo";
		model = "\z\misery\addons\assets\data\models\forge.p3d";
		cost = 0;
		armor = 2000;
		author = "Model credits: RBG_illustrations - Reworked by TenuredCLOUD";
		vehicleClass = "Misery_ObjectClass";
		numberOfDoors = 0;
		scope = 2;
		scopeCurator = 2;
		mapSize = 3;
		placement = "vertical";
		hiddenSelections[] = {};
		hiddenSelectionsTextures[] = {};
		
		class AnimationSources {};
		
		class UserActions {};

	};

	class Misery_Anvil : House_F {
		displayName = "$STR_MISERY_ANVIL_DISPLAYNAME";
		textSingular = "Anvil";
		destrType = "DestructNo";
		model = "\z\misery\addons\assets\data\models\medievalanvil.p3d";
		
		cost = 0;
		armor = 3;
		author = "Model credits: Margot D. - Reworked by TenuredCLOUD";
		vehicleClass = "Misery_ObjectClass";
		numberOfDoors = 0;
		scope = 2;
		scopeCurator = 2;
		mapSize = 2;
		placement = "vertical";
		hiddenSelections[] = {};
		hiddenSelectionsTextures[] = {};
		
		class AnimationSources {};
		
		class UserActions {};
	};

	//REFUELING STRUCTURES:

	class Misery_JetFuelRU : House_F {
		
		displayName = "$STR_MISERY_JETFUELRU_DISPLAYNAME";
		textSingular = "Jet Fuel Station";
		destrType = "DestructNo";
		model = "\z\misery\addons\assets\data\models\twinjetfueltank.p3d";
		
		cost = 0;
		armor = 2000;
		author = "Model credits: Tanks LuddePudde - Fuel pump castleonsandYT - Reworked by TenuredCLOUD";
		vehicleClass = "Misery_ObjectClass";
		numberOfDoors = 0;
		scope = 2;
		scopeCurator = 2;
		mapSize = 3;
		placement = "vertical";
		hiddenSelections[] = {};
		hiddenSelectionsTextures[] = {};
		hiddenSelectionsMaterials[] = {"\z\misery\addons\assets\data\models\ui\Fueltanks.rvmat"};
		
		class AnimationSources {};
		
		class UserActions {};

	};

	//Generators:
	class Misery_100KVA_Gen : House_F {
		
		displayName = "$STR_MISERY_100KVAGEN_DISPLAYNAME";
		textSingular = "100KVA Generator";
		destrType = "DestructNo";
		model = "\z\misery\addons\assets\data\models\100KVA_Generator.p3d";
		cost = 0;
		armor = 2000;
		author = "Model credits: tasraven - Reworked by TenuredCLOUD";
		vehicleClass = "Misery_ObjectClass";
		numberOfDoors = 0;
		scope = 2;
		scopeCurator = 2;
		mapSize = 3;
		placement = "vertical";
		hiddenSelections[] = {};
		hiddenSelectionsTextures[] = {};
		
		class AnimationSources {};
		
		class UserActions {
		class Start_100KVA
			{
				displayName = "Start 100KVA Generator";
				displayNameDefault = "<img image='\a3\missions_f_oldman\data\img\holdactions\holdAction_talk_ca.paa'/>";
				priority = 10;
				radius = 1; // a too small radius might cause the action to not be visible
				position = "ScreenController01";
				showWindow = 0;
				hideOnUse = 1;
				onlyForPlayer = 0;
				shortcut = "";
				condition = "alive this && {this getVariable ['Misery_Gen_IsRunning', false] isEqualTo false}";
				statement = "[this] execVM '\z\misery\addons\framework\scripts\survival\functions\menus\Generator\Gen_RunningUserAct.sqf'";
			};
		class Shutdown_100KVA
			{
				displayName = "ShutDown 100KVA Generator";
				displayNameDefault = "<img image='\a3\missions_f_oldman\data\img\holdactions\holdAction_talk_ca.paa'/>";
				priority = 10;
				radius = 1; // a too small radius might cause the action to not be visible
				position = "ScreenController01";
				showWindow = 0;
				hideOnUse = 1;
				onlyForPlayer = 0;
				shortcut = "";
				condition = "alive this && {this getVariable ['Misery_Gen_IsRunning', false] isEqualTo true}";
				statement = "this setVariable ['Misery_Gen_IsRunning', false, true]";
			};
		class Refuel_100KVA
			{
				displayName = "Refuel 100KVA Generator";
				displayNameDefault = "<img image='\a3\missions_f_oldman\data\img\holdactions\holdAction_talk_ca.paa'/>";
				priority = 10;
				radius = 1; // a too small radius might cause the action to not be visible
				position = "ScreenController01";
				showWindow = 0;
				hideOnUse = 1;
				onlyForPlayer = 0;
				shortcut = "";
				condition = "alive this && {this getVariable ['Misery_Gen_IsRunning', false] isEqualTo false}";
				statement = "this setVariable ['Misery_Gen_IsRunning', false, true]";
			};
		class Status_100KVA
			{
				displayName = "Check 100KVA Generator Status";
				displayNameDefault = "<img image='\a3\missions_f_oldman\data\img\holdactions\holdAction_talk_ca.paa'/>";
				priority = 10;
				radius = 1; // a too small radius might cause the action to not be visible
				position = "ScreenController01";
				showWindow = 0;
				hideOnUse = 1;
				onlyForPlayer = 0;
				shortcut = "";
				condition = "alive this";
				statement = "player setVariable ['Misery_Current_Generator', this]; createDialog 'MiseryGenerator_GUI'";
			};
		};
	};

	class Misery_HeavilyUsedGen_Gas : House_F {
		
		displayName = "$STR_MISERY_HeavilyUsedGen_Gas_DISPLAYNAME";
		textSingular = "Heavily used Genrator - Petrol";
		destrType = "DestructNo";
		model = "\z\misery\addons\assets\data\models\Used_Gen_Gas.p3d";
		cost = 0;
		armor = 2000;
		author = "Model credits: DennisHNguyen - Reworked by TenuredCLOUD";
		vehicleClass = "Misery_ObjectClass";
		numberOfDoors = 0;
		scope = 2;
		scopeCurator = 2;
		mapSize = 3;
		placement = "vertical";
		hiddenSelections[] = {};
		hiddenSelectionsTextures[] = {};
		
		class AnimationSources {};
		
		class UserActions {
		class Start_UsedGen_Gas
			{
				displayName = "Start Generator";
				displayNameDefault = "<img image='\a3\missions_f_oldman\data\img\holdactions\holdAction_talk_ca.paa'/>";
				priority = 10;
				radius = 1; // a too small radius might cause the action to not be visible
				position = "Ignition01";
				showWindow = 0;
				hideOnUse = 1;
				onlyForPlayer = 0;
				shortcut = "";
				condition = "alive this && {this getVariable ['Misery_Gen_IsRunning', false] isEqualTo false}";
				statement = "[this] execVM '\z\misery\addons\framework\scripts\survival\functions\menus\Generator\Gen_RunningUserAct.sqf'";
			};
		class Shutdown_UsedGen_Gas
			{
				displayName = "ShutDown Generator";
				displayNameDefault = "<img image='\a3\missions_f_oldman\data\img\holdactions\holdAction_talk_ca.paa'/>";
				priority = 10;
				radius = 1; // a too small radius might cause the action to not be visible
				position = "Ignition01";
				showWindow = 0;
				hideOnUse = 1;
				onlyForPlayer = 0;
				shortcut = "";
				condition = "alive this && {this getVariable ['Misery_Gen_IsRunning', false] isEqualTo true}";
				statement = "this setVariable ['Misery_Gen_IsRunning', false, true]";
			};
		class Status_UsedGen_Gas
			{
				displayName = "Check Generator Status";
				displayNameDefault = "<img image='\a3\missions_f_oldman\data\img\holdactions\holdAction_talk_ca.paa'/>";
				priority = 10;
				radius = 1; // a too small radius might cause the action to not be visible
				position = "Ignition01";
				showWindow = 0;
				hideOnUse = 1;
				onlyForPlayer = 0;
				shortcut = "";
				condition = "alive this";
				statement = "player setVariable ['Misery_Current_Generator', this]; createDialog 'MiseryGenerator_GUI'";
			};
		class Refuel_UsedGen_Gas
			{
				displayName = "Refuel Generator";
				displayNameDefault = "<img image='\a3\missions_f_oldman\data\img\holdactions\holdAction_talk_ca.paa'/>";
				priority = 10;
				radius = 1; // a too small radius might cause the action to not be visible
				position = "FuelTank01";
				showWindow = 0;
				hideOnUse = 1;
				onlyForPlayer = 0;
				shortcut = "";
				condition = "alive this && {this getVariable ['Misery_Gen_IsRunning', false] isEqualTo false}";
				statement = "this setVariable ['Misery_Gen_IsRunning', false, true]";
			};
		};
	};

	class Misery_HeavilyUsedGen_Diesel : House_F {
		
		displayName = "$STR_MISERY_HeavilyUsedGen_Diesel_DISPLAYNAME";
		textSingular = "Heavily used Genrator - Diesel";
		destrType = "DestructNo";
		model = "\z\misery\addons\assets\data\models\Used_Gen_Diesel.p3d";
		cost = 0;
		armor = 2000;
		author = "Model credits: Daniel_Bakunin - Reworked by TenuredCLOUD";
		vehicleClass = "Misery_ObjectClass";
		numberOfDoors = 0;
		scope = 2;
		scopeCurator = 2;
		mapSize = 3;
		placement = "vertical";
		hiddenSelections[] = {};
		hiddenSelectionsTextures[] = {};
		
		class AnimationSources {};
		
		class UserActions {
		class Start_UsedGen_Diesel
			{
				displayName = "Start Generator";
				displayNameDefault = "<img image='\a3\missions_f_oldman\data\img\holdactions\holdAction_talk_ca.paa'/>";
				priority = 10;
				radius = 1; // a too small radius might cause the action to not be visible
				position = "Ignition01";
				showWindow = 0;
				hideOnUse = 1;
				onlyForPlayer = 0;
				shortcut = "";
				condition = "alive this && {this getVariable ['Misery_Gen_IsRunning', false] isEqualTo false}";
				statement = "[this] execVM '\z\misery\addons\framework\scripts\survival\functions\menus\Generator\Gen_RunningUserAct.sqf'";
			};
		class Shutdown_UsedGen_Diesel
			{
				displayName = "ShutDown Generator";
				displayNameDefault = "<img image='\a3\missions_f_oldman\data\img\holdactions\holdAction_talk_ca.paa'/>";
				priority = 10;
				radius = 1; // a too small radius might cause the action to not be visible
				position = "Ignition01";
				showWindow = 0;
				hideOnUse = 1;
				onlyForPlayer = 0;
				shortcut = "";
				condition = "alive this && {this getVariable ['Misery_Gen_IsRunning', false] isEqualTo true}";
				statement = "this setVariable ['Misery_Gen_IsRunning', false, true]";
			};
		class Status_UsedGen_Diesel
			{
				displayName = "Check Generator Status";
				displayNameDefault = "<img image='\a3\missions_f_oldman\data\img\holdactions\holdAction_talk_ca.paa'/>";
				priority = 10;
				radius = 1; // a too small radius might cause the action to not be visible
				position = "Ignition01";
				showWindow = 0;
				hideOnUse = 1;
				onlyForPlayer = 0;
				shortcut = "";
				condition = "alive this";
				statement = "player setVariable ['Misery_Current_Generator', this]; createDialog 'MiseryGenerator_GUI'";
			};
		class Refuel_UsedGen_Diesel
			{
				displayName = "Refuel Generator";
				displayNameDefault = "<img image='\a3\missions_f_oldman\data\img\holdactions\holdAction_talk_ca.paa'/>";
				priority = 10;
				radius = 1; // a too small radius might cause the action to not be visible
				position = "FuelTank01";
				showWindow = 0;
				hideOnUse = 1;
				onlyForPlayer = 0;
				shortcut = "";
				condition = "alive this && {this getVariable ['Misery_Gen_IsRunning', false] isEqualTo false}";
				statement = "this setVariable ['Misery_Gen_IsRunning', false, true]";
			};
		};
	};

///////////END OF BUILDINGS//////////////////////

}; //DO NOT DELETE End of config
