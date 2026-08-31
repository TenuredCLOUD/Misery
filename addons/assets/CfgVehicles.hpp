class CfgVehicles {
    class House_F;
    class Thing;
    class Land_HelipadEmpty_F;

    class CLASS(forge): Thing {
        armor = 2000;
        author = "Model credits: RBG_illustrations - Reworked by TenuredCLOUD";
        displayName = CSTRING(Forge_DisplayName);
        MACRO_THING_COMMON;
        XEH_ENABLED;
        mapSize = 3;
        model = QPATHTOF(data\models\forge.p3d);
        textSingular = "Forge";
    };
    class CLASS(anvil): House_F {
        armor = 3;
        author = "Model credits: Margot D. - Reworked by TenuredCLOUD";
        displayName = CSTRING(Anvil_DisplayName);
        MACRO_HOUSE_COMMON;
        mapSize = 2;
        model = QPATHTOF(data\models\medievalanvil.p3d);
        textSingular = "Anvil";
    };
    class CLASS(detectorProxy): Land_HelipadEmpty_F {
        scope = 1;
        ACEGVAR(minedetector,detectable) = 1;
    };
    class CLASS(moneyCache): Land_HelipadEmpty_F {
        scope = 1;
        ACEGVAR(minedetector,detectable) = 1;
    };
    class CLASS(gearCache): Land_HelipadEmpty_F {
        scope = 1;
        ACEGVAR(minedetector,detectable) = 1;
    };
};


