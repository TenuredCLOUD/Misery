class CfgWeapons {
    class H_HelmetCrew_B;
    class H_HelmetCrew_I: H_HelmetCrew_B {
        GVAR(gasmask) = 0;
        GVAR(scba) = 0;
        GVAR(skinProtection) = 0;
        GVAR(respiratoryProtection) = 0;
        GVAR(eyeProtection) = 0;
        GVAR(hearingProtection) = 100;
    };

    class Uniform_Base;
    class U_B_CBRN_Suit_01_MTP_F: Uniform_Base {
        GVAR(gasmask) = 0;
        GVAR(scba) = 0;
        GVAR(skinProtection) = 100;
        GVAR(respiratoryProtection) = 0;
        GVAR(eyeProtection) = 0;
        GVAR(hearingProtection) = 0;
    };

    class U_B_CBRN_Suit_01_Tropic_F: Uniform_Base {
        GVAR(gasmask) = 0;
        GVAR(scba) = 0;
        GVAR(skinProtection) = 100;
        GVAR(respiratoryProtection) = 0;
        GVAR(eyeProtection) = 0;
        GVAR(hearingProtection) = 0;
    };

    class U_B_CBRN_Suit_01_Wdl_F: Uniform_Base {
        GVAR(gasmask) = 0;
        GVAR(scba) = 0;
        GVAR(skinProtection) = 100;
        GVAR(respiratoryProtection) = 0;
        GVAR(eyeProtection) = 0;
        GVAR(hearingProtection) = 0;
    };

    class U_C_CBRN_Suit_01_Blue_F: Uniform_Base {
        GVAR(gasmask) = 0;
        GVAR(scba) = 0;
        GVAR(skinProtection) = 100;
        GVAR(respiratoryProtection) = 0;
        GVAR(eyeProtection) = 0;
        GVAR(hearingProtection) = 0;
    };

    class U_C_CBRN_Suit_01_White_F: Uniform_Base {
        GVAR(gasmask) = 0;
        GVAR(scba) = 0;
        GVAR(skinProtection) = 100;
        GVAR(respiratoryProtection) = 0;
        GVAR(eyeProtection) = 0;
        GVAR(hearingProtection) = 0;
    };

    class U_I_CBRN_Suit_01_AAF_F: Uniform_Base {
        GVAR(gasmask) = 0;
        GVAR(scba) = 0;
        GVAR(skinProtection) = 100;
        GVAR(respiratoryProtection) = 0;
        GVAR(eyeProtection) = 0;
        GVAR(hearingProtection) = 0;
    };

    class U_I_E_CBRN_Suit_01_EAF_F: Uniform_Base {
        GVAR(gasmask) = 0;
        GVAR(scba) = 0;
        GVAR(skinProtection) = 100;
        GVAR(respiratoryProtection) = 0;
        GVAR(eyeProtection) = 0;
        GVAR(hearingProtection) = 0;
    };

    class VestItem;
    class Vest_Camo_Base;
    class CLASS(Rebreather) : Vest_Camo_Base {
        GVAR(gasmask) = 0;
        GVAR(scba) = 1;
        GVAR(skinProtection) = 0;
        GVAR(respiratoryProtection) = 100;
        GVAR(eyeProtection) = 0;
        GVAR(hearingProtection) = 0;
        access = 3;
        scope = 2;
        canShootInWater = 1;
        selectionFireAnim = "zasleh";
        type = 701;
        nameSound = "";
        displayName = "Oxygen Rebreather";
        author = "TenuredCLOUD";
        picture = "\A3\characters_f\Data\UI\icon_V_RebreatherB_CA.paa";
        model = "\A3\Characters_F\Common\equip_rebreather";
        hiddenSelections[] = {"camo","hide","unhide","unhide2"};
        hiddenSelectionsTextures[] = {
            "\A3\characters_f\common\data\diver_equip_nato_co.paa",
            "\A3\characters_f\common\data\diver_equip_nato_co.paa",
            "\A3\characters_f\data\visors_ca.paa"
        };

        class ItemInfo : VestItem {
            uniformModel = "\A3\Characters_F\Common\equip_rebreather";
            vestType = "Rebreather";
            containerClass = "Supply0";
            mass = 80;
            armor = 20;
            passThrough = 1;
            hiddenSelections[] = {"camo", "hide", "unhide", "unhide2"};
            hiddenSelectionsTextures[] = {
                "\A3\characters_f\common\data\diver_equip_nato_co.paa","\A3\characters_f\common\data\diver_equip_nato_co.paa","\A3\characters_f\data\visors_ca.paa"
            };
        };
    };
};
