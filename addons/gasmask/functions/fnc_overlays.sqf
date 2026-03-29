#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * Gasmask overlays for Contact DLC CBRN equipment
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_gasmask_fnc_overlays
 *
*/

player addEventHandler ["SlotItemChanged", {
    params ["_unit", "_name", "_slot", "_assigned", "_weapon"];

    private _maskIndex = MACRO_RESPIRATOR_MASKS_OVERLAYS findIf { (toLower _name) isEqualTo (_x select 0) };

    if (_maskIndex isNotEqualTo -1) then {
        if (_assigned) then {
            private _maskOverlay = (MACRO_RESPIRATOR_MASKS_OVERLAYS select _maskIndex) select 1;
            QCLASS(cbrnOverlay) cutRsc [_maskOverlay, "PLAIN", -1, false];
        } else {
            QCLASS(cbrnOverlay) cutText ["", "PLAIN"];
        };
    };
}];
