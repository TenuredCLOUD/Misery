#include "..\script_component.hpp"
 /*
 * Author: MikeMF, TenuredCLOUD
 * Gas mask cartridge replacement
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_gasmask_fnc_useCartridges
 *
*/

private _goggles = toLower goggles player;
if (_goggles isEqualTo "") exitWith {};

player removeItem QCLASS(gasCartridge);

private _respirators = [MACRO_RESPIRATOR_MASKS_NOFILTER];

if (_goggles in _respirators) then {
    private _index = _respirators find _goggles;
    private _filteredMask = [MACRO_RESPIRATOR_MASKS] select _index;

    removeGoggles player;
    player addGoggles _filteredMask;

    private _cartridgeReplaceStr = format ["<t font='PuristaMedium' size='0.7'>%1</t>", "You replace the cartridges on your gasmask..."];
    [QEGVAR(common,tileText), _cartridgeReplaceStr] call CBA_fnc_localEvent;

    player setVariable [GVAR(cartridgeEfficiency), MACRO_PLAYER_DEFAULTS_HIGH];
};
