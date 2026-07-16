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

private _goggles = toLower goggles ACE_player;

if (_goggles isEqualTo "" && !([[QCLASS(gasMask_Empty)]] call EFUNC(common,hasItem))) exitWith {
    [QEGVAR(common,tileText), localize LSTRING(NoValidMask)] call CBA_fnc_localEvent;
};

switch (true) do {
    case (_goggles isNotEqualTo "" && _goggles in [MACRO_RESPIRATOR_MASKS_NOFILTER]): {

        [ACE_player, QCLASS(gasCartridge)] call CBA_fnc_removeItem;

        private _respirators = [MACRO_RESPIRATOR_MASKS_NOFILTER];

        if (_goggles in _respirators) then {
            private _index = _respirators find _goggles;
            private _filteredMask = [MACRO_RESPIRATOR_MASKS] select _index;

            removeGoggles ACE_player;
            ACE_player addGoggles _filteredMask;

            [QEGVAR(common,tileText), localize LSTRING(ReplacedCartridges)] call CBA_fnc_localEvent;

            ACE_player setVariable [GVAR(cartridgeEfficiency), MACRO_PLAYER_DEFAULTS_HIGH];
        };
    };
    case ([[QCLASS(gasMask_Empty)]] call EFUNC(common,hasItem)): {
        if (isNil QGVAR(lastMask)) then {
            [ACE_player, QCLASS(gasCartridge)] call CBA_fnc_removeItem;
            [ACE_player, QCLASS(gasMask_Empty)] call CBA_fnc_removeItem;
            [ACE_player, GVAR(defaultMask), true] call CBA_fnc_addItem;
            [QEGVAR(common,tileText), localize LSTRING(ReplacedCartridges)] call CBA_fnc_localEvent;
        } else {
            [ACE_player, QCLASS(gasCartridge)] call CBA_fnc_removeItem;
            [ACE_player, QCLASS(gasMask_Empty)] call CBA_fnc_removeItem;
            [ACE_player, GVAR(lastMask), true] call CBA_fnc_addItem;
            GVAR(lastMask) = nil;
            [QEGVAR(common,tileText), localize LSTRING(ReplacedCartridges)] call CBA_fnc_localEvent;
        };
    };
};

