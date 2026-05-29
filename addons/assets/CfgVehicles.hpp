class CfgVehicles {
    class House_F;
    class Thing;
    class Land_PortableGenerator_01_F;

    class CLASS(forge): Thing {
        armor = 2000;
        author = "Model credits: RBG_illustrations - Reworked by TenuredCLOUD";
        displayName = CSTRING(Forge_DisplayName);
        MACRO_THING_COMMON;
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
    class CLASS(dieselGenerator): Land_PortableGenerator_01_F {
        armor = 300;
        displayName = CSTRING(DieselGenerator_DisplayName);
        MACRO_THING_COMMON;
        mapSize = 2;
        model = "a3\structures_f\ind\windpowerplant\powergenerator_f.p3d";
        textSingular = "Diesel Generator";
    };
    class CLASS(kvaGenerator): Land_PortableGenerator_01_F {
        armor = 1000;
        displayName = CSTRING(KVAGenerator_DisplayName);
        MACRO_THING_COMMON;
        mapSize = 5;
        model = "a3\structures_f_enoch\military\radar\mobileradar_01_generator_f.p3d";
        textSingular = "KVA Generator";
    };
};
