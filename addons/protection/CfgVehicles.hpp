class CfgVehicles {
    class Bag_Base;
    class B_SCBA_01_base_F;
    class B_CombinationUnitRespirator_01_Base_F;

	class B_SCBA_01F: B_SCBA_01_base_F {
        GVAR(gasmask) = 0;
        GVAR(scba) = 1;
        GVAR(skinProtection) = 0;
        GVAR(respiratoryProtection) = 100;
        GVAR(eyeProtection) = 0;
        GVAR(hearingProtection) = 0;
    };
    class B_CombinationUnitRespirator_01_F: B_CombinationUnitRespirator_01_Base_F {
        GVAR(gasmask) = 0;
        GVAR(scba) = 1;
        GVAR(skinProtection) = 0;
        GVAR(respiratoryProtection) = 100;
        GVAR(eyeProtection) = 0;
        GVAR(hearingProtection) = 0;
    };
};