class CfgVehicles {
    class SoldierGB;
    class SoldierWB;
    class rhsusf_socom_mc_uniform;

    class rhs_infantry_msv_base: SoldierGB {
        modelSides[] = {6};
    };
    class rhs_infantry_vdv_base: rhs_infantry_msv_base {
        modelSides[] = {6};
    };
    class rhs_infantry_vdv_des_base: rhs_infantry_vdv_base {
        modelSides[] = {6};
    };
    class rhs_mvd_izlom_rifleman: rhs_infantry_vdv_base {
        modelSides[] = {6};
    };
    class rhsusf_socom_uniform_base: SoldierWB {
        modelSides[] = {6};
    };
    class rhsusf_infantry_army_base: SoldierWB {
        modelSides[] = {6};
    };
    class rhsusf_infantry_socom_armysf_base: rhsusf_socom_mc_uniform {
        modelSides[] = {6};
    };
    class rhs_g_uniform1_base: SoldierGB {
        modelSides[] = {6};
    };
    class rhsgref_cdf_ngd_base: SoldierGB {
        modelSides[] = {6};
    };
    class rhsgref_cdf_reg_base: SoldierGB {
        modelSides[] = {6};
    };
    class rhsgref_cdf_para_base: rhsgref_cdf_reg_base {
        modelSides[] = {6};
    };
    class rhsgref_nat_base: SoldierGB {
        modelSides[] = {6};
    };
    class rhsgref_ins_base: SoldierGB {
        modelSides[] = {6};
    };
    class rhsgref_hidf_base: SoldierWB {
        modelSides[] = {6};
    };
    class rhsgref_tla_base: SoldierGB {
        modelSides[] = {6};
    };
    class rhssaf_soldier_m10_base: SoldierGB {
        modelSides[] = {6};
    };
};
