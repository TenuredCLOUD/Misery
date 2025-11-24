#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Gasmask & Rebreather hose connections for Contact DLC CBRN equipment
 * These are only intended for the CUR & NATO APR as well as the Regulator mask and SCBA pack
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_gasmask_fnc_rebreatherHose
 *
*/

// NATO APR & CUR
player addEventHandler ["SlotItemChanged", {
    params ["_unit", "_name", "_slot", "_assigned", "_weapon"];

    private _maskIndex = MACRO_RESPIRATOR_MASKS_CUR findIf { (toLower _name) isEqualTo (_x select 0) };

    private _pack = (MACRO_RESPIRATOR_MASKS_CUR select _maskIndex) select 1;

    if (_maskIndex isNotEqualTo -1 && backpack _unit isEqualTo _pack) then {
        if (_assigned) then {
            (backpackContainer _unit) setObjectTexture [1, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
            (backpackContainer _unit) setObjectTexture [2, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
            _unit linkItem "G_AirPurifyingRespirator_01_nofilter_F";
        } else {
            (backpackContainer _unit) setObjectTexture [1, ""];
            (backpackContainer _unit) setObjectTexture [2, ""];
        };
    };
}];

// Regulator mask & SCBA
player addEventHandler ["SlotItemChanged", {
    params ["_unit", "_name", "_slot", "_assigned", "_weapon"];

    private _maskIndex = MACRO_RESPIRATOR_MASKS_SCBA findIf { (toLower _name) isEqualTo (_x select 0) };

    private _pack = (MACRO_RESPIRATOR_MASKS_SCBA select _maskIndex) select 1;

    if (_maskIndex isNotEqualTo -1 && backpack _unit isEqualTo _pack) then {
        if (_assigned) then {
            (backpackContainer _unit) setObjectTexture [2, "a3\supplies_f_enoch\bags\data\b_scba_01_co.paa"];
        } else {
            (backpackContainer _unit) setObjectTexture [2, ""];
        };
    };
}];
