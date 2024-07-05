
private _cancraft = FALSE;

_Check_items = items player;
_check_mags = magazines player;

if ("U_I_Wetsuit_rvg" in _Check_items || "U_O_Wetsuit_rvg" in _Check_items || "U_B_Wetsuit_rvg" in _Check_items || "U_B_CBRN_Suit_01_MTP_F" in _Check_items || "U_B_CBRN_Suit_01_Tropic_F" in _Check_items || "U_B_CBRN_Suit_01_Wdl_F" in _Check_items || "U_I_CBRN_Suit_01_AAF_F" in _Check_items || "U_I_E_CBRN_Suit_01_EAF_F" in _Check_items || "U_C_CBRN_Suit_01_Blue_F" in _Check_items || "U_C_CBRN_Suit_01_White_F" in _Check_items
&& "rvg_toolkit" in _check_mags) then {
_cancraft = TRUE;
if (_cancraft)exitwith{};
};

_cancraft //return 