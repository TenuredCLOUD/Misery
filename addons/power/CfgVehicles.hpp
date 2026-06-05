class CfgVehicles {
    class Sound;
    class Static;
    class Land_PortableLight_02_single_folded_black_F;
    class Land_PortableLight_02_single_olive_F;

    class GVAR(sfx_v_petrolGenRun): Sound {
        author = "TenuredCLOUD";
        scope = 2;
        sound = QGVAR(sfx_portableRunning);
        displayName = "Petrol Generator Run Sound";
    };
    class GVAR(sfx_v_dieselGenRun): Sound {
        author = "TenuredCLOUD";
        scope = 2;
        sound = QGVAR(sfx_dieselRunning);
        displayName = "Diesel Generator Run Sound";
    };
    class GVAR(sfx_v_kvaGenRun): Sound {
        author = "TenuredCLOUD";
        scope = 2;
        sound = QGVAR(sfx_kvaRunning);
        displayName = "KVA Generator Run Sound";
    };
    // Generators
    class CLASS(petrolGenerator): Static {
        armor = 150;
        displayName = CSTRING(PetrolGenerator_DisplayName);
        MACRO_THING_COMMON;
        XEH_ENABLED;
        mapSize = 1;
        model = "a3\structures_f\items\electronics\portable_generator_f.p3d";
        textSingular = "Petrol Generator";

        GVAR(fuelDelay) = 60;
        GVAR(startupDelay) = 1;
        GVAR(shutDownDelay) = 1;
        GVAR(runDelay) = 11.5;
        GVAR(powerRadius) = 25;
        GVAR(powerOutput) = 5000;
        GVAR(connected)[] = {};
        GVAR(soundRadius) = 50;

        GVAR(fuelCan) = QCLASS(petrol);
        GVAR(fuelCanEmpty) = QCLASS(petrolEmpty);
        GVAR(requiredFuelType) = CSTRING(Petrol);
        // Simulated 40L/10.5Gal tank
        GVAR(fuelChange) = 0.025;

        GVAR(soundStart) = QEGVAR(audio,sound_petrolStart);
        GVAR(soundRunning) = QGVAR(sfx_v_petrolGenRun);
        GVAR(soundStop) = QEGVAR(audio,sound_petrolStop);
    };
    class CLASS(dieselGenerator): Static {
        armor = 300;
        displayName = CSTRING(DieselGenerator_DisplayName);
        MACRO_THING_COMMON;
        XEH_ENABLED;
        mapSize = 2;
        model = "a3\structures_f\ind\windpowerplant\powergenerator_f.p3d";
        textSingular = "Diesel Generator";

        GVAR(fuelDelay) = 120;
        GVAR(startupDelay) = 2;
        GVAR(shutDownDelay) = 3;
        GVAR(runDelay) = 11.5;
        GVAR(powerRadius) = 150;
        GVAR(powerOutput) = 15000;
        GVAR(connected)[] = {};
        GVAR(soundRadius) = 100;

        GVAR(fuelCan) = QCLASS(diesel);
        GVAR(fuelCanEmpty) = QCLASS(dieselEmpty);
        GVAR(requiredFuelType) = CSTRING(Diesel);
        // Simulated 80L/21Gal tank
        GVAR(fuelChange) = 0.0125;

        GVAR(soundStart) = QEGVAR(audio,sound_dieselStart);
        GVAR(soundRunning) = QGVAR(sfx_v_dieselGenRun);
        GVAR(soundStop) = QEGVAR(audio,sound_dieselStop);
    };
    class CLASS(kvaGenerator): Static {
        armor = 1000;
        displayName = CSTRING(KVAGenerator_DisplayName);
        MACRO_THING_COMMON;
        XEH_ENABLED;
        mapSize = 5;
        model = "a3\structures_f_heli\ind\machines\dieselgroundpowerunit_01_f.p3d";
        textSingular = "KVA Generator";

        GVAR(fuelDelay) = 240;
        GVAR(startupDelay) = 8;
        GVAR(shutDownDelay) = 6;
        GVAR(runDelay) = 9.5;
        GVAR(powerRadius) = 300;
        GVAR(powerOutput) = 25000;
        GVAR(connected)[] = {};
        GVAR(soundRadius) = 500;

        GVAR(fuelCan) = QCLASS(diesel);
        GVAR(fuelCanEmpty) = QCLASS(dieselEmpty);
        GVAR(requiredFuelType) = CSTRING(Diesel);
        // Simulated 500L/132Gal tank
        GVAR(fuelChange) = 0.002;

        GVAR(soundStart) = QEGVAR(audio,sound_kvaStart);
        GVAR(soundRunning) = QGVAR(sfx_v_kvaGenRun);
        GVAR(soundStop) = QEGVAR(audio,sound_kvaStop);
    };
    // Battery packs
    class CLASS(batteryPack_black): Static {
        armor = 10;
        displayName = CSTRING(KVAGenerator_DisplayName);
        MACRO_THING_COMMON;
        XEH_ENABLED;
        mapSize = 5;
        hiddenSelections[] = {"Camo_1"};
        hiddenSelectionsTextures[] = {"a3\Props_F_Enoch\Military\Equipment\data\BatteryPack_01_Black_CO.paa"};
        model = "a3\props_f_enoch\military\equipment\batterypack_01_closed_f.p3d";
        textSingular = "Battery Pack (black)";

        GVAR(powerOutput) = 1200;
    };
    class CLASS(batteryPack_od): CLASS(batteryPack_black) {
        armor = 10;
        displayName = CSTRING(KVAGenerator_DisplayName);
        MACRO_THING_COMMON;
        XEH_ENABLED;
        mapSize = 5;
        hiddenSelections[] = {"Camo_1"};
        hiddenSelectionsTextures[] = {"a3\Props_F_Enoch\Military\Equipment\data\BatteryPack_01_Olive_CO.paa"};
        model = "a3\props_f_enoch\military\equipment\batterypack_01_closed_f.p3d";
        textSingular = "Battery Pack (od)";

        GVAR(powerOutput) = 1200;
    };
    class CLASS(batteryPack_sand): CLASS(batteryPack_black) {
        armor = 10;
        displayName = CSTRING(KVAGenerator_DisplayName);
        MACRO_THING_COMMON;
        XEH_ENABLED;
        mapSize = 5;
        hiddenSelections[] = {"Camo_1"};
        hiddenSelectionsTextures[] = {"a3\Props_F_Enoch\Military\Equipment\data\BatteryPack_01_Sand_CO.paa"};
        model = "a3\props_f_enoch\military\equipment\batterypack_01_closed_f.p3d";
        textSingular = "Battery Pack (sand)";

        GVAR(powerOutput) = 1200;
    };
    // Portable Lights (single folded)
    class CLASS(portableLight_single_black): Land_PortableLight_02_single_folded_black_F {
        armor = 10;
        displayName = CSTRING(KVAGenerator_DisplayName);
        MACRO_THING_COMMON;
        XEH_ENABLED;
        mapSize = 5;
        hiddenSelections[] = {"Camo_1"};
        hiddenSelectionsTextures[] = {"a3\Props_F_Enoch\Military\Camps\data\Portable_light_02_Single_Black_CO.paa"};
        model = "a3\props_f_enoch\military\camps\portablelight_02_single_folded_f.p3d";
        textSingular = "Battery Pack (black)";
    };
    class CLASS(portableLight_single_od): CLASS(portableLight_single_black) {
        armor = 10;
        displayName = CSTRING(KVAGenerator_DisplayName);
        MACRO_THING_COMMON;
        XEH_ENABLED;
        mapSize = 5;
        hiddenSelections[] = {"Camo_1"};
        hiddenSelectionsTextures[] = {"a3\Props_F_Enoch\Military\Camps\data\Portable_light_02_Single_Olive_CO.paa"};
        model = "a3\props_f_enoch\military\camps\portablelight_02_single_folded_f.p3d";
        textSingular = "Battery Pack (black)";
    };
    class CLASS(portableLight_single_sand): CLASS(portableLight_single_black) {
        armor = 10;
        displayName = CSTRING(KVAGenerator_DisplayName);
        MACRO_THING_COMMON;
        XEH_ENABLED;
        mapSize = 5;
        hiddenSelections[] = {"Camo_1"};
        hiddenSelectionsTextures[] = {"a3\Props_F_Enoch\Military\Camps\data\Portable_light_02_Single_Sand_CO.paa"};
        model = "a3\props_f_enoch\military\camps\portablelight_02_single_folded_f.p3d";
        textSingular = "Battery Pack (black)";
    };
    class CLASS(portableLight_single_yellow): CLASS(portableLight_single_black) {
        armor = 10;
        displayName = CSTRING(KVAGenerator_DisplayName);
        MACRO_THING_COMMON;
        XEH_ENABLED;
        mapSize = 5;
        hiddenSelections[] = {"Camo_1"};
        hiddenSelectionsTextures[] = {"a3\Props_F_Enoch\Military\Camps\data\Portable_light_02_Single_Yellow_CO.paa"};
        model = "a3\props_f_enoch\military\camps\portablelight_02_single_folded_f.p3d";
        textSingular = "Battery Pack (black)";
    };
    // Portable Lights (single unfolded)
    class CLASS(portableLight_single_black_unfolded): Land_PortableLight_02_single_olive_F {
        armor = 10;
        displayName = CSTRING(KVAGenerator_DisplayName);
        MACRO_THING_COMMON;
        XEH_ENABLED;
        mapSize = 5;
        hiddenSelections[] = {"Camo_1"};
        hiddenSelectionsTextures[] = {"a3\Props_F_Enoch\Military\Camps\data\Portable_light_02_Single_Black_CO.paa"};
        model = "a3\props_f_enoch\military\camps\portablelight_02_single_f.p3d";
        textSingular = "Battery Pack (black)";
    };
    class CLASS(portableLight_single_od_unfolded): CLASS(portableLight_single_black_unfolded) {
        armor = 10;
        displayName = CSTRING(KVAGenerator_DisplayName);
        MACRO_THING_COMMON;
        XEH_ENABLED;
        mapSize = 5;
        hiddenSelections[] = {"Camo_1"};
        hiddenSelectionsTextures[] = {"a3\Props_F_Enoch\Military\Camps\data\Portable_light_02_Single_Olive_CO.paa"};
        model = "a3\props_f_enoch\military\camps\portablelight_02_single_f.p3d";
        textSingular = "Battery Pack (black)";
    };
    class CLASS(portableLight_single_sand_unfolded): CLASS(portableLight_single_black_unfolded) {
        armor = 10;
        displayName = CSTRING(KVAGenerator_DisplayName);
        MACRO_THING_COMMON;
        XEH_ENABLED;
        mapSize = 5;
        hiddenSelections[] = {"Camo_1"};
        hiddenSelectionsTextures[] = {"a3\Props_F_Enoch\Military\Camps\data\Portable_light_02_Single_Sand_CO.paa"};
        model = "a3\props_f_enoch\military\camps\portablelight_02_single_f.p3d";
        textSingular = "Battery Pack (black)";
    };
    class CLASS(portableLight_single_yellow_unfolded): CLASS(portableLight_single_black_unfolded) {
        armor = 10;
        displayName = CSTRING(KVAGenerator_DisplayName);
        MACRO_THING_COMMON;
        XEH_ENABLED;
        mapSize = 5;
        hiddenSelections[] = {"Camo_1"};
        hiddenSelectionsTextures[] = {"a3\Props_F_Enoch\Military\Camps\data\Portable_light_02_Single_Yellow_CO.paa"};
        model = "a3\props_f_enoch\military\camps\portablelight_02_single_f.p3d";
        textSingular = "Battery Pack (black)";
    };
    // Portable Lights (double)
    class CLASS(portableLight_double_black): Static {
        armor = 10;
        displayName = CSTRING(KVAGenerator_DisplayName);
        MACRO_THING_COMMON;
        XEH_ENABLED;
        mapSize = 1;
        hiddenSelections[] = {"Camo_1"};
        hiddenSelectionsTextures[] = {"a3\Props_F_Enoch\Military\Camps\data\Portable_light_02_Black_CO.paa"};
        model = "a3\props_f_enoch\military\camps\portablelight_02_double_f.p3d";
        textSingular = "Battery Pack (black)";
    };
    class CLASS(portableLight_double_od): CLASS(portableLight_double_black) {
        armor = 10;
        displayName = CSTRING(KVAGenerator_DisplayName);
        MACRO_THING_COMMON;
        XEH_ENABLED;
        mapSize = 1;
        hiddenSelections[] = {"Camo_1"};
        hiddenSelectionsTextures[] = {"a3\Props_F_Enoch\Military\Camps\data\Portable_light_02_Olive_CO.paa"};
        model = "a3\props_f_enoch\military\camps\portablelight_02_double_f.p3d";
        textSingular = "Battery Pack (black)";
    };
    class CLASS(portableLight_double_sand): CLASS(portableLight_double_black) {
        armor = 10;
        displayName = CSTRING(KVAGenerator_DisplayName);
        MACRO_THING_COMMON;
        XEH_ENABLED;
        mapSize = 1;
        hiddenSelections[] = {"Camo_1"};
        hiddenSelectionsTextures[] = {"a3\Props_F_Enoch\Military\Camps\data\Portable_light_02_Sand_CO.paa"};
        model = "a3\props_f_enoch\military\camps\portablelight_02_double_f.p3d";
        textSingular = "Battery Pack (black)";
    };
    class CLASS(portableLight_double_yellow): CLASS(portableLight_double_black) {
        armor = 10;
        displayName = CSTRING(KVAGenerator_DisplayName);
        MACRO_THING_COMMON;
        XEH_ENABLED;
        mapSize = 1;
        hiddenSelections[] = {"Camo_1"};
        hiddenSelectionsTextures[] = {"a3\Props_F_Enoch\Military\Camps\data\Portable_light_02_Yellow_CO.paa"};
        model = "a3\props_f_enoch\military\camps\portablelight_02_double_f.p3d";
        textSingular = "Battery Pack (black)";
    };
    // Portable Lights (quad)
    class CLASS(portableLight_quad_black): Static {
        armor = 10;
        displayName = CSTRING(KVAGenerator_DisplayName);
        MACRO_THING_COMMON;
        XEH_ENABLED;
        mapSize = 1;
        hiddenSelections[] = {"Camo_1"};
        hiddenSelectionsTextures[] = {"a3\Props_F_Enoch\Military\Camps\data\Portable_light_02_Black_CO.paa"};
        model = "a3\props_f_enoch\military\camps\portablelight_02_quad_f.p3d";
        textSingular = "Battery Pack (black)";
    };
    class CLASS(portableLight_quad_od): CLASS(portableLight_quad_black) {
        armor = 10;
        displayName = CSTRING(KVAGenerator_DisplayName);
        MACRO_THING_COMMON;
        XEH_ENABLED;
        mapSize = 1;
        hiddenSelections[] = {"Camo_1"};
        hiddenSelectionsTextures[] = {"a3\Props_F_Enoch\Military\Camps\data\Portable_light_02_Olive_CO.paa"};
        model = "a3\props_f_enoch\military\camps\portablelight_02_quad_f.p3d";
        textSingular = "Battery Pack (black)";
    };
    class CLASS(portableLight_quad_sand): CLASS(portableLight_quad_black) {
        armor = 10;
        displayName = CSTRING(KVAGenerator_DisplayName);
        MACRO_THING_COMMON;
        XEH_ENABLED;
        mapSize = 1;
        hiddenSelections[] = {"Camo_1"};
        hiddenSelectionsTextures[] = {"a3\Props_F_Enoch\Military\Camps\data\Portable_light_02_Sand_CO.paa"};
        model = "a3\props_f_enoch\military\camps\portablelight_02_quad_f.p3d";
        textSingular = "Battery Pack (black)";
    };
    class CLASS(portableLight_quad_yellow): CLASS(portableLight_quad_black) {
        armor = 10;
        displayName = CSTRING(KVAGenerator_DisplayName);
        MACRO_THING_COMMON;
        XEH_ENABLED;
        mapSize = 1;
        hiddenSelections[] = {"Camo_1"};
        hiddenSelectionsTextures[] = {"a3\Props_F_Enoch\Military\Camps\data\Portable_light_02_Yellow_CO.paa"};
        model = "a3\props_f_enoch\military\camps\portablelight_02_quad_f.p3d";
        textSingular = "Battery Pack (black)";
    };
    // Portable solar panels
    class CLASS(portable_solar_black): Static {
        armor = 10;
        displayName = CSTRING(KVAGenerator_DisplayName);
        MACRO_THING_COMMON;
        XEH_ENABLED;
        mapSize = 1;
        hiddenSelections[] = {"Camo_1"};
        hiddenSelectionsTextures[] = {"a3\Props_F_Enoch\Military\Equipment\data\SolarPanel_04_F_Black_CO.paa"};
        model = "a3\props_f_enoch\military\equipment\solarpanel_04_f.p3d";
        textSingular = "Battery Pack (black)";

        GVAR(powerOutput) = 300;
    };
    class CLASS(portable_solar_od): CLASS(portable_solar_black) {
        armor = 10;
        displayName = CSTRING(KVAGenerator_DisplayName);
        MACRO_THING_COMMON;
        XEH_ENABLED;
        mapSize = 1;
        hiddenSelections[] = {"Camo_1"};
        hiddenSelectionsTextures[] = {"a3\Props_F_Enoch\Military\Equipment\data\SolarPanel_04_F_Olive_CO.paa"};
        model = "a3\props_f_enoch\military\equipment\solarpanel_04_f.p3d";
        textSingular = "Battery Pack (black)";

        GVAR(powerOutput) = 300;
    };
    class CLASS(portable_solar_sand): CLASS(portable_solar_black) {
        armor = 10;
        displayName = CSTRING(KVAGenerator_DisplayName);
        MACRO_THING_COMMON;
        XEH_ENABLED;
        mapSize = 1;
        hiddenSelections[] = {"Camo_1"};
        hiddenSelectionsTextures[] = {"a3\Props_F_Enoch\Military\Equipment\data\SolarPanel_04_F_Sand_CO.paa"};
        model = "a3\props_f_enoch\military\equipment\solarpanel_04_f.p3d";
        textSingular = "Battery Pack (black)";

        GVAR(powerOutput) = 300;
    };
};
