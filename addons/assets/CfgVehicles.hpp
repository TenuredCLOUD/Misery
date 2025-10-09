class CfgVehicles {
    class Item_Base_F;
    class House_F;
    class Thing;

    class CLASS(object_Firewood): Item_Base_F {
        displayName = "Firewood";
        MACRO_ITEM_COMMON;

        MACRO_ADDITEM(CLASS(Object_Firewood),1);
    };
    class CLASS(object_Woodenlog): Item_Base_F {
        displayName = "Wooden log";
        MACRO_ITEM_COMMON;

        MACRO_ADDITEM(CLASS(Object_Woodenlog),1);
    };
    class CLASS(object_CollapsibleFishingRod): Item_Base_F {
        displayName = "Collapsible Fishing Rod";
        MACRO_ITEM_COMMON;

        MACRO_ADDITEM(CLASS(Object_CollapsibleFishingRod),1);
    };
    class CLASS(object_2x4): Item_Base_F {
        displayName = "2x4";
        MACRO_ITEM_COMMON;

        MACRO_ADDITEM(CLASS(Object_2x4),1);
    };
    class CLASS(object_2x8): Item_Base_F {
        displayName = "2x8";
        MACRO_ITEM_COMMON;

        MACRO_ADDITEM(CLASS(Object_2x8),1);
    };
    class CLASS(object_Woodpanel): Item_Base_F {
        displayName = "Woodpanel";
        MACRO_ITEM_COMMON;

        MACRO_ADDITEM(CLASS(Object_Woodpanel),1);
    };

    class CLASS(forge): Thing {
        armor = 2000;
        author = "Model credits: RBG_illustrations - Reworked by TenuredCLOUD";
        displayName = "$STR_MISERY_FORGE_DISPLAYNAME";
        MACRO_THING_COMMON;
        mapSize = 3;
        model = QPATHTOF(data\models\forge.p3d);
        textSingular = "Forge";
    };
    class CLASS(anvil): House_F {
        armor = 3;
        author = "Model credits: Margot D. - Reworked by TenuredCLOUD";
        displayName = "$STR_MISERY_ANVIL_DISPLAYNAME";
        MACRO_HOUSE_COMMON;
        mapSize = 2;
        model = QPATHTOF(data\models\medievalanvil.p3d);
        textSingular = "Anvil";
    };
    class CLASS(jetFuel_Russian): House_F {
        armor = 2000;
        author = "Model credits: Tanks LuddePudde - Fuel pump castleonsandYT - Reworked by TenuredCLOUD";
        displayName = "$STR_MISERY_JETFUELRU_DISPLAYNAME";
        hiddenSelectionsMaterials[] = {QPATHTOF(data\rvmats\fueltanks.rvmat)};
        MACRO_HOUSE_COMMON;
        mapSize = 3;
        model = QPATHTOF(data\models\twinjetfueltank.p3d);
        textSingular = "Jet Fuel Station";
    };
};
