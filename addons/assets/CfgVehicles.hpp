class CfgVehicles {
    class House_F;
    class Thing;

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
};
