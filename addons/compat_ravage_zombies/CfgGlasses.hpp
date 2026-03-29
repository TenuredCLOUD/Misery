class CfgGlasses {
    // Gasmasks
    class None;
    class Mask_M40_OD: None {
        EGVAR(protection,gasmask) = 1;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0.25;
        EGVAR(protection,respiratoryProtection) = 0.5;
        EGVAR(protection,eyeProtection) = 1;
        EGVAR(protection,hearingProtection) = 0;
    };

    class Mask_M50: None {
        EGVAR(protection,gasmask) = 1;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0.25;
        EGVAR(protection,respiratoryProtection) = 0.5;
        EGVAR(protection,eyeProtection) = 1;
        EGVAR(protection,hearingProtection) = 0;
    };

    class Mask_M40: None {
        EGVAR(protection,gasmask) = 1;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0.25;
        EGVAR(protection,respiratoryProtection) = 0.5;
        EGVAR(protection,eyeProtection) = 1;
        EGVAR(protection,hearingProtection) = 0;
    };

    // Respirators (Dirty respirators, so low protection)
    class rvg_respirator_5: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0.15;
        EGVAR(protection,eyeProtection) = 0;
        EGVAR(protection,hearingProtection) = 0;
    };

    class rvg_respirator_4: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0.15;
        EGVAR(protection,eyeProtection) = 0;
        EGVAR(protection,hearingProtection) = 0;
    };

    class rvg_respirator_3: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0.15;
        EGVAR(protection,eyeProtection) = 0;
        EGVAR(protection,hearingProtection) = 0;
    };

    class rvg_respirator_2: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0.15;
        EGVAR(protection,eyeProtection) = 0;
        EGVAR(protection,hearingProtection) = 0;
    };

    class rvg_respirator_1: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0.15;
        EGVAR(protection,eyeProtection) = 0;
        EGVAR(protection,hearingProtection) = 0;
    };

    // Science Goggles
    class rvg_eyeprotector: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0;
        EGVAR(protection,eyeProtection) = 0.75;
        EGVAR(protection,hearingProtection) = 0;
    };

    // Shemagh (Cloth of course low protection)
    class PU_shemagh_OD: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0.05;
        EGVAR(protection,eyeProtection) = 0;
        EGVAR(protection,hearingProtection) = 0;
    };

    class PU_shemagh_Tan: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0.05;
        EGVAR(protection,eyeProtection) = 0;
        EGVAR(protection,hearingProtection) = 0;
    };

    class PU_shemagh_White: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0.05;
        EGVAR(protection,eyeProtection) = 0;
        EGVAR(protection,hearingProtection) = 0;
    };

    // Shemagh with safety glasses
    class PU_shemagh_GryBLK: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0.05;
        EGVAR(protection,eyeProtection) = 0.25;
        EGVAR(protection,hearingProtection) = 0;
    };

    class PU_shemagh_ODBLK: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0.05;
        EGVAR(protection,eyeProtection) = 0.25;
        EGVAR(protection,hearingProtection) = 0;
    };

    class PU_shemagh_TanBLK: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0.05;
        EGVAR(protection,eyeProtection) = 0.25;
        EGVAR(protection,hearingProtection) = 0;
    };

    class PU_shemagh_WhiteBLK: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0.05;
        EGVAR(protection,eyeProtection) = 0.25;
        EGVAR(protection,hearingProtection) = 0;
    };

    class PU_shemagh_GryCLR: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0.05;
        EGVAR(protection,eyeProtection) = 0.25;
        EGVAR(protection,hearingProtection) = 0;
    };

    class PU_shemagh_ODCLR: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0.05;
        EGVAR(protection,eyeProtection) = 0.25;
        EGVAR(protection,hearingProtection) = 0;
    };

    class PU_shemagh_TanCLR: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0.05;
        EGVAR(protection,eyeProtection) = 0.25;
        EGVAR(protection,hearingProtection) = 0;
    };

    class PU_shemagh_WhiteCLR: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0.05;
        EGVAR(protection,eyeProtection) = 0.25;
        EGVAR(protection,hearingProtection) = 0;
    };

    class PU_shemagh_GryO: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0.05;
        EGVAR(protection,eyeProtection) = 0.25;
        EGVAR(protection,hearingProtection) = 0;
    };

    class PU_shemagh_ODO: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0.05;
        EGVAR(protection,eyeProtection) = 0.25;
        EGVAR(protection,hearingProtection) = 0;
    };

    class PU_shemagh_TanO: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0.05;
        EGVAR(protection,eyeProtection) = 0.25;
        EGVAR(protection,hearingProtection) = 0;
    };

    class PU_shemagh_WhiteO: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0.05;
        EGVAR(protection,eyeProtection) = 0.25;
        EGVAR(protection,hearingProtection) = 0;
    };

    // Shemagh NeckTight with safety glasses
    class NeckTight_DMBLK: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0;
        EGVAR(protection,eyeProtection) = 0.25;
        EGVAR(protection,hearingProtection) = 0;
    };

    class NeckTight_GryBLK: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0;
        EGVAR(protection,eyeProtection) = 0.25;
        EGVAR(protection,hearingProtection) = 0;
    };

    class NeckTight_ODBLK: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0;
        EGVAR(protection,eyeProtection) = 0.25;
        EGVAR(protection,hearingProtection) = 0;
    };

    class NeckTight_TanBLK: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0;
        EGVAR(protection,eyeProtection) = 0.25;
        EGVAR(protection,hearingProtection) = 0;
    };

    class NeckTight_WhiteBLK: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0;
        EGVAR(protection,eyeProtection) = 0.25;
        EGVAR(protection,hearingProtection) = 0;
    };

    class NeckTight_DMCLR: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0;
        EGVAR(protection,eyeProtection) = 0.25;
        EGVAR(protection,hearingProtection) = 0;
    };

    class NeckTight_GryCLR: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0;
        EGVAR(protection,eyeProtection) = 0.25;
        EGVAR(protection,hearingProtection) = 0;
    };

    class NeckTight_ODCLR: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0;
        EGVAR(protection,eyeProtection) = 0.25;
        EGVAR(protection,hearingProtection) = 0;
    };

    class NeckTight_TanCLR: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0;
        EGVAR(protection,eyeProtection) = 0.25;
        EGVAR(protection,hearingProtection) = 0;
    };

    class NeckTight_WhiteCLR: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0;
        EGVAR(protection,eyeProtection) = 0.25;
        EGVAR(protection,hearingProtection) = 0;
    };

    class NeckTight_DMO: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0;
        EGVAR(protection,eyeProtection) = 0.25;
        EGVAR(protection,hearingProtection) = 0;
    };

    class NeckTight_GryO: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0;
        EGVAR(protection,eyeProtection) = 0.25;
        EGVAR(protection,hearingProtection) = 0;
    };

    class NeckTight_ODO: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0;
        EGVAR(protection,eyeProtection) = 0.25;
        EGVAR(protection,hearingProtection) = 0;
    };

    class NeckTight_TanO: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0;
        EGVAR(protection,eyeProtection) = 0.25;
        EGVAR(protection,hearingProtection) = 0;
    };

    class NeckTight_WhiteO: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0;
        EGVAR(protection,eyeProtection) = 0.25;
        EGVAR(protection,hearingProtection) = 0;
    };

    // Balaclavas
    class rvg_balaclavaCombat_2: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0;
        EGVAR(protection,eyeProtection) = 0.75;
        EGVAR(protection,hearingProtection) = 0;
    };

    class rvg_balaclavaLow_2: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0;
        EGVAR(protection,eyeProtection) = 0.5;
        EGVAR(protection,hearingProtection) = 0;
    };

    class rvg_balaclavaCombat_5: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0;
        EGVAR(protection,eyeProtection) = 0.75;
        EGVAR(protection,hearingProtection) = 0;
    };

    class rvg_balaclavaLow_5: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0;
        EGVAR(protection,eyeProtection) = 0.5;
        EGVAR(protection,hearingProtection) = 0;
    };

    class rvg_balaclavaCombat_3: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0;
        EGVAR(protection,eyeProtection) = 0.75;
        EGVAR(protection,hearingProtection) = 0;
    };

    class rvg_balaclavaLow_3: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0;
        EGVAR(protection,eyeProtection) = 0.5;
        EGVAR(protection,hearingProtection) = 0;
    };

    class rvg_balaclavaCombat_1: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0;
        EGVAR(protection,eyeProtection) = 0.75;
        EGVAR(protection,hearingProtection) = 0;
    };

    class rvg_balaclavaLow_1: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0;
        EGVAR(protection,eyeProtection) = 0.5;
        EGVAR(protection,hearingProtection) = 0;
    };

    class rvg_balaclavaCombat_4: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0;
        EGVAR(protection,eyeProtection) = 0.75;
        EGVAR(protection,hearingProtection) = 0;
    };

    class rvg_balaclavaLow_4: None {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 0;
        EGVAR(protection,eyeProtection) = 0.5;
        EGVAR(protection,hearingProtection) = 0;
    };
};
