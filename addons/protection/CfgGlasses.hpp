class CfgGlasses {
    // Filter Variants
    class None;
    class G_AirPurifyingRespirator_01_base_F: None {
        GVAR(gasmask) = 1;
        GVAR(scba) = 0;
        GVAR(skinProtection) = 0.25;
        GVAR(respiratoryProtection) = 0.5;
        GVAR(eyeProtection) = 1;
        GVAR(hearingProtection) = 0;
    };

    class G_RegulatorMask_base_F: None {
        GVAR(gasmask) = 0;
        GVAR(scba) = 0;
        GVAR(skinProtection) = 0.25;
        GVAR(respiratoryProtection) = 0;
        GVAR(eyeProtection) = 1;
        GVAR(hearingProtection) = 0;
    };

    // Respirators
    class G_Respirator_blue_F: None {
        GVAR(gasmask) = 0;
        GVAR(scba) = 0;
        GVAR(skinProtection) = 0;
        GVAR(respiratoryProtection) = 0.25;
        GVAR(eyeProtection) = 0;
        GVAR(hearingProtection) = 0;
    };

    class G_Respirator_white_F: None {
        GVAR(gasmask) = 0;
        GVAR(scba) = 0;
        GVAR(skinProtection) = 0;
        GVAR(respiratoryProtection) = 0.25;
        GVAR(eyeProtection) = 0;
        GVAR(hearingProtection) = 0;
    };

    class G_Respirator_yellow_F: None {
        GVAR(gasmask) = 0;
        GVAR(scba) = 0;
        GVAR(skinProtection) = 0;
        GVAR(respiratoryProtection) = 0.25;
        GVAR(eyeProtection) = 0;
        GVAR(hearingProtection) = 0;
    };

    // Goggles
    class G_Combat: None {
        GVAR(gasmask) = 0;
        GVAR(scba) = 0;
        GVAR(skinProtection) = 0;
        GVAR(respiratoryProtection) = 0;
        GVAR(eyeProtection) = 0.75;
        GVAR(hearingProtection) = 0;
    };

    class G_Combat_Goggles_tna_F: None {
        GVAR(gasmask) = 0;
        GVAR(scba) = 0;
        GVAR(skinProtection) = 0;
        GVAR(respiratoryProtection) = 0;
        GVAR(eyeProtection) = 0.75;
        GVAR(hearingProtection) = 0;
    };

    class G_EyeProtectors_F: None {
        GVAR(gasmask) = 0;
        GVAR(scba) = 0;
        GVAR(skinProtection) = 0;
        GVAR(respiratoryProtection) = 0;
        GVAR(eyeProtection) = 0.75;
        GVAR(hearingProtection) = 0;
    };

    class G_EyeProtectors_Earpeice_F: None {
        GVAR(gasmask) = 0;
        GVAR(scba) = 0;
        GVAR(skinProtection) = 0;
        GVAR(respiratoryProtection) = 0;
        GVAR(eyeProtection) = 0.75;
        GVAR(hearingProtection) = 0;
    };

    // Balaclavas
    class G_Balaclava_TI_G_blk_F: None {
        GVAR(gasmask) = 0;
        GVAR(scba) = 0;
        GVAR(skinProtection) = 0;
        GVAR(respiratoryProtection) = 0;
        GVAR(eyeProtection) = 0.75;
        GVAR(hearingProtection) = 0;
    };

    class G_Balaclava_TI_G_tna_F: None {
        GVAR(gasmask) = 0;
        GVAR(scba) = 0;
        GVAR(skinProtection) = 0;
        GVAR(respiratoryProtection) = 0;
        GVAR(eyeProtection) = 0.75;
        GVAR(hearingProtection) = 0;
    };


    // No Filter Variants
    class G_AirPurifyingRespirator_01_F;
    class G_AirPurifyingRespirator_01_nofilter_F: G_AirPurifyingRespirator_01_F {
        GVAR(gasmask) = 0;
        GVAR(scba) = 0;
        GVAR(skinProtection) = 0.25;
        GVAR(respiratoryProtection) = 0;
        GVAR(eyeProtection) = 1;
        GVAR(hearingProtection) = 0;
    };

    class G_AirPurifyingRespirator_02_black_F;
    class G_AirPurifyingRespirator_02_black_nofilter_F: G_AirPurifyingRespirator_02_black_F {
        GVAR(gasmask) = 0;
        GVAR(scba) = 0;
        GVAR(skinProtection) = 0.25;
        GVAR(respiratoryProtection) = 0;
        GVAR(eyeProtection) = 1;
        GVAR(hearingProtection) = 0;
    };

    class G_AirPurifyingRespirator_02_olive_F;
    class G_AirPurifyingRespirator_02_olive_nofilter_F: G_AirPurifyingRespirator_02_olive_F {
        GVAR(gasmask) = 0;
        GVAR(scba) = 0;
        GVAR(skinProtection) = 0.25;
        GVAR(respiratoryProtection) = 0;
        GVAR(eyeProtection) = 1;
        GVAR(hearingProtection) = 0;
    };

    class G_AirPurifyingRespirator_02_sand_F;
    class G_AirPurifyingRespirator_02_sand_nofilter_F: G_AirPurifyingRespirator_02_sand_F {
        GVAR(gasmask) = 0;
        GVAR(scba) = 0;
        GVAR(skinProtection) = 0.25;
        GVAR(respiratoryProtection) = 0;
        GVAR(eyeProtection) = 1;
        GVAR(hearingProtection) = 0;
    };
};
