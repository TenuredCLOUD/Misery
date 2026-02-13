class CfgWeapons {

    class Uniform_Base;
    class U_I_Wetsuit_rvg: Uniform_Base {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0.75;
        EGVAR(protection,respiratoryProtection) = 0;
        EGVAR(protection,eyeProtection) = 0;
        EGVAR(protection,hearingProtection) = 0;
    };

    class U_O_Wetsuit_rvg: Uniform_Base {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0.75;
        EGVAR(protection,respiratoryProtection) = 0;
        EGVAR(protection,eyeProtection) = 0;
        EGVAR(protection,hearingProtection) = 0;
    };

    class U_B_Wetsuit_rvg: Uniform_Base {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 0;
        EGVAR(protection,skinProtection) = 0.75;
        EGVAR(protection,respiratoryProtection) = 0;
        EGVAR(protection,eyeProtection) = 0;
        EGVAR(protection,hearingProtection) = 0;
    };

    class Vest_Camo_Base;
    class V_O2Tank : Vest_Camo_Base {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 1;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 1;
        EGVAR(protection,eyeProtection) = 0;
        EGVAR(protection,hearingProtection) = 0;
    };

    class V_O2Tank_1 : Vest_Camo_Base {
        EGVAR(protection,gasmask) = 0;
        EGVAR(protection,scba) = 1;
        EGVAR(protection,skinProtection) = 0;
        EGVAR(protection,respiratoryProtection) = 1;
        EGVAR(protection,eyeProtection) = 0;
        EGVAR(protection,hearingProtection) = 0;
    };
};
