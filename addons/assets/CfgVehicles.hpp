class CfgVehicles {
    class Item_Base_F;
    class House_F;

    class CLASS(Object_Firewood): Item_Base_F {
        displayName = "Firewood";
        MACRO_ITEM_COMMON;

        MACRO_ADDITEM(CLASS(Object_Firewood),1);
    };
    class CLASS(Object_Woodenlog): Item_Base_F {
        displayName = "Wooden log";
        MACRO_ITEM_COMMON;

        MACRO_ADDITEM(CLASS(Object_Woodenlog),1);
    };
    class CLASS(Object_CollapsibleFishingRod): Item_Base_F {
        displayName = "Collapsible Fishing Rod";
        MACRO_ITEM_COMMON;

        MACRO_ADDITEM(CLASS(Object_CollapsibleFishingRod),1);
    };
    class CLASS(Object_2x4): Item_Base_F {
        displayName = "2x4";
        MACRO_ITEM_COMMON;

        MACRO_ADDITEM(CLASS(Object_2x4),1);
    };
    class CLASS(Object_2x8): Item_Base_F {
        displayName = "2x8";
        MACRO_ITEM_COMMON;

        MACRO_ADDITEM(CLASS(Object_2x8),1);
    };
    class CLASS(Object_Woodpanel): Item_Base_F {
        displayName = "Woodpanel";
        MACRO_ITEM_COMMON;

        MACRO_ADDITEM(CLASS(Object_Woodpanel),1);
    };

    class CLASS(Forge): House_F {
        armor = 2000;
        author = "Model credits: RBG_illustrations - Reworked by TenuredCLOUD";
        displayName = "$STR_MISERY_FORGE_DISPLAYNAME";
        MACRO_HOUSE_COMMON;
        mapSize = 3;
        model = QPATHTOF(data\models\forge.p3d);
        textSingular = "Forge";
    };
    class CLASS(Anvil): House_F {
        armor = 3;
        author = "Model credits: Margot D. - Reworked by TenuredCLOUD";
        displayName = "$STR_MISERY_ANVIL_DISPLAYNAME";
        MACRO_HOUSE_COMMON;
        mapSize = 2;
        model = QPATHTOF(data\models\medievalanvil.p3d);
        textSingular = "Anvil";
    };
    class CLASS(JetFuelRU): House_F {
        armor = 2000;
        author = "Model credits: Tanks LuddePudde - Fuel pump castleonsandYT - Reworked by TenuredCLOUD";
        displayName = "$STR_MISERY_JETFUELRU_DISPLAYNAME";
        hiddenSelectionsMaterials[] = {QPATHTOF(data\rvmats\fueltanks.rvmat)};
        MACRO_HOUSE_COMMON;
        mapSize = 3;
        model = QPATHTOF(data\models\twinjetfueltank.p3d);
        textSingular = "Jet Fuel Station";
    };
    class CLASS(100KVA_Gen): House_F {
        armor = 2000;
        author = "Model credits: tasraven - Reworked by TenuredCLOUD";
        displayName = "$STR_MISERY_100KVAGEN_DISPLAYNAME";
        MACRO_HOUSE_COMMON;
        mapSize = 3;
        model = QPATHTOF(data\models\100kva_generator.p3d);
        textSingular = "100KVA Generator";

        class UserActions {
            class Start_100KVA {
                condition = "alive this";
                displayName = "Use Generator";
                displayNameDefault = "<img image='\a3\missions_f_oldman\data\img\holdactions\holdAction_talk_ca.paa'/>";
                hideOnUse = 1;
                onlyForPlayer = 0;
                position = "ScreenController01";
                priority = 10;
                radius = 1;
                shortcut = "";
                showWindow = 0;
                statement = "[this] execVM '\z\misery\addons\framework\scripts\survival\functions\menus\Generator\Gen_Interact.sqf'";
            };
        };
    };
    class CLASS(HeavilyUsedGen_Gas): House_F {
        armor = 2000;
        author = "Model credits: DennisHNguyen - Reworked by TenuredCLOUD";
        displayName = "$STR_MISERY_HeavilyUsedGen_Gas_DISPLAYNAME";
        MACRO_HOUSE_COMMON;
        mapSize = 3;
        model = QPATHTOF(data\models\used_gen_gas.p3d);
        textSingular = "Heavily used Genrator - Petrol";

        class UserActions {
            class Start_UsedGen_Gas {
                condition = "alive this";
                displayName = "Use Generator";
                displayNameDefault = "<img image='\a3\missions_f_oldman\data\img\holdactions\holdAction_talk_ca.paa'/>";
                hideOnUse = 1;
                onlyForPlayer = 0;
                position = "Interact01";
                priority = 10;
                radius = 1;
                shortcut = "";
                showWindow = 0;
                statement = "[this] execVM '\z\misery\addons\framework\scripts\survival\functions\menus\Generator\Gen_Interact.sqf'";
            };
        };
    };
    class CLASS(HeavilyUsedGen_Diesel): House_F {
        armor = 2000;
        author = "Model credits: Daniel_Bakunin - Reworked by TenuredCLOUD";
        displayName = "$STR_MISERY_HeavilyUsedGen_Diesel_DISPLAYNAME";
        MACRO_HOUSE_COMMON;
        mapSize = 3;
        model = QPATHTOF(data\models\used_gen_diesel.p3d);
        textSingular = "Heavily used Generator - Diesel";

        class UserActions {
            class Start_UsedGen_Diesel {
                condition = "alive this";
                displayName = "Use Generator";
                displayNameDefault = "<img image='\a3\missions_f_oldman\data\img\holdactions\holdAction_talk_ca.paa'/>";
                hideOnUse = 1;
                onlyForPlayer = 0;
                position = "Interact01";
                priority = 10;
                radius = 1;
                shortcut = "";
                showWindow = 0;
                statement = "[this] execVM '\z\misery\addons\framework\scripts\survival\functions\menus\Generator\Gen_Interact.sqf'";
            };
        };
    };
};
