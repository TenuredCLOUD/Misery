#include "..\script_component.hpp"
 /*
 * Author: MikeMF, TenuredCLOUD
 * Gasmask swap due to cartridge depletion
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_gasmask_fnc_swapMask
 *
*/

private _goggles = toLower goggles player;
if (_goggles isEqualTo "") exitWith {};

private _respirators = [MACRO_RESPIRATOR_MASKS];

if (_goggles in _respirators) then {
    private _index = _respirators find _goggles;
    private _noFilterMask = [MACRO_RESPIRATOR_MASKS_NOFILTER] select _index;

    removeGoggles player;
    player addGoggles _noFilterMask;
};
