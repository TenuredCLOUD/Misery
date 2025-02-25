#include "..\script_component.hpp"
 /*
 * Author: TenuredCLOUD
 * gasmask cartridge degradation
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call misery_gasmask_fnc_deficiency
 *
*/

[{
    params ["_args", "_handle"];

    call EFUNC(protection,totalProtection) params ["_gasMask", "_scba", "", "_respiratory"];
    call EFUNC(common,getPlayerVariables) params ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "_cartridge"];

    if (_gasMask > 0 && _respiratory > 0 && _scba < 1) exitWith {};

    [-1, "cartridge"] call EFUNC(common,addStatusModifier);

    private _cartridgeTotal = _cartridge + GVAR(modifiers);
    player setVariable [QGVAR(cartridgeEfficiency), _cartridgeTotal];
    GVAR(modifiers) = 0;

    if (_cartridge <= 0) then {
        [] call FUNC(swapMask);
        player setVariable [QGVAR(cartridgeEfficiency), MACRO_PLAYER_DEFAULTS_HIGH];
    };

    [QUOTE(COMPONENT_BEAUTIFIED), "Deficiency cycle..."] call EFUNC(common,debugMessage);
}, GVAR(deficiencyCycle), []] call CBA_fnc_addPerFrameHandler;
