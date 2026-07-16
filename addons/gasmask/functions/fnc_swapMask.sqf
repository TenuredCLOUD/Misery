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

private _goggles = toLower goggles ACE_player;
if (_goggles isEqualTo "") exitWith {};

private _respirators = [MACRO_RESPIRATOR_MASKS];

if (_goggles in _respirators) then {
    private _index = _respirators find _goggles;
    private _noFilterMask = [MACRO_RESPIRATOR_MASKS_NOFILTER] select _index;

    removeGoggles ACE_player;
    ACE_player addGoggles _noFilterMask;
} else {
    removeGoggles ACE_player;
    GVAR(lastMask) = _goggles;
    [ACE_player, QCLASS(gasMask_Empty), true] call CBA_fnc_addItem;
};
