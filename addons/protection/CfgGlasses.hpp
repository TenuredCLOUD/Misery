class CfgGlasses {
	class None;
    class G_AirPurifyingRespirator_01_base_F;
    class G_AirPurifyingRespirator_02_base_F;
    class G_RegulatorMask_base_F;

	class G_AirPurifyingRespirator_01_F: G_AirPurifyingRespirator_01_base_F {
        GVAR(gasmask) = 1;
		GVAR(scba) = 0;
        GVAR(skinProtection) = 25;
        GVAR(respiratoryProtection) = 75;
        GVAR(eyeProtection) = 25;
        GVAR(hearingProtection) = 0;
    };

	class G_AirPurifyingRespirator_01_nofilter_F: G_AirPurifyingRespirator_01_F {
        GVAR(gasmask) = 1;
		GVAR(scba) = 0;
        GVAR(skinProtection) = 25;
        GVAR(respiratoryProtection) = 0;
        GVAR(eyeProtection) = 25;
        GVAR(hearingProtection) = 0;
    };

	class G_AirPurifyingRespirator_02_black_F: G_AirPurifyingRespirator_02_base_F {
        GVAR(gasmask) = 1;
		GVAR(scba) = 0;
        GVAR(skinProtection) = 25;
        GVAR(respiratoryProtection) = 75;
        GVAR(eyeProtection) = 25;
        GVAR(hearingProtection) = 0;
    };

	class G_AirPurifyingRespirator_02_black_nofilter_F: G_AirPurifyingRespirator_02_black_F {
        GVAR(gasmask) = 1;
		GVAR(scba) = 0;
        GVAR(skinProtection) = 25;
        GVAR(respiratoryProtection) = 0;
        GVAR(eyeProtection) = 25;
        GVAR(hearingProtection) = 0;
    };

	class G_AirPurifyingRespirator_02_olive_F: G_AirPurifyingRespirator_02_base_F {
        GVAR(gasmask) = 1;
		GVAR(scba) = 0;
        GVAR(skinProtection) = 25;
        GVAR(respiratoryProtection) = 75;
        GVAR(eyeProtection) = 25;
        GVAR(hearingProtection) = 0;
    };

	class G_AirPurifyingRespirator_02_olive_nofilter_F: G_AirPurifyingRespirator_02_olive_F {
        GVAR(gasmask) = 1;
		GVAR(scba) = 0;
        GVAR(skinProtection) = 25;
        GVAR(respiratoryProtection) = 0;
        GVAR(eyeProtection) = 25;
        GVAR(hearingProtection) = 0;
    };

	class G_AirPurifyingRespirator_02_sand_F: G_AirPurifyingRespirator_02_base_F {
        GVAR(gasmask) = 1;
		GVAR(scba) = 0;
        GVAR(skinProtection) = 25;
        GVAR(respiratoryProtection) = 75;
        GVAR(eyeProtection) = 25;
        GVAR(hearingProtection) = 0;
    };

	class G_AirPurifyingRespirator_02_sand_nofilter_F: G_AirPurifyingRespirator_02_sand_F {
        GVAR(gasmask) = 1;
		GVAR(scba) = 0;
        GVAR(skinProtection) = 25;
        GVAR(respiratoryProtection) = 0;
        GVAR(eyeProtection) = 25;
        GVAR(hearingProtection) = 0;
    };

	class G_RegulatorMask_F: G_RegulatorMask_base_F {
        GVAR(gasmask) = 1;
		GVAR(scba) = 0;
        GVAR(skinProtection) = 25;
        GVAR(respiratoryProtection) = 0;
        GVAR(eyeProtection) = 25;
        GVAR(hearingProtection) = 0;
    };
};