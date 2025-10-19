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

if (_goggles isEqualTo "" && !([[QCLASS(gasMask_Empty)]] call EFUNC(common,hasItem))) exitWith {
    [QEGVAR(common,tileText), "No valid mask available for cartridge replacement..."] call CBA_fnc_localEvent;
};

switch (true) do {
    case (_goggles isNotEqualTo "" && _goggles in [MACRO_RESPIRATOR_MASKS_NOFILTER]): {

        [player, QCLASS(gasCartridge)] call CBA_fnc_removeItem;

        private _respirators = [MACRO_RESPIRATOR_MASKS_NOFILTER];

        if (_goggles in _respirators) then {
            private _index = _respirators find _goggles;
            private _filteredMask = [MACRO_RESPIRATOR_MASKS] select _index;

            removeGoggles player;
            player addGoggles _filteredMask;

            [QEGVAR(common,tileText), "You replace the cartridges on your gasmask..."] call CBA_fnc_localEvent;

            player setVariable [GVAR(cartridgeEfficiency), MACRO_PLAYER_DEFAULTS_HIGH];
        };
    };
    case ([[QCLASS(gasMask_Empty)]] call EFUNC(common,hasItem)): {
        if (isNil QGVAR(lastMask)) then {
            [player, QCLASS(gasCartridge)] call CBA_fnc_removeItem;
            [player, QCLASS(gasMask_Empty)] call CBA_fnc_removeItem;
            [player, GVAR(defaultMask), true] call CBA_fnc_addItem;
            [QEGVAR(common,tileText), "You replace the cartridges on your gasmask..."] call CBA_fnc_localEvent;
        } else {
            [player, QCLASS(gasCartridge)] call CBA_fnc_removeItem;
            [player, QCLASS(gasMask_Empty)] call CBA_fnc_removeItem;
            [player, GVAR(lastMask), true] call CBA_fnc_addItem;
            GVAR(lastMask) = nil;
            [QEGVAR(common,tileText), "You replace the cartridges on your gasmask..."] call CBA_fnc_localEvent;
        };
    };
};

